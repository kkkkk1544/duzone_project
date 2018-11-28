/*** Eclipse Class Decompiler plugin, copyright (c) 2012 Chao Chen (cnfree2000@hotmail.com) ***/
package com.duzon.ctd.web.components.erpiu.customize.nham;

import com.duzon.ctd.components.annotation.DefaultViewPath;

import com.duzon.ctd.components.model.DzAbstractUploadModel;

import com.duzon.ctd.components.model.DzMultipartModel;
import com.duzon.ctd.components.model.DzRequestModel;
import com.duzon.ctd.components.model.DzResponseModel;
import com.duzon.ctd.components.model.DzResultFormat;
import com.duzon.ctd.data.DataTable;


import com.duzon.ctd.jdbc.objects.SqlPack;
import com.duzon.ctd.util.StringUtil;
import com.duzon.ctd.web.components.erpiu.DzErpiuServiceBase;

import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;

@DefaultViewPath(path = "/customize/nham/")
@Service("p_whr_z_nham_file_attach_pop")
public class p_whr_z_nham_file_attach_pop extends DzErpiuServiceBase {
	public String getDefaultViewName() {
		return "p_whr_z_nham_file_attach_pop";
	}

	protected String getServiceName() {
		return null;
	}

	protected DzResponseModel executeInternal(DzRequestModel requestModel)
			throws Exception {
		DzResponseModel responseModel = new DzResponseModel();
		try {
			if (StringUtil.equals(requestModel.getActionName(), "createTempFile")) {
				String pIdMenu = requestModel.getParameterValue("pIdMenu");
				String pFilePath = requestModel.getParameterValue("pFilePath");
				String pCdFile = requestModel.getParameterValue("pCdFile");

				List dzMultipartModels = requestModel.getDzMultipartModels();
				if ((dzMultipartModels != null) && (dzMultipartModels.size() > 0)) {
					String tempPath = requestModel.getDzConfig("uploadTempPath").toString();
					String splitText = requestModel.getDzConfig("uploadSplitText").toString();
					
					for (int i = 0; i < dzMultipartModels.size(); ++i) {
						String fileName = UUID.randomUUID().toString() + splitText 
											+ ((DzAbstractUploadModel) dzMultipartModels.get(i)).getCreateFileName();
						((DzAbstractUploadModel) dzMultipartModels.get(i)).setRealFileName(((DzAbstractUploadModel) dzMultipartModels.get(i)).getCreateFileName());
						((DzAbstractUploadModel) dzMultipartModels.get(i)).setCreateFileName(fileName);
						((DzAbstractUploadModel) dzMultipartModels.get(i)).transfer(tempPath);
					}
				}
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String writeDate = sdf.format(date);

				List<Map<String, String>> result = new ArrayList<Map<String, String>>();
				for (int i = 0; i < dzMultipartModels.size(); ++i) {
					Map resultMap = new HashMap();
					resultMap.put("FILE_SIZE", ((DzAbstractUploadModel) dzMultipartModels.get(i)).getFileSizeUnit());
					resultMap.put("FILE_NAME", ((DzAbstractUploadModel) dzMultipartModels.get(i)).getRealFileName());
					resultMap.put("TEMP_FILE_NAME", ((DzAbstractUploadModel) dzMultipartModels.get(i)).getCreateFileName());
					resultMap.put("NM_USER", getUserName());
					resultMap.put("FILE_DATE", writeDate);
					resultMap.put("ID_MENU", pIdMenu);
					resultMap.put("FILE_PATH", pFilePath);
					resultMap.put("CD_FILE", pCdFile);
					result.add(resultMap);
				}
				responseModel.setResultList("uploadInfo", result);
			} else if (StringUtil.equals(requestModel.getActionName(), "createRealFile")) {
				deleteFile(requestModel);
				insertFile(requestModel);
			} else if (StringUtil.equals(requestModel.getActionName(), "loadRealFile")) {
				String idMenu = requestModel.getParameterValue("pIdMenu");
				String cdFile = requestModel.getParameterValue("pCdFile");

				SqlPack sp = new SqlPack();
				sp.setStoreProcedure(true);
				sp.setSqlText("UP_WEB_FILE_INFO_SEL");
				sp.getInParameters().put("P_CD_COMPANY", getCompanyCode());
				sp.getInParameters().put("P_CD_MODULE", "WHR");
				sp.getInParameters().put("P_ID_MENU", idMenu);
				sp.getInParameters().put("P_CD_FILE", cdFile);
				DataTable dt = getDataManager().queryForDataTable(sp);
				responseModel.setResultDataTable(dt);
			} else if (StringUtil.equals(requestModel.getActionName(), "downloadFile")) {
				String realPath = requestModel.getDzConfig("uploadBasePath").toString();
				String idMenu = requestModel.getParameterValue("ID_MENU");
				String filePath = requestModel.getParameterValue("FILE_PATH");
				String cdFile = requestModel.getParameterValue("CD_FILE");
				String fileName = URLDecoder.decode(requestModel.getParameterValue("FILE_NAME"), "UTF-8");

				File path = makePath(new String[] { realPath, filePath, idMenu, cdFile });
				File file = new File(path, fileName);
				responseModel.getDzDownloadModel().setFileName(fileName);
				responseModel.getDzDownloadModel().setFile(file);
				responseModel.setReturnFormat(DzResultFormat.File);
				responseModel.getDzDownloadModel().setAttach(true);
				responseModel.setReturnFormat(DzResultFormat.File);
			} else if (StringUtil.equals(requestModel.getActionName(), "deleteFile")) {
				deleteFile(requestModel);
			}
			responseModel.setSuccess(true);
		} catch (Exception e) {
			responseModel.setSuccess(false);
			throw e;
		}

		return responseModel;
	}

	private String getFileName(String guidFileName, String splitText) {
		int startIndex = guidFileName.indexOf(splitText) + splitText.length();
		return guidFileName.substring(startIndex, guidFileName.length());
	}

	private void insertFile(DzRequestModel requestModel) throws Exception {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String writeDate = sdf.format(date);
		String realPath = requestModel.getDzConfig("uploadBasePath").toString();
		String tempPath = requestModel.getDzConfig("uploadTempPath").toString();
		String splitText = requestModel.getDzConfig("uploadSplitText").toString();

		List addGridData = requestModel.getGridData().getAdded();
		for (int i = 0; i < addGridData.size(); ++i) {
			String fileName = ((Map) addGridData.get(i)).get("TEMP_FILE_NAME").toString();
			String pIdMenu = ((Map) addGridData.get(i)).get("ID_MENU").toString();
			String pFilePath = ((Map) addGridData.get(i)).get("FILE_PATH").toString();
			String pCdFile = ((Map) addGridData.get(i)).get("CD_FILE").toString();
			String createFileName = getFileName(fileName, splitText);

			DzMultipartModel dzMultipartModel = new DzMultipartModel(new File(tempPath, fileName), createFileName);
			dzMultipartModel.setMakeFolder(true);
			File file = makePath(new String[] { realPath, pFilePath, pIdMenu, pCdFile });

			dzMultipartModel.transfer(file.toPath().toString());
			dzMultipartModel.transfer(file.getPath());

			SqlPack sp = new SqlPack();
			sp.setStoreProcedure(true);
			sp.setSqlText("UP_WEB_FILE_INFO_INS");
			sp.getInParameters().put("P_CD_COMPANY", getCompanyCode());
			sp.getInParameters().put("P_CD_MODULE", "WHR");
			sp.getInParameters().put("P_ID_MENU", pIdMenu);
			sp.getInParameters().put("P_CD_FILE", pCdFile);
			sp.getInParameters().put("P_FILE_NAME", dzMultipartModel.getCreateFileName());
			sp.getInParameters().put("P_FILE_PATH", pFilePath);
			sp.getInParameters().put("P_FILE_EXT", dzMultipartModel.getExt());
			sp.getInParameters().put("P_FILE_DATE", writeDate);
			sp.getInParameters().put("P_FILE_SIZE", dzMultipartModel.getFileSizeUnit());
			sp.getInParameters().put("P_ID_INSERT", getUserId());
			sp.getInParameters().put("P_DTS_INSERT", date);
			getDataManager().update(sp);
		}
	}

	private void deleteFile(DzRequestModel requestModel) throws Exception {
		String realPath = requestModel.getDzConfig("uploadBasePath").toString();

		List addGridData = requestModel.getGridData().getDeleted();
		for (int i = 0; i < addGridData.size(); ++i) {
			String pIdMenu = ((Map) addGridData.get(i)).get("ID_MENU") .toString();
			String pFilePath = ((Map) addGridData.get(i)).get("FILE_PATH").toString();
			String pCdFile = ((Map) addGridData.get(i)).get("CD_FILE").toString();
			String pFileName = ((Map) addGridData.get(i)).get("FILE_NAME").toString();
			String pNoSeq = ((Map) addGridData.get(i)).get("NO_SEQ").toString();

			SqlPack sp = new SqlPack();
			sp.setStoreProcedure(true);
			sp.setSqlText("UP_WEB_FILE_INFO_DEL");
			sp.getInParameters().put("P_CD_COMPANY", getCompanyCode());
			sp.getInParameters().put("P_CD_MODULE", "WHR");
			sp.getInParameters().put("P_ID_MENU", pIdMenu);
			sp.getInParameters().put("P_CD_FILE", pCdFile);
			sp.getInParameters().put("P_NO_SEQ", pNoSeq);
			getDataManager().queryForObject(sp);
			System.out.println(sp.getOutParameters().get("P_FILE_NAME"));

			File path = makePath(new String[] { realPath, pFilePath, pCdFile });
			File file = new File(path, pFileName);
			file.delete();
		}
	}

	private File makePath(String[] path) {
		if (path.length < 1) {
			return null;
		}

		File file = new File(path[0]);
		for (int i = 1; i < path.length; ++i) {
			file = new File(file, path[i]);
		}
		return file;
	}
}
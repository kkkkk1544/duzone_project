package com.duzon.ctd.web.components.erpiu.customize.nham;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.duzon.ctd.components.annotation.DefaultViewPath;
import com.duzon.ctd.components.exception.DzApplicationRuntimeException;
import com.duzon.ctd.components.impl.DzAbstractService;
import com.duzon.ctd.components.model.DzGridData;
import com.duzon.ctd.components.model.DzRequestModel;
import com.duzon.ctd.components.model.DzResponseModel;
import com.duzon.ctd.data.DataTable;
import com.duzon.ctd.jdbc.objects.SqlPack;
import com.duzon.ctd.jdbc.transaction.DbTransaction;
import com.duzon.ctd.util.DateUtil;
import com.duzon.ctd.util.StringUtil;
import com.duzon.ctd.web.components.erpiu.DzAuthErpUser;
import com.duzon.ctd.web.components.erpiu.DzErpiuServiceBase;
/*
 * 작성자 : NKH
 * 작성일 : 
 * 메뉴명 : 경조금신청 관계팝업
 * 수정자 : 
 * 수정일 :
 * 수정내용 :
 */
@DefaultViewPath(path="/customize/nham/help/")
@Service("help_p_whr_z_nham_rela")
public class help_p_whr_z_nham_rela extends DzErpiuServiceBase {

	@Override
	protected String getServiceName() {
		// TODO Auto-generated method stub
		return this.getClass().getName();
	}	
	@Override
	protected DzResponseModel executeInternal(DzRequestModel requestModel) throws Exception {
		
		this.logger.info("ORDER executeInternal start ;;; help_p_whr_z_nham_rela");
		// TODO Auto-generated method stub
		DzResponseModel responseModel = null;
		try{		
			responseModel = new DzResponseModel();	
			String cd_company =this.getCompanyCode();
			String no_emp = this.getEmpNo();
			if(StringUtil.equals(requestModel.getActionName(), "getRela") ){
				
				String keyword = requestModel.getParameterValue("keyword");
				String cd_sysdef = requestModel.getParameterValue("code");
				
				//this.logger.info(cd_sysdef + ";;;;;;;;;;;;;;;;");
				DataTable dt = this.GetRela(cd_company, no_emp, keyword, cd_sysdef);
				logger.info(dt.getRows().size());
				System.out.println("dt.getRows().size() = "+ dt.getRows().size());
				this.displayDataTable(dt);
				responseModel.setResultDataTable(dt);
				
			}
		}catch(DzApplicationRuntimeException e){
			responseModel.setSuccess(false);
			throw e;
		}catch(Exception e){
			responseModel.setSuccess(false);
			throw e;
		}
		finally{
			responseModel.setSuccess(true);
		}
		
		return responseModel;
	}
	
	//관계도움창
	private DataTable GetRela(String cd_company, String no_emp, String keyword, String cd_sysdef){
		DataTable dt = null;
		logger.info(cd_sysdef + ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; " + keyword);
		try{
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);   
			so.setSqlText("UP_WHR_Z_NHAM_WREATHAPPLY_R_S");		//UP_WEB_WHR_Z_NHAM_WREATHAPPLY_R_S
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_CD_CONGRA", cd_sysdef);
			so.getInParameters().put("P_NO_EMP", no_emp);
			so.getInParameters().put("P_KEYWORD", keyword);
			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}

}

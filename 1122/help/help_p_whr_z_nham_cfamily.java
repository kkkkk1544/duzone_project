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
 * 메뉴명 : 경조금신청 가족도움창
 * 수정자 : 
 * 수정일 :
 * 수정내용 :
 */
@DefaultViewPath(path="/customize/nham/help/")
@Service("help_p_whr_z_nham_cfamily")
public class help_p_whr_z_nham_cfamily extends DzErpiuServiceBase {

	@Override
	protected String getServiceName() {
		// TODO Auto-generated method stub
		return this.getClass().getName();
	}	
	@Override
	protected DzResponseModel executeInternal(DzRequestModel requestModel) throws Exception {
		
		this.logger.info("ORDER executeInternal start ;;; help_p_whr_z_nham_cfamily");
		// TODO Auto-generated method stub
		DzResponseModel responseModel = null;
		try{		
			responseModel = new DzResponseModel();	
			String cd_company =this.getCompanyCode();
			String no_emp = this.getEmpNo();
			if(StringUtil.equals(requestModel.getActionName(), "getCfamily") ){
				
				String keyword = requestModel.getParameterValue("keyword")+"%";
				
				DataTable dt = this.GetFamily(cd_company, no_emp, keyword);
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
	
	private DataTable GetFamily(String cd_company, String no_emp, String keyword){
		DataTable dt = null;
		this.logger.info(no_emp + ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; " + keyword);
		try{
			String sqlText = "UP_WHR_Z_NHAM_FAMILY_SUB_FC";	//UP_WEB_HR_Z_NHAM_FAMILY_SUB_FC
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText(sqlText);
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_NO_EMP", no_emp);  
			so.getInParameters().put("P_KEYWORD", keyword);
			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}

}

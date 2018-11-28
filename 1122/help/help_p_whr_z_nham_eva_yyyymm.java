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
 * 메뉴명 : 기준년월 드롭리스트
 * 수정자 : 
 * 수정일 :
 * 수정내용 :
 */
@DefaultViewPath(path="/customize/nham/help/")
@Service("help_p_whr_z_nham_eva_yyyymm")
public class help_p_whr_z_nham_eva_yyyymm extends DzErpiuServiceBase {

	@Override
	protected String getServiceName() {
		// TODO Auto-generated method stub
		return this.getClass().getName();
	}	
	@Override
	protected DzResponseModel executeInternal(DzRequestModel requestModel) throws Exception {
		
		logger.info("ORDER executeInternal start ;;; help_p_whr_z_nham_eva_yyyymm");
		// TODO Auto-generated method stub
		DzResponseModel responseModel = null;
		try{		
			responseModel = new DzResponseModel();	
			String cd_company =this.getCompanyCode();
			String no_emp = this.getEmpNo();
			if(StringUtil.equals(requestModel.getActionName(), "yyyymm") ){
				String id = requestModel.getParameterValue("CD_EVTYPE");
							
				DataTable dt = this.GetYymm(cd_company, id, no_emp);
				this.displayDataTable(dt);
				responseModel.setResultDataTable(dt);
				
			}else if(StringUtil.equals(requestModel.getActionName(),"AdminYm") ){
				String id = requestModel.getParameterValue("CD_EVTYPE");
				String NoEmp = requestModel.getParameterValue("NoEmp");
				
				DataTable dt = this.GetAdminYm(cd_company, id, NoEmp);
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
	
	private DataTable GetYymm(String cd_company, String id, String no_emp){
		DataTable dt = null;
		logger.info(id + ";;;;;;;;;;;;  UP_WHR_Z_NHAM_YYYYMM_S ");
		try{
			String sqlText = "UP_WHR_Z_NHAM_YYYYMM_S";
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText(sqlText);
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_CD_EVTYPE", id);
			so.getInParameters().put("P_NO_EMP",no_emp);
			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}
	
	//관리자 진입시 선택된 no_emp로 조회
	private DataTable GetAdminYm(String cd_company, String id, String NoEmp){
		DataTable dt = null;
		logger.info(id + ";;;;; admin ;;;;;" +NoEmp);
		try{
			String sqlText = "UP_WHR_Z_NHAM_YYYYMM_S";
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText(sqlText);
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_CD_EVTYPE", id);
			so.getInParameters().put("P_NO_EMP",NoEmp);
			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}

}

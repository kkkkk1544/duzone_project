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
 * 메뉴명 : 경조금신청 팝업
 * 수정자 : 
 * 수정일 :
 * 수정내용 :
 */
@DefaultViewPath(path="/customize/nham/help/")
@Service("help_p_whr_z_nham_eva_rpt_ymg")
public class help_p_whr_z_nham_eva_rpt_ymg extends DzErpiuServiceBase {

	@Override
	protected String getServiceName() {
		// TODO Auto-generated method stub
		return this.getClass().getName();
	}	
	@Override
	protected DzResponseModel executeInternal(DzRequestModel requestModel) throws Exception {
		
		logger.info("ORDER executeInternal start ;;; help_p_whr_z_nham_eva_rpt_ymg");
		// TODO Auto-generated method stub
		DzResponseModel responseModel = null;
		try{		
			responseModel = new DzResponseModel();	
			String cd_company =this.getCompanyCode();
			
			if(StringUtil.equals(requestModel.getActionName(), "YMG") ){
				String id = requestModel.getParameterValue("ID");
				String no_emp = requestModel.getParameterValue("no_emps");
				String ym_evlu = requestModel.getParameterValue("ym_evlu");
				
				logger.debug(no_emp+";;;;;;;;;;;;"+id);
				
				DataTable dt = this.getYmg(cd_company, id, no_emp,ym_evlu);
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
		
		responseModel.setSuccess(true);
		return responseModel;
	}
	
	private DataTable getYmg(String cd_company, String id, String no_emp, String ym_evlu){
		DataTable dt = null;
		logger.info(no_emp + ";;;;;;;;;;;;  UP_WHR_Z_NHAM_RPT_YMG_S");
		try{
			String sqlText = "UP_WHR_Z_NHAM_RPT_YMG_S";
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText(sqlText);
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_NO_EMP", no_emp);
			so.getInParameters().put("P_ID_MENU", id);
			so.getInParameters().put("P_YM_EVLU", ym_evlu);

			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}

}

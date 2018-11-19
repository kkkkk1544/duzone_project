package com.duzon.ctd.web.components.erpiu.customize.nham;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.duzon.ctd.util.Convert;
import com.duzon.ctd.util.DateUtil;
import com.duzon.ctd.util.JsonUtil;
import com.duzon.ctd.util.StringUtil;
import com.duzon.ctd.web.components.erpiu.DzAuthErpUser;
import com.duzon.ctd.web.components.erpiu.DzErpiuServiceBase;
/*
 * 작성자 : NKH
 * 작성일 : 2018-02-27
 * 메뉴명 : 평가결과조회
 * 수정자 : 
 * 수정일 :
 * 수정내용 : p_whr_z_nham_eva_rpt
 */
@DefaultViewPath(path="/customize/nham/")
@Service("p_whr_z_nham_eva_rpt")
public class p_whr_z_nham_eva_rpt extends DzErpiuServiceBase {

	@Override
	protected String getServiceName() {
		// TODO Auto-generated method stub
		return this.getClass().getName();
	}	
	@Override
	protected DzResponseModel executeInternal(DzRequestModel requestModel) throws Exception {
		
		logger.info("ORDER executeInternal start ;;; p_whr_z_nham_eva_rpt");
		// TODO Auto-generated method stub
		DzResponseModel responseModel = null;
		try{		

			responseModel = new DzResponseModel();	
			String cd_company =this.getCompanyCode();
			String no_emp = this.getEmpNo();
			String duty_rank = this.getDutyRankCode();
			if(StringUtil.equals(requestModel.getActionName(), "list") ){  //목표항목
				
				String ym_evlu = requestModel.getParameterValue("ym_evlu");

				DataTable dt = this.getList(cd_company, no_emp, ym_evlu, duty_rank);
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

	//조회
	private DataTable getList(String cd_company, String no_emp,String ym_evlu,String duty_rank){
		DataTable dt = null;
		
		try{
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText("UP_WHR_Z_NHAM_EVA_RPT_S");		//  //UP_HR_Z_NHAM_EVA_RPT_S
			so.getInParameters().put("P_CD_COMPANY", cd_company);	
			so.getInParameters().put("P_YM_EVLU_T", ym_evlu);		
			so.getInParameters().put("P_MULTI_BIZAREA", ""); 	
			so.getInParameters().put("P_MULTI_DEPT", ""); 		
			so.getInParameters().put("P_MULTI_EVUNIT", ""); 		
			so.getInParameters().put("P_MULTI_DUTY_RANK", duty_rank); 	
			so.getInParameters().put("P_MULTI_DUTY_RESP", ""); 	
			so.getInParameters().put("P_MULTI_NO_EMP", no_emp);		
			
			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}
	
	
}	//class ln

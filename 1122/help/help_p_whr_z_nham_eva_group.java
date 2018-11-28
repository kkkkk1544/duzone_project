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
 * 메뉴명 : 평가그룹 드롭리스트
 * 수정자 : 
 * 수정일 :
 * 수정내용 :     
 */
@DefaultViewPath(path="/customize/nham/")
@Service("help_p_whr_z_nham_eva_group")
public class help_p_whr_z_nham_eva_group extends DzErpiuServiceBase {
	
//	printDT pdt = new printDT();
	@Override
	protected String getServiceName() {
		// TODO Auto-generated method stub
		return this.getClass().getName();
	}	
	@Override
	protected DzResponseModel executeInternal(DzRequestModel requestModel) throws Exception {
		
		logger.info("ORDER executeInternal start ;;; help_p_whr_z_nham_eva_group");
		// TODO Auto-generated method stub
		DzResponseModel responseModel = null;
		try{		
			responseModel = new DzResponseModel();	
			String cd_company =this.getCompanyCode();
			String no_emp = this.getEmpNo();
			
			if(StringUtil.equals(requestModel.getActionName(), "EvaGroup") ){ 
				logger.info("EvaGroup ;;;;;; "+requestModel.getActionName());
				String ym_evlu = requestModel.getParameterValue("ym_evlu");		// 기준년월
				String cd_evtype = requestModel.getParameterValue("cd_evtype");	// 평가자, 피평가자 (100: 2차평가자, 200: 피평가자, 300: 1차평가자)
				String cd_evunit = requestModel.getParameterValue("cd_evunit"); // 평가단위 (100: 팀원, 200: 팀장, 300: 본부장)
				String tp_evlu = requestModel.getParameterValue("tp_evlu");		// 평가유형 (업적, 다면, 역량)
				
				DataTable dt = this.GetGroup(cd_company, no_emp, ym_evlu, cd_evtype, cd_evunit, tp_evlu);
				this.displayDataTable(dt);
				responseModel.setResultDataTable(dt);
			}else if(StringUtil.equalsIgnoreCase(requestModel.getActionName(), "AdminGroup")){
				String ym_evlu = requestModel.getParameterValue("ym_evlu");
				String cd_evtype = requestModel.getParameterValue("cd_evtype");
				String cd_evunit = requestModel.getParameterValue("cd_evunit");
				String tp_evlu = requestModel.getParameterValue("tp_evlu");
				String NoEmp = requestModel.getParameterValue("NoEmp");
				
				DataTable dt = this.GetAdminGroup(cd_company, NoEmp, ym_evlu, cd_evtype, cd_evunit, tp_evlu);
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
	//평가그룹 드롭리스트
	private DataTable GetGroup(String cd_company,String no_emp, String ym_evlu, String cd_evtype, String cd_evunit, String tp_evlu){
		DataTable dt = null;
		logger.debug("::::::::::::::::::::::"+cd_company+";;;;;"+no_emp);
		try{
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText("UP_WHR_Z_NHAM_EVA_GROUP_S");  
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_NO_EMP", no_emp);
			so.getInParameters().put("P_YM_EVLU", ym_evlu);
			so.getInParameters().put("P_CD_EVTYPE", cd_evtype);
			so.getInParameters().put("P_CD_EVUNIT", cd_evunit);
			so.getInParameters().put("P_TP_EVLU", tp_evlu);
			
			dt = this.queryForDataTable(so);
//			pdt.printDT(dt);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return dt;
	}
	//관리자 평가그룹 드롭리스트   //사번만 다르게 받음!!
		private DataTable GetAdminGroup(String cd_company,String NoEmp, String ym_evlu, String cd_evtype, String cd_evunit, String tp_evlu){
			DataTable dt = null;
			logger.debug(":::::::::::::: admin ;;;;;"+NoEmp);
			try{
				SqlPack so = new SqlPack();
				so.setStoreProcedure(true);
				so.setSqlText("UP_WHR_Z_NHAM_EVA_GROUP_S");  
				so.getInParameters().put("P_CD_COMPANY", cd_company);
				so.getInParameters().put("P_NO_EMP", NoEmp);   
				so.getInParameters().put("P_YM_EVLU", ym_evlu);
				so.getInParameters().put("P_CD_EVTYPE", cd_evtype);
				so.getInParameters().put("P_CD_EVUNIT", cd_evunit);
				so.getInParameters().put("P_TP_EVLU", tp_evlu);
				
				dt = this.queryForDataTable(so);
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return dt;
		}
}//end
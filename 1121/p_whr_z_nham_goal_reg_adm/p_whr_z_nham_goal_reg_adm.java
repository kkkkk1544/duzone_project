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
import com.duzon.ctd.data.DataColumn;
import com.duzon.ctd.data.DataRow;
import com.duzon.ctd.data.DataTable;
import com.duzon.ctd.jdbc.objects.SqlPack;
import com.duzon.ctd.jdbc.transaction.DbTransaction;
import com.duzon.ctd.util.Convert;
import com.duzon.ctd.util.DateUtil;
import com.duzon.ctd.util.StringUtil;
import com.duzon.ctd.web.components.erpiu.DzAuthErpUser;
import com.duzon.ctd.web.components.erpiu.DzErpiuServiceBase;

/*
 * 작성자 : NKH
 * 작성일 : 2018/04/13
 * 메뉴명 : 관리자 개인목표등록
 * 수정자 : 
 * 수정일 :
 * 수정내용 : p_whr_z_nham_goal_reg_adm.java
 */
@DefaultViewPath(path = "/customize/nham/")
@Service("p_whr_z_nham_goal_reg_adm")
public class p_whr_z_nham_goal_reg_adm extends DzErpiuServiceBase {
	

	@Override
	protected String getServiceName() {
		// TODO Auto-generated method stub
		return this.getClass().getName();
	}

	@Override
	protected DzResponseModel executeInternal(DzRequestModel requestModel)
			throws Exception {

		logger.info("ORDER executeInternal start ;;; p_whr_z_nham_goal_reg_adm");
		// TODO Auto-generated method stub
		DzResponseModel responseModel = null;
		try{		

			responseModel = new DzResponseModel();	
			String cd_company =this.getCompanyCode();
			
			if(StringUtil.equals(requestModel.getActionName(), "AdminList") ){  
				
				String ym_evlu = requestModel.getParameterValue("ym_evlu");
				String cd_evunit = requestModel.getParameterValue("cd_evunit");
				String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
				String NoEmp = requestModel.getParameterValue("NoEmp"); //관리자 
				
				DataTable dt = this.GetAdminList(cd_company, NoEmp, ym_evlu, cd_evunit, cd_evgroup);
				this.displayDataTable(dt);
				responseModel.setResultDataTable(dt);
				//System.out.println("안녕안녕안녕 "+dt);
				
			}else if(StringUtil.equals(requestModel.getActionName(), "AdminSave")){
							
				this.Save(cd_company,requestModel.getGridData());
				
			}else if(StringUtil.equals(requestModel.getActionName(), "AdminList_cmmt")){
				//String date = DateUtil.getTodayString();
				String ym_evlu = requestModel.getParameterValue("ym_evlu");
				String cd_evunit = requestModel.getParameterValue("cd_evunit");
				String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
				String NoEmp = requestModel.getParameterValue("NoEmp"); //관리자 
				
				DataTable dt = this.GetAdminLsitCmmt(cd_company, ym_evlu, cd_evunit, NoEmp, cd_evgroup);
				this.displayDataTable(dt);
				responseModel.setResultDataTable(dt);
				
			}else if(StringUtil.equals(requestModel.getActionName(), "AdminSave_cmmt")){
				
				String p_no_emp = requestModel.getParameterValue("NoEmp"); //관리자추가 변경
							
				this.SaveCMMT(cd_company, p_no_emp, requestModel.getGridData());
				
			}else if(StringUtil.equals(requestModel.getActionName(), "AdminApp")){
				
				String p_cd_company =this.getCompanyCode();
				String p_no_emp  = requestModel.getParameterValue("NoEmp"); //관리자추가 변경
//				String p_no_emp  =this.getEmpNo();
				String ym_evlu = requestModel.getParameterValue("ym_evlu");
				String cd_evunit = requestModel.getParameterValue("cd_evunit");
				String cd_evgroup = requestModel.getParameterValue("cd_evgroup");	
				String app_flag = requestModel.getParameterValue("app_flag");
				
				System.out.println("회사	:	"+p_cd_company+"\np_no_emp_admin :	"+p_no_emp+"\nym_evlu	:	"+ym_evlu
						+"\ncd_evunit	:	"+cd_evunit+"\ncd_evgroup	:	"+cd_evgroup+"\napp_flag	:	"+app_flag);
				
				this.Approve(p_cd_company, ym_evlu, cd_evunit ,cd_evgroup, p_no_emp, app_flag);
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

	private DataTable GetAdminList(String cd_company,String NoEmp, String ym_evlu, String cd_evunit, String cd_evgroup){
		DataTable dt = null;
		logger.info("list admin : "+NoEmp+";;;;;;;;;"+ym_evlu+";;;;;;;;;"+cd_evunit+";;;;;;;; "+cd_evgroup);
		try{
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_I_S");	
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_YM_EVLU", ym_evlu);
			so.getInParameters().put("P_CD_EVUNIT", cd_evunit);
			so.getInParameters().put("P_NO_EMP", NoEmp);
			so.getInParameters().put("P_YN_APPROVE", "");
			so.getInParameters().put("P_CD_EVGROUP", cd_evgroup);
			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}
	
	private DataTable GetAdminLsitCmmt(String cd_company,String ym_evlu, String cd_evunit,String NoEmp, String cd_evgroup){
		DataTable dt = null;
		logger.info("list_cmm admin : "+NoEmp);
		try{
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_CMMT_S");		//UP_WEB_WHR_Z_NHAM_WREATHAPPLY_R_S
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_YM_EVLU", ym_evlu);
			so.getInParameters().put("P_CD_EVUNIT", cd_evunit);
			so.getInParameters().put("P_NO_EMP", NoEmp);
			so.getInParameters().put("P_CD_EVGROUP", cd_evgroup);
//			logger.info(
//			"__P_CD_COMPANY"+cd_company
//			+"__P_YM_EVLU:"+ym_evlu
//			+"__P_CD_EVUNIT:"+ cd_evunit
//			+"__P_NO_EMP:"+ no_emp
//			+"__P_CD_EVGROUP:"+cd_evgroup);
			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}

	
	@Transactional
	private void Save(String cd_company,DzGridData gridData) throws Exception{	
	
		if(gridData == null) return;
		
		DbTransaction trans = null;
		try{
			trans = this.getDataManager().beginTransaction();
			//String cd_company = this.getCompanyCode();
			String id_user    = this.getUserId();
			
			List<Map<String, Object>> added   = gridData.getAdded  ();
			List<Map<String, Object>> updated = gridData.getUpdated();
			List<Map<String, Object>> deleted = gridData.getDeleted();
			
			int insertCnt = added.size();
			int updateCnt = updated.size();
			int deleteCnt = deleted.size();			
			
			if(added != null && insertCnt > 0){		//추가작업
					
				for(Map<String,Object> item : added){
					SqlPack pack = new SqlPack();
					pack.setStoreProcedure(true);
					pack.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_I_U");
					pack.getInParameters().put("P_CD_COMPANY"   , cd_company);
					pack.getInParameters().put("P_YM_EVLU",Convert.toString(item.get("YM_EVLU")));
					pack.getInParameters().put("P_CD_EVUNIT",Convert.toString(item.get("CD_EVUNIT")));
					pack.getInParameters().put("P_CD_EVGROUP",Convert.toString(item.get("CD_EVGROUP")));
					pack.getInParameters().put("P_TP_EVLU",Convert.toString(item.get("TP_EVLU")));
					pack.getInParameters().put("P_NO_SEQ",item.get("NO_SEQ"));//
					pack.getInParameters().put("P_NO_EMP",Convert.toString(item.get("NO_EMP")));  	
					pack.getInParameters().put("P_NO_ITEMSEQ",item.get("NO_ITEMSEQ"));//
					pack.getInParameters().put("P_CD_ITEM",Convert.toString(item.get("CD_ITEM")));
					pack.getInParameters().put("P_NUM_ITEM",item.get("NUM_ITEM"));  //
					pack.getInParameters().put("P_DC_DEFINATION",Convert.toString(item.get("DC_DEFINATION")));
					pack.getInParameters().put("P_DC_PLAN",Convert.toString(item.get("DC_PLAN")));
					pack.getInParameters().put("P_DC_FORMULA",Convert.toString(item.get("DC_FORMULA")));
					pack.getInParameters().put("P_CD_STATE",Convert.toString(item.get("CD_STATE")));
					pack.getInParameters().put("P_DT_CONSENT",Convert.toString(item.get("DT_CONSENT")));
					pack.getInParameters().put("P_DT_CHANGED",Convert.toString(item.get("DT_CHANGED")));
					pack.getInParameters().put("P_ID_CHANGED",Convert.toString(item.get("ID_CHANGED")));
					pack.getInParameters().put("P_ID_UPDATE",Convert.toString(item.get("ID_UPDATE")));
					pack.getInParameters().put("P_DC_REASON",Convert.toString(item.get("DC_REASON")));
					pack.getInParameters().put("P_DT_WRITE",Convert.toString(item.get("DT_WRITE")));
					pack.getInParameters().put("P_DC_RMK",Convert.toString(item.get("DC_RMK")));
					pack.getInParameters().put("P_CD_PRJ",Convert.toString(item.get("CD_PRJ")));
					pack.getInParameters().put("P_YN_CONSENT","");
					pack.getInParameters().put("P_ID_CONSENT","");
					pack.getInParameters().put("P_YN_CHANGED","");
					pack.getInParameters().put("P_CD_TASK",Convert.toString(item.get("CD_TASK")));
					pack.getInParameters().put("P_CD_LEVEL",Convert.toString(item.get("CD_LEVEL")));
					pack.getInParameters().put("P_CD_SCALEH",Convert.toString(item.get("CD_SCALEH")));
					pack.getInParameters().put("P_I_U_D","I");
					
					this.update(pack);
					
					
				}
			}
			
			if(updated != null && updateCnt > 0){	//업데이트작업
				for(Map<String,Object> item : updated){
					SqlPack pack = new SqlPack();
					pack.setStoreProcedure(true);
					pack.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_I_U");
					pack.getInParameters().put("P_CD_COMPANY"   , cd_company);
					pack.getInParameters().put("P_YM_EVLU",Convert.toString(item.get("YM_EVLU")));
					pack.getInParameters().put("P_CD_EVUNIT",Convert.toString(item.get("CD_EVUNIT")));
					pack.getInParameters().put("P_CD_EVGROUP",Convert.toString(item.get("CD_EVGROUP")));
					pack.getInParameters().put("P_TP_EVLU",Convert.toString(item.get("TP_EVLU")));
					pack.getInParameters().put("P_NO_SEQ",item.get("NO_SEQ"));//
					pack.getInParameters().put("P_NO_EMP",Convert.toString(item.get("NO_EMP")));  	
					pack.getInParameters().put("P_NO_ITEMSEQ",item.get("NO_ITEMSEQ"));//
					pack.getInParameters().put("P_CD_ITEM",Convert.toString(item.get("CD_ITEM")));
					pack.getInParameters().put("P_NUM_ITEM",item.get("NUM_ITEM"));  //
					pack.getInParameters().put("P_DC_DEFINATION",Convert.toString(item.get("DC_DEFINATION")));
					pack.getInParameters().put("P_DC_PLAN",Convert.toString(item.get("DC_PLAN")));
					pack.getInParameters().put("P_DC_FORMULA",Convert.toString(item.get("DC_FORMULA")));
					pack.getInParameters().put("P_CD_STATE",Convert.toString(item.get("CD_STATE")));
					pack.getInParameters().put("P_DT_CONSENT",Convert.toString(item.get("DT_CONSENT")));
					pack.getInParameters().put("P_DT_CHANGED",Convert.toString(item.get("DT_CHANGED")));
					pack.getInParameters().put("P_ID_CHANGED",Convert.toString(item.get("ID_CHANGED")));
					pack.getInParameters().put("P_ID_UPDATE",Convert.toString(item.get("ID_UPDATE")));
					pack.getInParameters().put("P_DC_REASON",Convert.toString(item.get("DC_REASON")));
					pack.getInParameters().put("P_DT_WRITE",Convert.toString(item.get("DT_WRITE")));
					pack.getInParameters().put("P_DC_RMK",Convert.toString(item.get("DC_RMK")));
					pack.getInParameters().put("P_CD_PRJ",Convert.toString(item.get("CD_PRJ")));
					pack.getInParameters().put("P_YN_CONSENT","");
					pack.getInParameters().put("P_ID_CONSENT","");
					pack.getInParameters().put("P_YN_CHANGED","");
					pack.getInParameters().put("P_CD_SCALEH",Convert.toString(item.get("CD_SCALEH")));
					pack.getInParameters().put("P_I_U_D","U");
					

					this.update(pack);
				}
			}

			if(deleted != null && deleteCnt > 0){	//삭제작업
				for(Map<String,Object> item : deleted){
					SqlPack pack = new SqlPack();
					pack.setStoreProcedure(true);
					pack.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_I_U");
					pack.getInParameters().put("P_CD_COMPANY"   , cd_company);
					pack.getInParameters().put("P_YM_EVLU",Convert.toString(item.get("YM_EVLU")));
					pack.getInParameters().put("P_CD_EVUNIT",Convert.toString(item.get("CD_EVUNIT")));
					pack.getInParameters().put("P_CD_EVGROUP",Convert.toString(item.get("CD_EVGROUP")));
					pack.getInParameters().put("P_TP_EVLU",Convert.toString(item.get("TP_EVLU")));
					pack.getInParameters().put("P_NO_SEQ",item.get("NO_SEQ"));//
					pack.getInParameters().put("P_NO_EMP",Convert.toString(item.get("NO_EMP")));  	
					pack.getInParameters().put("P_NO_ITEMSEQ",item.get("NO_ITEMSEQ"));//
					pack.getInParameters().put("P_CD_ITEM",Convert.toString(item.get("CD_ITEM")));
					pack.getInParameters().put("P_NUM_ITEM",item.get("NUM_ITEM"));  //
					pack.getInParameters().put("P_DC_DEFINATION",Convert.toString(item.get("DC_DEFINATION")));
					pack.getInParameters().put("P_DC_PLAN",Convert.toString(item.get("DC_PLAN")));
					pack.getInParameters().put("P_DC_FORMULA",Convert.toString(item.get("DC_FORMULA")));
					pack.getInParameters().put("P_CD_STATE",Convert.toString(item.get("CD_STATE")));
					pack.getInParameters().put("P_DT_CONSENT",Convert.toString(item.get("DT_CONSENT")));
					pack.getInParameters().put("P_DT_CHANGED",Convert.toString(item.get("DT_CHANGED")));
					pack.getInParameters().put("P_ID_CHANGED",Convert.toString(item.get("ID_CHANGED")));
					pack.getInParameters().put("P_ID_UPDATE",Convert.toString(item.get("ID_UPDATE")));
					pack.getInParameters().put("P_DC_REASON",Convert.toString(item.get("DC_REASON")));
					pack.getInParameters().put("P_DT_WRITE",Convert.toString(item.get("DT_WRITE")));
					pack.getInParameters().put("P_DC_RMK",Convert.toString(item.get("DC_RMK")));
					pack.getInParameters().put("P_CD_PRJ",Convert.toString(item.get("CD_PRJ")));
					pack.getInParameters().put("P_YN_CONSENT","");
					pack.getInParameters().put("P_ID_CONSENT","");
					pack.getInParameters().put("P_YN_CHANGED","");
					pack.getInParameters().put("P_I_U_D","D");
					this.update(pack);
				}
			}
			trans.commit();
			return;
		}
		catch(Exception e){
			if(trans != null){
				trans.rollback();
			}
			throw new DzApplicationRuntimeException(e);
		}
	}
	@Transactional
	private void SaveCMMT(String cd_company,String p_no_emp,DzGridData gridData) throws Exception{	
	
		if(gridData == null) return;
		
		DbTransaction trans = null;
		try{
			trans = this.getDataManager().beginTransaction();
			//String cd_company = this.getCompanyCode();
			String id_user    = this.getUserId();
			
			List<Map<String, Object>> added   = gridData.getAdded  ();
			List<Map<String, Object>> updated = gridData.getUpdated();
			List<Map<String, Object>> deleted = gridData.getDeleted();
			
			int insertCnt = added.size();
			int updateCnt = updated.size();
			int deleteCnt = deleted.size();			
			
			if(added != null && insertCnt > 0){		//추가작업
					
				for(Map<String,Object> item : added){
					SqlPack pack = new SqlPack();
					pack.setStoreProcedure(true);
					pack.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_CMMT_I");

					pack.getInParameters().put("P_CD_COMPANY"   , cd_company);
					pack.getInParameters().put("P_YM_EVLU",Convert.toString(item.get("YM_EVLU")));
					pack.getInParameters().put("P_CD_EVUNIT",Convert.toString(item.get("CD_EVUNIT")));
					pack.getInParameters().put("P_TP_EVLUATOR",Convert.toString(item.get("TP_EVLUATOR")));
					pack.getInParameters().put("P_NO_SEQ",item.get("NO_SEQ"));//
					pack.getInParameters().put("P_CD_EVGROUP",Convert.toString(item.get("CD_EVGROUP")));
					pack.getInParameters().put("P_NO_EMP",Convert.toString(item.get("NO_EMP")));  	
					pack.getInParameters().put("P_NO_CMMTSEQ",item.get("NO_CMMTSEQ"));  
					pack.getInParameters().put("P_NO_EMPCMMT",p_no_emp); 
					pack.getInParameters().put("P_DT_CMMT",Convert.toString(item.get("DT_CMMT"))); 
					pack.getInParameters().put("P_DC_CMMT",Convert.toString(item.get("DC_CMMT"))); 
					pack.getInParameters().put("P_ID_INSERT",Convert.toString(item.get("ID_INSERT"))); 
					
					pack.getInParameters().put("P_I_U_D","I");
					
					this.update(pack);
					
					
				}
			}
			
			if(updated != null && updateCnt > 0){	//업데이트작업
				for(Map<String,Object> item : updated){
					SqlPack pack = new SqlPack();
					pack.setStoreProcedure(true);
					pack.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_CMMT_I");

					pack.getInParameters().put("P_CD_COMPANY"   , cd_company);
					pack.getInParameters().put("P_YM_EVLU",Convert.toString(item.get("YM_EVLU")));
					pack.getInParameters().put("P_CD_EVUNIT",Convert.toString(item.get("CD_EVUNIT")));
					pack.getInParameters().put("P_TP_EVLUATOR",Convert.toString(item.get("TP_EVLUATOR")));
					pack.getInParameters().put("P_NO_SEQ",item.get("NO_SEQ"));//
					pack.getInParameters().put("P_CD_EVGROUP",Convert.toString(item.get("CD_EVGROUP")));
					pack.getInParameters().put("P_NO_EMP",Convert.toString(item.get("NO_EMP")));  	
					pack.getInParameters().put("P_NO_CMMTSEQ",item.get("NO_CMMTSEQ"));  
					pack.getInParameters().put("P_NO_EMPCMMT",Convert.toString(item.get("NO_EMPCMMT"))); 
					pack.getInParameters().put("P_DT_CMMT",Convert.toString(item.get("DT_CMMT"))); 
					pack.getInParameters().put("P_DC_CMMT",Convert.toString(item.get("DC_CMMT"))); 
					pack.getInParameters().put("P_ID_INSERT",Convert.toString(item.get("ID_INSERT"))); 
					
					pack.getInParameters().put("P_I_U_D","U");
					

					this.update(pack);
				}
			}

			if(deleted != null && deleteCnt > 0){	//삭제작업
				for(Map<String,Object> item : deleted){
					SqlPack pack = new SqlPack();
					pack.setStoreProcedure(true);
					pack.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_CMMT_I");

					pack.getInParameters().put("P_CD_COMPANY"   , cd_company);
					pack.getInParameters().put("P_YM_EVLU",Convert.toString(item.get("YM_EVLU")));
					pack.getInParameters().put("P_CD_EVUNIT",Convert.toString(item.get("CD_EVUNIT")));
					pack.getInParameters().put("P_TP_EVLUATOR",Convert.toString(item.get("TP_EVLUATOR")));
					pack.getInParameters().put("P_NO_SEQ",item.get("NO_SEQ"));//
					pack.getInParameters().put("P_CD_EVGROUP",Convert.toString(item.get("CD_EVGROUP")));
					pack.getInParameters().put("P_NO_EMP",Convert.toString(item.get("NO_EMP")));  	
					pack.getInParameters().put("P_NO_CMMTSEQ",item.get("NO_CMMTSEQ"));  
					pack.getInParameters().put("P_NO_EMPCMMT",Convert.toString(item.get("NO_EMPCMMT"))); 
					pack.getInParameters().put("P_DT_CMMT",Convert.toString(item.get("DT_CMMT"))); 
					pack.getInParameters().put("P_DC_CMMT",Convert.toString(item.get("DC_CMMT"))); 
					pack.getInParameters().put("P_ID_INSERT",Convert.toString(item.get("ID_INSERT"))); 
					
					pack.getInParameters().put("P_I_U_D","D");
					this.update(pack);
				}
			}
			trans.commit();
			return;
		}
		catch(Exception e){
			if(trans != null){
				trans.rollback();
			}
			throw new DzApplicationRuntimeException(e);
		}
	}
	
	@Transactional
	private void Approve(String cd_company,String p_ym_evlu,String p_cd_evunit
			,String p_no_evgroup,String p_no_emp,String appr) throws Exception{	
	
		if(appr == null) return;
		
		DbTransaction trans = null;
		try{
			trans = this.getDataManager().beginTransaction();
			//String cd_company = this.getCompanyCode();
			if(appr != null && appr.equals("app")){
				SqlPack pack = new SqlPack();
				pack.setStoreProcedure(true);
				pack.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_I_U");
				pack.getInParameters().put("P_CD_COMPANY"   , cd_company);
				pack.getInParameters().put("P_YM_EVLU"   , p_ym_evlu);
				pack.getInParameters().put("P_CD_EVUNIT"   , p_cd_evunit);
				pack.getInParameters().put("P_CD_EVGROUP"   , p_no_evgroup);
				pack.getInParameters().put("P_TP_EVLU"   , null);
				pack.getInParameters().put("P_NO_SEQ",null);//
				pack.getInParameters().put("P_NO_EMP",p_no_emp);  	
				
				pack.getInParameters().put("P_NO_ITEMSEQ",null);//
				pack.getInParameters().put("P_CD_ITEM",null);
				pack.getInParameters().put("P_NUM_ITEM",null);  //
				pack.getInParameters().put("P_DC_DEFINATION",null);
				pack.getInParameters().put("P_DC_PLAN",null);
				pack.getInParameters().put("P_DC_FORMULA",null);
				pack.getInParameters().put("P_CD_STATE","100");
				pack.getInParameters().put("P_DT_CONSENT",null);
				pack.getInParameters().put("P_DT_CHANGED",null);
				pack.getInParameters().put("P_ID_CHANGED",null);
				pack.getInParameters().put("P_ID_UPDATE",null);
				pack.getInParameters().put("P_DC_REASON",null);
				pack.getInParameters().put("P_DT_WRITE",null);
				pack.getInParameters().put("P_DC_RMK",null);
				pack.getInParameters().put("P_CD_PRJ",null);
				pack.getInParameters().put("P_YN_CONSENT",null);
				pack.getInParameters().put("P_ID_CONSENT",null);
				pack.getInParameters().put("P_YN_CHANGED",null);
				pack.getInParameters().put("P_CD_TASK",null);
				pack.getInParameters().put("P_CD_LEVEL",null);
				
				pack.getInParameters().put("P_I_U_D","A");
				this.update(pack);
			}else if(appr != null && appr.equals("cancel")){
				SqlPack pack = new SqlPack();
				pack.setStoreProcedure(true);
				pack.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_I_U");
				pack.getInParameters().put("P_CD_COMPANY"   , cd_company);
				pack.getInParameters().put("P_YM_EVLU"   , p_ym_evlu);
				pack.getInParameters().put("P_CD_EVUNIT"   , p_cd_evunit);
				pack.getInParameters().put("P_CD_EVGROUP"   , p_no_evgroup);
				pack.getInParameters().put("P_TP_EVLU"   , null);
				pack.getInParameters().put("P_NO_SEQ",null);//
				pack.getInParameters().put("P_NO_EMP",p_no_emp);  	
				
				pack.getInParameters().put("P_NO_ITEMSEQ",null);//
				pack.getInParameters().put("P_CD_ITEM",null);
				pack.getInParameters().put("P_NUM_ITEM",null);  //
				pack.getInParameters().put("P_DC_DEFINATION",null);
				pack.getInParameters().put("P_DC_PLAN",null);
				pack.getInParameters().put("P_DC_FORMULA",null);
				pack.getInParameters().put("P_CD_STATE","000");
				pack.getInParameters().put("P_DT_CONSENT",null);
				pack.getInParameters().put("P_DT_CHANGED",null);
				pack.getInParameters().put("P_ID_CHANGED",null);
				pack.getInParameters().put("P_ID_UPDATE",null);
				pack.getInParameters().put("P_DC_REASON",null);
				pack.getInParameters().put("P_DT_WRITE",null);
				pack.getInParameters().put("P_DC_RMK",null);
				pack.getInParameters().put("P_CD_PRJ",null);
				pack.getInParameters().put("P_YN_CONSENT",null);
				pack.getInParameters().put("P_ID_CONSENT",null);
				pack.getInParameters().put("P_YN_CHANGED",null);
				pack.getInParameters().put("P_CD_TASK",null);
				pack.getInParameters().put("P_CD_LEVEL",null);
				pack.getInParameters().put("P_I_U_D","A");
				this.update(pack);
			}else{
				
				System.out.println("app플래그가 이상함 확인요망 ");
			}
			

			trans.commit();
			return;
		}
		catch(Exception e){
			if(trans != null){
				trans.rollback();
			}
			throw new DzApplicationRuntimeException(e);
		}
	}
}

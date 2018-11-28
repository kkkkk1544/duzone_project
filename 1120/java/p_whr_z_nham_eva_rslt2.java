
package com.duzon.ctd.web.components.erpiu.customize.nham;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.duzon.ctd.components.annotation.DefaultViewPath;
import com.duzon.ctd.components.exception.DzApplicationRuntimeException;
import com.duzon.ctd.components.model.DzRequestModel;
import com.duzon.ctd.components.model.DzResponseModel;
import com.duzon.ctd.data.DataSet;
import com.duzon.ctd.data.DataTable;
import com.duzon.ctd.jdbc.objects.SqlPack;
import com.duzon.ctd.jdbc.transaction.DbTransaction;
import com.duzon.ctd.util.JsonUtil;
import com.duzon.ctd.util.StringUtil;
import com.duzon.ctd.web.components.erpiu.DzErpiuServiceBase;
/*
 * 작성자 : 
 * 작성일 : 2017-12-24
 * 메뉴명 : 인사평가 -> 보직자평가
 * 수정자 : 
 * 수정일 :
 * 수정내용 : 
 */
@DefaultViewPath(path="/customize/nham/")
@Service("p_whr_z_nham_eva_rslt2")
public class p_whr_z_nham_eva_rslt2 extends DzErpiuServiceBase {
	
	@Override
	protected String getServiceName() {
		// TODO Auto-generated method stub
		return this.getClass().getName();
	}	
	@Override
	protected DzResponseModel executeInternal(DzRequestModel requestModel) throws Exception {
		
		this.logger.info("ORDER executeInternal start ::: p_whr_z_nham_eva_rslt2");
		
		// TODO Auto-generated method stub
		DzResponseModel responseModel = null;
		
		try{		
			DataTable dt1 = null;
			DataTable dt2 = null;
			DataTable dt3 = null;
			responseModel = new DzResponseModel();	
			String companyCode = this.getCompanyCode();	//회사코드
			if(StringUtil.equals(requestModel.getActionName(), "planCheck")){ 
				DataTable dt = this.PlanCheck(requestModel, companyCode);
				this.displayDataTable(dt);				
				responseModel.setResultDataTable(dt);
			}else if(StringUtil.equals(requestModel.getActionName(), "getCDevtype")){ 
				String cd_evtype = this.GetCDevtype(requestModel, companyCode);
				responseModel.setResultString("cd_evtype", cd_evtype);
			}else if(StringUtil.equals(requestModel.getActionName(), "getGradeList")){ 
				DataSet ds = this.GetGradeList(requestModel, companyCode);
				dt1 = ds.getTable(0);
				dt2 = ds.getTable(1);
				
				responseModel.setResultObject("dt1", dt1);
				responseModel.setResultObject("dt2", dt2);
			}else if(StringUtil.equals(requestModel.getActionName(), "getPipyeongList")){ 
				DataTable dt = this.GetPipyeongList(requestModel, companyCode);
				this.displayDataTable(dt);				
				responseModel.setResultDataTable(dt);
			}else if(StringUtil.equals(requestModel.getActionName(), "getList")){ 
				DataTable dt = this.GetList(requestModel, companyCode);
				this.displayDataTable(dt);				
				responseModel.setResultDataTable(dt);
			}else if(StringUtil.equals(requestModel.getActionName(), "rsltSclList")){ 
				DataTable dt = this.GetRsltSclList(requestModel, companyCode);
				this.displayDataTable(dt);				
				responseModel.setResultDataTable(dt);
			}else if(StringUtil.equals(requestModel.getActionName(), "rsltScmList")){ 
				DataTable dt = this.GetRsltScmList(requestModel, companyCode);
				this.displayDataTable(dt);				
				responseModel.setResultDataTable(dt);
			}else if(StringUtil.equals(requestModel.getActionName(), "rslt2Insert")){ 
				String tp_grade = requestModel.getParameterValue("tp_grade");
				String cd_evtype = requestModel.getParameterValue("cd_evtype");
				if("100".equals(tp_grade) && "100".equals(cd_evtype)){
					this.Save(requestModel, companyCode, tp_grade, cd_evtype);
				}else {
					this.Save(requestModel, companyCode);
				}
//				responseModel.setResultDataTable(dt);
			}else if(StringUtil.equals(requestModel.getActionName(), "checkData")){ 
				int changeCnt = 0;
				String tp_grade = requestModel.getParameterValue("tp_grade");
				String cd_evtype = requestModel.getParameterValue("cd_evtype");
				if("100".equals(tp_grade) && "100".equals(cd_evtype)){
					changeCnt = this.CheckData(requestModel, companyCode, tp_grade, cd_evtype);
				}else {
					changeCnt = this.CheckData(requestModel, companyCode);
				}
				responseModel.setResultInteger("CHANGE_CNT", changeCnt);
			}else if(StringUtil.equals(requestModel.getActionName(), "relCheckData")){ 
				DataSet ds  = this.RelCheckData(requestModel, companyCode);
				dt1 = ds.getTable(0);
				dt2 = ds.getTable(1);
				dt3 = ds.getTable(2);
				
				responseModel.setResultObject("dt1", dt1);
				responseModel.setResultObject("dt2", dt2);
				responseModel.setResultObject("dt3", dt3);
			}else if(StringUtil.equals(requestModel.getActionName(), "checkDeadline")){ 
				String tp_grade = requestModel.getParameterValue("tp_grade");
				String cd_evtype = requestModel.getParameterValue("cd_evtype");
				int deadlineCnt = 0;
				if("100".equals(tp_grade)){
					deadlineCnt = this.CheckDeadline(requestModel, companyCode, tp_grade, cd_evtype);
				}else {
					deadlineCnt = this.CheckDeadline(requestModel, companyCode);
				}
				responseModel.setResultInteger("DEADLINE_CNT", deadlineCnt);
			}else if(StringUtil.equals(requestModel.getActionName(), "deadLineUpdate")){ 
				String tp_grade = requestModel.getParameterValue("tp_grade");
				String cd_evtype = requestModel.getParameterValue("cd_evtype");
				if("100".equals(tp_grade)){
					this.DeadLineUpdate(requestModel, companyCode, tp_grade, cd_evtype);
				}else {
					this.DeadLineUpdate(requestModel, companyCode);
				}
//				responseModel.setResultDataTable(dt);
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
	
	//평가계획조회
	private DataTable PlanCheck(DzRequestModel dzRequestModel, String companyCode){
		DataTable dt = null;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			
			SqlPack	sp = new SqlPack();
			String sqlText = "UP_WHR_Z_NHAM_EVA_PLAN_S";
			sp.setStoreProcedure(true);
			sp.setSqlText(sqlText);
			sp.getInParameters().put("P_CD_COMPANY",  companyCode);
			sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
			sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
			sp.getInParameters().put("P_CD_EVLUTYPE",   tp_evlu);
			sp.getInParameters().put("P_MENU_ID",  "RSLT12");
			
	        dt = this.getDataManager().queryForDataTable(sp);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;	
	}
	
	//평가자구분값 조회
	private String GetCDevtype(DzRequestModel dzRequestModel, String companyCode){
		DataTable dt = null;
		String cd_evtype = "AA";
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String noEmp = this.getEmpNo();	
			
			SqlPack	sp = new SqlPack();
			String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_EVTP_S";
			sp.setStoreProcedure(true);
			sp.setSqlText(sqlText);
			sp.getInParameters().put("P_CD_COMPANY",  companyCode);
			sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
			sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
			sp.getInParameters().put("P_TP_EVLU",   tp_evlu);
			sp.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);
			sp.getInParameters().put("P_NO_EMP",   noEmp);
			sp.getInParameters().put("V_CD_EVTYPE",   cd_evtype);
			this.getDataManager().update(sp);
	        
			cd_evtype = sp.getOutParameters().get("V_CD_EVTYPE").toString();
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return cd_evtype;	
	}
	
	//평가결과 계산기준설정 조회
	private DataSet GetGradeList(DzRequestModel dzRequestModel, String companyCode){
		DataSet dt = null;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String noEmp = this.getEmpNo();	
			
			SqlPack	sp = new SqlPack();
			String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_GRADE_S";
			sp.setStoreProcedure(true);
			sp.setSqlText(sqlText);
			sp.getInParameters().put("P_CD_COMPANY",  companyCode);
			sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
			sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
			sp.getInParameters().put("P_CD_GRDTYPE",   tp_evlu);
			sp.getInParameters().put("P_CD_TYPEH",  cd_evgroup);
			sp.getInParameters().put("P_NO_EMP",  noEmp);
			
	        dt = this.getDataManager().queryForDataset(sp);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;	
	}
	
	//피평가자 조회
	private DataTable GetPipyeongList(DzRequestModel dzRequestModel, String companyCode){
		DataTable dt = null;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String noEmp = this.getEmpNo();	
			
			SqlPack	sp = new SqlPack();
			String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_GS2";
			sp.setStoreProcedure(true);
			sp.setSqlText(sqlText);
			sp.getInParameters().put("P_CD_COMPANY",  companyCode);
			sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
			sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
			sp.getInParameters().put("P_TP_EVLU",   tp_evlu);
			sp.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);
			sp.getInParameters().put("P_NO_EMP",   noEmp);
			
	        dt = this.getDataManager().queryForDataTable(sp);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;	
	}
	
	private DataTable GetList(DzRequestModel dzRequestModel, String companyCode){
		DataTable dt = null;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String s_cd_evgroup = requestModel.getParameterValue("s_cd_evgroup");
			String s_noEmp = requestModel.getParameterValue("s_no_emp");
			String noEmp = this.getEmpNo();	
			
			SqlPack	sp = new SqlPack();
			String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_LS";
			sp.setStoreProcedure(true);
			sp.setSqlText(sqlText);
			sp.getInParameters().put("P_CD_COMPANY",  companyCode);
			sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
			sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
			sp.getInParameters().put("P_TP_EVLU",   tp_evlu);
			sp.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);
			sp.getInParameters().put("P_S_CD_EVGROUP",  s_cd_evgroup);
			sp.getInParameters().put("P_NO_EMP",   noEmp);
			sp.getInParameters().put("P_S_NO_EMP",   s_noEmp);
			
	        dt = this.getDataManager().queryForDataTable(sp);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;	
	}
	
	private DataTable GetRsltSclList(DzRequestModel dzRequestModel, String companyCode){
		DataTable dt = null;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_scaleh = requestModel.getParameterValue("cd_scaleh");
			
			SqlPack	sp = new SqlPack();
			String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_SCL_S";
			sp.setStoreProcedure(true);
			sp.setSqlText(sqlText);
			sp.getInParameters().put("P_CD_COMPANY",  companyCode);
			sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
			sp.getInParameters().put("P_CD_SCALEH",   cd_scaleh);
			
	        dt = this.getDataManager().queryForDataTable(sp);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;	
	}
	
	private DataTable GetRsltScmList(DzRequestModel dzRequestModel, String companyCode){
		DataTable dt = null;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_scaleh = requestModel.getParameterValue("cd_scaleh");
			String cd_scaled = requestModel.getParameterValue("cd_scaled");
			
			SqlPack	sp = new SqlPack();
			String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_SCM_S";
			sp.setStoreProcedure(true);
			sp.setSqlText(sqlText);
			sp.getInParameters().put("P_CD_COMPANY",  companyCode);
			sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
			sp.getInParameters().put("P_CD_SCALEH",   cd_scaleh);
			sp.getInParameters().put("P_CD_SCALED",   cd_scaled);

	        dt = this.getDataManager().queryForDataTable(sp);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;	
	}
	
	@Transactional
	private boolean Save(DzRequestModel requestModel, String companyCode, String tp_grade, String cd_evtype) throws Exception {
		DbTransaction trans = null;
		
		try {
			trans = this.getDataManager().beginTransaction();
			String id_user = this.getUserId();
			String no_emp = this.getEmpNo();		
			
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String cd_grade = requestModel.getParameterValue("cd_grade");
			String grade_dc_rslt = requestModel.getParameterValue("grade_dc_rslt");
			
			List<Map<String, Object>> gridData = JsonUtil.deserialize(requestModel.getParameterValue("gridData"), ArrayList.class);
			
			for(Map<String, Object> data : gridData) {
				if((int)1 < (int)(Double.parseDouble(data.get("ROW_NO").toString()))) {
					SqlPack so = new SqlPack();
					String procedure = "UP_WHR_Z_NHAM_EVA_RSLT_LS2_U";
					so.setStoreProcedure(true);
					so.setSqlText(procedure);	
					String no_itemseq = data.get("NO_ITEMSEQ").toString();
					so.getInParameters().put("P_CD_COMPANY",  companyCode);
					so.getInParameters().put("P_YM_EVLU",   ym_evlu);
					so.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
					so.getInParameters().put("P_TP_EVLU",   tp_evlu);
					so.getInParameters().put("P_CD_EVGROUP",   cd_evgroup);
					so.getInParameters().put("P_NO_EMP",  no_emp);
					so.getInParameters().put("P_S_NO_EMP",  data.get("NO_EMP"));
					so.getInParameters().put("P_NO_ITEMSEQ",   no_itemseq.substring(0, no_itemseq.length()-2));
					so.getInParameters().put("P_CD_SCALEH",   data.get("CD_SCALEH"));
					so.getInParameters().put("P_CD_EVTYPE",	cd_evtype);
					so.getInParameters().put("P_CD_RSLT_1",   data.get("CD_RSLT_1"));
					so.getInParameters().put("P_NUM_RSLT_1",   Double.parseDouble(data.get("NUM_RSLT_1").toString()));
					so.getInParameters().put("P_NUM_CVTRSLT_1", Double.parseDouble(data.get("NUM_CVTRSLT_1").toString()));
					so.getInParameters().put("P_DC_RSLT_1",  data.get("DC_RSLT_1"));
					so.getInParameters().put("P_CD_RSLT_2",   data.get("CD_RSLT_2"));
					so.getInParameters().put("P_NUM_RSLT_2",   Double.parseDouble(data.get("NUM_RSLT_2").toString()));
					so.getInParameters().put("P_NUM_CVTRSLT_2", Double.parseDouble(data.get("NUM_CVTRSLT_2").toString()));
					so.getInParameters().put("P_DC_RSLT_2",  grade_dc_rslt);
					so.getInParameters().put("P_CD_GRADE",  cd_grade);
					so.getInParameters().put("P_NUM_GRADE",  null);
					so.getInParameters().put("P_ID_UPDATE",   id_user);
					
					this.update(so);
				}
			}

			trans.commit();
		
		}catch(Exception e){
			if(trans != null){
				trans.rollback();
			}
			throw new DzApplicationRuntimeException(e);
		}

		return true;
	}
	
	@Transactional
	private boolean Save(DzRequestModel requestModel, String companyCode) throws Exception {
		DbTransaction trans = null;
		
		try {
			trans = this.getDataManager().beginTransaction();
			String id_user = this.getUserId();
			String no_emp = this.getEmpNo();		
			
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String cd_evtype = requestModel.getParameterValue("cd_evtype");
			String num_grade = requestModel.getParameterValue("num_grade");
			String cd_grade = requestModel.getParameterValue("cd_grade");
			
			List<Map<String, Object>> gridData = JsonUtil.deserialize(requestModel.getParameterValue("gridData"), ArrayList.class);
			
			for(Map<String, Object> data : gridData) {
				if((int)1 < (int)(Double.parseDouble(data.get("ROW_NO").toString()))) {
					SqlPack so = new SqlPack();
					String procedure = "UP_WHR_Z_NHAM_EVA_RSLT_LS2_U";
					so.setStoreProcedure(true);
					so.setSqlText(procedure);	
					String no_itemseq = data.get("NO_ITEMSEQ").toString();
					so.getInParameters().put("P_CD_COMPANY",  companyCode);
					so.getInParameters().put("P_YM_EVLU",   ym_evlu);
					so.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
					so.getInParameters().put("P_TP_EVLU",   tp_evlu);
					so.getInParameters().put("P_CD_EVGROUP",   cd_evgroup);
					so.getInParameters().put("P_NO_EMP",  no_emp);
					so.getInParameters().put("P_S_NO_EMP",  data.get("NO_EMP"));
					so.getInParameters().put("P_NO_ITEMSEQ",   no_itemseq.substring(0, no_itemseq.length()-2));
					so.getInParameters().put("P_CD_SCALEH",   data.get("CD_SCALEH"));
					so.getInParameters().put("P_CD_EVTYPE",	cd_evtype);
					so.getInParameters().put("P_CD_RSLT_1",   data.get("CD_RSLT_1"));
					so.getInParameters().put("P_NUM_RSLT_1",   Double.parseDouble(data.get("NUM_RSLT_1").toString()));
					so.getInParameters().put("P_NUM_CVTRSLT_1", Double.parseDouble(data.get("NUM_CVTRSLT_1").toString()));
					so.getInParameters().put("P_DC_RSLT_1",  data.get("DC_RSLT_1"));
					so.getInParameters().put("P_CD_RSLT_2",   data.get("CD_RSLT_2"));
					so.getInParameters().put("P_NUM_RSLT_2",   Double.parseDouble(data.get("NUM_RSLT_2").toString()));
					so.getInParameters().put("P_NUM_CVTRSLT_2", Double.parseDouble(data.get("NUM_CVTRSLT_2").toString()));
					so.getInParameters().put("P_DC_RSLT_2",  data.get("DC_RSLT_2"));
					so.getInParameters().put("P_CD_GRADE",  cd_grade);
					so.getInParameters().put("P_NUM_GRADE",  Double.parseDouble(num_grade));
					so.getInParameters().put("P_ID_UPDATE",   id_user);
					
					this.update(so);
				}
			}

			trans.commit();
		
		}catch(Exception e){
			if(trans != null){
				trans.rollback();
			}
			throw new DzApplicationRuntimeException(e);
		}

		return true;
	}
	
	private int CheckData(DzRequestModel dzRequestModel, String companyCode, String tp_grade, String cd_evtype){
		DataTable dt = null;
		int changeCnt = 0;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String cd_grade = requestModel.getParameterValue("cd_grade");
			String grade_dc_rslt = requestModel.getParameterValue("grade_dc_rslt");
			String noEmp = this.getEmpNo();	
			
			List<Map<String, Object>> gridData = JsonUtil.deserialize(requestModel.getParameterValue("chData"), ArrayList.class);
			
			for(Map<String, Object> data : gridData) {
				if((int)1 < (int)(Double.parseDouble(data.get("ROW_NO").toString()))) {
					SqlPack	sp = new SqlPack();
					String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_LS2_CHECK_S";
					sp.setStoreProcedure(true);
					sp.setSqlText(sqlText);
					String no_itemseq = data.get("NO_ITEMSEQ").toString();
					sp.getInParameters().put("P_CD_COMPANY",  companyCode);
					sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
					sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
					sp.getInParameters().put("P_TP_EVLU",   tp_evlu);
					sp.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);
					sp.getInParameters().put("P_NO_EMP",   noEmp);
					sp.getInParameters().put("P_S_NO_EMP",   data.get("NO_EMP"));
					sp.getInParameters().put("P_NO_ITEMSEQ",   no_itemseq.substring(0, no_itemseq.length()-2));
					sp.getInParameters().put("P_CD_SCALEH",	data.get("CD_SCALEH"));
					sp.getInParameters().put("P_CD_EVTYPE",	cd_evtype);
					sp.getInParameters().put("P_CD_RSLT_1",	data.get("CD_RSLT_1"));
					sp.getInParameters().put("P_DC_RSLT_1",	data.get("DC_RSLT_1"));	
					sp.getInParameters().put("P_CD_RSLT_2",	data.get("CD_RSLT_2"));
					sp.getInParameters().put("P_DC_RSLT_2",	grade_dc_rslt);	
					sp.getInParameters().put("P_TP_GRADE",	tp_grade);				
					sp.getInParameters().put("P_CD_GRADE",	cd_grade);				
					
			        dt = this.getDataManager().queryForDataTable(sp);
			        changeCnt += Integer.parseInt(StringUtil.convertToString(dt.getData(0, "CHANGE_CNT")));
				}
			}
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return changeCnt;	
	}
	
	private int CheckData(DzRequestModel dzRequestModel, String companyCode){
		DataTable dt = null;
		int changeCnt = 0;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String cd_evtype = requestModel.getParameterValue("cd_evtype");
			String cd_grade = requestModel.getParameterValue("cd_grade");
			String tp_grade = requestModel.getParameterValue("tp_grade");
			String noEmp = this.getEmpNo();	
			
			List<Map<String, Object>> gridData = JsonUtil.deserialize(requestModel.getParameterValue("chData"), ArrayList.class);
			
			for(Map<String, Object> data : gridData) {
				if((int)1 < (int)(Double.parseDouble(data.get("ROW_NO").toString()))) {
					SqlPack	sp = new SqlPack();
					String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_LS2_CHECK_S";
					sp.setStoreProcedure(true);
					sp.setSqlText(sqlText);
					String no_itemseq = data.get("NO_ITEMSEQ").toString();
					sp.getInParameters().put("P_CD_COMPANY",  companyCode);
					sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
					sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
					sp.getInParameters().put("P_TP_EVLU",   tp_evlu);
					sp.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);
					sp.getInParameters().put("P_NO_EMP",   noEmp);
					sp.getInParameters().put("P_S_NO_EMP",   data.get("NO_EMP"));
					sp.getInParameters().put("P_NO_ITEMSEQ",   no_itemseq.substring(0, no_itemseq.length()-2));
					sp.getInParameters().put("P_CD_SCALEH",	data.get("CD_SCALEH"));
					sp.getInParameters().put("P_CD_EVTYPE",	cd_evtype);
					sp.getInParameters().put("P_CD_RSLT_1",	data.get("CD_RSLT_1"));
					sp.getInParameters().put("P_DC_RSLT_1",	data.get("DC_RSLT_1"));	
					sp.getInParameters().put("P_CD_RSLT_2",	data.get("CD_RSLT_2"));
					sp.getInParameters().put("P_DC_RSLT_2",	data.get("DC_RSLT_2"));	
					sp.getInParameters().put("P_TP_GRADE",	tp_grade);				
					sp.getInParameters().put("P_CD_GRADE",	cd_grade);				
					
			        dt = this.getDataManager().queryForDataTable(sp);
			        changeCnt += Integer.parseInt(StringUtil.convertToString(dt.getData(0, "CHANGE_CNT")));
				}
			}
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return changeCnt;	
	}
	
	//상대평가 check
	private DataSet RelCheckData(DzRequestModel dzRequestModel, String companyCode){
		DataSet ds = null;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String cd_evtype = requestModel.getParameterValue("cd_evtype");
			String noEmp = this.getEmpNo();	
			
			SqlPack	sp = new SqlPack();
			String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_LS2_REL_CHECK_S";
			sp.setStoreProcedure(true);
			sp.setSqlText(sqlText);
//			for(Map<String, Object> data : gridData) {
			sp.getInParameters().put("P_CD_COMPANY",  companyCode);
			sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
			sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
			sp.getInParameters().put("P_TP_EVLU",   tp_evlu);
			sp.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);
			sp.getInParameters().put("P_NO_EMP",   noEmp);
//			sp.getInParameters().put("P_S_NO_EMP",   data.get("NO_EMP"));
			sp.getInParameters().put("P_CD_EVTYPE",	cd_evtype);	
			
			ds = this.getDataManager().queryForDataset(sp);
				
//			}
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return ds;	
	}
	
	private int CheckDeadline(DzRequestModel dzRequestModel, String companyCode, String tp_grade, String cd_evtype){
		DataTable dt = null;
		int deadlineCnt = 0;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String noEmp = this.getEmpNo();	
			
			List<Map<String, Object>> gridData = JsonUtil.deserialize(requestModel.getParameterValue("chData"), ArrayList.class);
			
			for(Map<String, Object> data : gridData) {
				SqlPack	sp = new SqlPack();
				String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_LS2_DEADLINE_CHECK_S";
				sp.setStoreProcedure(true);
				sp.setSqlText(sqlText);
				sp.getInParameters().put("P_CD_COMPANY",  companyCode);
				sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
				sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
				sp.getInParameters().put("P_TP_EVLU",   tp_evlu);
				sp.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);
				sp.getInParameters().put("P_NO_EMP",   noEmp);
				sp.getInParameters().put("P_S_NO_EMP",   data.get("NO_EMP"));
				sp.getInParameters().put("P_CD_EVTYPE",	cd_evtype);		
				
		        dt = this.getDataManager().queryForDataTable(sp);
		        deadlineCnt += Integer.parseInt(StringUtil.convertToString(dt.getData(0, "DEADLINE_CNT")));
			}
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return deadlineCnt;	
	}
	
	private int CheckDeadline(DzRequestModel dzRequestModel, String companyCode){
		DataTable dt = null;
		int deadlineCnt = 0;
		
		try{
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String cd_evtype = requestModel.getParameterValue("cd_evtype");
			String noEmp = this.getEmpNo();	
			
			Map<String, Object> data = JsonUtil.deserialize(requestModel.getParameterValue("chData"), Map.class);
			
			SqlPack	sp = new SqlPack();
			String sqlText = "UP_WHR_Z_NHAM_EVA_RSLT_LS2_DEADLINE_CHECK_S";
			sp.setStoreProcedure(true);
			sp.setSqlText(sqlText);
			sp.getInParameters().put("P_CD_COMPANY",  companyCode);
			sp.getInParameters().put("P_YM_EVLU",   ym_evlu);
			sp.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
			sp.getInParameters().put("P_TP_EVLU",   tp_evlu);
			sp.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);
			sp.getInParameters().put("P_NO_EMP",   noEmp);
			sp.getInParameters().put("P_S_NO_EMP",   data.get("NO_EMP"));
			sp.getInParameters().put("P_CD_EVTYPE",	cd_evtype);		
			
	        dt = this.getDataManager().queryForDataTable(sp);
	        deadlineCnt += Integer.parseInt(StringUtil.convertToString(dt.getData(0, "DEADLINE_CNT")));
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return deadlineCnt;	
	}
	
	@Transactional
	private boolean DeadLineUpdate(DzRequestModel requestModel, String companyCode, String tp_grade, String cd_evtype) throws Exception {
		DbTransaction trans = null;
		
		try {
			trans = this.getDataManager().beginTransaction();
			String id_user = this.getUserId();
			String no_emp = this.getEmpNo();		
			
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String yn_deadline = requestModel.getParameterValue("yn_deadline");
	
			List<Map<String, Object>> gridData = JsonUtil.deserialize(requestModel.getParameterValue("gridData"), ArrayList.class);
			
			for(Map<String, Object> data : gridData) {
				SqlPack so = new SqlPack();
				String procedure = "UP_WHR_Z_NHAM_EVA_RSLT_LS2_YN_DEADLINE_U";
				so.setStoreProcedure(true);
				so.setSqlText(procedure);	
				so.getInParameters().put("P_CD_COMPANY",  companyCode);
				so.getInParameters().put("P_YM_EVLU",   ym_evlu);
				so.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
				so.getInParameters().put("P_TP_EVLU",   tp_evlu);
				so.getInParameters().put("P_CD_EVGROUP",   cd_evgroup);
				so.getInParameters().put("P_NO_EMP",  no_emp);
				so.getInParameters().put("P_S_NO_EMP",  data.get("NO_EMP"));
				so.getInParameters().put("P_CD_EVTYPE",	cd_evtype);
				so.getInParameters().put("P_YN_DEADLINE",  yn_deadline);
				so.getInParameters().put("P_ID_UPDATE",   id_user);
			        
				this.update(so);
			}
			trans.commit();
		
		}catch(Exception e){
			if(trans != null){
				trans.rollback();
			}
			throw new DzApplicationRuntimeException(e);
		}
		return true;
	}
	
	@Transactional
	private boolean DeadLineUpdate(DzRequestModel requestModel, String companyCode) throws Exception {
		DbTransaction trans = null;
		
		try {
			trans = this.getDataManager().beginTransaction();
			String id_user = this.getUserId();
			String no_emp = this.getEmpNo();		
			
			String ym_evlu = requestModel.getParameterValue("ym_evlu");
			String cd_evunit = requestModel.getParameterValue("cd_evunit");
			String tp_evlu = requestModel.getParameterValue("tp_evlu");
			String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
			String cd_evtype = requestModel.getParameterValue("cd_evtype");
			String yn_deadline = requestModel.getParameterValue("yn_deadline");
	
			Map<String, Object> data = JsonUtil.deserialize(requestModel.getParameterValue("gridData"), Map.class);
			
			SqlPack so = new SqlPack();
			String procedure = "UP_WHR_Z_NHAM_EVA_RSLT_LS2_YN_DEADLINE_U";
			so.setStoreProcedure(true);
			so.setSqlText(procedure);	
			so.getInParameters().put("P_CD_COMPANY",  companyCode);
			so.getInParameters().put("P_YM_EVLU",   ym_evlu);
			so.getInParameters().put("P_CD_EVUNIT",   cd_evunit);
			so.getInParameters().put("P_TP_EVLU",   tp_evlu);
			so.getInParameters().put("P_CD_EVGROUP",   cd_evgroup);
			so.getInParameters().put("P_NO_EMP",  no_emp);
			so.getInParameters().put("P_S_NO_EMP",  data.get("NO_EMP"));
			so.getInParameters().put("P_CD_EVTYPE",	cd_evtype);
			so.getInParameters().put("P_YN_DEADLINE",  yn_deadline);
			so.getInParameters().put("P_ID_UPDATE",   id_user);
		        
			this.update(so);
			trans.commit();
		
		}catch(Exception e){
			if(trans != null){
				trans.rollback();
			}
			throw new DzApplicationRuntimeException(e);
		}
		return true;
	}
	
}


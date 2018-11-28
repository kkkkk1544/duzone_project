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
 * 작성일 : 2018-04-18
 * 메뉴명 : 관리자 본인중간평가
 * 수정자 : 
 * 수정일 :
 * 수정내용 : p_whr_z_nham_eva_slfmid_adm
 */
@DefaultViewPath(path="/customize/nham/")
@Service("p_whr_z_nham_eva_slfmid_adm")
public class p_whr_z_nham_eva_slfmid_adm extends DzErpiuServiceBase {

	@Override
	protected String getServiceName() {
		// TODO Auto-generated method stub
		return this.getClass().getName();
	}	
	@Override
	protected DzResponseModel executeInternal(DzRequestModel requestModel) throws Exception {
		
		logger.info("ORDER executeInternal start ;;; p_whr_z_nham_eva_slfmid_adm");
		// TODO Auto-generated method stub
		DzResponseModel responseModel = null;
		try{		

			responseModel = new DzResponseModel();	
			String cd_company =this.getCompanyCode();
			String no_emp = this.getEmpNo();
			if(StringUtil.equals(requestModel.getActionName(), "AdminList") ){  //목표항목
				
				String ym_evlu = requestModel.getParameterValue("ym_evlu");
				String cd_evunit = requestModel.getParameterValue("cd_evunit");
				String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
				String NoEmp = requestModel.getParameterValue("NoEmp");
				
				//this.logger.info(cd_sysdef + ";;;;;;;;;;;;;;;;");
				DataTable dt = this.GetLsit(cd_company, NoEmp, ym_evlu, cd_evunit, cd_evgroup);
				this.displayDataTable(dt);
				responseModel.setResultDataTable(dt);
				
			}else if(StringUtil.equals(requestModel.getActionName(), "AdminMidtList") ){  //피평가자 의견
				
				String ym_evlu = requestModel.getParameterValue("ym_evlu");
				String cd_evunit = requestModel.getParameterValue("cd_evunit");
				String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
				String no_itemseq = requestModel.getParameterValue("no_itemseq");
				String no_seq = requestModel.getParameterValue("no_seq");
				String NoEmp = requestModel.getParameterValue("NoEmp");
			
				DataTable dt = this.GetMidtLsit(cd_company, NoEmp, ym_evlu, cd_evunit, cd_evgroup, no_itemseq, no_seq);
				this.displayDataTable(dt);
				responseModel.setResultDataTable(dt);
				
			}else if(StringUtil.equals(requestModel.getActionName(), "AdminDataSave") ){  //피평가자 의견
				
				String ym_evlu = requestModel.getParameterValue("ym_evlu");
				String cd_evunit = requestModel.getParameterValue("cd_evunit");
				String cd_evgroup = requestModel.getParameterValue("cd_evgroup");
				String no_itemseq = requestModel.getParameterValue("no_itemseq");
				String no_seq = requestModel.getParameterValue("no_seq");
				String NoEmp = requestModel.getParameterValue("NoEmp");
				
				logger.info(cd_company+";;;"+NoEmp+";;;"+ ym_evlu+";;;"+ cd_evunit+";;;"+ cd_evgroup+";;;"+ no_itemseq+";;;"+ no_seq);
				
				this.SaveData(cd_company, NoEmp, ym_evlu, cd_evunit, cd_evgroup, no_itemseq, no_seq, requestModel.getGridData());
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

	//목표항목
	private DataTable GetLsit(String cd_company,String NoEmp,String ym_evlu, String cd_evunit, String cd_evgroup){
		DataTable dt = null;
		logger.info("admin ;;;;;;;;"+ NoEmp);
		try{
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_I_S");		
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_YM_EVLU", ym_evlu);
			so.getInParameters().put("P_CD_EVUNIT", cd_evunit);
			so.getInParameters().put("P_NO_EMP", NoEmp);
			so.getInParameters().put("P_YN_APPROVE", "300");
			so.getInParameters().put("P_CD_EVGROUP", cd_evgroup);
			
			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}
	
	
	//피평가자의견
	private DataTable GetMidtLsit(String cd_company,String no_emp,String ym_evlu, String cd_evunit, String cd_evgroup, String no_itemseq, String no_seq){
		DataTable dt = null;
		logger.info(ym_evlu + ";;;;;;;;;;;;;;;;;;;"+no_itemseq+";;;;;;;;;;;;;;;;;;;;;; " + no_seq);
		try{
			SqlPack so = new SqlPack();
			so.setStoreProcedure(true);
			so.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_MIDT_S");
			so.getInParameters().put("P_CD_COMPANY", cd_company);
			so.getInParameters().put("P_YM_EVLU", ym_evlu);
			so.getInParameters().put("P_CD_EVUNIT", cd_evunit);
			so.getInParameters().put("P_CD_EVGROUP", cd_evgroup);
			so.getInParameters().put("P_NO_EMP", no_emp);
			so.getInParameters().put("P_NO_ITEMSEQ", no_itemseq);  //항목순번
			so.getInParameters().put("P_NO_CMMTSEQ", ""); 		   //채번 조회에 필요한가?
//			so.getInParameters().put("P_CD_INPUT", "200");		//입력구분  (100 : 성과기록, 200 : 중간평가)
			
			dt = this.queryForDataTable(so);
			
		}catch(Exception e){
			throw new DzApplicationRuntimeException(e);
		}
		return dt;
	}
	
	@Transactional
	private void SaveData(String cd_company,String NoEmp,String ym_evlu,String cd_evunit,String cd_evgroup,
							String no_itemseq,String no_seq, DzGridData gridData) throws Exception {
		if(gridData == null) return;
				
		DbTransaction trans = null;
		try{
			trans = this.getDataManager().beginTransaction();
			
			String id_user = this.getUserId();
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String writeDate = sdf.format(date);
			
			List<Map<String, Object>> add = gridData.getAdded();
			List<Map<String, Object>> update = gridData.getUpdated();
			List<Map<String, Object>> delete = gridData.getDeleted();
			
			int addCnt = add.size();
			int updateCnt = update.size();
			int deleteCnt = delete.size();
			
			logger.debug("addCnt : "+addCnt+";;; updateCnt : "+updateCnt+";;;; deleteCnt : "+deleteCnt);
			if(add != null && addCnt > 0){
//				logger.debug(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                    ADD");
				for(Map<String, Object> item : add){
					SqlPack so = new SqlPack();
					so.setStoreProcedure(true);
					so.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_MIDT_I");
					so.getInParameters().put("P_CD_COMPANY",  cd_company);	//회사코드
					so.getInParameters().put("P_YM_EVLU", 	  ym_evlu);		//기준년월
					so.getInParameters().put("P_CD_EVUNIT",   cd_evunit);	//평가단위
					so.getInParameters().put("P_TP_EVLU",     "100");		//평가유형코드 (업적평가 100, 역량평가 200, 다면평가 300)  
					so.getInParameters().put("P_NO_SEQ",      no_seq);		//평가순번
					so.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);	//평가그룹
					so.getInParameters().put("P_NO_ITEMSEQ",  no_itemseq);	//항목순번
					so.getInParameters().put("P_CD_INPUT",    "200");		//입력구분 (평가자 100, 피평가자 200)
					so.getInParameters().put("P_NO_EMP",      NoEmp);		//평가자 사번?   작성자사번
					so.getInParameters().put("P_NO_EMPCMMT",  NoEmp);		//코멘트 작성자사번
					so.getInParameters().put("P_DT_CMMT",     writeDate);	//코멘트 작성일자 
					so.getInParameters().put("P_DC_CMMT",     Convert.toString(item.get("DC_CMMT")));			//코멘트 내용
					so.getInParameters().put("P_TP_STATUS",   "100");		//진행상태
					so.getInParameters().put("P_TP_PROGRESS", "");			//도달수준
					so.getInParameters().put("P_ID_INSERT",   id_user);		//작성자ID
					
					/*Map<String, Object> map = so.getInParameters();
			        for( Map.Entry<String, Object> elem : map.entrySet() ){
			            logger.debug( String.format("key ::: %s ^^^^^ value ::: %s", elem.getKey(), elem.getValue()) );
			        }*/
			        
					this.update(so);
				}
			}  
			
			if(update != null && updateCnt > 0){
//				logger.debug(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;     UPDATE");
				
				for(Map<String, Object> item : update){
					SqlPack pack = new SqlPack();
					pack.setStoreProcedure(true);
					pack.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_MIDT_U");					
					pack.getInParameters().put("P_CD_COMPANY",  cd_company);	//회사코드
					pack.getInParameters().put("P_YM_EVLU", 	ym_evlu);		//기준년월
					pack.getInParameters().put("P_CD_EVUNIT",   cd_evunit);		//평가단위
					pack.getInParameters().put("P_TP_EVALU",     "100");		//평가유형코드 (업적평가 100, 역량평가 200, 다면평가 300)  
					pack.getInParameters().put("P_NO_SEQ",      no_seq);		//평가순번
					pack.getInParameters().put("P_CD_EVGROUP",  cd_evgroup);	//평가그룹
					pack.getInParameters().put("P_NO_ITEMSEQ",  no_itemseq);	//항목순번
					pack.getInParameters().put("P_CD_INPUT",    "200");			//입력구분 (평가자 100, 피평가자 200)
					pack.getInParameters().put("P_NO_EMP",      NoEmp);		//평가자 사번?   작성자사번
					pack.getInParameters().put("P_NO_CMMTSEQ",  Convert.toInteger(item.get("NO_CMMTSEQ").toString()));	//코멘트순번
					pack.getInParameters().put("P_DC_CMMT",     Convert.toString(item.get("DC_CMMT")));		//코멘트 내용
					pack.getInParameters().put("P_TP_STATUS",   "100");			//진행상태
					pack.getInParameters().put("P_TP_PROGRESS", "");			//도달수준
					pack.getInParameters().put("P_ID_UPDATE",   id_user);		//작성자ID
					logger.debug(Convert.toInteger(item.get("NO_CMMTSEQ").toString())+";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"+Convert.toString(item.get("DC_CMMT")));
					// 파라메터 확인
				/*	Map<String, Object> map = pack.getInParameters();
				        for( Map.Entry<String, Object> elem : map.entrySet() ){
				            logger.debug( String.format("key ::: %s ^^^^^ value ::: %s", elem.getKey(), elem.getValue()) );
				    }*/
					
					this.update(pack);
				}
			}
			
			if(delete != null && deleteCnt > 0){
				for(Map<String, Object> item : delete){
					SqlPack sp = new SqlPack();
					sp.setStoreProcedure(true);
					sp.setSqlText("UP_WHR_Z_NHAM_EVA_RSLT_MIDT_D");
					sp.getInParameters().put("P_CD_COMPANY", cd_company);	//회사코드
					sp.getInParameters().put("P_YM_EVLU", ym_evlu);			//기준년월
					sp.getInParameters().put("P_CD_EVUNIT", cd_evunit);		//평가단위
					sp.getInParameters().put("P_TP_EVALU", "100");			//평가유형코드 (업적평가 100, 역량평가 200, 다면평가 300)  
					sp.getInParameters().put("P_NO_SEQ", no_seq);			//평가순번
					sp.getInParameters().put("P_CD_EVGROUP", cd_evgroup);	//평가그룹
					sp.getInParameters().put("P_NO_ITEMSEQ", no_itemseq);	//평가항목순번
					sp.getInParameters().put("P_CD_INPUT", "200");			//입력구분 (평가자 100, 피평가자 200)
					sp.getInParameters().put("P_NO_EMP", NoEmp);			//사원번호
					sp.getInParameters().put("P_NO_CMMTSEQ", Convert.toInteger(item.get("NO_CMMTSEQ").toString()));	//코멘트순번
					//파라메터 확인
					/*Map<String, Object> map = sp.getInParameters();
			        for( Map.Entry<String, Object> elem : map.entrySet() ){
			            logger.debug( String.format("key ::: %s ^^^^^ value ::: %s", elem.getKey(), elem.getValue()) );
				    }*/
					this.update(sp);
				}
			}
			trans.commit();
			return;
			
		}catch(Exception e){
			if(trans != null){
				trans.rollback();
			}
//			throw new DzApplicationRuntimeException(e);
		}
	}
	
	
}

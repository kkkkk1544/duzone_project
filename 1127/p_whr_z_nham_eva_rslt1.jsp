<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
<tiles:putAttribute name="content">
	<!--   
		작성자 : 
		작성일 : 2017-12-23
		메뉴명 : 본인평가
		수정자 : 
		수정일 :
		수정내용 : p_whr_z_nham_eva_rslt1.jsp
	 -->
	 
    <!-- 버튼영역 시작 -->
	<div class="dews-button-group dews-button-group-primary">
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_search">조회</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_save">저장</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_submit_deadline">입력마감</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_cancel_deadline">마감취소</button>
	</div>
    <!-- 버튼영역 끝 -->
  
    <!-- 조회조건 영역 -->  
    <div class="dews-condition-panel">
    	<form class="dews-condition-form">
    		<ul>
				<li>
					<label for='ym_evlu' class='required dews-ui-multilingual'>기준년월</label> 					
					<span>
<!-- 						<input name="ym_evlu"  -->
<!-- 						       id="ym_evlu"  -->
<!-- 						       type="text"  -->
<!-- 						       class="dews-ui-codepicker required" -->
<!-- 						       data-dews-help-code="P_HR_YM" -->
<!-- 							   data-dews-help-title="기준년월도움창"  -->
<!-- 							   data-dews-code-field="YM_EVLU" -->
<!-- 							   data-dews-text-field="YM_EVLU" -->
<!-- 							   data-dews-help-params="PAGEID=SLFMID" -->
<!-- 							   data-dews-format="0000/00" -->
<!-- 							/> -->
						<select id="ym_evlu" class="dews-ui-dropdownlist" 
								data-dews-value-field="YM_EVLU" 
								data-dews-text-field="NM_EVLU" 
								data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=200">
           				</select>
					</span>					
				</li>
				<li >
					<label class="dews-ui-multilingual" for="cd_evunit">평가단위</label>
	                <span>
	                    <select class="dews-ui-dropdownlist" id="cd_evunit" 
	                    		data-dews-text-field="NM_SYSDEF" 
	                    		data-dews-value-field="CD_SYSDEF" 
	                    		data-dews-data-url="~/Data/CommonData/getCodeData?cd_field=HR_EV00006&dummy_yn=N" >
	                    </select>
	                </span>
				</li>
				<li >
					<label class="dews-ui-multilingual" for="tp_evlu">평가유형</label>
	                <span>
	                	<select class="dews-ui-dropdownlist" id="tp_evlu" 
	                			data-dews-text-field="NM_SYSDEF" 
	                			data-dews-value-field="CD_SYSDEF" 
	                			data-dews-data-url="~/Data/CommonData/getCodeData?cd_field=HR_EV00004&dummy_yn=N" >
	                	</select>
	                </span>
				</li>
				<li>
					<label class="dews-ui-multilingual" for="nm_group">평가그룹</label>
	                <span>
	                	<select id='nm_group' class='dews-ui-dropdownlist'
	                		data-dews-value-field='CD_EVGROUP'
	                		data-dews-text-field='NM_EVGROUP'
	                		data-dews-data-url='~/Data/help_p_whr_z_nham_eva_group/EvaGroup'>
	                	</select>
	                </span>
           		</li>
			</ul>
    	</form>
    </div> 
    <!-- 조회조건 끝 -->
 
    <!-- 버튼영역 시작 -->
	<div class="dews-button-group">
		<div class="dews-grid-title">
			<span>평가입력</span>
		</div>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_file">첨부파일</button>
	</div>
    <!-- 버튼영역 끝 -->
    
    <!-- 그리드 영역 시작  -->
	<div class="dews-grid-panel">
		<!-- (업적평가)그리드 -->
		<div id="grid_list" class="dews-ui-grid"></div>
		<!-- (역량평가)그리드 -->
		<div id="grid_list2" class="dews-ui-grid"></div>
	</div>
	<!-- 그리드 영역 끝 -->
	
	<!-- comment 영역 시작 -->
	<div class="dews-button-group">
		<div class="dews-grid-title">
			<span>산출근거 및 기타 COMMENT 사항(상세작성)</span>
		</div>
	</div>
    
	<div class="dews-condition-panel div-3" style="text-align:center" id="dataForm">
		<form class="dews-condition-form">
			<ul>
				<li class="col-3">
					<label for='dc_rslt1' class='dews-ui-multilingual'>자기평가</label>
					<span>
						<textarea id="dc_rslt1" class="dews-ui-textbox" rows="3" name="DC_RSLT1" onchange="dcRslt1Text(this.value);"></textarea>
					</span>
				</li>

				<li class="col-3">
					<label for='dc_rslt2' class='dews-ui-multilingual'>평가자(1차)</label> 	
					<span>
						<textarea id="dc_rslt2" class="dews-ui-textbox readonly" rows="3"></textarea>
					</span>
				</li>
				
				<li class="col-3">
					<label for='dc_rslt3' class='dews-ui-multilingual'>평가자(2차)</label> 	
					<span>
						<textarea id="dc_rslt3" class="dews-ui-textbox readonly" rows="3"></textarea>
					</span>
				</li>
				
				<li class="col-3">
					<label for='dc_rslt4' class='dews-ui-multilingual'>평가자(3차)</label> 	
					<span>
						<textarea id="dc_rslt4" class="dews-ui-textbox readonly" rows="3"></textarea>
					</span>
				</li>
				
			</ul>
		</form>
	</div>
	
	<script>
	var grid, grid2, dataSource1, dataSource2, rsltSclDataSource, sclArr, changeData, no_emp;
	
	dews.ready(function() {
		//초기데이터
		initPageData();
		
		var tp_evlu, cdScaleh;
		changeData = false;
		isDeadline = false;
		$("#btn_cancel_deadline").attr("disabled", "disabled");
		
		// 평가그룹 SET
		//groupSelect();
	 	

		dataSource1 = dews.ui.dataSource("dataSource1", {
        	batch: true,	//그리드 저장시
            schema: {
                model: {
                    fields: {
                    	NM_TASK:   		{ editable: false, type: "string" },
                    	NM_ITEM:    	{ editable: false, type: "string" },
                    	DC_DEFINATION:	{ editable: false, type: "string" },	
                    	DC_PLAN:    	{ editable: false, type: "string" },	
                    	DC_FORMULA:  	{ editable: false, type: "string" },	
                    	NUM_ITEM: 		{ editable: false, type: "string" },
                    	NM_SCALED:  	{ editable: true,  type: "string" },
                    	NUM_CVTRSLT: 	{ editable: false, type: "number" }
                    }
                }
            }
        });
		
		dataSource2 = dews.ui.dataSource("dataSource2", {
        	batch: true, 	//그리드 저장시
            schema: {
                model: {
                    fields: {	
                    	NM_ITEM:  		{ editable: false, type: "string" },
                    	NM_ITEM2:  		{ editable: false, type: "string" },
                    	NUM_ITEM:  		{ editable: false, type: "string" },	
                    	NM_SCALED: 		{ editable: true,  type: "string" },
                    	NUM_CVTRSLT: 	{ editable: false, type: "number" }
                    }
                }
            }
        });  
		
		//grid SET
		selectGrid();
	    
	}); // END dew.ready
	
	//조회
	$("#btn_search").on("click", function() {
		var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
		if(check_tp_evlu == '100') {
			dataSource1.data([]);
		}else if(check_tp_evlu == '200') {
			dataSource2.data([]);
		}
		
		dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt1","planCheck"),{
    		async : false,
			data  : {
   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value()
            }
    	}).done(function(result){
    		if(result[0].CNT > 0) {
    			if(dews.ui.dropdownlist('#nm_group').value()){
					selectData();
				}
   			}else {
   				dews.alert("기간을 확인해주세요.","ico2");
   			}
    	});
	});
	
	//저장
	$('#btn_save').on('click', function (e) {
		
		//평가유형 체크
		var sGrid, sSourse;
		var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
		if(check_tp_evlu == '100') {
			sGrid = grid;
			sSourse = dataSource1;
		}else if(check_tp_evlu == '200') {
			sGrid = grid2;
			sSourse = dataSource2;
		}else {
			sGrid = grid;
			sSourse = dataSource1;
		}
		
		//데이터 변경체크
		var gridData = sGrid.dataItems();
		
		if(gridData == null) {
			dews.alert("항목이 존재하지 않습니다.");
			return;
		}
		
		dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt1","checkData"),{
    		async : false,
			data  : {
   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
				chData : JSON.stringify(gridData)
            }
    	}).done(function(result){
    		if(result.CHANGE_CNT > 0) {
   				changeData = true;
   			}else {
   				changeData = false;
   			}
    	});
		
		if(!changeData) {
			dews.alert("변경 된 내용이 존재하지 않습니다.");
			return;
		}
		
		for(var i=1; i<gridData.length; i++){
			if(!gridData[i].DC_RSLT && gridData[i].DC_RSLT != ""){
				if(gridData[i].LB_EVGROUP == 5){
					gridData[i].DC_RSLT = gridData[i].DC_RSLT5;
				}else if(gridData[i].LB_EVGROUP == 4){
					gridData[i].DC_RSLT = gridData[i].DC_RSLT4;
				}else if(gridData[i].LB_EVGROUP == 3){
					gridData[i].DC_RSLT = gridData[i].DC_RSLT3;
				}else if(gridData[i].LB_EVGROUP == 2){
					gridData[i].DC_RSLT = gridData[i].DC_RSLT2;
				}else if(gridData[i].LB_EVGROUP == 1){
					gridData[i].DC_RSLT = gridData[i].DC_RSLT1;
				}
			}
		}
	
		dews.confirm('저장하시겠습니까?').yes(function() {
			sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt1", "rslt1Insert"),{
	       		async : false,
	   			data  : {
	   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
	   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
	   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
	   				gridData : JSON.stringify(gridData)
				},
				callback: function (result) {
					if (result && result.hasOwnProperty("error")) {
	                      dews.error(dews.localize.get("저장이 실패하였습니다."));
	                      console.log(result.error);
					} else {
		        		dews.alert(dews.localize.get("저장 성공하였습니다.")).done(function() {
		        			selectData();
		        			
		        		});
	                  }
				} // end callback 
			}); // end batchSave
		}).no(function() {
			// 무반응
		});
    });

	// 입력마감
	$('#btn_submit_deadline').on('click', function (e) {
		var sGrid, sSourse;
		
		//평가유형 체크
		var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
		if(check_tp_evlu == '100') {
			sGrid = grid;
			sSourse = dataSource1;
		}else if(check_tp_evlu == '200') {
			sGrid = grid2;
			sSourse = dataSource2;
		}else {
			sGrid = grid;
			sSourse = dataSource1;
		}
		
		var gridData = sGrid.dataItems();

		if(gridData == null) {
			dews.alert("항목이 존재하지 않습니다.");
			return;
		}
		/* //달성도 null체크
		for(var i=1; i<gridData.length; i++) {
			if(!gridData[i].NM_SCALED){
				dews.alert("자기달성도가 없는 항목이 존재합니다.");
				return;
			}
		}
 */
		//데이터 변경체크
		dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt1","checkData"),{
    		async : false,
			data  : {
   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
				chData : JSON.stringify(gridData)
            }
    	}).done(function(result){
    		if(result.CHANGE_CNT > 0) {
   				changeData = true;
   			}else {
   				changeData = false;
   			}
    	});
		
		if(changeData) {
			dews.alert("저장 후 입력 마감이 가능합니다.");
			return;
		}
		
		dews.confirm('입력마감 하시겠습니까?').yes(function() {
			sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt1", "deadLineUpdate"),{
	       		async : false,
	   			data  : {
	   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
	   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
	   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
	   				yn_deadline : "Y",
	   				gridData : JSON.stringify(gridData)
				},
				callback: function (result) {
					if (result && result.hasOwnProperty("error")) {
	                      dews.error(dews.localize.get("입력마감 작업이 실패하였습니다."));
	                      console.log(result.error);
					} else {
		        		dews.alert(dews.localize.get("입력마감 작업이 완료되었습니다.")).done(function() {
		        			selectData();
							$("#btn_cancel_deadline").removeAttr("disabled");
							$("#btn_submit_deadline").attr("disabled", "disabled");
							dews.ui.textbox("#dc_rslt1").readonly(true);
				      		sGrid.closeCell();
		        		});
	                }
	            } // end callback 
	  		}); // end batchSave
		}).no(function() {
			// 무반응
		});
		
    });
	
	// 마감취소
	$('#btn_cancel_deadline').on('click', function (e) {
		var sGrid, sSourse;
		
		//평가유형 체크
		var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
		if(check_tp_evlu == '100') {
			sGrid = grid;
			sSourse = dataSource1;
		}else if(check_tp_evlu == '200') {
			sGrid = grid2;
			sSourse = dataSource2;
		}else {
			sGrid = grid;
			sSourse = dataSource1;
		}
		
		var gridData = sGrid.dataItems();
		
		if(gridData == null) {
			dews.alert("항목이 존재하지 않습니다.");
			return;
		}
		
		//마감취소 가능여부 확인
		dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt1","checkDeadline"),{
    		async : false,
			data  : {
   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value()
            }
    	}).done(function(result){
    		if(result.DEADLINE_CNT > 0) {
    			isDeadline = true;
   			}else {
   				isDeadline = false;
   			}
    	});
		
		if(isDeadline) {
			dews.alert("마감취소 할 수 없는 상태입니다.");
			return;
		}
		
		dews.confirm('마감취소 하시겠습니까?').yes(function() {
			sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt1", "deadLineUpdate"),{
	       		async : false,
	   			data  : {
	   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
	   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
	   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
	   				yn_deadline : "N",
	   				gridData : JSON.stringify(gridData)
				},
				callback: function (result) {
					if (result && result.hasOwnProperty("error")) {
	                      dews.error(dews.localize.get("마감취소 작업이 실패하였습니다."));
	                      console.log(result.error);
					} else {
		        		dews.alert(dews.localize.get("마감취소 작업이 완료되었습니다.")).done(function() {
		        			selectData();
							$("#btn_submit_deadline").removeAttr("disabled");
							$("#btn_cancel_deadline").attr("disabled", "disabled");
							dews.ui.textbox("#dc_rslt1").readonly(false);
		        		});
	                }
	            } // end callback 
	  		}); // end batchSave
		}).no(function() {
			// 무반응
		});
		
    });
	
	//기준연월
	$("#ym_evlu").on("change", function(e){
		 dews.ui.dropdownlist("#ym_evlu").value(e.target.value);
		 ym_evlu = e.target.value;
		 groupSelect();
	});
	
	//평가단위
	$("#cd_evunit").on("change", function(e){
		 dews.ui.dropdownlist("#cd_evunit").value(e.target.value);
		 cd_evunit = e.target.value;
		 groupSelect();
	});
	
	//평가유펑
	$("#tp_evlu").on("change", function(e){
  		dews.ui.textbox("#dc_rslt1").readonly(false);
		dews.ui.dropdownlist("#tp_evlu").value(e.target.value);
		tp_evlu = e.target.value;
		selectGrid();
	});
	
	// 파일첨부
	$('#btn_file').on('click', function (e) {
		var row = grid.select();
	    var rowData = grid.dataItem(row);	
	    var flag = {flag: true};
    	$.extend(rowData,flag);
	    if(rowData){
    		var initData = {
    				pIdMenu: "p_whr_z_nham_goal_reg",   //구분자 줘서 그냥 쓰면 될듯합니다.
    				pFilePath: "",
					pCdFile: rowData.YM_EVLU + "_" + rowData.CD_EVUNIT + "_" + rowData.CD_EVGROUP + "_" + rowData.NO_EMP + "_0",		
					params: {
						data: rowData
					}
			};
    		var dialog= dews.ui.dialog('p_whr_z_nham_file_attach_pop', {
				url: "~/p_whr_z_nham_file_attach_pop",
				title: "첨부파일 업다운로드",
				width: 800,
				height: 300,
				ifram: true,
				ok:function(data){
				}
			});
			dialog.setInitData(initData);
			dialog.open();
    	} 
    });
	
	//자기평가
	function dcRslt1Text(val) {
		var sGrid, sSourse;
		
		//평가유형 체크
		var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
		if(check_tp_evlu == '100') {
			sGrid = grid;
			sSourse = dataSource1;
		}else if(check_tp_evlu == '200') {
			sGrid = grid2;
			sSourse = dataSource2;
		}else {
			sGrid = grid;
			sSourse = dataSource1;
		}
		var data = sGrid.dataItem(sGrid.select());
		
		if(data) {
			data["DC_RSLT"] = val;
		}else {
			dews.ui.textbox("#dc_rslt1").text("");
			dews.ui.textbox("#dc_rslt2").text("");
			dews.ui.textbox("#dc_rslt3").text("");
			dews.ui.textbox("#dc_rslt4").text("");
		}

	}
	</script>
	<script>
	//초기데어터
	function initPageData() {
		
		dews.ajax.data(dews.url.getDataUrl("CommonData","getCurrentUser"), { async: false }).done(function (currentUser) {
			no_emp = currentUser.NO_EMP;
	    });
	    
		// 평가유형 select
		var tp_evlulist, tp_evlu_arr = new Array();
		dews.ajax.data('~/Data/CommonData/getCodeData?cd_field=HR_EV00004&use_yn=Y&dummy_yn=N', { async: false }).done(function (data) {
			for(var i=0; i<data.length; i++){
				if(data[i].CD_SYSDEF != "300"){ //다면제외
					tp_evlu_arr.push(data[i]);
				}
			}
		}).fail(function(data) {
			dews.error(data.responseJSON.message);
		});
		tp_evlulist = dews.ui.dropdownlist('#tp_evlu');
		tp_evlulist.setDataSource(tp_evlu_arr);
	}
	
	//평가그룹 조회
	function groupSelect() {
		dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_group","EvaGroup"),{
       		async : false,
   			data  : {
   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
   				cd_evtype : "200"
               }
       	}).done(function(result){
       		var arr = new Array();
//     		arr.push({CD_EVGROUP:"", NM_EVGROUP : ""});
    		if(JSON.stringify(result) !== "[]" && result.length > 0) {
    			for(var i=0; i<result.length; i++) {
	    			data = {
	    					CD_EVGROUP : result[i].CD_EVGROUP,
	    					NM_EVGROUP : result[i].NM_EVGROUP
	    			}	
	    			arr.push(data);
    			}
    		}
			var evgroup_code = dews.ui.dropdownlist('#nm_group');
			evgroup_code.setDataSource(arr);
			evgroup_code.select(0);
       	});
	}
	
	//평가유형별 그리드 SET
	function selectGrid() {
		$("#grid_list").hide();
		$("#grid_list2").hide();
		dews.ui.textbox("#dc_rslt1").text("");
		dews.ui.textbox("#dc_rslt2").text("");
		dews.ui.textbox("#dc_rslt3").text("");
		dews.ui.textbox("#dc_rslt4").text("");
		
		var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();

		if(check_tp_evlu === "100" || !check_tp_evlu) {
			$("#grid_list").show();
			gridList1();
			dews.ui.grid("#grid_list").clearSelection();
		}else if(check_tp_evlu === "200" || !check_tp_evlu) {
			$("#grid_list2").show();
			gridList2();
			dews.ui.grid("#grid_list2").clearSelection();
		}else {
			$("#grid_list").show();
			gridList1();
		}
		
	} // END selectGrid
	
	//첨부파일 데이터 
	function fileCheck(no_emp){
		var ym_evlu = dews.ui.dropdownlist("#ym_evlu").value();
		var cd_evunit = dews.ui.dropdownlist("#cd_evunit").value();
		var cd_evgroup = dews.ui.dropdownlist("#nm_group").value();
			
		dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_file_attach_pop","loadRealFile"),{
       		async : false,
   			data  : {
   				pIdMenu: "p_whr_z_nham_goal_reg",
   				pCdFile: ym_evlu + "_" + cd_evunit + "_" + cd_evgroup + "_" + no_emp + "_0"
               }
       	}).done(function(result){
       		if(result.length > 0) {
       			$("#btn_file").enable(true);
       		}else {
       			$("#btn_file").enable(false);
       		}
       	})
	} // END fileCheck

	//그리드 조회
	function selectData() {
		var gridData, sGrid, sDataSource;
		var tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
		if(tp_evlu === "100" || !tp_evlu) {
			sDataSource = dataSource1;
			sGrid = dews.ui.grid("#grid_list");	
		}else if(tp_evlu === "200" || !tp_evlu) {
			sDataSource = dataSource2;	
			sGrid = dews.ui.grid("#grid_list2");
		}else {
			sDataSource = dataSource1;
			sGrid = dews.ui.grid("#grid_list");
		}
		dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_rslt1", "getList"), {
	        async: false,
	        data:{
               	ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
               	cd_evunit : dews.ui.dropdownlist('#cd_evunit').value(),
               	tp_evlu : dews.ui.dropdownlist('#tp_evlu').value(),
               	cd_evgroup : dews.ui.dropdownlist('#nm_group').value()
	        }
	    }).done(function (result) {
	    	if(result.length > 0){
	    		for(var i=0; i<result.length; i++) {
            		var lb_evgroup = result[i].LB_EVGROUP;
            		var cd_evtype = result[i].CD_EVTYPE;
            		if(i > 0) {
            			if(lb_evgroup == 5) {
            				result[i].CD_RSLT = result[i].CD_RSLT5;
            				result[i].NUM_RSLT = result[i].NUM_RSLT5;
            				result[i].NM_SCALED = result[i].NM_SCALED5;
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT5;
	                		dews.ui.textbox("#dc_rslt1").text(result[i].DC_RSLT5);
	                		dews.ui.textbox("#dc_rslt2").text(result[i].DC_RSLT4);
	                		dews.ui.textbox("#dc_rslt3").text(result[i].DC_RSLT3);
	                		dews.ui.textbox("#dc_rslt4").text(result[i].DC_RSLT2);
            			}else if(lb_evgroup == 4) {
            				result[i].CD_RSLT = result[i].CD_RSLT4;
            				result[i].NUM_RSLT = result[i].NUM_RSLT4;
            				result[i].NM_SCALED = result[i].NM_SCALED4;
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT4;
	                		dews.ui.textbox("#dc_rslt1").text(result[i].DC_RSLT4);
	                		dews.ui.textbox("#dc_rslt2").text(result[i].DC_RSLT3);
	                		dews.ui.textbox("#dc_rslt3").text(result[i].DC_RSLT2);
	                		dews.ui.textbox("#dc_rslt4").text(result[i].DC_RSLT1);
            			}else if(lb_evgroup == 3) {
            				result[i].CD_RSLT = result[i].CD_RSLT3;
            				result[i].NUM_RSLT = result[i].NUM_RSLT3;
            				result[i].NM_SCALED = result[i].NM_SCALED3;
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT3;
	                		dews.ui.textbox("#dc_rslt1").text(result[i].DC_RSLT3);
	                		dews.ui.textbox("#dc_rslt2").text(result[i].DC_RSLT2);
	                		dews.ui.textbox("#dc_rslt3").text(result[i].DC_RSLT1);
            			}else if(lb_evgroup == 2) {
            				result[i].CD_RSLT = result[i].CD_RSLT2;
            				result[i].NUM_RSLT = result[i].NUM_RSLT2;
            				result[i].NM_SCALED = result[i].NM_SCALED2;
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT2;
	                		dews.ui.textbox("#dc_rslt1").text(result[i].DC_RSLT2);
                			dews.ui.textbox("#dc_rslt2").text(result[i].DC_RSLT1);
            			}else if(lb_evgroup == 1) {
            				result[i].CD_RSLT = result[i].CD_RSLT1;
            				result[i].NUM_RSLT = result[i].NUM_RSLT1;
            				result[i].NM_SCALED = result[i].NM_SCALED1;
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT1;
	                		dews.ui.textbox("#dc_rslt1").text(result[i].DC_RSLT1);
            			}
            		}else {
            			result[i].NM_SCALED = "-";
            			if(lb_evgroup == 5) {
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT5;
            			}else if(lb_evgroup == 4) {
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT4;
            			}else if(lb_evgroup == 3) {
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT3;
            			}else if(lb_evgroup == 2) {
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT2;
            			}else if(lb_evgroup == 1) {
            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT1;
            			}
            		}
	    		}
		    	gridData = result;
		    	
		    	fileCheck(no_emp);
	  	  	}else {
	  	  		sDataSource.data([]);
	  	  		dews.ui.textbox("#dc_rslt1").text("");
	  	  		dews.ui.textbox("#dc_rslt1").readonly(false);
	    	}
	   	});
		sGrid.dataSource.data(gridData); 
	}
	
	//업적평가
	function gridList1() {  
         
        grid = dews.ui.grid("#grid_list", {
        	dataSource: dataSource1,
            editable: {	createAt: 'bottom' },
            selectable: "row",
            height: 300,
	        columns: [	
                {
                    field: "NM_TASK",
                    title: dews.localize.get("과업명"),
                    width: 70,
                    align: "left"
                },
                {
                    field: "NM_ITEM",
                    title: dews.localize.get("KPI명"),
                    width: 70,
                    align: "left"
                },
                {
                    field: "DC_DEFINATION",
                    title: dews.localize.get("업적목표(KPI정의)"),
                    width: 90,
                    align: "left"
                },
                {
                    field: "DC_PLAN",
                    title: dews.localize.get("계획 및 달성수준"),
                    width: 80,
                    align: "left"
                },
                {
                    field: "DC_FORMULA",
                    title: dews.localize.get("평가 및 등급부여기준(KPI 산식)"),
                    width: 120,
                    align:"left"
                },
                {
                    field: "NUM_ITEM",		
                    title: dews.localize.get("가중치"),
                    width: 40
                },
                {
                    field: "CD_RSLT",		
                    title: dews.localize.get("자기달성도"),
                    width: 40,
	        		hidden : true
                },
                {
                    field: "NM_SCALED",		
                    title: dews.localize.get("자기달성도"),
                    width: 40,
       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED', { 
	        			dataSourceID	: 'rsltSclDataSource', 
	        			dataValueField	: 'CD_SYSDEF', 
	        			dataTextField	: 'NM_SYSDEF' 
	        		}),
	        		editor		: function(container, options) {
	        			dews.ui.grid.editors.dropdownlist(container, options, {
    	        				dataValueField	: 'CD_SYSDEF', 
    	                    	dataTextField	: 'NM_SYSDEF', 
    	                    	dataSource		: rsltSclDataSource,
	        				}, function(data) {
		        				var lb_evgroup = data.LB_EVGROUP;
		        				if((lb_evgroup == "5" && data.YN_DEADLINE5 == "Y")
		        					|| (lb_evgroup == "4" && data.YN_DEADLINE4 == "Y")
		        					|| (lb_evgroup == "3" && data.YN_DEADLINE3 == "Y")
		        					|| (lb_evgroup == "2" && data.YN_DEADLINE2 == "Y")
		        					|| (lb_evgroup == "1" && data.YN_DEADLINE1 == "Y")) {
		        					return false;
		        				}else {
			        				return true;	
		        				}
	        				}
	        			)
	        		}
                },
                {
                    field: "NUM_CVTRSLT",		
                    title: dews.localize.get("평가 환산점수"),
                    width: 50,
                    format: dews.ui.grid.formats.number('n02'),
	        		attributes: {
	                    id : "NUM_CVTRSLT"
	                }
                }  
            ],
            dataBound: function (e) {
            	this.select(this.element.find("tbody tr:nth-child(2)"));
            },
            change: function(e) {
            	var currentRow, rowData, 
            	rowNum = 0;

                currentRow = grid.select(); // 현재 선택된 ROW
            	if(currentRow.length > 0) {
                    rowData = grid.dataItem(currentRow); // 현재 ROW의 데이터 획득
					rowNum = rowData.ROW_NO;
                    
                    if (rowData && rowNum > 1) {
                    	
                    	//레벨에 따른 마감여부 SET
                    	deadlineSet(rowData);
                    	
                    	//레벨에 따라서 평가 comment 뿌려주기
                    	lbCommentSet(rowData);
                    	
                    	cdScaleh = rowData.CD_SCALEH;
                    
                    } else if(rowNum == 1) {
                    	grid.closeCell();
                    }
            	}else {
        			dataSource1.data([]);
            	}
                
                if(rowNum > 1) {
	            	rsltSclList(cdScaleh);
                }
            },
            save: function(e) {
            	// 달성도가 수정되었는지 확인
            	if (e.values.hasOwnProperty('NM_SCALED')) { // 감시하고자 하는 컬럼이 수정되었는지 확인하는 방법
            		var result = rsltScmList(cdScaleh, e.values.NM_SCALED, e.model.NUM_ITEM);
                	e.model.CD_RSLT = e.values.NM_SCALED; // 다른 입력 가능 셀의 값을 변경시킵니다.
            		e.model.NUM_RSLT = result.num_ptscale.toFixed(2);
                    e.model.NUM_CVTRSLT = result.num_cvtrslt.toFixed(2); // 다른 입력 가능 셀의 값을 변경시킵니다.
            	}
            }
       	});
	}
	
	//역량평가
	function gridList2() {
        grid2 = dews.ui.grid("#grid_list2", {
        	dataSource: dataSource2,
            editable: {	createAt: 'bottom' },
            selectable: "row",
            autoBind: false,
            noData: true,
            height: 300,
	        columns: [	
                {
                    field: "NM_ITEM",
                    title: dews.localize.get("항목"),
                    width: 200,
                    align:"left"
                },		
                {
                    field: "NM_ITEM2",
                    title: dews.localize.get("항목상세"),
                    width: 450,
                    align:"left"
                },
                {
                    field: "NUM_ITEM",		
                    title: dews.localize.get("가중치"),
                    width: 100
                },
                {
                    field: "CD_RSLT",		
                    title: dews.localize.get("자기달성도"),
                    width: 100,
	        		hidden : true
                },
                {
                    field: "NM_SCALED",		
                    title: dews.localize.get("자기달성도"),
                    width: 100,
       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED', { 
	        			dataSourceID	: 'rsltSclDataSource', 
	        			dataValueField	: 'CD_SYSDEF', 
	        			dataTextField	: 'NM_SYSDEF' 
	        		}),
	        		editor		: function(container, options) {
	        			if(options.model.ROW_NO > 1) {
		        			dews.ui.grid.editors.dropdownlist(container, options, {
	    	        				dataValueField	: 'CD_SYSDEF', 
	    	                    	dataTextField	: 'NM_SYSDEF', 
	    	                    	dataSource		: rsltSclDataSource,
		        				}, function(data) {
			        				var lb_evgroup = data.LB_EVGROUP;
			        				if((lb_evgroup == "5" && data.YN_DEADLINE5 == "Y")
			        					|| (lb_evgroup == "4" && data.YN_DEADLINE4 == "Y")
			        					|| (lb_evgroup == "3" && data.YN_DEADLINE3 == "Y")
			        					|| (lb_evgroup == "2" && data.YN_DEADLINE2 == "Y")
			        					|| (lb_evgroup == "1" && data.YN_DEADLINE1 == "Y")) {
			        					return false;
			        				}else {
				        				return true;	
			        				}
		        				}
		        			)
	        			}
	        		}
                },
                {
                    field: "NUM_CVTRSLT",		
                    title: dews.localize.get("평가 환산점수"),
                    width: 100,
                    format: dews.ui.grid.formats.number("n02"),
	        		attributes: {
	                    id : "NUM_CVTRSLT"
	                }
                },
                {
                    field: "CD_SCALEH",		
                    title: dews.localize.get("평가척도코드"),
                    width: 100,
                    hidden : true
                }
            ],
            dataBound: function (e) {
            	this.select(this.element.find("tbody tr:nth-child(2)"));
            },
            change: function(e) {
            	var currentRow, rowData, 
            	rowNum = 0;

                currentRow = grid2.select(); // 현재 선택된 ROW
                if(currentRow.length > 0) {
                    rowData = grid2.dataItem(currentRow); // 현재 ROW의 데이터 획득
					rowNum = rowData.ROW_NO;
                    
                    if (rowData && rowNum > 1) {

                    	//레벨에 따른 마감여부 SET
                    	deadlineSet(rowData);
                    	
                    	//레벨에 따라서 평가 comment 뿌려주기
                    	lbCommentSet(rowData);
                    	
                    	cdScaleh = rowData.CD_SCALEH;
                    	
                    } else if(rowNum == 1) {
                    	grid2.closeCell();
                    }
            	}else {
        			dataSource2.data([]);
            	}
                
                if(rowNum > 1) {
	            	rsltSclList(cdScaleh);
                }
            },
            save: function(e) {
            	// 달성도가 수정되었는지 확인
            	if (e.values.hasOwnProperty('NM_SCALED')) { // 감시하고자 하는 컬럼이 수정되었는지 확인하는 방법
            		var result = rsltScmList(cdScaleh, e.values.NM_SCALED, e.model.NUM_ITEM);
                	e.model.CD_RSLT = e.values.NM_SCALED; // 다른 입력 가능 셀의 값을 변경시킵니다.
            		e.model.NUM_RSLT = result.num_ptscale.toFixed(2);
                    e.model.NUM_CVTRSLT = result.num_cvtrslt.toFixed(2); // 다른 입력 가능 셀의 값을 변경시킵니다.
            	}
            }
       	});
	}
	
	//달성도SET
	function rsltSclList(cd_scaleh){
		dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt1","rsltSclList"),{
    		async : false,
			data  : {
				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
				cd_scaleh : cd_scaleh
            }
    	}).done(function(result){
    		sclArr = new Array();
//     		sclArr.push({CD_SYSDEF:"", NM_SYSDEF : ""});
    		if(JSON.stringify(result) !== "[]" && result.length > 0) {
    			for(var i=0; i<result.length; i++) {
	    			data = {
	    					CD_SYSDEF : result[i].CODE,
	    					NM_SYSDEF : result[i].NAME
	    			}	
	    			sclArr.push(data);
    			}
    		}
    	});	
		
		rsltSclDataSource = dews.ui.dataSource("rsltSclDataSource", {
			data: sclArr
		});
		
	}
	

	//달성도에 따른 환산점수 SET
	function rsltScmList(cd_scaleh, cd_scaled, num_item){
		var num_ptscale, num_cvtrslt;
		dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt1","rsltScmList"),{
    		async : false,
			data  : {
				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
				cd_scaleh : cd_scaleh,
				cd_scaled : cd_scaled
            }
    	}).done(function(result){
    		if(JSON.stringify(result) !== "[]" && result.length > 0) {
    			num_ptscale = result[0].NUM_PTSCALE;
    			num_cvtrslt = (num_item/100) * num_ptscale;
    			$("tr.k-state-selected td#NUM_CVTRSLT").text(num_cvtrslt.toFixed(2));
    		}
    	});	
		return {
			num_ptscale: num_ptscale,
			num_cvtrslt: num_cvtrslt
		};
		
	}
	
	//레벨에 따른 마감여부 SET
	function deadlineSet(rowData) {
		
		//평가유형 체크
		var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
		if(check_tp_evlu == '100') {
			sGrid = grid;
		}else if(check_tp_evlu == '200') {
			sGrid = grid2;
		}else {
			sGrid = grid;
		}
		
		if(	   (rowData.LB_EVGROUP == 5 && rowData.YN_DEADLINE5 == "Y")
       		|| (rowData.LB_EVGROUP == 4 && rowData.YN_DEADLINE4 == "Y")
       		|| (rowData.LB_EVGROUP == 3 && rowData.YN_DEADLINE3 == "Y")
       		|| (rowData.LB_EVGROUP == 2 && rowData.YN_DEADLINE2 == "Y")
       		|| (rowData.LB_EVGROUP == 1 && rowData.YN_DEADLINE1 == "Y")) {
			$("#btn_cancel_deadline").removeAttr("disabled");
			$("#btn_submit_deadline").attr("disabled", "disabled");
			$("#btn_save").attr("disabled", "disabled");			
			dews.ui.textbox("#dc_rslt1").readonly(true);
			sGrid.closeCell();
       	}else {
       		$("#btn_save").removeAttr("disabled");
			$("#btn_cancel_deadline").attr("disabled", "disabled");
			$("#btn_submit_deadline").removeAttr("disabled");
			dews.ui.textbox("#dc_rslt1").readonly(false);
       	}
	}
	
	//레벨에 따라서 평가 comment 뿌려주기
	function lbCommentSet(rowData) {
    	if(rowData.LB_EVGROUP == 5 && rowData.CD_EVTYPE == '200') {
    		if(rowData.DC_RSLT || rowData.DC_RSLT == ""){
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT);
    		}else{
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT5);
    		}
    		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT4);
    		dews.ui.textbox("#dc_rslt3").text(rowData.DC_RSLT3);
    		dews.ui.textbox("#dc_rslt4").text(rowData.DC_RSLT2);
    	}else if(rowData.LB_EVGROUP == 4 && rowData.CD_EVTYPE == '200') {
    		if(rowData.DC_RSLT || rowData.DC_RSLT == ""){
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT);
    		}else{
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT4);
    		}
    		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT3);
    		dews.ui.textbox("#dc_rslt3").text(rowData.DC_RSLT2);
    		dews.ui.textbox("#dc_rslt4").text(rowData.DC_RSLT1);
    	}else if(rowData.LB_EVGROUP == 3 && rowData.CD_EVTYPE == '200') {
    		if(rowData.DC_RSLT || rowData.DC_RSLT == ""){
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT);
    		}else{
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT3);
    		}
    		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT2);
    		dews.ui.textbox("#dc_rslt3").text(rowData.DC_RSLT1);
    	}else if(rowData.LB_EVGROUP == 2 && rowData.CD_EVTYPE == '200') {
    		if(rowData.DC_RSLT || rowData.DC_RSLT == ""){
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT);
    		}else{
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT2);
    		}
    		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT1);
    	}else if(rowData.LB_EVGROUP == 1 && rowData.CD_EVTYPE == '200') {
    		if(rowData.DC_RSLT || rowData.DC_RSLT == ""){
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT);
    		}else{
    			dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT1);
    		}
    	}
	}
	</script>
	<script src="scripts/util.js"></script>
	<script id="customize">
		dews.ready(function(){
	    	/* grid = util.customize.initCustomizeGrid(grid); */
	    	//util.customize.initCustomizeLabel();
	    });
	</script>
	
</tiles:putAttribute>
</tiles:insertDefinition>
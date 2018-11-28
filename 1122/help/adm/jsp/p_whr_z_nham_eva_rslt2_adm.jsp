<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
<tiles:putAttribute name="content">
	<!--   
		작성자 : 
		작성일 : 2018-04-16
		메뉴명 : 보직자평가 관리자
		수정자 : 
		수정일 :
		수정내용 : p_whr_z_nham_eva_rslt2_adm.jsp
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
           			<label class="dews-ui-multilingual" for="NoEmp">사원</label>
           			<span>
						<input name="NoEmp" id="NoEmp" type="text" class="dews-ui-codepicker"
						       data-dews-help-code="COMM_HELP_EMP"
							   data-dews-help-title="사원 도움창"
							   data-dews-code-field="NO_EMP"
							   data-dews-text-field="NM_EMP"/>
					</span>
           		</li>
    			<li>
           			<label for='ym_evlu' class='required dews-ui-multilingual'>기준년월</label>
					<span>
						<select id="ym_evlu" class="dews-ui-dropdownlist" 
								data-dews-value-field="YM_EVLU" 
								data-dews-text-field="NM_EVLU" 
								>
<!-- 								data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=200" -->
           				</select>
					</span>				
           		</li>
				<li>
					<label class="dews-ui-multilingual" for="cd_evunit">평가단위</label>
	                <span>
	                    <select  id="cd_evunit" class="dews-ui-dropdownlist"
	                    	data-dews-value-field="CD_SYSDEF" 
	                    	data-dews-text-field="NM_SYSDEF"
	                    	data-dews-data-url="~/Data/help_p_whr_z_nham_eva_unit/EvaUnit"></select>
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
	                		>
<!-- 	                		data-dews-data-url='~/Data/help_p_whr_z_nham_eva_group/EvaGroup' -->
	                		</select>
	                </span>
           		</li>
			</ul>
    	</form>
    </div> 
    <!-- 조회조건 끝 -->
    
    <!-- 그리드 영역 시작 -->
	<div class="dews-grid-panel" style="width:100%;height:100%;">
		<!-- 좌측 -->
		<div class="dews-grid-panel"id="Module_area" style="float:left;width:25.3%;height:100%;">
			<div class="grade_box">	
				<div class="dews-grid-title">
					<span>상대평가 등급비율</span>
				</div>
			</div>
		    <div class="dews-grid-panel grade_box" id="grid_subject_div">
		        <div id="grid_grade" class="dews-ui-grid"></div>
		    </div>
			<div>	
				<div class="dews-grid-title">
					<span>평가대상</span>
				</div>
			</div>
		    <div class="dews-grid-panel" id="grid_subject_div">
		        <div id="grid_pipyeong" class="dews-ui-grid"></div>
		    </div>
	    </div>
	    
	    <!-- 우측 -->
		<div class="dews-grid-panel" style="float:right;width:74%;height:100%;margin-left:5px;">
		
		   	<div class="dews-button-group">
				<div class="dews-grid-title">
					<span>평가입력</span>
				</div>
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_file">첨부파일</button>
			</div>
			
			<div class="dews-grid-panel">
				<div id="grid_list" class="dews-ui-grid"></div>
				<div id="grid_list2" class="dews-ui-grid"></div>
			</div>
			
			<br>
			
			<!-- comment 영역 시작 -->
			<div class="dews-button-group">
				<div class="dews-grid-title">
					<span>산출근거 및 기타 COMMENT 사항(상세작성)</span>
				</div>
			</div>
		    
			<div class="dews-condition-panel div-3" id="dataForm">
				<form class="dews-condition-form">
					<ul>
						<li class="col-3">
							<label for='dc_rslt1' class='dews-ui-multilingual'>자기평가</label>
							<span>
								<textarea id="dc_rslt1" class="dews-ui-textbox readonly" rows="3" style="width:650px;"></textarea>
							</span>
						</li>
						<li class="col-3">
							<label for='dc_rslt2' class='dews-ui-multilingual'>평가자(1차)</label> 	
							<span>
								<textarea id="dc_rslt2" class="dews-ui-textbox" rows="3" style="width:650px;" onchange="dcRsltText(1, this.value);"></textarea>
							</span>
						</li>
 						<li class="col-3">
 							<label for='dc_rslt3' class='dews-ui-multilingual'>평가자(2차)</label>
 							<span>
 								<textarea id="dc_rslt3" class="dews-ui-textbox" rows="3" style="width:650px;" onchange="dcRsltText(2, this.value);"></textarea>
 							</span>
 						</li>
<!-- 						<li class="col-3"> -->
<!-- 							<label for='dc_rslt4' class='dews-ui-multilingual'>평가자(3차)</label> 	 -->
<!-- 							<span> -->
<!-- 								<textarea id="dc_rslt4" class="dews-ui-textbox" rows="3" style="width:650px;" onchange="dcRsltText(3, this.value);"></textarea> -->
<!-- 							</span> -->
<!-- 						</li> -->

					</ul>
				</form>
			</div>
			<!-- comment 영역 끝 -->
		</div>
		<!-- 우측 끝-->
			 
	</div>
	<!-- 그리드 영역 끝 -->
	<script>
		var grid_grade, grid_pipyeong, grid, grid2, 
			grade_datasource, pipyeong_datasource, datasource1, datasource2, rsltSclDataSource, 
			sclArr, changeData, lbGroup, cdEvtype, isGrade, grade_dc_rslt,
			tp_grade, pipyeongRowNum, isSave, admin;
		
		dews.ready(function() {
			
			tp_grade = '100';
			pipyeongRowNum = 0;
			changeData = false;	//데이터 변경여부
			isDeadline = false; //마감취소 가능여부
			isSave = {result : false, currentNo : 0 } //상대평가일경우 데이터 변경 후 피평가자 변경시 저장알림 
			deadlineCheckData = {deadline_cnt : false, null_cnt : false, grade_ck : false}; //상대평가 입력마감시 체크항목
			
			$("#btn_cancel_deadline").attr("disabled", "disabled");
			
			
			// 초기데이터 SET
			initPageData();
			
			// 평가그룹 SET
// 			groupSelect();
			
			grade_datasource = dews.ui.dataSource("grade_datasource", {
				batch: true,	//그리드 저장시
	            schema: {
	                model: {
	                    fields: {
	                    	TOT_CNT: 	{ editable: false, type: "string" },	
	                    	NM_EVGROUP:	{ editable: false, type: "string" },
	                    	GRADE_S:	{ editable: false, type: "string" },	
	                    	GRADE_A:	{ editable: false, type: "string" },	
	                    	GRADE_B:	{ editable: false, type: "string" },	
	                    	GRADE_C:	{ editable: false, type: "string" },	
	                    	GRADE_D:	{ editable: false, type: "string" }
	                    }
	                }
	            }
	        });
			
			grid_grade = dews.ui.grid("#grid_grade", {
	            dataSource: grade_datasource,
	            autoBind: false,
	            noData: true, 
	            rowNo: false,
	            height:62,
		        columns: [	
					{
					    field: "TOT_CNT",
					    title: dews.localize.get("총인원"),
					    width: 50
					},     
	                {
	                    field: "NM_EVGROUP",
	                    title: dews.localize.get("평가그룹명"),
	                    width: 80,
	                    align: "left"
	                },
	                {
	                    field: "GRADE_S",
	                    title: dews.localize.get("S"),
	                    width: 35
	                },
	                {
	                    field: "GRADE_A",
	                    title: dews.localize.get("A"),
	                    width: 35
	                },
	                {
	                    field: "GRADE_B",
	                    title: dews.localize.get("B"),
	                    width: 35
	                },
	                {
	                    field: "GRADE_C",
	                    title: dews.localize.get("C"),
	                    width: 35
	                },
	                {
	                    field: "GRADE_D",
	                    title: dews.localize.get("D"),
	                    width: 35
	                }
	            ],
	            dataBound: function (e) {
	            }
	   	 	});		
			
			pipyeong_datasource = dews.ui.dataSource("pipyeong_datasource", {
				batch: true,	//그리드 저장시
	            schema: {
	                model: {
	                    fields: {
	                    	NM_EVGROUP: { editable: false, type: "string" },	
	                    	NM_KOR:	    { editable: false, type: "string" },
	                    	NO_EMP:		{ editable: false, type: "string" },	
	                    	YN_APPROVE:	{ editable: false, type: "string" },	
	                    	NM_GRADE_1:	{ editable: false, type: "string" },	
	                    	NM_GRADE_2:	{ editable: true,  type: "string" }
	                    }
	                }
	            }
	        });
			
			grid_pipyeong = dews.ui.grid("#grid_pipyeong", {
	            dataSource: pipyeong_datasource,
	            editable: {	createAt: 'bottom' },
	            selectable: "row",
	            autoBind: false,
	            noData: true, 
	            height: 550,
		        columns: [	
	                {
	                    field: "NM_EVGROUP",
	                    title: dews.localize.get("평가그룹명"),
	                    width: 70,
	                    align: "left",
	                },
	                {
	                    field: "NM_KOR",
	                    title: dews.localize.get("성명"),
	                    width: 55,
	                },
	                {
	                    field: "NO_EMP",
	                    title: dews.localize.get("사원번호"),
	                    width: 65
	                },
	                {
	                    field: "YN_APPROVE",
	                    title: dews.localize.get("마감여부"),
	                    width: 65
	                },
	                {
	                    field: "NM_GRADE_1",
	                    title: dews.localize.get("(1차)<br>등급"),
	                    width: 45,
		        		attributes: {
		                    class : "NM_GRADE_1"
		                }
	                	,template: dews.ui.grid.templates.dataSource('NM_GRADE_1', { dataSourceID: 'gradeDataSource', dataValueField: 'CD_SYSDEF', dataTextField: 'NM_SYSDEF' })
// 	                	,
// 		                editor: function (container, options) {
// 		                	 $.extend(options, {
// 		                		 maxLength: 1,
// 		                		 mask:  "L"
// 		                     });
// 		                	 dews.ui.grid.editors.maskedtextbox(container, options, function(data) {
// 		        				if(cdEvtype == "100" || data.YN_APPROVE == "Y" || data.PIPYEONG_YN != "Y"){
// 		        					return false;
// 		        					grid_pipyeong.closeCell();
// 		        				}else {
// 			        				return true;	
// 		        				}
// 							});
// 	                    }
	                    
	                },
	                {
	                    field: "NM_GRADE_2",
	                    title: dews.localize.get("(2차)<br>등급"),
	                    width: 45,
		        		attributes: {
		                    class : "NM_GRADE_2"
		                },
		                template: dews.ui.grid.templates.dataSource('NM_GRADE_2', { dataSourceID: 'gradeDataSource', dataValueField: 'CD_SYSDEF', dataTextField: 'NM_SYSDEF' }),
		                editor: function (container, options) {
		                	 dews.ui.grid.editors.dropdownlist(container, options,
								{ dataValueField: 'CD_SYSDEF', dataTextField: 'NM_SYSDEF', dataSource: gradeDataSource }, function (data) {
					            	if(data.YN_APPROVE == "Y" || data.YN_APPROVE_1 != "Y" || data.PIPYEONG_YN != "Y"){
					        			return false;
					        			grid_pipyeong.closeCell();
			        				}else {
				        				return true;	
			        				}
		        			});
	                    }
	                }
	            ],
	            dataBound: function (e) {
	            	this.select(this.element.find("tbody tr:eq("+pipyeongRowNum+")"));
	            	var row = grid_pipyeong.select(); // 현재 선택된 ROW
	                if (row.length < 1) {
	            		//데이터가 없을 경우 초기화
	        			dataSource1.data([]);
	        			dataSource2.data([]);
	        			$("#btn_cancel_deadline").attr("disabled", "disabled");
	        			$("#btn_submit_deadline").removeAttr("disabled");
	        			dews.ui.textbox("#dc_rslt2").readonly(false);
	        			dews.ui.textbox("#dc_rslt3").readonly(false);
	                    
	                }
	            },
				change: function (e) {
	            	var row, rowData, lb_evgroup, currentNo, currentGroup;
	            	var row = grid_pipyeong.select(); // 현재 선택된 ROW
					if(tp_grade == "100" && isSave.result) {
						if(row[0].sectionRowIndex != pipyeongRowNum){
		                	grid_pipyeong.select(grid_pipyeong.element.find("tbody tr:eq("+pipyeongRowNum+")"));
		                	dews.confirm('변경된 사항이 있습니다.\n저장하시겠습니까?').yes(function(){
			                	saveFn();
		                    }).no(function(){
		                    	headerData();
								isSave = {result : false, currentNo: isSave.currentNo};
		                    });
							return;
						}
	                }else {
						dews.ui.textbox("#dc_rslt2").text("");
	        			dews.ui.textbox("#dc_rslt2").text("");
	        			dews.ui.textbox("#dc_rslt3").text("");
		            	row = grid_pipyeong.select(); // 현재 선택된 ROW
		            	if (row.length > 0) {
			             	// 현재 ROW의 데이터 획득
			                rowData = grid_pipyeong.dataItem(row); 
			             	pipyeongRowNum = rowData.ROW_NO -1;
			            	gradeList();
			            	currentNo = rowData.NO_EMP;
			            	currentGroup = rowData.CD_EVGROUP;
		                }
			            detailData(currentNo, currentGroup);
	                }
	            	
		        },
	            save: function(e) {
	            	if (e.values.hasOwnProperty('NM_GRADE_2')) { // 2차등급 수정되었는지 체크
	            		if(e.model.CD_GRADE_2 != e.values.NM_GRADE_2) {
		            		e.model.CD_GRADE_2 = e.values.NM_GRADE_2;
		            		isSave = {result : true, currentNo : e.model.NO_EMP}
		            	}else {
		            		isSave = {result : false, currentNo : e.model.NO_EMP}
		            	}
	            	}
	            }
	   	 	});
			
			//업적조회 dataSource
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
		                	NM_SCALED: 		{ editable: false, type: "string" },
		                	NUM_CVTRSLT: 	{ editable: false, type: "number" },
		                	NM_SCALED_1 : 	{ editable: true,  type: "string" },
		                	NUM_CVTRSLT_1: 	{ editable: false, type: "number" },
		                	NM_SCALED_2 : 	{ editable: true,  type: "string" },
		                	NUM_CVTRSLT_2: 	{ editable: false, type: "number" }
		                }
		            }
		        }
		    }); //END dataSource1
			
		    //역량조회 dataSource
			dataSource2 = dews.ui.dataSource("dataSource2", {
		    	batch: true,	//그리드 저장시
		        schema: {
		            model: {
		                fields: {
		                	NM_ITEM:    	{ editable: false, type: "string" },
	                    	NM_ITEM2:  		{ editable: false, type: "string" },
		                	NM_SCALED: 		{ editable: false, type: "string" },
		                	NUM_CVTRSLT: 	{ editable: false, type: "number" },
		                	NM_SCALED_1: 	{ editable: true,  type: "string" },
		                	NUM_CVTRSLT_1: 	{ editable: false, type: "number" },
		                	NM_SCALED_2 : 	{ editable: true,  type: "string" },
		                	NUM_CVTRSLT_2: 	{ editable: false, type: "number" }
		                }
		            }
		        }
		    }); //END dataSource2
	
			//grid SET
			selectGrid();
		    
		}); // END dew.ready
		
		//자기평가
		function dcRsltText(num, val) {
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
				if(num == 1) {
					data["DC_RSLT_1"] = val;
				}else if(num == 2) {
					if(tp_grade == "100" && cdEvtype == "100") {
						grade_dc_rslt = val;
					}else {
						data["DC_RSLT_2"] = val;
					}
				}else if(num == 3) {
					data["DC_RSLT_3"] = val;
				}
				isSave = {result : true, currentNo : data.NO_EMP }
			}else {
				dews.ui.textbox("#dc_rslt1").text("");
				dews.ui.textbox("#dc_rslt2").text("");
				dews.ui.textbox("#dc_rslt3").text("");
		// 		dews.ui.textbox("#dc_rslt4").text("");
			}
	
		}
		
		//사원검색(최상위)한 뒤 기준년월, 평가단위, 평가유형, 평가그룹조회되어야 함
	     $("#NoEmp").on("setData",  function(e, data){
//	    	alert(JSON.stringify(data));
	    	admin = data.NO_EMP;
	    	cdEvtype = "";
	    	ymSelect(admin);
	    	groupSelect(admin);
	     });
		
		//기준연월
		$("#ym_evlu").on("change", function(e){
			 dews.ui.dropdownlist("#ym_evlu").value(e.target.value);
			 ym_evlu = e.target.value;
			 groupSelect(admin);
		});
		
		//평가단위
		$("#cd_evunit").on("change", function(e){
			 dews.ui.dropdownlist("#cd_evunit").value(e.target.value);
			 cd_evunit = e.target.value;
			 groupSelect(admin);
		});
		
		//평가유펑
		$("#tp_evlu").on("change", function(e){
			dews.ui.dropdownlist("#tp_evlu").value(e.target.value);
			tp_evlu = e.target.value;
			pipyeong_datasource.data([]);
			groupSelect(admin);
			selectGrid();
		});
		
		//조회
		$("#btn_search").on("click", function() {
			if(tp_grade == "100" && isSave.result) {
               	grid_pipyeong.select(grid_pipyeong.element.find("tbody tr:eq("+pipyeongRowNum+")"));
               	dews.confirm('변경된 사항이 있습니다.\n저장하시겠습니까?').yes(function(){
					saveFn();
                }).no(function(){
                	headerData();
					isSave = {result : false, currentNo: isSave.currentNo};
                });
               	return;
            }
			
			pipyeongRowNum = 0;
			grade_datasource.data([]);
			pipyeong_datasource.data([]);
			var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
			if(check_tp_evlu == '100') {
				dataSource1.data([]);
			}else if(check_tp_evlu == '200') {
				dataSource2.data([]);
			}
			
			dews.ui.textbox("#dc_rslt1").text("");
			dews.ui.textbox("#dc_rslt2").text("");
			dews.ui.textbox("#dc_rslt3").text("");
	// 		dews.ui.textbox("#dc_rslt4").text("");
	
// 			grade_datasource.read();
// 			pipyeong_datasource.read();

			// 평가계획기간 조회
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","planCheck"),{
    		async : false,
			data  : {
   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value()
            }
	    	}).done(function(result){
	    		if(result[0].CNT > 0) {
    				if(dews.ui.dropdownlist('#nm_group').value()){
		    			gradeData();
    				}
	   			}else {
	   				dews.alert("기간을 확인해주세요.","ico2");
	   			}
	    	});
			
		});
		
		//데이터 변경 후 다른데이터 또는 버튼 누른뒤 저장시
		function saveFn(){
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
			
			var gridData = sGrid.dataItems(); //우측그리드
			
			//상대평가 1차, 2차등급 비교
			if(tp_grade == "100") {
				var pipyeongSelData, grade;
				pipyeongSelData = grid_pipyeong.dataItem(grid_pipyeong.select()); //좌측 그리드
				if(cdEvtype == "300") {
					grade = pipyeongSelData.CD_GRADE_1;
				}else if(cdEvtype == "100") {
					grade = pipyeongSelData.CD_GRADE_2;
					if(pipyeongSelData.CD_GRADE_1 != pipyeongSelData.CD_GRADE_2 && !grade_dc_rslt) {
						dews.alert("1차등급과 2차등급이 같지 않을 경우 <br>COMMENT(조정사유)는 필수입니다.","ico2");
						return;
					}
				}
			}
			
			var num_grade = 0;
			for(var i=1; i<gridData.length; i++){
				if(cdEvtype == "300" ) {
					if(!gridData[i].DC_RSLT_1 && gridData[i].DC_RSLT_1 != ""){
						if(gridData[i].LB_EVGROUP == 5){
							gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT4;
						}else if(gridData[i].LB_EVGROUP == 4){
							gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT3;
						}else if(gridData[i].LB_EVGROUP == 3){
							gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT2;
						}else if(gridData[i].LB_EVGROUP == 2){
							gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT1;
						}
					}
					num_grade += parseFloat(gridData[i].NUM_CVTRSLT_1);
				}else if(cdEvtype == "100" && tp_grade != "100"){
					if(!gridData[i].DC_RSLT_2 && gridData[i].DC_RSLT_2 != ""){
						if(gridData[i].LB_EVGROUP == 5){
							gridData[i].DC_RSLT_2 = gridData[i].DC_RSLT3;
						}else if(gridData[i].LB_EVGROUP == 4){
							gridData[i].DC_RSLT_2 = gridData[i].DC_RSLT2;
						}else if(gridData[i].LB_EVGROUP == 3){
							gridData[i].DC_RSLT_2 = gridData[i].DC_RSLT1;
						}
					}
				}else if(cdEvtype == "3차평가자"){
					if(!gridData[i].DC_RSLT_3 && gridData[i].DC_RSLT_3 != ""){
						if(gridData[i].LB_EVGROUP == 5){
							gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT2;
						}else if(gridData[i].LB_EVGROUP == 4){
							gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT1;
						}
					}
				}
			}
		
			sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt2_adm", "rslt2Insert"),{
	       		async : false,
	   			data  : {
	   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
	   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
	   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
	   				cd_evtype : cdEvtype,
	   				gridData : JSON.stringify(gridData),
	   				cd_grade : grade,
	   				num_grade : num_grade.toFixed(2),
					tp_grade : tp_grade,
					grade_dc_rslt : grade_dc_rslt,
					no_emp : admin
				},
				callback: function (result) {
					if (result && result.hasOwnProperty("error")) {
	                      dews.error(dews.localize.get("저장이 실패하였습니다."));
	                      console.log(result.error);
					} else {
		        		dews.alert(dews.localize.get("저장 성공하였습니다.")).done(function() {
		        			isSave = {result : false, currentNo: pipyeongSelData.NO_EMP	};
		        			gradeData();
		        		});
					}
				} // end callback 
			}); // end batchSave
		}
		
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
			
			var gridData = sGrid.dataItems(); //우측그리드
			
			//상대평가 1차, 2차등급 비교
			if(tp_grade == "100") {
				var pipyeongSelData, grade;
				pipyeongSelData = grid_pipyeong.dataItem(grid_pipyeong.select()); //좌측 그리드
				if(cdEvtype == "300") {
					grade = pipyeongSelData.CD_GRADE_1;
				}else if(cdEvtype == "100") {
					grade = pipyeongSelData.CD_GRADE_2;
					if(pipyeongSelData.CD_GRADE_1 != pipyeongSelData.CD_GRADE_2 && !grade_dc_rslt) {
						dews.alert("1차등급과 2차등급이 같지 않을 경우 <br>COMMENT(조정사유)는 필수입니다.","ico2");
						return;
					}
				}
			}
			
			if(gridData == null) {
				dews.alert("항목이 존재하지 않습니다.");
				return;
			}
			
			var num_grade = 0;
			for(var i=1; i<gridData.length; i++){
				if(cdEvtype == "300" ) {
					if(!gridData[i].DC_RSLT_1 && gridData[i].DC_RSLT_1 != ""){
						if(gridData[i].LB_EVGROUP == 5){
							gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT4;
						}else if(gridData[i].LB_EVGROUP == 4){
							gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT3;
						}else if(gridData[i].LB_EVGROUP == 3){
							gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT2;
						}else if(gridData[i].LB_EVGROUP == 2){
							gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT1;
						}
					}
					num_grade += parseFloat(gridData[i].NUM_CVTRSLT_1);
				}else if(cdEvtype == "100" && tp_grade != "100"){
					if(!gridData[i].DC_RSLT_2 && gridData[i].DC_RSLT_2 != ""){
						if(gridData[i].LB_EVGROUP == 5){
							gridData[i].DC_RSLT_2 = gridData[i].DC_RSLT3;
						}else if(gridData[i].LB_EVGROUP == 4){
							gridData[i].DC_RSLT_2 = gridData[i].DC_RSLT2;
						}else if(gridData[i].LB_EVGROUP == 3){
							gridData[i].DC_RSLT_2 = gridData[i].DC_RSLT1;
						}
					}
				}else if(cdEvtype == "3차평가자"){
					if(!gridData[i].DC_RSLT_3 && gridData[i].DC_RSLT_3 != ""){
						if(gridData[i].LB_EVGROUP == 5){
							gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT2;
						}else if(gridData[i].LB_EVGROUP == 4){
							gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT1;
						}
					}
				}
			}
			
			//데이터 변경체크
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","checkData"),{
	    		async : false,
				data  : {
	   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
	   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
	   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
	   				cd_evtype : cdEvtype,
					chData : JSON.stringify(gridData),
					cd_grade : grade,
					tp_grade : tp_grade,
					grade_dc_rslt : grade_dc_rslt,
					no_emp : admin
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
		
			dews.confirm('저장하시겠습니까?').yes(function() {
				sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt2_adm", "rslt2Insert"),{
		       		async : false,
		   			data  : {
		   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
		   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
		   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
		   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
		   				cd_evtype : cdEvtype,
		   				gridData : JSON.stringify(gridData),
		   				cd_grade : grade,
		   				num_grade : num_grade.toFixed(2),
						tp_grade : tp_grade,
						grade_dc_rslt : grade_dc_rslt,
						no_emp : admin
					},
					callback: function (result) {
						if (result && result.hasOwnProperty("error")) {
		                      dews.error(dews.localize.get("저장이 실패하였습니다."));
		                      console.log(result.error);
						} else {
			        		dews.alert(dews.localize.get("저장 성공하였습니다.")).done(function() {
			        			isSave.result = false;
			        			gradeData();
			        			
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
			var sGrid, sSourse, grade;
			
			if(tp_grade == "100" && isSave.result) {
               	grid_pipyeong.select(grid_pipyeong.element.find("tbody tr:eq("+pipyeongRowNum+")"));
               	dews.confirm('변경된 사항이 있습니다.\n저장하시겠습니까?').yes(function(){
					saveFn();
                }).no(function(){
                	headerData();
					isSave = {result : false, currentNo: isSave.currentNo};
                });
               	return;
            }
			
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
			
			//상대평가
			if(tp_grade == "100") {
				deadlineCheckData.deadline_cnt = false;
				deadlineCheckData.null_cnt = false;
				deadlineCheckData.grade_ck = false;
				var gridData = grid_pipyeong.dataItems();

				if(gridData == null) {
					dews.alert("항목이 존재하지 않습니다.");
					return;
				}
				
				//달성도 null체크
				dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","relCheckData"),{
		    		async : false,
					data  : {
		   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
		   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
		   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
		   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
		   				cd_evtype : cdEvtype,
						chData : JSON.stringify(gridData),
						no_emp : admin
		            }
		    	}).done(function(result){
		    		if(result.dt1[0].DEADLINE_CNT > 0) {
		    			deadlineCheckData.deadline_cnt = true;
		   			}
		    		if(result.dt2[0].NULL_CNT > 0) {
		    			deadlineCheckData.null_cnt = true;
		   			}
		    		if(result.dt3[0].GRADE_CK == "NO") {
		    			deadlineCheckData.grade_ck = true;
		    		}
		    	});
				
				//상대평가 비율 체크
				if(isGrade == "false") {
	    			dews.alert("상대평가 등급비율이 존재하지 않아<br>입력마감을 할 수 없습니다.","ico2");
	    			return;
    			}
				
				if(deadlineCheckData.deadline_cnt){
					dews.alert("하위평가자가 입력마감을 하지 않은<br>항목이 존재합니다.","ico2");
					return;
				}else if(deadlineCheckData.null_cnt) {
					if(cdEvtype == '300'){//1차평가자 
	 					dews.alert("(1차)달성도가 없는<br>피평가자가 존재합니다.","ico2");
	 				}else if(cdEvtype == '100'){//1차평가자 
	 					dews.alert("(2차)등급이 없는<br>피평가자가 존재합니다.","ico2");
	 				}
 					return;
				}else if(deadlineCheckData.grade_ck) {
					dews.alert("상대평가 등급비율을 확인해 주세요.");
					return;
				}
			
			}else {
				if(gridData == null) {
					dews.alert("항목이 존재하지 않습니다.");
					return;
				}
				
				//달성도 null체크
				for(var i=1; i<gridData.length; i++) {
					if(cdEvtype == '300'){//1차평가자
						if(!gridData[i].NM_SCALED_1){
							dews.alert("(1차)달성도가 없는 항목이 존재합니다.");
							return;
						}
					}
					else if(cdEvtype == '100'){ //2차평가자
						if(!gridData[i].NM_SCALED_2){
							dews.alert("(2차)달성도가 없는 항목이 존재합니다.");
							return;
						}
					}
				}
				
				var num_grade = 0;
				for(var i=1; i<gridData.length; i++){
					if(cdEvtype == "300" ) {
						if(!gridData[i].DC_RSLT_1 && gridData[i].DC_RSLT_1 != ""){
							if(gridData[i].LB_EVGROUP == 5){
								gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT4;
							}else if(gridData[i].LB_EVGROUP == 4){
								gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT3;
							}else if(gridData[i].LB_EVGROUP == 3){
								gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT2;
							}else if(gridData[i].LB_EVGROUP == 2){
								gridData[i].DC_RSLT_1 = gridData[i].DC_RSLT1;
							}
						}
						num_grade += parseFloat(gridData[i].NUM_CVTRSLT_1);
					}else if(cdEvtype == "100" && tp_grade != "100"){
						if(!gridData[i].DC_RSLT_2 && gridData[i].DC_RSLT_2 != ""){
							if(gridData[i].LB_EVGROUP == 5){
								gridData[i].DC_RSLT_2 = gridData[i].DC_RSLT3;
							}else if(gridData[i].LB_EVGROUP == 4){
								gridData[i].DC_RSLT_2 = gridData[i].DC_RSLT2;
							}else if(gridData[i].LB_EVGROUP == 3){
								gridData[i].DC_RSLT_2 = gridData[i].DC_RSLT1;
							}
						}
					}else if(cdEvtype == "3차평가자"){
						if(!gridData[i].DC_RSLT_3 && gridData[i].DC_RSLT_3 != ""){
							if(gridData[i].LB_EVGROUP == 5){
								gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT2;
							}else if(gridData[i].LB_EVGROUP == 4){
								gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT1;
							}
						}
					}
				}

				//데이터 변경체크
				dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","checkData"),{
		    		async : false,
					data  : {
		   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
		   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
		   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
		   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
		   				cd_evtype : cdEvtype,
						chData : JSON.stringify(gridData),
						cd_grade : grade,
						tp_grade : tp_grade,
						grade_dc_rslt : grade_dc_rslt
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
				
				// 입력마감할 피평가자대상 테이블에서 선택된 데이터로 변경
				gridData = grid_pipyeong.dataItem(grid_pipyeong.select());
			}
			
			dews.confirm('입력마감 하시겠습니까?').yes(function() {
				sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt2_adm", "deadLineUpdate"),{
		       		async : false,
		   			data  : {
		   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
		   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
		   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
		   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
		   				cd_evtype : cdEvtype,
		   				yn_deadline : "Y",
		   				gridData : JSON.stringify(gridData),
		   				tp_grade : tp_grade,
		   				no_emp : admin
					},
					callback: function (result) {
						if (result && result.hasOwnProperty("error")) {
		                      dews.error(dews.localize.get("입력마감 작업이 실패하였습니다."));
		                      console.log(result.error);
						} else {
			        		dews.alert(dews.localize.get("입력마감 작업이 완료되었습니다.")).done(function() {
			        			isSave.result = false;
			        			gradeData();
								$("#btn_cancel_deadline").removeAttr("disabled");
								$("#btn_submit_deadline").attr("disabled", "disabled");
								dews.ui.textbox("#dc_rslt2").readonly(true);
					      		sGrid.closeCell();
					      		grid_pipyeong.closeCell();
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
			
			if(tp_grade == "100") {
				var gridData = grid_pipyeong.dataItems();
			}else {
				var gridData = grid_pipyeong.dataItem(grid_pipyeong.select());
			}
			
			if(gridData == null) {
				dews.alert("항목이 존재하지 않습니다.");
				return;
			}
			
			//마감취소 가능여부 확인
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","checkDeadline"),{
	    		async : false,
				data  : {
	   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
	   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
	   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
	   				cd_evtype : cdEvtype,
	   				chData : JSON.stringify(gridData),
	   				tp_grade : tp_grade,
	   				no_emp : admin
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
				sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt2_adm", "deadLineUpdate"),{
		       		async : false,
		   			data  : {
		   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
		   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
		   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
		   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
		   				cd_evtype : cdEvtype,
		   				yn_deadline : "N",
		   				gridData : JSON.stringify(gridData),
		   				tp_grade : tp_grade,
		   				no_emp : admin
					},
					callback: function (result) {
						if (result && result.hasOwnProperty("error")) {
		                      dews.error(dews.localize.get("마감취소 작업이 실패하였습니다."));
		                      console.log(result.error);
						} else {
			        		dews.alert(dews.localize.get("마감취소 작업이 완료되었습니다.")).done(function() {
			        			isSave.result = false;
			        			gradeData();
			        			$("#btn_cancel_deadline").attr("disabled", "disabled");
			        			$("#btn_submit_deadline").removeAttr("disabled");
								dews.ui.textbox("#dc_rslt2").readonly(false);
			        		});
		                }
		            } // end callback 
		  		}); // end batchSave
			}).no(function() {
				// 무반응
			});
			
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
		</script>
		<script>
		//초기데어터
		function initPageData() {
			
			// 더존고객 여부
			var tp_evlulist, tp_evlu_arr = new Array();
			dews.ajax.data('~/Data/CommonData/getCodeData?cd_field=HR_EV00004&use_yn=Y&dummy_yn=N', { async: false }).done(function (data) {
				for(var i=0; i<data.length; i++){
					if(data[i].CD_SYSDEF != "300"){
						tp_evlu_arr.push(data[i]);
					}
				}
			}).fail(function(data) {
				dews.error(data.responseJSON.message);
			});
			tp_evlulist = dews.ui.dropdownlist('#tp_evlu');
			tp_evlulist.setDataSource(tp_evlu_arr);
		}
		
		//평가자구분(1차평가자, 2차평가자) 가져오기
		function getCDevtype(){
			cdEvtype = ""
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","getCDevtype"),{
	       		async : false,
	   			data  : {
	            	ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	            	cd_evunit : dews.ui.dropdownlist('#cd_evunit').value(),
	            	tp_evlu : dews.ui.dropdownlist('#tp_evlu').value(),
	            	cd_evgroup : dews.ui.dropdownlist('#nm_group').value(),
	            	no_emp : admin
	               }
	       	}).done(function(result){
	       		cdEvtype = result.cd_evtype;
				if(cdEvtype == "300"){ //1차평가자
					dews.ui.textbox("#dc_rslt2").readonly(false);
					dews.ui.textbox("#dc_rslt3").readonly(true);
				}else if(cdEvtype == "100"){//2차평가자
					dews.ui.textbox("#dc_rslt2").readonly(true);
					dews.ui.textbox("#dc_rslt3").readonly(false);
				}
	       	});
			
		}
		
		//상대평가 등급비율 조회
		function gradeData() {
       		var gridData;
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","getGradeList"),{
	       		async : false,
	   			data  : {
	               	ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	               	cd_evunit : dews.ui.dropdownlist('#cd_evunit').value(),
	               	tp_evlu : dews.ui.dropdownlist('#tp_evlu').value(),
	               	cd_evgroup : dews.ui.dropdownlist('#nm_group').value(),
	            	no_emp : admin
	               }
	       	}).done(function(result){
	    		if(result.dt1.length > 0) {
	    			tp_grade = result.dt1[0].TP_GRADE; //등급산정기준 (100:상대평가, 200:절대평가)
	    		}
	    		if(result.dt2.length > 0) {
	    			isGrade = result.dt2[0].IS_GRADE;
	    			gridData = result.dt2;
	    		}
	    		
	    		//평가자구분값 가져오기
				getCDevtype();
    			
	    		if(cdEvtype != "200"){
		    		if(tp_grade == "100") {
		    			$(".grade_box").show();
						grid_grade.dataSource.data(gridData);   
		    		}
					headerData();
	    		}
	       	});
			
		}
	
		//기준년월 조회
		function ymSelect(admin){
			dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_yyyymm","AdminYm"),{
				async	: false,
				data	: {
					CD_EVTYPE	: cdEvtype,
					NoEmp		: admin
				}
			}).done(function (result){
				var arrlist = new Array();
				if(JSON.stringify(result) !=="[]" && result.length > 0) {
					for(var i=0; i<result.length; i++){
						data = { 
								YM_EVLU : result[i].YM_EVLU, 
								NM_EVLU : result[i].NM_EVLU								
						}	
						arrlist.push(data);
					}   
				}
				var ym_code = dews.ui.dropdownlist('#ym_evlu');
				ym_code.setDataSource(arrlist);
				ym_code.select(0); 
			});
		}
		   	   
		//평가그룹 조회
	 	function groupSelect(admin) {
	 		dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_group","AdminGroup"),{
        		async : false,
    			data  : {
					ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
	   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
	   				cd_evtype : cdEvtype,
    				NoEmp		: admin
                }
        	}).done(function(result){
        		var arr = new Array();
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
		
		//평가유형에따른 그리드 SET
		function selectGrid() {
			$(".grade_box").hide();
			grid_pipyeong.hideColumn('NM_GRADE_1'); // 등급 숨김
			grid_pipyeong.hideColumn('NM_GRADE_2'); // 등급 숨김
			$("#grid_list").hide();
			$("#grid_list2").hide();
			dews.ui.textbox("#dc_rslt2").readonly(false);
			dews.ui.textbox("#dc_rslt3").readonly(false);
			dews.ui.textbox("#dc_rslt1").text("");
			dews.ui.textbox("#dc_rslt2").text("");
			dews.ui.textbox("#dc_rslt3").text("");
	// 		dews.ui.textbox("#dc_rslt4").text("");
			
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
		
		//좌측그리드 조회
		function headerData() {
			//평가유형 체크
			var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
			if(check_tp_evlu == '100') {
				sGrid = grid;
			}else if(check_tp_evlu == '200') {
				sGrid = grid2;
			}else {
				sGrid = grid;
			}
			
			//평가자구분값 가져오기
// 			getCDevtype();
			
			var gridData;
	        
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm", "getPipyeongList"), {
		        async: false,
		        data:{
	               	ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	               	cd_evunit : dews.ui.dropdownlist('#cd_evunit').value(),
	               	tp_evlu : dews.ui.dropdownlist('#tp_evlu').value(),
	               	cd_evgroup : dews.ui.dropdownlist('#nm_group').value(),
	               	no_emp : admin
		        }
		    }).done(function (result) {
		    	if(result.length > 0){
    				gridData = result;
		  	  	}
		   	});
			
			grid_pipyeong.dataSource.data(gridData);  
			if(tp_grade == "100") {
				if(cdEvtype == "300") {
	  				grid_pipyeong.showColumn('NM_GRADE_1'); // 1차평가가등급 
	  				grid_pipyeong.hideColumn('NM_GRADE_2'); // 2차평가가등급 숨김
					$(".NM_GRADE_1").addClass('required'); // 2차평가가등급 숨김
				}else if(cdEvtype == "100") { 
	  				grid_pipyeong.showColumn('NM_GRADE_1'); // 1차평가가등급
	  				grid_pipyeong.showColumn('NM_GRADE_2'); // 2차평가가등급 
	   				$(".NM_GRADE_1").removeClass('required'); // 2차평가가등급 숨김
	   				$(".NM_GRADE_2").addClass('required'); // 2차평가가등급 숨김
				}
    			//1차평가자일 경우 또는 상대평가일 경우
	        	sGrid.hideColumn('NM_SCALED_2'); // 2차평가가달성도 숨김
	        	sGrid.hideColumn('NUM_CVTRSLT_2'); // 2차평가환산점수 숨김
			}else if(tp_grade == "200") {
				$(".grade_box").hide();
    			grid_pipyeong.hideColumn('NM_GRADE_1'); // 등급 숨김
    			grid_pipyeong.hideColumn('NM_GRADE_2'); // 등급 숨김
    			
    	        if(cdEvtype == "300") {
    	        	sGrid.hideColumn('NM_SCALED_2'); // 2차평가가달성도 숨김
    	        	sGrid.hideColumn('NUM_CVTRSLT_2'); // 2차평가환산점수 숨김
    	        }else if(cdEvtype == "100") {
    	        	sGrid.showColumn('NM_SCALED_2'); // 2차평가가달성도
    	        	sGrid.showColumn('NUM_CVTRSLT_2'); // 2차평가환산점수
    	        }
			}
		}
		
		//우측그리드 조회
		function detailData(currentNo, currentGroup) {
			
			//평가유형 체크
			var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
			if(check_tp_evlu == '100') {
				sGrid = grid;
			}else if(check_tp_evlu == '200') {
				sGrid = grid2;
			}else {
				sGrid = grid;
			}
			
			var gridData;
	        
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm", "getList"), {
		        async: false,
		        data:{
	               	ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	               	cd_evunit : dews.ui.dropdownlist('#cd_evunit').value(),
	               	tp_evlu : dews.ui.dropdownlist('#tp_evlu').value(),
	               	cd_evgroup : dews.ui.dropdownlist('#nm_group').value(),
	               	s_cd_evgroup : currentGroup,
	               	s_no_emp : currentNo,
	               	no_emp : admin
		        }
		    }).done(function (result) {
		    	if(result.length > 0){
		    		for(var i=0; i<result.length; i++) {
	            		var lb_evgroup = result[i].LB_EVGROUP;
	            		var cd_evtype = result[i].CD_EVTYPE;
	            		if(i > 0) {
	            			if(lb_evgroup == 5) {
	            				result[i].CD_RSLT = result[i].CD_RSLT5;
	            				result[i].NM_SCALED = result[i].NM_SCALED5;
	            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT5;
	            				result[i].CD_RSLT_1 = result[i].CD_RSLT4;
	            				result[i].NUM_RSLT_1 = result[i].NUM_RSLT4;
	            				result[i].NM_SCALED_1 = result[i].NM_SCALED4;
	            				result[i].NUM_CVTRSLT_1 = result[i].NUM_CVTRSLT4;
	            				result[i].CD_RSLT_2 = result[i].CD_RSLT3;
	            				result[i].NUM_RSLT_2 = result[i].NUM_RSLT3;
	            				result[i].NM_SCALED_2 = result[i].NM_SCALED3;
	            				result[i].NUM_CVTRSLT_2 = result[i].NUM_CVTRSLT3;
		                		dews.ui.textbox("#dc_rslt1").text(result[i].DC_RSLT5);
		                		dews.ui.textbox("#dc_rslt2").text(result[i].DC_RSLT4);
		                		dews.ui.textbox("#dc_rslt3").text(result[i].DC_RSLT3);
		                		grade_dc_rslt = result[i].DC_RSLT3;
	            			}else if(lb_evgroup == 4) {
	            				result[i].CD_RSLT = result[i].CD_RSLT4;
	            				result[i].NM_SCALED = result[i].NM_SCALED4;
	            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT4;
	            				result[i].CD_RSLT_1 = result[i].CD_RSLT3;
	            				result[i].NUM_RSLT_1 = result[i].NUM_RSLT3;
	            				result[i].NM_SCALED_1 = result[i].NM_SCALED3;
	            				result[i].NUM_CVTRSLT_1 = result[i].NUM_CVTRSLT3;
	            				result[i].CD_RSLT_2 = result[i].CD_RSLT2;
	            				result[i].NUM_RSLT_2 = result[i].NUM_RSLT2;
	            				result[i].NM_SCALED_2 = result[i].NM_SCALED2;
	            				result[i].NUM_CVTRSLT_2 = result[i].NUM_CVTRSLT2;
		                		dews.ui.textbox("#dc_rslt1").text(result[i].DC_RSLT4);
		                		dews.ui.textbox("#dc_rslt2").text(result[i].DC_RSLT3);
		                		dews.ui.textbox("#dc_rslt3").text(result[i].DC_RSLT2);
		                		grade_dc_rslt = result[i].DC_RSLT2;
	            			}else if(lb_evgroup == 3) {
	            				result[i].CD_RSLT = result[i].CD_RSLT3;
	            				result[i].NM_SCALED = result[i].NM_SCALED3;
	            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT3;
	            				result[i].CD_RSLT_1 = result[i].CD_RSLT2;
	            				result[i].NUM_RSLT_1 = result[i].NUM_RSLT2;
	            				result[i].NM_SCALED_1 = result[i].NM_SCALED2;
	            				result[i].NUM_CVTRSLT_1 = result[i].NUM_CVTRSLT2;
	            				result[i].CD_RSLT_2 = result[i].CD_RSLT1;
	            				result[i].NUM_RSLT_2 = result[i].NUM_RSLT1;
	            				result[i].NM_SCALED_2 = result[i].NM_SCALED1;
	            				result[i].NUM_CVTRSLT_2 = result[i].NUM_CVTRSLT1;
		                		dews.ui.textbox("#dc_rslt1").text(result[i].DC_RSLT3);
		                		dews.ui.textbox("#dc_rslt2").text(result[i].DC_RSLT2);
		                		dews.ui.textbox("#dc_rslt3").text(result[i].DC_RSLT1);
		                		grade_dc_rslt = result[i].DC_RSLT1;
	            			}else if(lb_evgroup == 2) {
	            				result[i].CD_RSLT = result[i].CD_RSLT2;
	            				result[i].NM_SCALED = result[i].NM_SCALED2;
	            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT2;
	            				result[i].CD_RSLT_1 = result[i].CD_RSLT1;
	            				result[i].NUM_RSLT_1 = result[i].NUM_RSLT1;
	            				result[i].NM_SCALED_1 = result[i].NM_SCALED1;
	            				result[i].NUM_CVTRSLT_1 = result[i].NUM_CVTRSLT1;
	            				result[i].CD_RSLT_2 = "";
	            				result[i].NUM_RSLT_2 = 0;
	            				result[i].NM_SCALED_2 = "";
	            				result[i].NUM_CVTRSLT_2 = 0;
		                		dews.ui.textbox("#dc_rslt1").text(result[i].DC_RSLT2);
		                		dews.ui.textbox("#dc_rslt2").text(result[i].DC_RSLT1);
	            			}
	            		}else {
	            			result[i].NM_SCALED = "-";
	            			result[i].NM_SCALED_1 = "-";
	            			result[i].NM_SCALED_2 = "-";
	            			if(lb_evgroup == 5) {
	            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT5;
	            				result[i].NUM_CVTRSLT_1 = result[i].NUM_CVTRSLT4;
	            				result[i].NUM_CVTRSLT_2 = result[i].NUM_CVTRSLT3;
	            			}else if(lb_evgroup == 4) {
	            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT4;
	            				result[i].NUM_CVTRSLT_1 = result[i].NUM_CVTRSLT3;
	            				result[i].NUM_CVTRSLT_2 = result[i].NUM_CVTRSLT2;
	            			}else if(lb_evgroup == 3) {
	            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT3;
	            				result[i].NUM_CVTRSLT_1 = result[i].NUM_CVTRSLT2;
	            				result[i].NUM_CVTRSLT_2 = result[i].NUM_CVTRSLT1;
	            			}else if(lb_evgroup == 2) {
	            				result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT2;
	            				result[i].NUM_CVTRSLT_1 = result[i].NUM_CVTRSLT1;
	            			}
	            		}
		    		}
		  	  	}
		    	gridData = result;
		   	});
			
	    	sGrid.dataSource.data(gridData);  
	    	
	    	//달성도 필수입력 설정
	    	$(".NM_SCALED_1").removeClass("required");
	    	$(".NM_SCALED_2").removeClass("required");
	        if(cdEvtype == "300") { //1차평가자일 경우
	        	$(".NM_SCALED_1").addClass("required");
	        }else if(cdEvtype == "100") { //2차평가자일경우
	        	$(".NM_SCALED_2").addClass("required");
	        }
		}
		
		//업적평가
		function gridList1() {  
			grid = dews.ui.grid("#grid_list", {
				dataSource: dataSource1,
		        editable: {	createAt: 'bottom' },
		        selectable: "row",
		        autoBind: false,
		        navigatable: true,
		        noData: true, 
		        height: 300,
		        columns: [	
					{
						field: "NM_TASK",
		                title: dews.localize.get("과업명"),
		                width: 95,
		                align: "left",
		            },
		            {
		                field: "NM_ITEM",
		                title: dews.localize.get("KPI명"),
		                width: 102,
		            },
		            {
		                field: "DC_DEFINATION",
		                title: dews.localize.get("업적목표(KPI정의)"),
		                width: 131,
		                align: "left"
		            },
		            {
		                field: "DC_PLAN",
		                title: dews.localize.get("계획 및 달성수준"),
		                width: 116,
		                align: "left"
		            },
		            {
		                field: "DC_FORMULA",
		                title: dews.localize.get("평가 및 등급부여기준<br>(KPI 산식)"),
		                width: 174,
		                align:"left",
		            },
		            {
		                field: "NUM_ITEM",		
		                title: dews.localize.get("가중치"),
		                width: 72,
		            },
		            {
		                field: "NM_SCALED",		
		                title: dews.localize.get("자기달성도"),
		                width: 72
		            },
		            {
		                field: "NUM_CVTRSLT",		
		                title: dews.localize.get("평가 환산점수"),
		                width: 79,
	                    format: dews.ui.grid.formats.number("n02")
		            },
		            {
						field: "CD_RSLT_1",		
						title: dews.localize.get("평가자달성도"),
			        	hidden : true
	                },
		            {
		                field: "NM_SCALED_1",		
		                title: dews.localize.get("(1차)<br>평가자달성도"),
	                    width: 79,
	       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED_1', { 
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
			        				if((lb_evgroup == "5" && data.YN_DEADLINE4 == "Y")
			        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
			        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
			        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")) {
			        					return false;
			        				}else {
				        				return true;	
			        				}
			        			})
		        			}
		        		},
		        		attributes: {
		                    class : "NM_SCALED_1"
		                }
	                },
	                {
	                    field: "NUM_CVTRSLT_1",		
	                    title: dews.localize.get("(1차)<br>환산점수"),
	                    width: 86,
	                    format: dews.ui.grid.formats.number("n02"),
		        		attributes: {
		                    class : "NUM_CVTRSLT_1"
		                }
	                },
		            {
						field: "CD_RSLT_2",		
						title: dews.localize.get("평가자달성도"),
			        	hidden : true
	                },
		            {
		                field: "NM_SCALED_2",		
		                title: dews.localize.get("(2차)<br>평가자달성도"),
	                    width: 79,
	       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED_2', { 
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
			        				if((lb_evgroup == "5" && data.YN_DEADLINE4 == "Y" && data.YN_DEADLINE3 == "Y")
			        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y" && data.YN_DEADLINE2 == "Y")
			        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y" && data.YN_DEADLINE1 == "Y")
			        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")) {
			        					return false;
			        				}else {
				        				return true;	
			        				}	
			        			})
		        			}
		        		},
		        		attributes: {
		                    class : "NM_SCALED_2"
		                }
	                },
	                {
	                    field: "NUM_CVTRSLT_2",		
	                    title: dews.localize.get("(2차)<br>환산점수"),
	                    width: 86,
	                    format: dews.ui.grid.formats.number("n02"),
		        		attributes: {
		                    class : "NUM_CVTRSLT_2"
		                }
	                }
		        ],
		        dataBound: function (e) {
		        	this.select(this.element.find("tbody tr:nth-child(2)"));
		        },
	            change: function(e) {
	            	var currentRow, rowData, lb_evgroup, 
	            	rowNum = 0;
	            	
	            	// 현재 선택된 ROW 
	                currentRow = grid.select();
	
	            	if(currentRow.length > 0) {
		           		//평가자구분(1차평가자, 2차평가자)에 대한 달성도 edit 비활성화
		               	var cellIndex = this.cellIndex($('td#grid_list_active_cell', this.tbody)); // 선택된 셀의 인덱스
		               	if(cellIndex != -1) {
		                    var columnName = this.columns[cellIndex].field; // 선택된 셀의 컬럼명
		                    if((cdEvtype == 100 && columnName == "NM_SCALED_1") || (cdEvtype == 300 && columnName == "NM_SCALED_2")){
		                    	grid.closeCell();
		                    }
		               	}
		                
		             	// 현재 ROW의 데이터 획득
		                rowData = grid.dataItem(currentRow); 
						rowNum = rowData.ROW_NO;
		           		lb_evgroup = rowData.LB_EVGROUP;
		                   
						if (rowData && rowNum > 1) {
		                  	//레벨과 평가자구분(1차평가자, 2차평가자)에 대한 마감여부 SET
		                  	deadlineSet(lb_evgroup, rowData);
		                  	
		                  	//달성도SET을 위한 코드값 가져오기
		                  	cdScaleh = rowData.CD_SCALEH;
		                  	
		                  	//레벨에 따라서 평가 comment 뿌려주기
		                  	lbCommentSet(lb_evgroup, rowData);
	                  	
						} else if(rowNum == 1) {
		                  	//첫재줄(합계) edit비활성화
		                  	grid.closeCell();
						}
		            }
	                if(rowNum > 1) {
		            	rsltSclList(cdScaleh);
	                }
	            },
	            save: function(e) {
	            	// 달성도가 수정되었는지 확인
	            	if (e.values.hasOwnProperty('NM_SCALED_1')) { // 1차달성도가 수정되었는지 체크
	            		if(e.model.CD_RSLT_1 != e.values.NM_SCALED_1){
		            		var result1 = rsltScmList(cdScaleh, e.values.NM_SCALED_1, e.model.NUM_ITEM);
		                	e.model.CD_RSLT_1 = e.values.NM_SCALED_1; // 다른 입력 가능 셀의 값을 변경시킵니다.
		            		e.model.NUM_RSLT_1 = result1.num_ptscale.toFixed(2);
		                    e.model.NUM_CVTRSLT_1 = result1.num_cvtrslt.toFixed(2); // 다른 입력 가능 셀의 값을 변경시킵니다.
		            		isSave = {result : true, currentNo : e.model.NO_EMP}
	            		}else {
		            		isSave = {result : false, currentNo : e.model.NO_EMP}
	            		}
	            	}else if (e.values.hasOwnProperty('NM_SCALED_2')) { // 2차달성도가 수정되었는지 체크
	            		var result2 = rsltScmList(cdScaleh, e.values.NM_SCALED_2, e.model.NUM_ITEM);
	                	e.model.CD_RSLT_2 = e.values.NM_SCALED_2; // 다른 입력 가능 셀의 값을 변경시킵니다.
	            		e.model.NUM_RSLT_2 = result2.num_ptscale.toFixed(2);
	                    e.model.NUM_CVTRSLT_2 = result2.num_cvtrslt.toFixed(2); // 다른 입력 가능 셀의 값을 변경시킵니다.
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
		                title: dews.localize.get("항목명"),
		                width: 150,
		                align: "left"
		            },
		            {
		                field: "NM_ITEM2",		
		                title: dews.localize.get("항목상세"),
		                width: 350,
		                align: "left"
		            },
		            {
		                field: "NUM_ITEM",		
		                title: dews.localize.get("가중치"),
		                width: 72,
		            },
		            {
		                field: "NM_SCALED",		
		                title: dews.localize.get("자기달성도"),
		                width: 100
		            },
		            {
		                field: "NUM_CVTRSLT",		
		                title: dews.localize.get("평가 환산점수"),
		                width: 100,
	                    format: dews.ui.grid.formats.number("n02")
		            },
		            {
						field: "CD_RSLT_1",		
						title: dews.localize.get("평가자달성도"),
		                width: 100,
			        	hidden : true
	                },
		            {
		                field: "NM_SCALED_1",		
		                title: dews.localize.get("(1차)<br>평가자달성도"),
	                    width: 100,
	       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED_1', { 
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
			        				if((lb_evgroup == "5" && data.YN_DEADLINE4 == "Y")
			        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
			        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
			        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")) {
			        					return false;
			        				}else {
				        				return true;	
			        				}
			        			})
		        			}
		        		},
		        		attributes: {
		                    class : "NM_SCALED_1"
		                }
	                },
	                {
	                    field: "NUM_CVTRSLT_1",		
	                    title: dews.localize.get("(1차)<br>환산점수"),
	                    width: 100,
	                    format: dews.ui.grid.formats.number("n02"),
		        		attributes: {
		        			class : "NUM_CVTRSLT_1"
		                }
	                },
		            {
						field: "CD_RSLT_2",		
						title: dews.localize.get("평가자달성도"),
			        	hidden : true
	                },
		            {
		                field: "NM_SCALED_2",		
		                title: dews.localize.get("(2차)<br>평가자달성도"),
	                    width: 100,
	       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED_2', { 
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
			        				if((lb_evgroup == "5" && data.YN_DEADLINE4 == "Y" && data.YN_DEADLINE3 == "Y")
			        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y" && data.YN_DEADLINE2 == "Y")
			        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y" && data.YN_DEADLINE1 == "Y")
			        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")) {
			        					return false;
			        				}else {
				        				return true;	
			        				}
			        			})
		        			}
		        		},
		        		attributes: {
		                    class : "NM_SCALED_2"
		                }
	                },
	                {
	                    field: "NUM_CVTRSLT_2",		
	                    title: dews.localize.get("(2차)<br>환산점수"),
	                    width: 100,
	                    format: dews.ui.grid.formats.number("n02"),
		        		attributes: {
		        			class : "NUM_CVTRSLT_2"
		                }
	                }
		        ],
		        dataBound: function (e) {
		        	this.select(this.element.find("tbody tr:nth-child(2)"));
		        },
	            change: function(e) {
	            	var currentRow, rowData, lb_evgroup, 
	            	rowNum = 0;
	                
	            	// 현재 선택된 ROW
	                currentRow = grid2.select(); 
	            	if(currentRow.length > 0) {
	            		
	            		//평가자구분(1차평가자, 2차평가자)에 대한 달성도 edit 비활성화
	                	var cellIndex = this.cellIndex($('td#grid_list2_active_cell', this.tbody)); // 선택된 셀의 인덱스
	                	if(cellIndex != -1) {
		                    var columnName = this.columns[cellIndex].field; // 선택된 셀의 컬럼명
		                    if((cdEvtype == 100 && columnName == "NM_SCALED_1") || (cdEvtype == 300 && columnName == "NM_SCALED_2")){
		                    	grid2.closeCell();
		                    }
	                	}
	                    
	                	// 현재 ROW의 데이터 획득
	                    rowData = grid2.dataItem(currentRow); 
						rowNum = rowData.ROW_NO;
	            		lb_evgroup = rowData.LB_EVGROUP;
	                    
	                    if (rowData && rowNum > 1) {
	                    	//레벨과 평가자구분(1차평가자, 2차평가자)에 대한 마감여부 SET
	                    	deadlineSet(lb_evgroup, rowData);
	                    	
	                    	//달성도SET을 위한 코드값 가져오기
	                    	cdScaleh = rowData.CD_SCALEH;
	                    	
	                    	//레벨에 따라서 평가 comment 뿌려주기
	                    	lbCommentSet(lb_evgroup, rowData);
	                    	
	                    } else if(rowNum == 1) {
	                    	//첫재줄(합계) edit비활성화
	                    	grid2.closeCell();
	                    }
	            	}
	                
	                if(rowNum > 1) {
		            	rsltSclList(cdScaleh);
	                }
	            },
	            save: function(e) {
	            	// 달성도가 수정되었는지 확인
	            	if (e.values.hasOwnProperty('NM_SCALED_1')) { // 1차달성도가 수정되었는지 체크
	            		if(e.model.CD_RSLT_1 != e.values.NM_SCALED_1){
		            		var result1 = rsltScmList(cdScaleh, e.values.NM_SCALED_1, e.model.NUM_ITEM);
		                	e.model.CD_RSLT_1 = e.values.NM_SCALED_1; // 다른 입력 가능 셀의 값을 변경시킵니다.
		            		e.model.NUM_RSLT_1 = result1.num_ptscale.toFixed(2);
		                    e.model.NUM_CVTRSLT_1 = result1.num_cvtrslt.toFixed(2); // 다른 입력 가능 셀의 값을 변경시킵니다.
		            		isSave = {result : true, currentNo : e.model.NO_EMP}
	            		}else {
		            		isSave = {result : false, currentNo : e.model.NO_EMP}
	            		}
	            	}else if (e.values.hasOwnProperty('NM_SCALED_2')) { // 2차달성도가 수정되었는지 체크
	            		var result2 = rsltScmList(cdScaleh, e.values.NM_SCALED_2, e.model.NUM_ITEM);
	                	e.model.CD_RSLT_2 = e.values.NM_SCALED_2; // 다른 입력 가능 셀의 값을 변경시킵니다.
	            		e.model.NUM_RSLT_2 = result2.num_ptscale.toFixed(2);
	                    e.model.NUM_CVTRSLT_2 = result2.num_cvtrslt.toFixed(2); // 다른 입력 가능 셀의 값을 변경시킵니다.
	            	}
	            }
		 	});
		}
	
		//등급SET
		function gradeList(){
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","rsltSclList"),{
	    		async : false,
				data  : {
					ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
					cd_scaleh : 300
	            }
	    	}).done(function(result){
	    		gradeArr = new Array();
	//     		sclArr.push({CD_SYSDEF:"", NM_SYSDEF : ""});
	    		if(JSON.stringify(result) !== "[]" && result.length > 0) {
	    			for(var i=0; i<result.length; i++) {
		    			data = {
		    					CD_SYSDEF : result[i].CODE,
		    					NM_SYSDEF : result[i].NAME
		    			}	
		    			gradeArr.push(data);
	    			}
	    		}
	    	});	
			
			gradeDataSource = dews.ui.dataSource("gradeDataSource", {
				data: gradeArr
			});
			
		}
		
		//달성도SET
		function rsltSclList(cd_scaleh){
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","rsltSclList"),{
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
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2_adm","rsltScmList"),{
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
	    			if(cdEvtype == "300") { //1차평가자
		    			$("tr.k-state-selected td.NUM_CVTRSLT_1").text(num_cvtrslt.toFixed(2));
	    			}else if(cdEvtype == "100") { //2차평가자
		    			$("tr.k-state-selected td.NUM_CVTRSLT_2").text(num_cvtrslt.toFixed(2));
	    			}
	    		}
	    	});	
			return {
				num_ptscale: num_ptscale,
				num_cvtrslt: num_cvtrslt
			};
			
		}
	
		//레벨과 평가자구분(1차평가자, 2차평가자)에 대한 마감여부 SET
		function deadlineSet(lb_evgroup, rowData) {
			
			//평가유형 체크
			var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
			if(check_tp_evlu == '100') {
				sGrid = grid;
			}else if(check_tp_evlu == '200') {
				sGrid = grid2;
			}else {
				sGrid = grid;
			}
			
			if(	   (lb_evgroup == 5 && cdEvtype == 300 && rowData.YN_DEADLINE4 == "Y")
	       		|| (lb_evgroup == 4 && cdEvtype == 300 && rowData.YN_DEADLINE3 == "Y")
	       		|| (lb_evgroup == 3 && cdEvtype == 300 && rowData.YN_DEADLINE2 == "Y")
	       		|| (lb_evgroup == 2 && cdEvtype == 300 && rowData.YN_DEADLINE1 == "Y")) {
				$("#btn_cancel_deadline").removeAttr("disabled");
				$("#btn_submit_deadline").attr("disabled", "disabled");
				$("#btn_save").attr("disabled", "disabled");
				dews.ui.textbox("#dc_rslt2").readonly(true);
				sGrid.closeCell();
	       	}else if(	 (lb_evgroup == 5 && cdEvtype == 300 && rowData.YN_DEADLINE4 == "N")
	           		  || (lb_evgroup == 4 && cdEvtype == 300 && rowData.YN_DEADLINE3 == "N")
	           		  || (lb_evgroup == 3 && cdEvtype == 300 && rowData.YN_DEADLINE2 == "N")
	           		  || (lb_evgroup == 2 && cdEvtype == 300 && rowData.YN_DEADLINE1 == "N")) {
				$("#btn_cancel_deadline").attr("disabled", "disabled");
				$("#btn_submit_deadline").removeAttr("disabled");
				$("#btn_save").removeAttr("disabled");
				dews.ui.textbox("#dc_rslt2").readonly(false);
	     	}else if(	 (lb_evgroup == 5 && cdEvtype == 100 && rowData.YN_DEADLINE3 == "Y")
	         		  || (lb_evgroup == 4 && cdEvtype == 100 && rowData.YN_DEADLINE2 == "Y")
	         		  || (lb_evgroup == 3 && cdEvtype == 100 && rowData.YN_DEADLINE1 == "Y")) {
				$("#btn_cancel_deadline").removeAttr("disabled");
				$("#btn_submit_deadline").attr("disabled", "disabled");
				$("#btn_save").attr("disabled", "disabled");
				dews.ui.textbox("#dc_rslt3").readonly(true);
				sGrid.closeCell();
	       	}else if(	 (lb_evgroup == 5 && cdEvtype == 100 && rowData.YN_DEADLINE3 == "N")
	            	  || (lb_evgroup == 4 && cdEvtype == 100 && rowData.YN_DEADLINE2 == "N")
	            	  || (lb_evgroup == 3 && cdEvtype == 100 && rowData.YN_DEADLINE1 == "N")) {
				$("#btn_cancel_deadline").attr("disabled", "disabled");
				$("#btn_submit_deadline").removeAttr("disabled");
				$("#btn_save").removeAttr("disabled");
				dews.ui.textbox("#dc_rslt3").readonly(false);
	      	}
			
		}
		
		//레벨에 따라서 평가 comment 뿌려주기
		function lbCommentSet(lb_evgroup, rowData) {
			if(lb_evgroup == 5 && rowData.CD_EVTYPE == '200') {
	    		dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT5);
	    		if(rowData.DC_RSLT_1 || rowData.DC_RSLT_1 == ""){
	        		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT_1);
	    		}else{
	        		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT4);
	    		}
	    		if(tp_grade != "100") {
		    		if(rowData.DC_RSLT_2 || rowData.DC_RSLT_2 == ""){
		        		dews.ui.textbox("#dc_rslt3").text(rowData.DC_RSLT_2);
		    		}else {
		        		dews.ui.textbox("#dc_rslt3").text(rowData.DC_RSLT3);
		    		}
	    		}else {
	    			dews.ui.textbox("#dc_rslt3").text(grade_dc_rslt);
	    		}
	    	}else if(lb_evgroup == 4 && rowData.CD_EVTYPE == '200') {
	    		dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT4);
	    		if(rowData.DC_RSLT_1 || rowData.DC_RSLT_1 == ""){
	        		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT_1);
	    		}else {
	        		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT3);
	    		}
	    		if(tp_grade != "100") {
		    		if(rowData.DC_RSLT_2 || rowData.DC_RSLT_2 == ""){
		        		dews.ui.textbox("#dc_rslt3").text(rowData.DC_RSLT_2);
		    		}else {
		        		dews.ui.textbox("#dc_rslt3").text(rowData.DC_RSLT2);
		    		}
	    		}else {
	    			dews.ui.textbox("#dc_rslt3").text(grade_dc_rslt);
	    		}
	    	}else if(lb_evgroup == 3 && rowData.CD_EVTYPE == '200') {
	    		dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT3);
	    		if(rowData.DC_RSLT_1 || rowData.DC_RSLT_1 == ""){
	        		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT_1);
	    		}else {
	        		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT2);
	    		}
	    		if(tp_grade != "100") {
		    		if(rowData.DC_RSLT_2 || rowData.DC_RSLT_2 == ""){
		        		dews.ui.textbox("#dc_rslt3").text(rowData.DC_RSLT_2);
		    		}else {
		        		dews.ui.textbox("#dc_rslt3").text(rowData.DC_RSLT1);
		    		}
	    		}else {
	    			dews.ui.textbox("#dc_rslt3").text(grade_dc_rslt);
	    		}
	    	}else if(lb_evgroup == 2 && rowData.CD_EVTYPE == '200') {
	    		dews.ui.textbox("#dc_rslt1").text(rowData.DC_RSLT2);
	    		if(rowData.DC_RSLT_1 || rowData.DC_RSLT_1 == ""){
	        		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT_1);
	    		}else {
	        		dews.ui.textbox("#dc_rslt2").text(rowData.DC_RSLT1);
	    		}
	    	}
		}
		</script>	
	
	<script src="scripts/util.js"></script>
	<script id="customize">
		dews.ready(function(){
	    	/* grid = util.customize.initCustomizeGrid(grid);
	    	util.customize.initCustomizeLabel(); */
	    });
	</script>
    
</tiles:putAttribute>
</tiles:insertDefinition>


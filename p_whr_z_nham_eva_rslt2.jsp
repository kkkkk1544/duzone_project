<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
	<tiles:putAttribute name="content">
		<!--   
			�ۼ��� : 
			�ۼ��� : 2017-12-23
			�޴��� : ��������
			������ : 
			������ :
			�������� : p_whr_z_nham_eva_rslt2.jsp
		 -->
		 
	    <!-- ��ư���� ���� -->
		<div class="dews-button-group dews-button-group-primary">
		    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_search">��ȸ</button>
		    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_save">����</button>
		    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_submit_deadline">�Է¸���</button>
		    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_cancel_deadline">�������</button>
		</div>
	    <!-- ��ư���� �� -->
	  
	    <!-- ��ȸ���� ���� -->  
	    <div class="dews-condition-panel">
	    	<form class="dews-condition-form">
	    		<ul>
					<li>
						<label for='ym_evlu' class='required dews-ui-multilingual'>���س��</label> 					
						<span>
	<!-- 						<input name="ym_evlu"  -->
	<!-- 						       id="ym_evlu"  -->
	<!-- 						       type="text"  -->
	<!-- 						       class="dews-ui-codepicker required" -->
	<!-- 						       data-dews-help-code="P_HR_YM" -->
	<!-- 							   data-dews-help-title="���س������â"  -->
	<!-- 							   data-dews-code-field="YM_EVLU" -->
	<!-- 							   data-dews-text-field="YM_EVLU" -->
	<!-- 							   data-dews-help-params="PAGEID=SLFMID" -->
	<!-- 							   data-dews-format="0000/00" -->
	<!-- 							/> -->
							<select id="ym_evlu" class="dews-ui-dropdownlist" 
									data-dews-value-field="YM_EVLU" 
									data-dews-text-field="NM_EVLU" 
									data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=800">
	           				</select>
						</span>					
					</li>
					<li >
						<label class="dews-ui-multilingual" for="cd_evunit">�򰡴���</label>
		                <span>
		                    <select class="dews-ui-dropdownlist" id="cd_evunit" 
		                    		data-dews-text-field="NM_SYSDEF" 
		                    		data-dews-value-field="CD_SYSDEF" 
		                    		data-dews-data-url="~/Data/CommonData/getCodeData?cd_field=HR_EV00006&dummy_yn=N" >
		                    </select>
		                </span>
					</li>
					<li >
						<label class="dews-ui-multilingual" for="tp_evlu">������</label>
		                <span>
		                	<select class="dews-ui-dropdownlist" id="tp_evlu" 
		                			data-dews-text-field="NM_SYSDEF" 
		                			data-dews-value-field="CD_SYSDEF" 
		                			data-dews-data-url="~/Data/CommonData/getCodeData?cd_field=HR_EV00004&dummy_yn=N" >
		                	</select>
		                </span>
					</li>
					<li>
						<label class="dews-ui-multilingual" for="nm_group">�򰡱׷�</label>
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
	    <!-- ��ȸ���� �� -->
	    
	    <!-- �׸��� ���� ���� -->
	   <div class="dews-grid-panel" style="width:100%;height:100%;">
	   		<!-- ���� -->
			<div class="dews-grid-panel"id="Module_area" style="float:left;width:25.3%;height:100%;">
				<div class="grade_box">	
					<div class="dews-grid-title">
						<span>����� ��޺���</span>
					</div>
				</div>
			    <div class="dews-grid-panel grade_box" id="grid_subject_div">
			        <div id="grid_grade" class="dews-ui-grid"></div>
			    </div>
				<div>	
					<div class="dews-grid-title">
						<span>�򰡴��</span>
					</div>
				</div>
			    <div class="dews-grid-panel" id="grid_subject_div">
			        <div id="grid_pipyeong" class="dews-ui-grid"></div>
			    </div>
		    </div>
		    
		    <!-- ���� -->
			<div class="dews-grid-panel" style="float:right;width:74%;height:100%;margin-left:5px;">
			   	<div class="dews-button-group">
					<div class="dews-grid-title">
						<span>���Է�</span>
					</div>
				    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_file">÷������</button>
				</div>
				<div class="dews-grid-panel">
					<!-- (������)�׸��� -->
					<div id="grid_list" class="dews-ui-grid"></div>
					<!-- (������)�׸��� -->
					<div id="grid_list2" class="dews-ui-grid"></div>
				</div>
				<br>
				<!-- comment ���� ���� -->
				<div class="dews-button-group">
					<div class="dews-grid-title">
						<span>����ٰ� �� ��Ÿ COMMENT ����(���ۼ�)</span>
					</div>
				</div>
				<div class="dews-condition-panel div-3" id="dataForm">
					<form class="dews-condition-form">
						<ul>
							<li class="col-3">
								<label for='dc_rslt1' class='dews-ui-multilingual'>�ڱ���</label>
								<span>
									<textarea id="dc_rslt1" class="dews-ui-textbox readonly" rows="3" style="width:650px;"></textarea>
								</span>
							</li>
							<li class="col-3">
								<label for='dc_rslt2' class='dews-ui-multilingual'>����(1��)</label> 	
								<span>
									<textarea id="dc_rslt2" class="dews-ui-textbox" rows="3" style="width:650px;" onchange="dcRsltText(1, this.value);"></textarea>
								</span>
							</li>
	 						<li class="col-3">
	 							<label for='dc_rslt3' class='dews-ui-multilingual'>����(2��)</label>
	 							<span>
	 								<textarea id="dc_rslt3" class="dews-ui-textbox" rows="3" style="width:650px;" onchange="dcRsltText(2, this.value);"></textarea>
	 							</span>
	 						</li>
	<!-- 						<li class="col-3"> -->
	<!-- 							<label for='dc_rslt4' class='dews-ui-multilingual'>����(3��)</label> 	 -->
	<!-- 							<span> -->
	<!-- 								<textarea id="dc_rslt4" class="dews-ui-textbox" rows="3" style="width:650px;" onchange="dcRsltText(3, this.value);"></textarea> -->
	<!-- 							</span> -->
	<!-- 						</li> -->
	
						</ul>
					</form>
				</div>
				<!-- comment ���� �� -->
			</div>
			<!-- ���� ��-->
				 
		</div>
		<!-- �׸��� ���� �� -->
		<script>
		var grid_grade, grid_pipyeong, grid, grid2,
			grade_datasource, pipyeong_datasource, datasource1, datasource2, rsltSclDataSource, 
			sclArr, changeData, lbGroup, cdEvtype, isGrade, grade_dc_rslt,
			tp_grade, pipyeongRowNum, isSave;
		
		dews.ready(function() {
			
			tp_grade = '100';
			pipyeongRowNum = 0;
			changeData = false;	//������ ���濩��
			isDeadline = false; //������� ���ɿ���
			isSave = {result : false, currentNo : 0 } //������ϰ�� ������ ���� �� ������ ����� ����˸�  	,
			deadlineCheckData = {deadline_cnt : false, null_cnt : false, grade_ck : false}; //����� �Է¸����� üũ�׸�
			
			$("#btn_cancel_deadline").attr("disabled", "disabled");
			
			// �ʱⵥ���� SET
			initPageData();
			
			// �򰡱׷� SET
			groupSelect();
			
			grade_datasource = dews.ui.dataSource("grade_datasource", {
				batch: true,	//�׸��� �����
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
					    title: dews.localize.get("���ο�"),
					    width: 50
					},     
	                {
	                    field: "NM_EVGROUP",
	                    title: dews.localize.get("�򰡱׷��"),
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
				batch: true,	//�׸��� �����
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
	                    title: dews.localize.get("�򰡱׷��"),
	                    width: 70,
	                    align: "left",
	                },
	                {
	                    field: "NM_KOR",
	                    title: dews.localize.get("����"),
	                    width: 55,
	                },
	                {
	                    field: "NO_EMP",
	                    title: dews.localize.get("�����ȣ"),
	                    width: 65
	                },
	                {
	                    field: "YN_APPROVE",
	                    title: dews.localize.get("��������"),
	                    width: 65
	                },
	                {
	                    field: "NM_GRADE_1",
	                    title: dews.localize.get("(1��)<br>���"),
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
	                    title: dews.localize.get("(2��)<br>���"),
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
	            	var row = grid_pipyeong.select(); // ���� ���õ� ROW
	                if (row.length < 1) {
	            		//�����Ͱ� ���� ��� �ʱ�ȭ
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
	            	var row = grid_pipyeong.select(); // ���� ���õ� ROW
					if(tp_grade == "100" && isSave.result) {
						if(row[0].sectionRowIndex != pipyeongRowNum){
		                	dews.confirm('����� ������ �ֽ��ϴ�.\n�����Ͻðڽ��ϱ�?').yes(function(){
			                	saveFn();
		                    }).no(function(){
								isSave = {result : false, currentNo: isSave.currentNo};
		                    	headerData();
		                    });
		                	grid_pipyeong.select(grid_pipyeong.element.find("tbody tr:eq("+pipyeongRowNum+")"));
							return;
						}
	                }else {
						dews.ui.textbox("#dc_rslt2").text("");
	        			dews.ui.textbox("#dc_rslt2").text("");
	        			dews.ui.textbox("#dc_rslt3").text("");
		            	if (row.length > 0) {
			             	// ���� ROW�� ������ ȹ��
			                rowData = grid_pipyeong.dataItem(row); 
			             	pipyeongRowNum = rowData.ROW_NO -1;
			            	gradeList();
			            	currentNo = rowData.NO_EMP;
			            	currentGroup = rowData.CD_EVGROUP;
		                }
			            detailData(currentNo, currentGroup);
	                }
	            	
					fileCheck(grid_pipyeong.dataItem(row).NO_EMP);
	            	
		        },
	            save: function(e) {
	            	if (e.values.hasOwnProperty('NM_GRADE_2')) { // 2����� �����Ǿ����� üũ
	            		if(e.model.CD_GRADE_2 != e.values.NM_GRADE_2) {
		            		e.model.CD_GRADE_2 = e.values.NM_GRADE_2;
		            		isSave = {result : true, currentNo : e.model.NO_EMP}
		            	}else {
		            		isSave = {result : false, currentNo : e.model.NO_EMP}
		            	}
	            	}
	            }
	   	 	});
			
			//������ȸ dataSource
			dataSource1 = dews.ui.dataSource("dataSource1", {
		    	batch: true,	//�׸��� �����
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
			
		    //������ȸ dataSource
			dataSource2 = dews.ui.dataSource("dataSource2", {
		    	batch: true,	//�׸��� �����
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
		
		//�ڱ���
		function dcRsltText(num, val) {
			var sGrid, sSourse;
			
			//������ üũ
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
		
		//÷������ ������ üũ
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
		}
		
		//��ȸ
		$("#btn_search").on("click", function() {
			if(tp_grade == "100" && isSave.result) {
               	dews.confirm('����� ������ �ֽ��ϴ�.\n�����Ͻðڽ��ϱ�?').yes(function(){
					saveFn();
                }).no(function(){
					isSave = {result : false, currentNo: isSave.currentNo};
                	headerData();
                });
               	grid_pipyeong.select(grid_pipyeong.element.find("tbody tr:eq("+pipyeongRowNum+")"));
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

			// �򰡰�ȹ�Ⱓ ��ȸ
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","planCheck"),{
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
	   				dews.alert("�Ⱓ�� Ȯ�����ּ���.","ico2");
	   			}
	    	});
			
		});
		
		//������ ���� �� �ٸ������� �Ǵ� ��ư ������ �����
		function saveFn(){
			//������ üũ
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
			
			var gridData = sGrid.dataItems(); //�����׸���
			
			//����� 1��, 2����� ��
			if(tp_grade == "100") {
				var pipyeongSelData, grade;
				pipyeongSelData = grid_pipyeong.dataItem(grid_pipyeong.select()); //���� �׸���
				if(cdEvtype == "300") {
					grade = pipyeongSelData.CD_GRADE_1;
				}else if(cdEvtype == "100") {
					grade = pipyeongSelData.CD_GRADE_2;
					if(pipyeongSelData.CD_GRADE_1 != pipyeongSelData.CD_GRADE_2 && !grade_dc_rslt) {
						dews.alert("1����ް� 2������� ���� ���� ��� <br>COMMENT(��������)�� �ʼ��Դϴ�.","ico2");
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
				}else if(cdEvtype == "3������"){
					if(!gridData[i].DC_RSLT_3 && gridData[i].DC_RSLT_3 != ""){
						if(gridData[i].LB_EVGROUP == 5){
							gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT2;
						}else if(gridData[i].LB_EVGROUP == 4){
							gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT1;
						}
					}
				}
			}
		
			sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt2", "rslt2Insert"),{
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
					grade_dc_rslt : grade_dc_rslt
				},
				callback: function (result) {
					if (result && result.hasOwnProperty("error")) {
	                      dews.error(dews.localize.get("������ �����Ͽ����ϴ�."));
	                      console.log(result.error);
					} else {
		        		dews.alert(dews.localize.get("���� �����Ͽ����ϴ�.")).done(function() {
		        			isSave = {result : false, currentNo: pipyeongSelData.NO_EMP	};
		        			gradeData();
		        		});
					}
				} // end callback 
			}); // end batchSave
		}
		
		//����
		$('#btn_save').on('click', function (e) {
			
			//������ üũ
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
			
			var gridData = sGrid.dataItems(); //�����׸���
			
			//����� 1��, 2����� ��
			if(tp_grade == "100") {
				var pipyeongSelData, grade;
				pipyeongSelData = grid_pipyeong.dataItem(grid_pipyeong.select()); //���� �׸���
				if(cdEvtype == "300") {
					grade = pipyeongSelData.CD_GRADE_1;
				}else if(cdEvtype == "100") {
					grade = pipyeongSelData.CD_GRADE_2;
					if(grade && pipyeongSelData.CD_GRADE_1 != pipyeongSelData.CD_GRADE_2 && !grade_dc_rslt) {
						dews.alert("1����ް� 2������� ���� ���� ��� <br>COMMENT(��������)�� �ʼ��Դϴ�.","ico2");
						return;
					}
				}
			}
			
			if(gridData == null) {
				dews.alert("�׸��� �������� �ʽ��ϴ�.");
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
				}else if(cdEvtype == "3������"){
					if(!gridData[i].DC_RSLT_3 && gridData[i].DC_RSLT_3 != ""){
						if(gridData[i].LB_EVGROUP == 5){
							gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT2;
						}else if(gridData[i].LB_EVGROUP == 4){
							gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT1;
						}
					}
				}
			}
			
			//������ ����üũ
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","checkData"),{
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
			
			if(!changeData) {
				dews.alert("���� �� ������ �������� �ʽ��ϴ�.");
				return;
			}
		
			dews.confirm('�����Ͻðڽ��ϱ�?').yes(function() {
				sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt2", "rslt2Insert"),{
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
						grade_dc_rslt : grade_dc_rslt
					},
					callback: function (result) {
						if (result && result.hasOwnProperty("error")) {
		                      dews.error(dews.localize.get("������ �����Ͽ����ϴ�."));
		                      console.log(result.error);
						} else {
			        		dews.alert(dews.localize.get("���� �����Ͽ����ϴ�.")).done(function() {
			        			isSave.result = false;
			        			gradeData();
			        			
			        		});
						}
					} // end callback 
				}); // end batchSave
			}).no(function() {
				// ������
			});
	    });
	
		// �Է¸���
		$('#btn_submit_deadline').on('click', function (e) {
			var sGrid, sSourse, check_grade, grade;
			
			if(tp_grade == "100" && isSave.result) {
               	grid_pipyeong.select(grid_pipyeong.element.find("tbody tr:eq("+pipyeongRowNum+")"));
               	dews.confirm('����� ������ �ֽ��ϴ�.\n�����Ͻðڽ��ϱ�?').yes(function(){
					saveFn();
                }).no(function(){
					isSave = {result : false, currentNo: isSave.currentNo};
                	headerData();
                });
               	return;
            }
			
			//������ üũ
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
			
			//�����
			if(tp_grade == "100") {
				deadlineCheckData.deadline_cnt = false;
				deadlineCheckData.null_cnt = false;
				deadlineCheckData.grade_ck = false;
				var gridData = grid_pipyeong.dataItems();

				if(gridData == null) {
					dews.alert("�׸��� �������� �ʽ��ϴ�.");
					return;
				}
				
				//�޼��� nullüũ
				dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","relCheckData"),{
		    		async : false,
					data  : {
		   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
		   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
		   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
		   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
		   				cd_evtype : cdEvtype,
						chData : JSON.stringify(gridData)
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
				
				//����� ���� üũ
				if(isGrade == "false") {
	    			dews.alert("����� ��޺����� �������� �ʾ�<br>�Է¸����� �� �� �����ϴ�.","ico2");
	    			return;
    			}
				
				if(deadlineCheckData.deadline_cnt){
					dews.alert("�������ڰ� �Է¸����� ���� ����<br>�׸��� �����մϴ�.","ico2");
					return;
				}else if(deadlineCheckData.null_cnt) {
					if(cdEvtype == '300'){//1������ 
	 					dews.alert("(1��)�޼����� ����<br>�����ڰ� �����մϴ�.","ico2");
	 				}else if(cdEvtype == '100'){//1������ 
	 					dews.alert("(2��)����� ����<br>�����ڰ� �����մϴ�.","ico2");
	 				}
 					return;
				}else if(deadlineCheckData.grade_ck) {
					dews.alert("����� ��޺����� Ȯ���� �ּ���.");
					return;
				}
			
			}else {
				if(gridData == null) {
					dews.alert("�׸��� �������� �ʽ��ϴ�.");
					return;
				}
				
				//�޼��� nullüũ
				for(var i=1; i<gridData.length; i++) {
					if(cdEvtype == '300'){//1������
						if(!gridData[i].NM_SCALED_1){
							dews.alert("(1��)�޼����� ���� �׸��� �����մϴ�.");
							return;
						}
					}
					else if(cdEvtype == '100'){ //2������
						if(!gridData[i].NM_SCALED_2){
							dews.alert("(2��)�޼����� ���� �׸��� �����մϴ�.");
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
					}else if(cdEvtype == "3������"){
						if(!gridData[i].DC_RSLT_3 && gridData[i].DC_RSLT_3 != ""){
							if(gridData[i].LB_EVGROUP == 5){
								gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT2;
							}else if(gridData[i].LB_EVGROUP == 4){
								gridData[i].DC_RSLT_3 = gridData[i].DC_RSLT1;
							}
						}
					}
				}

				//������ ����üũ
				dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","checkData"),{
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
					dews.alert("���� �� �Է� ������ �����մϴ�.");
					return;
				}
				
				// �Է¸����� �����ڴ�� ���̺��� ���õ� �����ͷ� ����
				gridData = grid_pipyeong.dataItem(grid_pipyeong.select());
			}
			
			dews.confirm('�Է¸��� �Ͻðڽ��ϱ�?').yes(function() {
				sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt2", "deadLineUpdate"),{
		       		async : false,
		   			data  : {
		   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
		   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
		   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
		   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
		   				cd_evtype : cdEvtype,
		   				yn_deadline : "Y",
		   				gridData : JSON.stringify(gridData),
		   				tp_grade : tp_grade
					},
					callback: function (result) {
						if (result && result.hasOwnProperty("error")) {
		                      dews.error(dews.localize.get("�Է¸��� �۾��� �����Ͽ����ϴ�."));
		                      console.log(result.error);
						} else {
			        		dews.alert(dews.localize.get("�Է¸��� �۾��� �Ϸ�Ǿ����ϴ�.")).done(function() {
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
				// ������
			});
			
	    });
		
		// �������
		$('#btn_cancel_deadline').on('click', function (e) {
			var sGrid, sSourse;
			
			//������ üũ
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
				dews.alert("�׸��� �������� �ʽ��ϴ�.");
				return;
			}
			
			//������� ���ɿ��� Ȯ��
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","checkDeadline"),{
	    		async : false,
				data  : {
	   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
	   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
	   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
	   				cd_evtype : cdEvtype,
	   				chData : JSON.stringify(gridData),
	   				tp_grade : tp_grade
	            }
	    	}).done(function(result){
	    		if(result.DEADLINE_CNT > 0) {
	    			isDeadline = true;
	   			}else {
	   				isDeadline = false;
	   			}
	    	});

			if(isDeadline) {
				dews.alert("������� �� �� ���� �����Դϴ�.");
				return;
			}
			
			dews.confirm('������� �Ͻðڽ��ϱ�?').yes(function() {
				sSourse.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_eva_rslt2", "deadLineUpdate"),{
		       		async : false,
		   			data  : {
		   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
		   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
		   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
		   				cd_evgroup : dews.ui.dropdownlist("#nm_group").value(),
		   				cd_evtype : cdEvtype,
		   				yn_deadline : "N",
		   				gridData : JSON.stringify(gridData),
		   				tp_grade : tp_grade
					},
					callback: function (result) {
						if (result && result.hasOwnProperty("error")) {
		                      dews.error(dews.localize.get("������� �۾��� �����Ͽ����ϴ�."));
		                      console.log(result.error);
						} else {
			        		dews.alert(dews.localize.get("������� �۾��� �Ϸ�Ǿ����ϴ�.")).done(function() {
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
				// ������
			});
			
	    });
		
		//���ؿ���
		$("#ym_evlu").on("change", function(e){
			 dews.ui.dropdownlist("#ym_evlu").value(e.target.value);
			 ym_evlu = e.target.value;
			 groupSelect();
		});
		
		//�򰡴���
		$("#cd_evunit").on("change", function(e){
			 dews.ui.dropdownlist("#cd_evunit").value(e.target.value);
			 cd_evunit = e.target.value;
			 groupSelect();
		});
		
		//������
		$("#tp_evlu").on("change", function(e){
			dews.ui.dropdownlist("#tp_evlu").value(e.target.value);
			tp_evlu = e.target.value;
			pipyeong_datasource.data([]);
			groupSelect();
			selectGrid();
		});
		
		// ����÷��
		$('#btn_file').on('click', function (e) {
			var row = grid.select();
		    var rowData = grid.dataItem(row);	
		    var flag = {flag: false};
	    	$.extend(rowData,flag);
		    if(rowData){
	    		var initData = {
    				pIdMenu: "p_whr_z_nham_goal_reg",   //������ �༭ �׳� ���� �ɵ��մϴ�.
    				pFilePath: "",
					pCdFile: rowData.YM_EVLU + "_" + rowData.CD_EVUNIT + "_" + rowData.CD_EVGROUP + "_" + rowData.NO_EMP + "_0",		
					params: {
						data: rowData
					}
				};
	    		var dialog= dews.ui.dialog('p_whr_z_nham_file_attach_pop', {
					url: "~/p_whr_z_nham_file_attach_pop",
					title: "÷������ ���ٿ�ε�",
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
		//�ʱⵥ����
		function initPageData() {
			
			// ������ select
			var tp_evlulist, tp_evlu_arr = new Array();
			dews.ajax.data('~/Data/CommonData/getCodeData?cd_field=HR_EV00004&use_yn=Y&dummy_yn=N', { async: false }).done(function (data) {
				for(var i=0; i<data.length; i++){
					if(data[i].CD_SYSDEF != "300"){ //�ٸ�����
						tp_evlu_arr.push(data[i]);
					}
				}
			}).fail(function(data) {
				dews.error(data.responseJSON.message);
			});
			tp_evlulist = dews.ui.dropdownlist('#tp_evlu');
			tp_evlulist.setDataSource(tp_evlu_arr);
		}
		
		//���ڱ���(1������, 2������) ��������
		function getCDevtype(){
			cdEvtype = ""
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","getCDevtype"),{
	       		async : false,
	   			data  : {
	            	ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	            	cd_evunit : dews.ui.dropdownlist('#cd_evunit').value(),
	            	tp_evlu : dews.ui.dropdownlist('#tp_evlu').value(),
	            	cd_evgroup : dews.ui.dropdownlist('#nm_group').value()
	               }
	       	}).done(function(result){
	       		cdEvtype = result.cd_evtype;
				if(cdEvtype == "300"){ //1������
					dews.ui.textbox("#dc_rslt2").readonly(false);
					dews.ui.textbox("#dc_rslt3").readonly(true);
				}else if(cdEvtype == "100"){//2������
					dews.ui.textbox("#dc_rslt2").readonly(true);
					dews.ui.textbox("#dc_rslt3").readonly(false);
				}
	       	});
			
		}
		
		//����� ��޺��� ��ȸ
		function gradeData() {
       		var gridData;
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","getGradeList"),{
	       		async : false,
	   			data  : {
	               	ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	               	cd_evunit : dews.ui.dropdownlist('#cd_evunit').value(),
	               	tp_evlu : dews.ui.dropdownlist('#tp_evlu').value(),
	               	cd_evgroup : dews.ui.dropdownlist('#nm_group').value()
	               }
	       	}).done(function(result){
	    		if(result.dt1.length > 0) {
	    			tp_grade = result.dt1[0].TP_GRADE; //��޻������� (100:�����, 200:������)
	    		}
	    		if(result.dt2.length > 0) {
	    			isGrade = result.dt2[0].IS_GRADE;
	    			gridData = result.dt2;
	    		}
    			
    			//���ڱ��а� ��������
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
	
		//�򰡱׷� ��ȸ
		function groupSelect() {
			dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_group","EvaGroup"),{
	       		async : false,
	   			data  : {
	   				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	   				cd_evunit : dews.ui.dropdownlist("#cd_evunit").value(),
	   				tp_evlu : dews.ui.dropdownlist("#tp_evlu").value(),
	   				cd_evtype : cdEvtype
	               }
	       	}).done(function(result){
	       		var arr = new Array();
// 	    		arr.push({CD_EVGROUP:"", NM_EVGROUP : ""});
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
		
		//������������ �׸��� SET
		function selectGrid() {
			$(".grade_box").hide();
			grid_pipyeong.hideColumn('NM_GRADE_1'); // ��� ����
			grid_pipyeong.hideColumn('NM_GRADE_2'); // ��� ����
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
		
		//�����׸��� ��ȸ
		function headerData() {
			//������ üũ
			var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
			if(check_tp_evlu == '100') {
				sGrid = grid;
			}else if(check_tp_evlu == '200') {
				sGrid = grid2;
			}else {
				sGrid = grid;
			}
			
			//���ڱ��а� ��������
//			getCDevtype();
			
			var gridData;
	        
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_rslt2", "getPipyeongList"), {
		        async: false,
		        data:{
	               	ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	               	cd_evunit : dews.ui.dropdownlist('#cd_evunit').value(),
	               	tp_evlu : dews.ui.dropdownlist('#tp_evlu').value(),
	               	cd_evgroup : dews.ui.dropdownlist('#nm_group').value()
		        }
		    }).done(function (result) {
		    	if(result.length > 0){
    				gridData = result;
		  	  	}
		   	});
			
			grid_pipyeong.dataSource.data(gridData);  
			if(tp_grade == "100") {
				if(cdEvtype == "300") {
	  				grid_pipyeong.showColumn('NM_GRADE_1'); // 1���򰡰���� 
	  				grid_pipyeong.hideColumn('NM_GRADE_2'); // 2���򰡰���� ����
					$(".NM_GRADE_1").addClass('required'); // 2���򰡰���� ����
				}else if(cdEvtype == "100") { 
	  				grid_pipyeong.showColumn('NM_GRADE_1'); // 1���򰡰����
	  				grid_pipyeong.showColumn('NM_GRADE_2'); // 2���򰡰���� 
	   				$(".NM_GRADE_1").removeClass('required'); // 2���򰡰���� ����
	   				$(".NM_GRADE_2").addClass('required'); // 2���򰡰���� ����
				}
    			//1�������� ��� �Ǵ� ������� ���
	        	sGrid.hideColumn('NM_SCALED_2'); // 2���򰡰��޼��� ����
	        	sGrid.hideColumn('NUM_CVTRSLT_2'); // 2����ȯ������ ����
			}else if(tp_grade == "200") {
				$(".grade_box").hide();
    			grid_pipyeong.hideColumn('NM_GRADE_1'); // ��� ����
    			grid_pipyeong.hideColumn('NM_GRADE_2'); // ��� ����
    			
    	        if(cdEvtype == "300") {
    	        	sGrid.hideColumn('NM_SCALED_2'); // 2���򰡰��޼��� ����
    	        	sGrid.hideColumn('NUM_CVTRSLT_2'); // 2����ȯ������ ����
    	        }else if(cdEvtype == "100") {
    	        	sGrid.showColumn('NM_SCALED_2'); // 2���򰡰��޼���
    	        	sGrid.showColumn('NUM_CVTRSLT_2'); // 2����ȯ������
    	        }
			}
		}
		
		//�����׸��� ��ȸ
		function detailData(currentNo, currentGroup) {
			
			//������ üũ
			var check_tp_evlu = dews.ui.dropdownlist("#tp_evlu").value();
			if(check_tp_evlu == '100') {
				sGrid = grid;
			}else if(check_tp_evlu == '200') {
				sGrid = grid2;
			}else {
				sGrid = grid;
			}
			
			var gridData;
	        
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_rslt2", "getList"), {
		        async: false,
		        data:{
	               	ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	               	cd_evunit : dews.ui.dropdownlist('#cd_evunit').value(),
	               	tp_evlu : dews.ui.dropdownlist('#tp_evlu').value(),
	               	cd_evgroup : dews.ui.dropdownlist('#nm_group').value(),
	               	s_cd_evgroup : currentGroup,
	               	s_no_emp : currentNo
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
	    	
	    	//�޼��� �ʼ��Է� ����
	    	$(".NM_SCALED_1").removeClass("required");
	    	$(".NM_SCALED_2").removeClass("required");
	        if(cdEvtype == "300") { //1�������� ���
	        	$(".NM_SCALED_1").addClass("required");
	        }else if(cdEvtype == "100") { //2�������ϰ��
	        	$(".NM_SCALED_2").addClass("required");
	        }
		}
		
		//������
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
		                title: dews.localize.get("������"),
		                width: 95,
		                align: "left",
		            },
		            {
		                field: "NM_ITEM",
		                title: dews.localize.get("KPI��"),
		                width: 102,
		            },
		            {
		                field: "DC_DEFINATION",
		                title: dews.localize.get("������ǥ(KPI����)"),
		                width: 131,
		                align: "left"
		            },
		            {
		                field: "DC_PLAN",
		                title: dews.localize.get("��ȹ �� �޼�����"),
		                width: 116,
		                align: "left"
		            },
		            {
		                field: "DC_FORMULA",
		                title: dews.localize.get("�� �� ��޺ο�����<br>(KPI ���)"),
		                width: 174,
		                align:"left",
		            },
		            {
		                field: "NUM_ITEM",		
		                title: dews.localize.get("����"),
		                width: 72
		            },
		            {
		                field: "NM_SCALED",		
		                title: dews.localize.get("�ڱ�޼���"),
		                width: 72,
		                hidden : true
		            },
		            {
		                field: "NUM_CVTRSLT",		
		                title: dews.localize.get("�� ȯ������"),
		                width: 79,
		                hidden : true,
	                    format: dews.ui.grid.formats.number("n02")
		            },
		            {
						field: "CD_RSLT_2",		
						title: dews.localize.get("���ڴ޼���"),
			        	hidden : true
	                },
	                {
						field: "NUM_RSLT_1",		
						title: dews.localize.get("(1��)<br>���ڴ޼���"),
	                    width: 100,
		        		editor		: function(container, options) {
			            	var gridLength,
			            	//�׸��� ROW ����
			            	gridLength = grid.dataSource._pristineTotal;
		        			if(options.model.ROW_NO < gridLength) {
	                        	dews.ui.grid.editors.textbox(container, options,
                        		function (data) {
			        				var lb_evgroup = data.LB_EVGROUP;
			        				if((lb_evgroup == "5" && options.model.YN_DEADLINE4 == "Y")
				        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
				        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
				        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")
				        					|| (cdEvtype == 100)) {
			        					return false;
			        				}else {
				        				return true;	
			        				}	
		        				})		
		        			}
		        		},
		        		attributes: {
		                    class : "NUM_RSLT_1"
		                }
	                },
		            {
		                field: "NM_SCALED_1",		
		                title: dews.localize.get("(1��)<br>���ڴ޼���"),
	                    width: 79,
			        	hidden : true,
	       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED_1', { 
		        			dataSourceID	: 'rsltSclDataSource', 
		        			dataValueField	: 'CD_SYSDEF', 
		        			dataTextField	: 'NM_SYSDEF' 
		        		}),
		        		editor		: function(container, options) {
			            	var gridLength = grid.dataSource._pristineTotal;
		        			if(options.model.ROW_NO < gridLength) {
			        			dews.ui.grid.editors.dropdownlist(container, options, {
		    	        			dataValueField	: 'CD_SYSDEF', 
		    	                    dataTextField	: 'NM_SYSDEF', 
		    	                    dataSource		: rsltSclDataSource,
			        			}, function(data) {
			        				var lb_evgroup = data.LB_EVGROUP;
			        				if((lb_evgroup == "5" && data.YN_DEADLINE4 == "Y")
			        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
			        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
			        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")
			        					|| (cdEvtype == 100)) {
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
	                    title: dews.localize.get("(1��)<br>ȯ������"),
	                    width: 86,
			        	hidden : true,
	                    format: dews.ui.grid.formats.number("n02"),
		        		attributes: {
		                    class : "NUM_CVTRSLT_1"
		                }
	                },
		            {
						field: "CD_RSLT_2",		
						title: dews.localize.get("���ڴ޼���"),
			        	hidden : true
	                },
	                {
						field: "NUM_RSLT_2",		
						title: dews.localize.get("(1��)<br>���ڴ޼���"),
	                    width: 100,
		        		editor		: function(container, options) {
			            	var gridLength,
			            	//�׸��� ROW ����
			            	gridLength = grid.dataSource._pristineTotal;
		        			if(options.model.ROW_NO < gridLength) {
	                        	dews.ui.grid.editors.textbox(container, options,
                        		function (data) {
			        				var lb_evgroup = data.LB_EVGROUP;
			        				if((lb_evgroup == "5" && options.model.YN_DEADLINE4 == "Y")
				        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
				        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
				        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")
				        					|| (cdEvtype == 300)) {
			        					return false;
			        				}else {
				        				return true;	
			        				}	
		        				})		
		        			}
		        		},
		        		attributes: {
		                    class : "NUM_RSLT_2"
	    	            }
	                },
		            {
		                field: "NM_SCALED_2",		
		                title: dews.localize.get("(2��)<br>���ڴ޼���"),
	                    width: 79,
			        	hidden : true,
	       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED_2', { 
		        			dataSourceID	: 'rsltSclDataSource', 
		        			dataValueField	: 'CD_SYSDEF', 
		        			dataTextField	: 'NM_SYSDEF' 
		        		}),
		        		editor		: function(container, options) {
			            	//�׸��� ROW ����
			            	var gridLength = grid.dataSource._pristineTotal;
		        			if(options.model.ROW_NO < gridLength) {
			        			dews.ui.grid.editors.dropdownlist(container, options, {
		    	        			dataValueField	: 'CD_SYSDEF', 
		    	                    dataTextField	: 'NM_SYSDEF', 
		    	                    dataSource		: rsltSclDataSource,
			        			}, function(data) {
			        				var lb_evgroup = data.LB_EVGROUP;
			        				if((lb_evgroup == "5" && data.YN_DEADLINE4 == "Y")
			        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
			        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
			        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")
			        					|| (cdEvtype == 300)) {
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
	                    title: dews.localize.get("(2��)<br>ȯ������"),
	                    width: 86,
			        	hidden : true,
	                    format: dews.ui.grid.formats.number("n02"),
		        		attributes: {
		                    class : "NUM_CVTRSLT_2"
		                }
	                }
		        ],
		        dataBound: function (e) {
		        	this.select(this.element.find("tbody tr:first"));
		        },
	            change: function(e) {
	            	var currentRow, rowData, lb_evgroup, gridLength,
	            	rowNum = 0;
	            	
	            	//�׸��� ROW ����
	            	gridLength = grid.dataSource._pristineTotal;
	            	// ���� ���õ� ROW 
	                currentRow = grid.select();
	
	            	if(currentRow.length > 0) {
		           		//���ڱ���(1������, 2������)�� ���� �޼��� edit ��Ȱ��ȭ
		           		
		               	var cellIndex = this.cellIndex($('td#grid_list_active_cell', this.tbody)); // ���õ� ���� �ε���
		               	if(cellIndex != -1) {
		                    var columnName = this.columns[cellIndex].field; // ���õ� ���� �÷���
		                    if((cdEvtype == 100 && columnName == "NM_SCALED_1") 
		                    || (cdEvtype == 300 && columnName == "NM_SCALED_2")
		                    || (cdEvtype == 100 && columnName == "NUM_RSLT_1") 
		                    || (cdEvtype == 300 && columnName == "NUM_RSLT_2")){
		                    	grid.closeCell();
		                    }
		               	}
		                
		             	// ���� ROW�� ������ ȹ��
		                rowData = grid.dataItem(currentRow); 
						rowNum = rowData.ROW_NO;
		           		lb_evgroup = rowData.LB_EVGROUP;
		                   
						if (rowData && rowNum < gridLength) {
		                  	//������ ���ڱ���(1������, 2������)�� ���� �������� SET
		                  	deadlineSet(lb_evgroup, rowData);
		                  	
		                  	//�޼���SET�� ���� �ڵ尪 ��������
		                  	cdScaleh = rowData.CD_SCALEH;
		                  	
		                  	//������ ���� �� comment �ѷ��ֱ�
		                  	lbCommentSet(lb_evgroup, rowData);
	                  	
						} else if(rowNum == gridLength) {
		                  	//ù����(�հ�) edit��Ȱ��ȭ
		                  	grid.closeCell();
						}
		            }
	                if(rowNum < gridLength) {
		            	rsltSclList(cdScaleh);
	                }
	            },
	            save: function(e) {
	            	// �޼����� �����Ǿ����� Ȯ��
			        if (e.values.hasOwnProperty('NUM_RSLT_1')) { // 1���޼����� �����Ǿ����� üũ
	            		if(e.model.CD_RSLT_1 != e.values.NUM_RSLT_1) {
		                	e.model.CD_RSLT_1 = e.values.NUM_RSLT_1; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
		            		e.model.NUM_RSLT_1 = e.values.NUM_RSLT_1;
		                    e.model.NUM_CVTRSLT_1 = e.values.NUM_RSLT_1; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
		            		isSave = {result : true, currentNo : e.model.NO_EMP}
	            		}else{
		            		isSave = {result : false, currentNo : e.model.NO_EMP}
	            		}
			        }else if (e.values.hasOwnProperty('NUM_RSLT_2')) {
	            		if(e.model.CD_RSLT_2 != e.values.NUM_RSLT_2) {
		                	e.model.CD_RSLT_2 = e.values.NUM_RSLT_2; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
		            		e.model.NUM_RSLT_2 = e.values.NUM_RSLT_2;
		                    e.model.NUM_CVTRSLT_2 = e.values.NUM_RSLT_2; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
		            		isSave = {result : true, currentNo : e.model.NO_EMP}
	            		}else{
		            		isSave = {result : false, currentNo : e.model.NO_EMP}
	            		}
			        }
			                    
			        if (e.values.hasOwnProperty('NM_SCALED_1')) { // 1���޼����� �����Ǿ����� üũ
	            		if(e.model.CD_RSLT_2 != e.values.NM_SCALED_1){	    	            	
		            		var result1 = rsltScmList(cdScaleh, e.values.NM_SCALED_1, e.model.NUM_ITEM);
		                	e.model.CD_RSLT_1 = e.values.NM_SCALED_1; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
		            		e.model.NUM_RSLT_1 = result1.num_ptscale.toFixed(2);
		                    e.model.NUM_CVTRSLT_1 = result1.num_cvtrslt.toFixed(2); // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
		            		isSave = {result : true, currentNo : e.model.NO_EMP}
	            		}else {
		            		isSave = {result : false, currentNo : e.model.NO_EMP}
	            		}
	            	}else if (e.values.hasOwnProperty('NM_SCALED_2')) { // 2���޼����� �����Ǿ����� üũ
	            		var result2 = rsltScmList(cdScaleh, e.values.NM_SCALED_2, e.model.NUM_ITEM);
	                	e.model.CD_RSLT_2 = e.values.NM_SCALED_2; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
	            		e.model.NUM_RSLT_2 = result2.num_ptscale.toFixed(2);
	                    e.model.NUM_CVTRSLT_2 = result2.num_cvtrslt.toFixed(2); // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
	            	}
	            	
	            }
		 	});
		}
		
		
		//������
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
		                title: dews.localize.get("�׸��"),
		                width: 150,
		                align: "left"
		            },
		            {
		                field: "NM_ITEM2",		
		                title: dews.localize.get("�׸��"),
		                width: 350,
		                align: "left"
		            },
		            {
		                field: "NUM_ITEM",		
		                title: dews.localize.get("����"),
		                width: 72,
		            },
		            {
		                field: "NM_SCALED",		
		                title: dews.localize.get("�ڱ�޼���"),
		                width: 100,
			        	hidden : true
		            },
		            {
		                field: "NUM_CVTRSLT",		
		                title: dews.localize.get("�� ȯ������"),
		                width: 100,
			        	hidden : true,
	                    format: dews.ui.grid.formats.number("n02")
		            },
		            {
						field: "CD_RSLT_1",		
						title: dews.localize.get("���ڴ޼���"),
		                width: 100,
			        	hidden : true
	                },
	                {
						field: "NUM_RSLT_1",		
						title: dews.localize.get("(1��)<br>���ڴ޼���"),
	                    width: 100,
		        		editor		: function(container, options) {
			            	var gridLength,
			            	//�׸��� ROW ����
			            	gridLength = grid2.dataSource._pristineTotal;
		        			if(options.model.ROW_NO < gridLength) {
	                        	dews.ui.grid.editors.textbox(container, options,
                        		function (data) {
			        				var lb_evgroup = data.LB_EVGROUP;
			        				if((lb_evgroup == "5" && options.model.YN_DEADLINE4 == "Y")
				        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
				        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
				        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")
				        					|| (cdEvtype == 100)) {
			        					return false;
			        				}else {
				        				return true;	
			        				}	
		        				})		
		        			}
		        		},
		        		attributes: {
		                    class : "NUM_RSLT_1"
		                }
	                },
		            {
		                field: "NM_SCALED_1",		
		                title: dews.localize.get("(1��)<br>���ڴ޼���"),
	                    width: 79,
			        	hidden : true,
	       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED_1', { 
		        			dataSourceID	: 'rsltSclDataSource', 
		        			dataValueField	: 'CD_SYSDEF', 
		        			dataTextField	: 'NM_SYSDEF' 
		        		}),
		        		editor		: function(container, options) {
			            	var gridLength = grid.dataSource._pristineTotal;
		        			if(options.model.ROW_NO < gridLength) {
			        			dews.ui.grid.editors.dropdownlist(container, options, {
		    	        			dataValueField	: 'CD_SYSDEF', 
		    	                    dataTextField	: 'NM_SYSDEF', 
		    	                    dataSource		: rsltSclDataSource,
			        			}, function(data) {
			        				var lb_evgroup = data.LB_EVGROUP;
			        				if((lb_evgroup == "5" && data.YN_DEADLINE4 == "Y")
			        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
			        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
			        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")
			        					|| (cdEvtype == 100)) {
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
	                    title: dews.localize.get("(1��)<br>ȯ������"),
	                    width: 100,
			        	hidden : true,
	                    format: dews.ui.grid.formats.number("n02"),
		        		attributes: {
		        			class : "NUM_CVTRSLT_1"
		                }
	                },
		            {
						field: "CD_RSLT_2",		
						title: dews.localize.get("���ڴ޼���"),
			        	hidden : true
	                },
	                {
						field: "NUM_RSLT_2",		
						title: dews.localize.get("(1��)<br>���ڴ޼���"),
	                    width: 100,
		        		editor		: function(container, options) {
			            	var gridLength,
			            	//�׸��� ROW ����
			            	gridLength = grid2.dataSource._pristineTotal;
		        			if(options.model.ROW_NO < gridLength) {
	                        	dews.ui.grid.editors.textbox(container, options,
                        		function (data) {
			        				var lb_evgroup = data.LB_EVGROUP;
			        				if((lb_evgroup == "5" && options.model.YN_DEADLINE4 == "Y")
				        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
				        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
				        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")
				        					|| (cdEvtype == 300)) {
			        					return false;
			        				}else {
				        				return true;	
			        				}	
		        				})		
		        			}
		        		},
		        		attributes: {
		                    class : "NUM_RSLT_2"
	    	            }
	                },
		            {
		                field: "NM_SCALED_2",		
		                title: dews.localize.get("(2��)<br>���ڴ޼���"),
	                    width: 79,
			        	hidden : true,
	       		   		template	: dews.ui.grid.templates.dataSource('NM_SCALED_2', { 
		        			dataSourceID	: 'rsltSclDataSource', 
		        			dataValueField	: 'CD_SYSDEF', 
		        			dataTextField	: 'NM_SYSDEF' 
		        		}),
		        		editor		: function(container, options) {
			            	//�׸��� ROW ����
			            	var gridLength = grid.dataSource._pristineTotal;
		        			if(options.model.ROW_NO < gridLength) {
			        			dews.ui.grid.editors.dropdownlist(container, options, {
		    	        			dataValueField	: 'CD_SYSDEF', 
		    	                    dataTextField	: 'NM_SYSDEF', 
		    	                    dataSource		: rsltSclDataSource,
			        			}, function(data) {
			        				var lb_evgroup = data.LB_EVGROUP;
			        				if((lb_evgroup == "5" && data.YN_DEADLINE4 == "Y")
			        					|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
			        					|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
			        					|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")
			        					|| (cdEvtype == 300)) {
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
	                    title: dews.localize.get("(2��)<br>ȯ������"),
	                    width: 100,
			        	hidden : true,
	                    format: dews.ui.grid.formats.number("n02"),
		        		attributes: {
		        			class : "NUM_CVTRSLT_2"
		                }
	                }
		        ],
		        dataBound: function (e) {
		        	this.select(this.element.find("tbody tr:first"));
		        },
	            change: function(e) {
	            	var currentRow, rowData, lb_evgroup, gridLength,
	            	rowNum = 0;
	                
	            	gridLength = grid2.dataSource._pristineTotal;
	            	// ���� ���õ� ROW
	                currentRow = grid2.select(); 
	            	if(currentRow.length > 0) {
	            		
	            		//���ڱ���(1������, 2������)�� ���� �޼��� edit ��Ȱ��ȭ
		               	var cellIndex = this.cellIndex($('td#grid_list_active_cell', this.tbody)); // ���õ� ���� �ε���
		               	if(cellIndex != -1) {
		                    var columnName = this.columns[cellIndex].field; // ���õ� ���� �÷���
		                    if((cdEvtype == 100 && columnName == "NM_SCALED_1") 
		                    || (cdEvtype == 300 && columnName == "NM_SCALED_2")
		                    || (cdEvtype == 100 && columnName == "NUM_RSLT_1") 
		                    || (cdEvtype == 300 && columnName == "NUM_RSLT_2")){
		                    	grid.closeCell();
		                    }
		               	}
	                    
	                	// ���� ROW�� ������ ȹ��
	                    rowData = grid2.dataItem(currentRow); 
						rowNum = rowData.ROW_NO;
	            		lb_evgroup = rowData.LB_EVGROUP;
	                    
	                    if (rowData && rowNum < gridLength) {
	                    	//������ ���ڱ���(1������, 2������)�� ���� �������� SET
	                    	deadlineSet(lb_evgroup, rowData);
	                    	
	                    	//�޼���SET�� ���� �ڵ尪 ��������
	                    	cdScaleh = rowData.CD_SCALEH;
	                    	
	                    	//������ ���� �� comment �ѷ��ֱ�
	                    	lbCommentSet(lb_evgroup, rowData);
	                    	
	                    } else if(rowNum == gridLength) {
	                    	//ù����(�հ�) edit��Ȱ��ȭ
	                    	grid2.closeCell();
	                    }
	            	}
	                
	                if(rowNum < gridLength) {
		            	rsltSclList(cdScaleh);
	                }
	            },
	            save: function(e) {
	            	// �޼����� �����Ǿ����� Ȯ��
	            	if (e.values.hasOwnProperty('NM_SCALED_1')) { // 1���޼����� �����Ǿ����� üũ
	            		if(e.model.CD_RSLT_1 != e.values.NM_SCALED_1){
	            			if(e.model.NM_SCALED2 == ""){
			            		if(e.values.NM_SCALED_1 > e.model.NUM_ITEM) {
			        				dews.alert("�޼����� ������ �ʰ� �� �� �����ϴ�.");
				            		isSave = {result : false, currentNo : e.model.NO_EMP}
			            		}
			                	e.model.CD_RSLT_1 = cdScaleh; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
			            		e.model.NUM_RSLT_1 = e.values.NM_SCALED_1;
			                    e.model.NUM_CVTRSLT_1 = e.values.NM_SCALED_1; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
			            		isSave = {result : true, currentNo : e.model.NO_EMP}
	            			}
	            			else{	            				
			            		var result1 = rsltScmList(cdScaleh, e.values.NM_SCALED_1, e.model.NUM_ITEM);
			                	e.model.CD_RSLT_1 = e.values.NM_SCALED_1; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
			            		e.model.NUM_RSLT_1 = result1.num_ptscale.toFixed(2);
			                    e.model.NUM_CVTRSLT_1 = result1.num_cvtrslt.toFixed(2); // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
			            		isSave = {result : true, currentNo : e.model.NO_EMP}
	            			}
	            		}else {
		            		isSave = {result : false, currentNo : e.model.NO_EMP}
	            		}
	            	}else if (e.values.hasOwnProperty('NM_SCALED_2')) { // 2���޼����� �����Ǿ����� üũ
            			if(e.model.NM_SCALED1 == ""){
		            		if(e.values.NM_SCALED_2 > e.model.NUM_ITEM) {
		        				dews.alert("�޼����� ������ �ʰ� �� �� �����ϴ�.");
			            		isSave = {result : false, currentNo : e.model.NO_EMP}
		            		}
		                	e.model.CD_RSLT_2 = cdScaleh; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
		            		e.model.NUM_RSLT_2 = e.values.NM_SCALED_2;
		                    e.model.NUM_CVTRSLT_2 = e.values.NM_SCALED_2; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
		            		isSave = {result : true, currentNo : e.model.NO_EMP}
            			}
            			else{	            				
		            		var result2 = rsltScmList(cdScaleh, e.values.NM_SCALED_2, e.model.NUM_ITEM);
		                	e.model.CD_RSLT_2 = e.values.NM_SCALED_2; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
		            		e.model.NUM_RSLT_2 = result2.num_ptscale.toFixed(2);
		                    e.model.NUM_CVTRSLT_2 = result2.num_cvtrslt.toFixed(2); // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
            			}
	            	}
	            }
		 	});
		}
	
		//���SET
		function gradeList(){
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","rsltSclList"),{
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
		
		//�޼���SET
		function rsltSclList(cd_scaleh){
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","rsltSclList"),{
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
	
		//�޼����� ���� ȯ������ SET
		function rsltScmList(cd_scaleh, cd_scaled, num_item){
			var num_ptscale, num_cvtrslt;
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","rsltScmList"),{
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
	    			if(cdEvtype == "300") { //1������
		    			$("tr.k-state-selected td.NUM_CVTRSLT_1").text(num_cvtrslt.toFixed(2));
	    			}else if(cdEvtype == "100") { //2������
		    			$("tr.k-state-selected td.NUM_CVTRSLT_2").text(num_cvtrslt.toFixed(2));
	    			}
	    		}
	    	});	
			return {
				num_ptscale: num_ptscale,
				num_cvtrslt: num_cvtrslt
			};
			
		}
		//�޼����� ���� ȯ������ SET
		function rsltScmList2(cd_scaleh, cd_scaled, num_item){
			var num_ptscale, num_cvtrslt;
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_rslt2","rsltScmList"),{
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
	    			if(cdEvtype == "300") { //1������
		    			$("tr.k-state-selected td.NUM_CVTRSLT_1").text(num_cvtrslt.toFixed(2));
	    			}else if(cdEvtype == "100") { //2������
		    			$("tr.k-state-selected td.NUM_CVTRSLT_2").text(num_cvtrslt.toFixed(2));
	    			}
	    		}
	    	});	
			return {
				num_ptscale: num_ptscale,
				num_cvtrslt: num_cvtrslt
			};
			
		}
	
		//������ ���ڱ���(1������, 2������)�� ���� �������� SET
		function deadlineSet(lb_evgroup, rowData) {
			
			//������ üũ
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
		
		//������ ���� �� comment �ѷ��ֱ�
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
<tiles:putAttribute name="content">
	<!--   
		작성자 : NKH
		작성일 : 2018-04-18
		메뉴명 : 관리자 보직자중간평가
		수정자 : 
		수정일 :
		수정내용 : p_whr_z_nham_eva_evalmid_adm.jsp
	 -->
    <!-- 버튼영역 시작 -->
	<div class="dews-button-group dews-button-group-primary">
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_search">조회</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_save">저장</button>
	</div>
    <!-- 버튼영역 끝 -->
  
    <!-- 조회조건 영역 -->  
    <div class="dews-condition-panel">
    	<form class="dews-condition-form">
    		<ul>
    			<li>
           			<label class="required dews-ui-multilingual" for="NoEmp">사원</label>
           			<span>
						<input name="NoEmp" id="NoEmp" type="text" class="dews-ui-codepicker"
						       data-dews-help-code="COMM_HELP_EMP"
							   data-dews-help-title="사원 도움창"
							   data-dews-code-field="NO_EMP"
							   data-dews-text-field="NM_EMP"/>
					</span>
           		</li>
    			<li>
           			<label for='dt_date' class='required dew-ui-multilingual'>기준년월</label>
           			<span>
           				<select id="dt_date" class="dews-ui-dropdownlist" 
           				  data-dews-value-field="YM_EVLU" 
           				  data-dews-text-field="NM_EVLU" 
           				  ></select>
<!--            				  data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=300" -->
           			</span>
           			
           		</li>
				<li >
					<label class="dews-ui-multilingual" for="nm_unit">평가단위</label>
	                <span>
	                    <select id="nm_unit" class="dews-ui-dropdownlist"
	                    	data-dews-value-field="CD_SYSDEF" 
	                    	data-dews-text-field="NM_SYSDEF"
	                    	data-dews-data-url="~/Data/help_p_whr_z_nham_eva_unit/EvaUnit"></select>
	                </span>
				</li> 
				<li>
	                <label class="dews-ui-multilingual" for="nm_group">평가그룹</label>
	                <span>
	                	<select id='nm_group' class='dews-ui-dropdownlist'
	                		data-dews-value-field='CD_EVGROUP'
	                		data-dews-text-field='NM_EVGROUP'
	                		data-dews-data-url='~/Data/help_p_whr_z_nham_eva_group/EvaGroup'></select>
	                 
	                </span>
           		</li>
           		
			</ul>
    	</form>
    </div> 
    <!-- 조회조건 끝 -->
    
    <!-- 그리드 영역 시작 -->
   <div class="dews-grid-panel" style="width:100%;height:100%;">
   		<!-- 좌측 -->
		<div class="dews-grid-panel" id="Module_area" style="float:left;width:31.3%;height:100%;">
			<div>	
				<div class="dews-grid-title">
					<span>평가대상</span>
				</div>
			</div>
		    <div class="dews-grid-panel" id="grid_subject_div">
		        <div id="grid_subject" class="dews-ui-grid"></div>
		    </div>
	    </div>
	    <!-- 우측 -->
	    
		<div class="dews-grid-panel" style="float:right;width:68%;height:100%;margin-left:5px;">
			<div class="dews-button-group">	
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_file">첨부파일</button>
				<div class="dews-grid-title">
					<span>목표항목</span>
				</div>
			</div>	
			<div class="dews-grid-panel">
	            <div id="grid" class="dews-ui-grid"></div>
	        </div>
	        <div>	
				<div class="dews-grid-title">
					<span>피평가자 의견</span>
				</div>
			</div>
	        <div class="dews-grid-panel">
	        	<div id="grid_slf" class="dews_ui_grid"></div>
	        </div>
	        <div class="dews-button-group">	
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_add">추가</button>
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_del">삭제</button>
				<div class="dews-grid-title">
					<span>평가자 Feed back</span>
				</div>
			</div>
	        <div class="dews_gird_panel">
	        	<div id="grid_commt" class="dews_ui_grid"></div>
	        </div> 
		</div>	 
	</div>
	<!-- 그리드 영역 끝 -->
	
	<!-- hidden -->
	<input type="hidden" class="dews-ui-textbox" id="nm_dept"> 
	<input type="hidden" class="dews-ui-textbox" id="nm_user"> 
	<input type="hidden" class="dews-ui-textbox" id="no_team"> 
	<input type="hidden" class="dews-ui-textbox" id="no_subject"> 
	
	<input type="hidden" class="dews-ui-textbox" id="no_seq">
	<input type="hidden" class="dews-ui-textbox" id="no_itemseq">
	<script>
	var grid_subject, grid,grid_slf, grid_commt, Data;
	dews.ready(function(){
		var datasource, datasource2, datasource3, datasource4, codedata, admin,
			num = 0;
		    initPageData();
// 		    groupSelect();
	   
	    datasource4 = dews.ui.dataSource("dataSource4", {
        	batch: true,	//그리드 저장시
            schema: {
                model: {
                    fields: {
                    	NM_EVGROUP: 	{ editable: false, type: "string" },
                    	NM_KOR:    		{ editable: false, type: "string" },
                    	NM_DUTY_RANK:	{ editable: false, type: "string" },	
                    	NO_EMP:   	 	{ editable: false, type: "string" }
                    }
                }
            }
        });  
    
        grid_subject = dews.ui.grid("#grid_subject", {
	            dataSource: datasource,
	            editable: {	createAt: 'bottom' },
	            selectable: "row",
	            autoBind: false,
	            noData: true, 
	            height: 600,
		           columns: [
                    {
	                    field: "NM_EVGROUP",
	                    title: dews.localize.get("평가그룹"),
	                    width: 100,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NM_KOR",
	                    title: dews.localize.get("성명"),
	                    width: 70,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NM_DUTY_RANK",
	                    title: dews.localize.get("직위"),
	                    width: 60,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NO_EMP",
	                    title: dews.localize.get("사원번호"),
	                    width: 80,
	                    editor: dews.ui.grid.editors.readonly
	                }
	            ],
	            dataBound: function (e) {
	            	this.select(this.element.find("tbody tr:first"));
	            	var row = this.element.find("tbody tr:first");
	            	rowData = this.dataItem(row);
// 	            	alert(rowData.NO_EMP);
 	            	SelectData(rowData);
 	            	num = 0;
	            },
	            change: function (e){
	            	var no_emp = grid_subject.dataItem(grid_subject.select()).NO_EMP;
	            	fileCheck(no_emp);
	            }
       	 });
	 	
	    datasource = dews.ui.dataSource("dataSource", {
        	batch: true,	//그리드 저장시
            schema: {
                model: {
                    fields: {
                    	NM_TASK:   		{ editable: false, type: "string" },
                    	NM_ITEM:    	{ editable: false, type: "string" },
                    	DC_DEFINATION:	{ editable: false, type: "string" },	
                    	DC_PLAN:    	{ editable: false, type: "string" },	
                    	DC_FORMULA:  	{ editable: false, type: "string" },	
                    	DC_RMK: 		{ editable: false, type: "string" }
                    }
                }
            }
        });  
    
         
        grid = dews.ui.grid("#grid", {
	            dataSource: datasource,
	            editable: {	createAt: 'bottom' },
	            selectable: "row",
	            autoBind: false,
	            noData: true, 
	            height: 300,
		           columns: [
                    {
	                    field: "NM_TASK",
	                    title: dews.localize.get("과업명"),
	                    width: 70,
	                    align: "left",
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NM_ITEM",
	                    title: dews.localize.get("KIP명"),
	                    width: 70,
	                    align:"left",
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "DC_DEFINATION",
	                    title: dews.localize.get("업적목표(KIP정의)"),
	                    width: 90,
	                    editor: dews.ui.grid.editors.readonly,
	                    align: "left"
	                },
	                {
	                    field: "DC_PLAN",
	                    title: dews.localize.get("계획 및 달성수준"),
	                    width: 80,
	                    editor: dews.ui.grid.editors.readonly,
	                    align: "left"
	                },
	                {
	                    field: "DC_FORMULA",
	                    title: dews.localize.get("평가 및 등급부여기준(KIP 신식)"),
	                    width: 120,
	                    align:"left",
	                    eitor: dews.ui.grid.editors.readonly
	                    //template: dews.ui.grid.templates.mask('NO_RES', '000000-0000000')
	                },
	                {
	                    field: "DC_RMK",		
	                    title: dews.localize.get("비고"),
	                    width: 60,
	                    align:"left",
	                    editor: dews.ui.grid.editors.readonly
	                } 
	            ],
	            dataBound: function (e) {
	            	this.select(this.element.find("tbody tr:first"));
	            	MidtData();
	            }
       	 });
	            
	            
         //피평가자의견
         datasource1 = dews.ui.dataSource("dataSource1", {
         	batch: true,	//그리드 저장시
             schema: {
                 model: {
                     fields: {
                     	DT_CMMT:    { editable: false, type: "string" },
                     	NM_EMPCMMT:	{ editable: false, type: "string" },
                     	DC_CMMT:	{ editable: false, type: "string" }
                     }
                 }
             }
         });  
      
           
         grid_slf = dews.ui.grid("#grid_slf", {
 	            dataSource: datasource1,
 	            editable: {   createAt: 'bottom' },
 	            selectable: "row",
 	            autoBind: false,
 	            noData: true, 
 	            height: 112,
 		           columns: [	
                     {
 	                    field: "DT_CMMT",
 	                    title: dews.localize.get("작성일자"),
 	                    width: 70,
 	                    align: "left",
 	                    editor: dews.ui.grid.editors.readonly,
 	                    template: dews.ui.grid.templates.date("DT_CMMT", "D"),
 	                },
 	                {
 	                    field: "NM_EMPCMMT",
 	                    title: dews.localize.get("작성자"),
 	                    width: 40,
 	                    editor: dews.ui.grid.editors.readonly,
 	                },
 	                {
 	                    field: "DC_CMMT",
 	                    title: dews.localize.get("진척사항"),
 	                    width: 180,
 	                    editor: dews.ui.grid.editors.readonly,
 	                    align: "left"
 	                }
 	            ],
 	            dataBound: function (e) {
 	            	this.select(this.element.find("tbody tr:first"));
 	            }
    	 });
            
     	codedata = dews.ui.dataSource('codedata',{
        	 data:[
				{ code:"000" , text:" " },
        	  	{ code:"100" , text:"S" },
        	  	{ code:"200" , text:"A" },
        	  	{ code:"300" , text:"B" },
        	  	{ code:"400" , text:"C" },
        	  	{ code:"500" , text:"D" }
        	  ]
         });
            
	     //평가자 feed back
	     datasource2 = dews.ui.dataSource("dataSource2", {
	     	batch: true,	//그리드 저장시
	         schema: {
	             model: {
	                 fields: {
	                 	DT_CMMT:    { editable: false, type: "string" },
	                 	NM_EMPCMMT: { editable: false, type: "string" },
	                    TP_PROGRESS:{ editable: true , type: "string" },	
	                    DC_CMMT:    { editable: true , type: "string" } 
	                 }
	             }
	         }
	     });  
	  
	       
	     grid_commt = dews.ui.grid("#grid_commt", {
	          dataSource: datasource2,
	          editable: {  	createAt: 'bottom'  },
	          selectable: "row",
	          autoBind: false,
	          noData: true, 
	          height: 112,
	          columns: [	
					{
					    field: "DT_CMMT",
					    title: dews.localize.get("작성일자"),
					    width: 70,
					    align: "left",
					    editor: dews.ui.grid.editors.readonly,
					    template: dews.ui.grid.templates.date("DT_CMMT", "D"),
					},
					{
					    field: "NM_EMPCMMT",
					    title: dews.localize.get("작성자"),
					    width: 40,
					    align: "left",
					    editor: dews.ui.grid.editors.readonly
					},
					{
					    field: "TP_PROGRESS",
					    title: dews.localize.get("도달수준"),
					    width: 60,
					    align: "left",
					    editor: dews.ui.grid.editors.readonly,
					    template: dews.ui.grid.templates.dataSource('TP_PROGRESS',
	                            {
	                                dataSourceID: 'codedata',
	                                dataValueField: 'code',
	                                dataTextField: 'text'
	                            }),
		                    //드롭다운 리스트 변환
		                    editor: function(container, options){
	                    	dews.ui.grid.editors.dropdownlist(container, options,
	                    		{	dataValueField :'code',
	                    			dataTextField : 'text',
	                    			dataSource : codedata	
	                    		},
	                    		function (data){
	                    				return true;	
	                    		})
	                    }
					},
					{
					    field: "DC_CMMT",
					    title: dews.localize.get("면담내용"),
					    width: 80,
					    align: "left"
					}
	          ],
	          dataBound: function (e) {
	          	this.select(this.element.find("tbody tr:first"));
	          },
	          change : function (e) {
	        	var commt_row = grid_commt.select();
		 		var commt_rowData = grid_commt.dataItem(commt_row);
		 		var no_emp_c = dews.ui.codepicker('#NoEmp').code(); //관리자 추가
		 		
		 		if(commt_rowData.NO_EMPCMMT == no_emp_c){
		 			$("#btn_del").prop("disabled","");
		 		}else{
		 			$("#btn_del").prop("disabled","disabled");
		 		}		 
	          }
	     });

	  
     //저장  
     $('#btn_save').on('click', function (e){
// 	   	alert(JSON.stringify(datasource2.getDirtyDataCount()));
// 	   	alert(dews.ui.textbox('#no_subject').text());

		if (datasource2.getDirtyDataCount() > 0) {
			Save();
        }
		else{
    	   dews.alert(dews.localize.get("저장할 내용이 없습니다."));
        }
       });
	      
		//조회
		$("#btn_search").on("click", function() {
			if(!dews.ui.dropdownlist('#dt_date').value()){		
				dews.ui.requiredTooltip.show('#dt_date');
			}else{
				EmpData();
// 		   		SelectData();
		   	}
		});
		
		//업로드
		$("#btn_file").on("click", function(){
			 var row = grid.select();
			    var rowData = grid.dataItem(row);	
			    var flag = {flag: false};
			    
		    	$.extend(rowData,flag);
		    	
			    if(rowData){
		    		var initData = {
		    				pIdMenu: "p_whr_z_nham_goal_reg",   //구분자 줘서 그냥 쓰면 될듯합니다.
		    				pFilePath: "",
							pCdFile: rowData.YM_EVLU + "_" + rowData.CD_EVUNIT + "_" + rowData.CD_EVGROUP + "_" + rowData.NO_EMP + "_0", 	
							params: {
								data: rowData
							}
							//nm_user : dews.ui.codepicker('#NoEmp').text() //관리자 추가  보류 2018/4/17
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
		
		//목표대상 클릭시 조회
		$('#grid_subject').on("click",function(e){
			var grid = dews.ui.grid("#grid_subject");
			var row = grid.select();
			var rowData = grid.dataItem(row);
			
			SelectData(rowData);			
		});
		
		//feed 클릭
		$('#grid_commt').on("change",function(e){
			num = dews.ui.grid("#grid").dataItem(dews.ui.grid("#grid").select()).ROW_NO;
		});
		
		
		//목표항목 클릭시 조회
		$('#grid').on("click",function(e){
			var grid = dews.ui.grid("#grid");
			var row = grid.select();
			var rowData = grid.dataItem(row);
			var num2 = rowData.ROW_NO;
// 			alert(num + "진입?"+ num2);

			if(num > 0){
				if(num != num2 && grid_commt != Data){
	 				Save();
				}//if end
			}else{
				//MidtData(rowData);	
				MidtData();
			}
		});
		
		//추가
		$("#btn_add").on("click", function(){
			num = dews.ui.grid("#grid").dataItem(dews.ui.grid("#grid").select()).ROW_NO;
			
			if(dews.ui.textbox("#no_itemseq").text() != ''){
				var grid = dews.ui.grid('#grid_commt');
//	 		    grid.addRow();
				var today = util.date.toString(new Date());
			    var user = dews.ui.textbox("#nm_user").text();
			    
				data1 = {
						DT_CMMT		: today, 
						NM_EMPCMMT	: dews.ui.codepicker('#NoEmp').text(),	
						TP_STATUS	: '100',
						TP_PROGRESS : '000'
				};
				grid.dataSource.add(data1);
			}
		});
		
		//삭제
		$("#btn_del").on("click", function(){
			num = dews.ui.grid("#grid").dataItem(dews.ui.grid("#grid").select()).ROW_NO;
			
			var grid = dews.ui.grid("#grid_commt");
			var row = grid.select();
			grid.removeRow(row);
		});
		
		//사원검색(최상위)한 뒤 기준년월, 평가단위, 평가그룹조회되어야 함
	     $("#NoEmp").on("setData",  function(e, data){
	    	admin = data.NO_EMP;
	    	ymSelect(admin);
	    	groupSelect(admin);	 //조회된 사원 사번을 가져가서 조회해야함
	     });
		
		//평가그룹 조회
		$("#dt_date").on("change", function(e){
			 dews.ui.dropdownlist("#dt_date").value(e.target.value);
			 ym_evlu = e.target.value;
			 groupSelect(admin);
		});
		 
		//평가단위 조회
		$("#nm_unit").on("change", function(e){
			 dews.ui.dropdownlist("#nm_unit").value(e.target.value);
			 groupSelect(admin);
		});
		
		  
	  //기준년월 조회
	   function ymSelect(admin){
		   dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_yyyymm","AdminYm"),{
					async	: false,
					data	: {
						CD_EVTYPE	: "300",
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
			   var ym_code = dews.ui.dropdownlist('#dt_date');
			   ym_code.setDataSource(arrlist);
			   ym_code.select(0); 
		   });
		}
		//평가그룹 조회
		function groupSelect(admin) {
			dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_group","AdminGroup"),{
		      		async : false,
		  			data  : {
		  				ym_evlu   : dews.ui.dropdownlist("#dt_date").value(),
		  				cd_evtype : '300',
		  				cd_evunit : dews.ui.dropdownlist("#nm_unit").value(),
		  				NoEmp     : admin
		              }
		      	}).done(function(result){
		      		var arr = new Array();
				//arr.push({CD_EVGROUP:"", NM_EVGROUP : ""});
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
		 
		//pageinit 시 디폴트데이더 셋팅 commonDataProvider.class-jar
		function initPageData(){
			dews.ajax.data(dews.url.getDataUrl("CommonData","getCurrentUser"), { async: false }).done(function (currentUser) {	
				var no_emp = currentUser.NO_EMP;
				var nm_user = currentUser.NM_USER;
				var nm_dept = currentUser.NM_DEPT;
				
				$("#no_emp").val(no_emp);
				$("#nm_user").val(nm_user);
				$("#nm_dept").val(nm_dept);
				});
		
			}
		
		//목표대상
		function EmpData(){
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_evalmid_adm","AdminEmpList"),{
				async: false,
				data: {
					ym_evlu		: dews.ui.dropdownlist("#dt_date").value(),
					cd_evunit	: dews.ui.dropdownlist("#nm_unit").value(),
					cd_evgroup	: dews.ui.dropdownlist("#nm_group").value()
				}
			}).done(function(result){
		    	if(result==0){
		    		dews.alert(dews.localize.get("등록된 자료가 없거나 개인목표등록이 승인되지 않았습니다."));
		    	}
				dews.ui.grid("#grid_subject").dataSource.data(result);
			})
		}
		
		//목표항목
		function SelectData(rowData){
// 			alert(((rowData != null) ? rowData.NO_EMP : ''));
			var no_emp_btn = dews.ui.codepicker('#NoEmp').code();
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_evalmid_adm", "AdminList"), {
			      async: false,
			      data:{
			      	no_subjectE	:  ((rowData != null) ? rowData.NO_EMP : ''),
			      	ym_evlu	  	: dews.ui.dropdownlist('#dt_date').value(),    
			      	cd_evunit 	: dews.ui.dropdownlist('#nm_unit').value(),
			      	cd_evgroup 	: dews.ui.dropdownlist('#nm_group').value()
			      }
			}).done(function (result) {
				if(result[0].NO_TEAM != no_emp_btn){
			 		$('#btn_save').prop('disabled','disabled');
			 		$('#btn_add').prop('disabled','disabled');
			 		$('#btn_del').prop('disabled','disabled');
				}
				dews.ui.grid("#grid").dataSource.data(result);   	
			});
		}
		
		//첨부파일 데이터 
		function fileCheck(no_emp){
			var ym_evlu = dews.ui.dropdownlist("#dt_date").value();
			var cd_evunit = dews.ui.dropdownlist("#nm_unit").value();
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
		
		//피평가자&평가자 데이터조회
		function MidtData(){
			//alert("selectdata"+rowData.NO_EMP+";;;;"+rowData.COPY_NO_EMP);
			var row = dews.ui.grid("#grid").select();
			var rowData = dews.ui.grid("#grid").dataItem(row);
			
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_evalmid_adm","AdminMidtList"),{
				async: false,
				data: {
					no_subjectE : ((rowData != null) ? rowData.NO_EMP : ''),
					ym_evlu		: ((rowData != null) ? rowData.YM_EVLU : ''), 
					cd_evunit	: ((rowData != null) ? rowData.CD_EVUNIT : ''), 
					cd_evgroup	: ((rowData != null) ? rowData.CD_EVGROUP : ''), 
					no_itemseq	: ((rowData != null) ? rowData.NO_ITEMSEQ : ''), 
					no_seq		: ((rowData != null) ? rowData.NO_SEQ : ''), 
				}
			}).done(function (result) {
				dews.ui.textbox("#no_team").text(((rowData != null) ? rowData.NO_TEAM : ''));
				dews.ui.textbox("#no_itemseq").text(((rowData != null) ? rowData.NO_ITEMSEQ : ''));
				dews.ui.textbox("#no_subject").text(((rowData != null) ? rowData.NO_EMP : ''));
				
				var grid_slfL = new Array();
				var grid_cmmtL = new Array();
				
				$(result).each(function (){
					if(this.CD_INPUT == 200){
						grid_slfL.push(this);
					}
					if(this.CD_INPUT == 100){
						grid_cmmtL.push(this);
					}
				});
				dews.ui.grid("#grid_slf").dataSource.data(grid_slfL);
				dews.ui.grid("#grid_commt").dataSource.data(grid_cmmtL);
			})
		}
		
		function Save(){
			dews.confirm(dews.localize.get("저장하시겠습니까?")).yes(function(){
				num = 0;
				datasource2.batchSave(dews.url.getDataUrl("p_whr_z_nham_eva_evalmid_adm", "AdminDataSave"), {
					async: false,
					data: {
						no_subjectE: dews.ui.textbox('#no_subject').text(),
						ym_evlu	   : dews.ui.dropdownlist('#dt_date').value(),    
			        	cd_evunit  : dews.ui.dropdownlist('#nm_unit').value(),
			        	cd_evgroup : dews.ui.dropdownlist('#nm_group').value(),
			        	no_itemseq : dews.ui.textbox("#no_itemseq").text(),
						no_seq	   : "0",
						NoEmp      : dews.ui.codepicker('#NoEmp').code()
					},							
					callback: function (result) {						
						if (result && result.hasOwnProperty("error")) {
							dews.error(dews.localize.get("저장이 실패하였습니다."));
                        }else{
                        	dews.alert(dews.localize.get("정상적으로 저장되었습니다.")).done(function(){
                        		EmpData();
                        	}); 
                        }//else end
                	},
                    error: function(message, data) {
						dews.error({
							"message": data.message,
							"error": data.error,
						});
                    }
				})	                   	
			})
		}
		  
		function onChange(arg) {
            var selected = $.map(this.select(), function(item) {
                return $(item).text();
            });
            
            SelectData(selected);
        }
		
		
// 		$('.k-grid-content').prop('style','height:600px;');
		});

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


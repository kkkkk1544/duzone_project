<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
<tiles:putAttribute name="content">
	<!--   
		작성자 : NKH
		작성일 : 2018-04-18
		메뉴명 : 관리자 본인중간평가
		수정자 : 
		수정일 :
		수정내용 : p_whr_z_nham_eva_slfmid_adm.jsp
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
           				  >
           				  </select>
<!--            				  data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=200" -->
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
     
    <!-- 버튼영역 시작 -->
	<div class="dews-button-group">
	    <div class="dews-grid-title">
			목표항목
		</div>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_file">첨부파일</button>
	</div>
    <!-- 버튼영역 끝 -->
    
    <!-- 그리드 영역 시작 -->
	<div class="dews-grid-panel">
		<div id="grid" class="dews-ui-grid"></div>
	</div>
	<!-- 그리드 영역 끝 -->
	
	<!-- 버튼영역 시작 -->
		<div class="dews-button-group">
			<div class="dews-grid-title">
			피평가자 의견
		</div>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_add">추가</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_del">삭제</button>
	</div>
    <!-- 버튼영역 끝 -->
	
    <!-- 그리드 영역 시작 -->
	<div class="dews-grid-panel">
		<div id="grid_slf" class="dews-ui-grid"></div>
	</div>
	<!-- 그리드 영역 끝 -->
	
    <div class="dews-grid-title">
		평가자 Feed back
	</div>
	
	<!-- 그리드 영역 시작 -->
	<div class="dews-grid-panel">
		<div id="grid_commt" class="dews-ui-grid"></div>
	</div>
	<!-- 그리드 영역 끝 -->
	
	<!-- hidden -->
	
	<input type="hidden" id ='no_emp'/>
	<input type="hidden" class="dews-ui-textbox" id="nm_dept"> 
	<input type="hidden" class="dews-ui-textbox" id="nm_user"> 
	<input type="hidden" class="dews-ui-textbox" id="no_team"> 
	
	<input type="hidden" class="dews-ui-textbox" id="no_seq">
	<input type="hidden" class="dews-ui-textbox" id="no_itemseq">
	<script>
	var grid,grid_slf, grid_commt, Data;
	
	dews.ready(function(){
		var datasource, datasource2, datasource3, codedata, admin,
			num = 0;
		
		    initPageData();
// 			groupSelect(); //관리자추가 변경

	    datasource = dews.ui.dataSource("dataSource", {
        	batch: true,	//그리드 저장시
            schema: {
                model: {
                    id: "NM_TASK",
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
	                    title: dews.localize.get("KPI명"),
	                    width: 70,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "DC_DEFINATION",
	                    title: dews.localize.get("업적목표(KPI정의)"),
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
	                    title: dews.localize.get("평가 및 등급부여기준(KPI 신식)"),
	                    width: 120,
	                    align:"left",
	                    eitor: dews.ui.grid.editors.readonly
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
	            	//alert(rowData);
	            	MidtData();  //JSON.tbody tr:first dataget
	            },
	            change: function(e){
	            	
	            }
       	 });
      	//databounding 가져오는중
        //databound 가져오고 나서      
        //change	변경이되면 바로
        //save
	            
         //피평가자의견    
         datasource1 = dews.ui.dataSource("dataSource1", {
         	batch: true,	//그리드 저장시
             schema: {
                 model: {
                     fields: {
                     	DT_CMMT:    { editable: true, type: "string" },
                     	NM_EMPCMMT: { editable: true, type: "string" },
                     	DC_CMMT:	{ editable: true, type: "string" }
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
 	            height: 100,
 		           columns: [
                     {
 	                    field: "DT_CMMT",
 	                    title: dews.localize.get("작성일자"),
 	                    width: 70,
 	                    align: "left",
  	                    editor: dews.ui.grid.editors.readonly,
  	                    template: dews.ui.grid.templates.date("DT_CMMT", "D")
 	                },
 	                {
 	                    field: "NM_EMPCMMT",
 	                    title: dews.localize.get("작성자"),
 	                    width: 40,
  	                    editor: dews.ui.grid.editors.readonly
 	                },
 	                {
 	                    field: "DC_CMMT",
 	                    title: dews.localize.get("진척사항"),
 	                    width: 180,
 	                    align: "left"
 	                }
 	            ],
 	            dataBinding: function(e){
 	            },
 	            dataBound: function (e) {
 	            	this.select(this.element.find("tbody tr:first"));
 	            },
 	            change: function (e) {
 	            },
 	            save: function (e) {
 	            }
    	 });
         
         codedata = dews.ui.dataSource('codedata',{
        	 data:[
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
		                    DC_CMMT:    { editable: false, type: "string" }  //별칭**
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
	          height: 100,
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
					    editor: dews.ui.grid.editors.readonly
					},
					{
					    field: "DC_CMMT",
					    title: dews.localize.get("면담내용"),
					    width: 170,
					    align: "left",
					    editor: dews.ui.grid.editors.readonly
					}
	              
	          ],
	          dataBound: function (e) {
	          	this.select(this.element.find("tbody tr:first"));
	          }
	     });
     	
     	//저장  
	     $('#btn_save').on('click', function (e){
			if (datasource1.getDirtyDataCount() > 0) {
 				Save();
	        } else{
	    	   dews.alert(dews.localize.get("저장할 내용이 없습니다."));
	        }
	     });

		//조회
		$("#btn_search").on("click", function() {
			if(!dews.ui.dropdownlist('#dt_date').value()){		
				dews.ui.requiredTooltip.show('#dt_date');
			}else{
		   		SelectData();
		   		num = 0;
		   	}
		});
		
		//업로드
		$("#btn_file").on("click", function(){	    
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
		
		//추가
		$("#btn_add").on("click", function(){
			num = dews.ui.grid("#grid").dataItem(dews.ui.grid("#grid").select()).ROW_NO;
			
			if(dews.ui.textbox("#no_itemseq").text() != ''){
				var grid = dews.ui.grid('#grid_slf');
				var today = util.date.toString(new Date());
			    var user = dews.ui.codepicker('#NoEmp').text();
// 			    var user = dews.ui.textbox("#nm_user").text();
			    
				data1 = {
						DT_CMMT : today, 
						NM_EMPCMMT : user	
				};
				grid.dataSource.add(data1);
			}
		});
		
		//삭제
		$("#btn_del").on("click", function(){
			num = dews.ui.grid("#grid").dataItem(dews.ui.grid("#grid").select()).ROW_NO;
			
			var grid = dews.ui.grid("#grid_slf");
			var row = grid.select();
			grid.removeRow(row);
		});
		
		//피평가자 클릭
		$('#grid_slf').on("change",function(e){
			num = dews.ui.grid("#grid").dataItem(dews.ui.grid("#grid").select()).ROW_NO;
		});
		
		//피평가자 클릭시 조회
		$('#grid').on("click",function(e){
			var grid = dews.ui.grid("#grid");
			var row = grid.select();
			var rowData = grid.dataItem(row);
			var num2 = rowData.ROW_NO;
			 
			if(num > 0){
				if(num != num2 && grid_slf != Data){
	 				Save();
				}//if end
			}else{
				MidtData();
			}
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
						CD_EVTYPE	: "200",
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
		function groupSelect( admin ) {
			dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_group","AdminGroup"),{
	       		async : false,
	   			data  : {
	   				ym_evlu   : dews.ui.dropdownlist("#dt_date").value(),
	   				cd_evtype : '200',
	   				cd_evunit : dews.ui.dropdownlist("#nm_unit").value(),
	   				NoEmp     : admin		//관리자 추가
	               }
	       	}).done(function(result){
	       		var arr = new Array();
//	     		arr.push({CD_EVGROUP:"", NM_EVGROUP : ""});
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
		
		//메인그리드조회
		function SelectData(){
			var NoEmp = dews.ui.codepicker('#NoEmp').code();
 		    dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_slfmid_adm", "AdminList"), {
		        async: false,
		        data:{
		        	ym_evlu	   : dews.ui.dropdownlist('#dt_date').value(),    
		        	cd_evunit  : dews.ui.dropdownlist('#nm_unit').value(),
		        	cd_evgroup : dews.ui.dropdownlist('#nm_group').value(),
		        	NoEmp      : dews.ui.codepicker('#NoEmp').code()
		        }
		    }).done(function (result) {
		    	if(result==0){
		    		dews.alert(dews.localize.get("등록된 자료가 없거나 개인목표등록이 승인되지 않았습니다."));
		    	}
		    	dews.ui.grid("#grid").dataSource.data(result);  
		    	fileCheck(NoEmp);
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
		
		function MidtData(){
// 			alert("넘김 :: "+rowData.NO_SEQ+";;"+rowData.NO_ITEMSEQ);
			var row = dews.ui.grid("#grid").select();
			var rowData = dews.ui.grid("#grid").dataItem(row);
			
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_slfmid_adm", "AdminMidtList"), {
		        async: false,
		        data:{
		        	ym_evlu		: ((rowData != null) ? rowData.YM_EVLU : ''), 
					cd_evunit	: ((rowData != null) ? rowData.CD_EVUNIT : ''), 
					cd_evgroup	: ((rowData != null) ? rowData.CD_EVGROUP : ''), 
					no_itemseq	: ((rowData != null) ? rowData.NO_ITEMSEQ : ''), 
					no_seq		: ((rowData != null) ? rowData.NO_SEQ : ''),
					NoEmp       : dews.ui.codepicker('#NoEmp').code()					
		        }
		    }).done(function (result) {
		    	//alert(JSON.stringify(result));
		    	dews.ui.textbox("#no_team").text(((rowData != null) ? rowData.NO_TEAM : '')); //평가자의 조회된 데이터의 정보만 가져가도록 넣어둠  평가자사번
		    	dews.ui.textbox("#no_itemseq").text(((rowData != null) ? rowData.NO_ITEMSEQ : '')); //평가자의 조회된 데이터의 정보만 가져가도록 넣어둠  평가항목순번
		    	
		    	var grid_slfL = new Array();
		    	var grid_cmmtL = new Array();
		    	
		    	$(result).each(function(){		
	    			if(this.CD_INPUT == 200){
	    				grid_slfL.push(this);
	    			}
	    			if(this.CD_INPUT == 100){
	    				grid_cmmtL.push(this);
	    			}	
	    		});
		 		dews.ui.grid("#grid_slf").dataSource.data(grid_slfL);
				dews.ui.grid('#grid_commt').dataSource.data(grid_cmmtL);
	   	 	}); 
		}
		
		function Save(){
			dews.confirm(dews.localize.get("저장하시겠습니까?")).yes(function(){
				num = 0;
				datasource1.batchSave(dews.url.getDataUrl("p_whr_z_nham_eva_slfmid_adm", "AdminDataSave"), {
					async: false,
					data: {
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
                        		SelectData();
//									MidtData(a);
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
		
		});

	</script>	
	<script src="scripts/util.js"></script>
		<script id="customize">
			dews.ready(function(){
		    	//grid = util.customize.initCustomizeGrid(grid); 
		    	//util.customize.initCustomizeLabel();
		    });
		</script>
</tiles:putAttribute>
</tiles:insertDefinition>


<%@page import="java.util.Enumeration"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
<tiles:putAttribute name="content">
	<!--   
		작성자 : 
		작성일 : 
		메뉴명 : 개인목표등록
		수정자 : 
		수정일 :
		수정내용 : 
	 -->
	 
    <!-- 버튼영역 시작 -->
	<input type="hidden" id ='no_emp'/>
	<input type="hidden" id ='nm_user'/>
	<input type="hidden" id ='nm_dept'/>
	<input type="hidden" id ='CD_STATE'/>
	<div class="dews-button-group dews-button-group-primary">
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_search">조회</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_save">저장</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_app">승인신청</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_cancel">신청취소</button>
	</div>
    <!-- 버튼영역 끝 -->
  
    <!-- 조회조건 영역 -->  
    <div class="dews-condition-panel">
    	<form class="dews-condition-form">
    		<ul>
    			<li>
           			<label for='ym_evlu' class='required dews-ui-multilingual'>기준년월</label>
					<span>
						<select id="ym_evlu" class="dews-ui-dropdownlist" 
								data-dews-value-field="YM_EVLU" 
								data-dews-text-field="NM_EVLU" 
								data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=200">
           				</select>
					</span>				
           			
           		</li>
				<li >
					<label class="dews-ui-multilingual" for="nm_unit">평가단위</label>
	                <span>
	                    <select  id="nm_unit" class="dews-ui-dropdownlist"
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
    
    <!-- 피평가자 및 평가자 정보 시작 -->
   	<div class="dews-condition-panel div-4">
   		<form class="dews-condition-form" id='form_ii'>
    		<ul>
    			<li>
         			<label style="nowrap:true;" class='required dew-ui-multilingual'>작성자(피평가자)</label>
           			<span>
           				<input class="dews-ui-textbox readonly" style="width: 100%;" type="text" id="NM_KOR"/>
          			</span>
           		</li>
				<li>
           			<label class='required dew-ui-multilingual'>작성일자</label>
           			<span>
           				<input class="dews-ui-textbox dews-ui-maskedtextbox readonly" data-dews-mask="####/##/##" style="width: 100%;"  type="text" id="DT_WRITE"/>
          			</span>
           		</li>
				<li>
           			<label class='required dew-ui-multilingual'>제출기한</label>
           			<span>
           				<input class="dews-ui-textbox dews-ui-maskedtextbox readonly" data-dews-mask="####/##/##" style="width: 100%;"  type="text" id="DT_LIMIT"/>
          			</span>
           		</li>
           		<li>
           			<label class='required dew-ui-multilingual'>진행상태</label>
           			<span>
           				<input class="dews-ui-textbox readonly" style="width: 100%;"  type="text" id="NM_STATE"/>
          			</span>
           		</li>
           		<li>
           			<label class='required dew-ui-multilingual'>합의자(평가자)</label>
           			<span>
           				<input class="dews-ui-textbox readonly" style="width: 100%;"  type="text" id="NM_TEAM"/>
          			</span>
           		</li>
				<li>
           			<label class='required dew-ui-multilingual'>합의일자</label>
           			<span>
           				<input class="dews-ui-textbox dews-ui-maskedtextbox readonly"  data-dews-mask="####/##/##" style="width: 100%;"  type="text" id="DT_CONSENT"/>
          			</span>
           		</li>
				<li>
           			<label class='required dew-ui-multilingual'>최종수정승인일</label>
           			<span>
           				<input class="dews-ui-textbox dews-ui-maskedtextbox readonly"  data-dews-mask="####/##/##" style="width: 100%;"  type="text" id="DT_CHANGED"/>
          			</span>
           		</li>
			</ul>
		</form>
   	</div>
    <!-- 피평가자 및 평가자 정보 끝 -->
    <!-- 버튼영역 시작 -->
	<div class="dews-button-group">
		<div class="dews-grid-title">
			<span>목표항목</span>
		</div>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_file">첨부파일</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_add">추가</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_del">삭제</button>
	</div>
    <!-- 버튼영역 끝 -->
	<!-- 그리드 영역 시작 -->
	<div class="dews-grid-panel">
		<div id="grid_list" class="dews-ui-grid"></div>
	</div>
	<!-- 그리드 영역 끝 -->
	 <!-- 버튼영역 시작 -->
	<div class="dews-button-group">
		<div class="dews-grid-title">
			<span>COMMENT 내역</span>
		</div>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_comment_add">추가</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_comment_del">삭제</button>
	</div>
    <!-- 버튼영역 끝 -->
	<!-- 그리드 영역 시작 -->
	<div class="dews-grid-panel">
		<div id="grid_commt" class="dews-ui-grid"></div>
	</div>
	<!-- 그리드 영역 끝 -->
	<script type="text/javascript" charset="UTF-8">
	
	var grid, grid_commt;

	dews.ready(function(){
		var datasource,datasource2, datasource3;
	    //var useApproval = false;
	    
	    //groupSelect();
	    initPageData();
	    
	    datasource = dews.ui.dataSource("dataSource", {
        	batch: true,	//그리드 저장시
            schema: {
                model: {
                    id: "NO_ITEMSEQ",
                    fields: {
                    	NO_ITEMSEQ:{ editable: false},
                    	NM_TASK:{ editable: false, type: "string" },
    	                NM_ITEM:{ editable: false, type: "string" },
    	                NUM_ITEMTYPE:{ editable: false, type: "string" },
    	                NUM_ITEM:{ editable: true, type: "number" },
    	                DC_DEFINATION:{ editable: true, type: "string" },
    	                DC_PLAN:{ editable: true, type: "string" },
    	                DC_FORMULA:{ editable: true, type: "string" },
    	                DC_RMK:{ editable: true, type: "string" }
    	                
                    }
                }
            }
        });
        grid = dews.ui.grid("#grid_list", {
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
	                    align: "left"
	                },
	                {
	                    field: "NM_ITEM",
	                    title: dews.localize.get("KPI명"),
	                    width: 70
	                },
	                {
	                    field: "NUM_ITEMTYPE",
	                    title: dews.localize.get("총점"),
	                    width: 40
	                },
	                
	                {
	                    field: "NUM_ITEM",
	                    title: dews.localize.get("배점"),
	                    width: 40,
	           /*      },
	                {
	                    field: "NUM_ITEM",
	                    title: dews.localize.get("가중치"),
	                    width: 50,
// 	                    template: dews.ui.grid.templates.mask("NUM_ITEM","0.00"),
// 						format: dews.ui.grid.formats.number('#.##'),
						//aggregates: ["min", "max", "sum"],
						//format: "{0:#,1:#}", */
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                                    // 조건에 따른 텍스트박스 출력
	                                    if (data.CD_STATE === "000") { // && data.CD_LEVEL != "100"  && data.CD_LEVEL != "200"
	                                        return true;
	                                    } else {
	                                        return false;
	                                    }
	                                }
	                        );
	                    }
	                },
	                {
	                    field: "DC_DEFINATION",
	                    title: dews.localize.get("업적목표(KPI정의)"),
	                    width: 90,
	                    align: "left",
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                                    // 조건에 따른 텍스트박스 출력
	                                    if (data.CD_STATE === "000") {  // && data.CD_LEVEL != "100" && data.CD_LEVEL != "200" 
	                                        return true;
	                                    } else {
	                                        return false;
	                                    }
	                                }
	                        );
	                    }
	                },
	                {
	                    field: "DC_PLAN",
	                    title: dews.localize.get("계획 및 달성수준"),
	                    width: 80,
	                    align: "left",
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                        	
	                                    // 조건에 따른 텍스트박스 출력
	                                    if (data.CD_STATE === "000") {  // && data.CD_LEVEL != "100" && data.CD_LEVEL != "200" 
	                                        return true;
	                                    } else {
	                                        return false;
	                                    }
	                                }
	                        );
	                    }
	                },
	                {
	                    field: "DC_FORMULA",
	                    title: dews.localize.get("평가 및 등급부여기준(KPI 산식)"),
	                    width: 120,
	                    align:"left",
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                        	
	                                    // 조건에 따른 텍스트박스 출력
	                                    if (data.CD_STATE === "000" ) {  //&& data.CD_LEVEL != "100" && data.CD_LEVEL != "200" 
	                                        return true;
	                                    } else {
	                                        return false;
	                                    }
	                                }
	                        );
	                    }
	                },
	                {
	                    field: "DC_RMK",		
	                    title: dews.localize.get("비고"),
	                    width: 60,
	                    attributes: {style:"text-align:left;"},
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                        	
	                                    // 조건에 따른 텍스트박스 출력
	                                    if (data.CD_STATE === "000") {  // && data.CD_LEVEL != "100" && data.CD_LEVEL != "200" 
	                                        return true;
	                                    } else {
	                                        return false;
	                                    }
	                                }
	                        );
	                    }
	                }
	                ,
	                {
	                    field: "NO_ITEMSEQ",		
						hidden: true,	
	                    width: 60
	                }
	                ,
	                {
	                    field: "CD_SCALEH",		
						hidden: true,	
	                    width: 60
	                }
	            ],
				dataBound: function (e) {
					this.select(this.element.find("tbody tr:first"));
				},
				save: function(e) {
				},
				change: function(e){
					var rowC = grid.select();
					var rowDataC = grid.dataItem(rowC);
					
					if("300" == rowDataC.CD_STATE || "100" == rowDataC.CD_LEVEL || "200" == rowDataC.CD_LEVEL){
						$("#btn_del").prop("disabled","disabled");
					}else{
						$("#btn_del").prop("disabled","");
					}
				},
			    filterMenuInit: function(e) {
			    	var numeric = e.container.find("[data-role=numerictextbox]").data("NUM_ITEM");
			    	
			        if (numeric) {
			        	numeric.min(0);
			          	numeric.max(9);
			        }
			    }
       	 });
        
	     //COMMENT 내역
	     datasource2 = dews.ui.dataSource("dataSource2", {
	     	batch: true,	//그리드 저장시
	         schema: {
	             model: {
	                 fields: {
	                 	DT_COMMT:   { editable: false, type: "string" },
	                 	NM_EMPCMMT:    	{ editable: false, type: "string" },
	                 	DC_COMMT:	{ editable: true, type: "string" }//별칭**
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
					    field: "NM_EMPCMMT",
					    title: dews.localize.get("작성자"),
					    width: 40,
					    editor: dews.ui.grid.editors.readonly
					},
	                {
	                  field: "DT_CMMT",
	                  title: dews.localize.get("작성일자"),
	                  width: 70,
	                  align: "left",
	                  editor: dews.ui.grid.editors.readonly,
	                  template: dews.ui.grid.templates.date("DT_CMMT", "D")	                  
	              	},
					{
					    field: "DC_CMMT",
					    title: dews.localize.get("COMMENT"),
					    width: 80,
					    align: "left"
					}
	          ],
	          dataBound: function (e) {
	          	this.select(this.element.find("tbody tr:first"));
	          },
	          change: function(e){
	  	 		var select_commt_row = grid_commt.select();
		 		var select_commt_rowData = grid_commt.dataItem(select_commt_row);
		 		if(select_commt_rowData.NO_EMPCMMT == $("#no_emp").val() && "000" == $("#CD_STATE").val()){
		 			$("#btn_comment_del").prop("disabled","");
		 		}else{
		 			$("#btn_comment_del").prop("disabled","disabled");
		 		}		 		 		
	          }
	     });
	     
	     $("#ym_evlu").on("change", function(e){
			 dews.ui.dropdownlist("#ym_evlu").value(e.target.value);
			 ym_evlu = e.target.value;
			 groupSelect();
		 });
	     
	     $("#nm_unit").on("change", function(e){
			 groupSelect();
		 });
	     
	   //평가그룹 조회
	 	function groupSelect() {
	 		dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_group","EvaGroup"),{
	        		async : false,
	    			data  : {
	    				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(),
	    				cd_evtype	:	200,
	    				cd_evunit	: dews.ui.dropdownlist("#nm_unit").value()
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
	   
	 	function SelectCmmt(){
	 		var ym_evlu = dews.ui.dropdownlist("#ym_evlu").value();
	         var cd_evunit = dews.ui.dropdownlist('#nm_unit').value();	
	         var	cd_evgroup = dews.ui.dropdownlist('#nm_group').value();
	 		    dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_reg", "list_cmmt"), {
	 		        async: false,
	 		        data:{
	 		        	ym_evlu	  : ym_evlu,
	 		        	cd_evunit : cd_evunit,
	 		        	cd_evgroup : cd_evgroup
	 		        }
	 		    }).done(function (result) {
	 		    	//분을 시간형태로 변환 ex> 90분 ---> 01:30
	 		    	dews.ui.grid("#grid_commt").dataSource.data(result);
	 	   	 	});
	 	}

	 	function SelectData(){
	 		grid.dataSource.data([]);
	 		grid_commt.dataSource.data([]);
	 		var ym_evlu = dews.ui.dropdownlist("#ym_evlu").value();
	        var cd_evunit = dews.ui.dropdownlist('#nm_unit').value();	
	        var	cd_evgroup = dews.ui.dropdownlist('#nm_group').value();
	        
 		    dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_reg", "list"), {
 		        async: false,
 		        data:{
 		        	ym_evlu	  : ym_evlu,
 		        	cd_evunit : cd_evunit,
 		        	cd_evgroup : cd_evgroup
 		        }
 		    }).done(function (result) {
 		    	
 		    	if(result.length){
 		    		clean_input();
	 		    	$(result).each(function() {
 	    				hour =parseInt(this.DY_PROPOSAL/60);
 	    				min = parseInt(this.DY_PROPOSAL%60);
 	    				if(min==0)
 	    					hour = hour + "" + 0;
 	    				var padString = util.string.padLeft(hour+""+min, "0", 4);
 	    				var masked = dews.string.mask(padString, "00:00");	 	    				
 	    				this.DY_PROPOSAL = masked;
 	    				$("#NM_KOR").val(this.NM_KOR);
 	    				dews.ui.maskedtextbox('#DT_WRITE').value(this.DT_WRITE);
 	    				dews.ui.maskedtextbox('#DT_LIMIT').value(this.DT_LIMIT);
 	    				$("#NM_STATE").val(this.NM_STATE);
 	    				$("#NM_TEAM").val(this.NM_TEAM);
 	    				$("#CD_STATE").val(this.CD_STATE);
 	    				dews.ui.maskedtextbox('#DT_CONSENT').value(this.DT_CONSENT);
 	    				dews.ui.maskedtextbox('#DT_CHANGED').value(this.DT_CHANGED);
	 		    	});
	 		    	
	 		    	if("000"==result[0].CD_STATE){
	 		    		$("#btn_cancel").prop("disabled","disabled");
	 		    		$("#btn_app").prop("disabled","");
	 		    		$("#btn_save").prop("disabled","");
	 		    		$("#btn_add").prop("disabled","");
	 		    		$("#btn_del").prop("disabled","");
	 		    		$("#btn_comment_add").prop("disabled","");
	 		    		$("#btn_comment_del").prop("disabled","");
	 		    	}else if("100"==result[0].CD_STATE){
	 		    		$("#btn_cancel").prop("disabled","");
	 		    		$("#btn_app").prop("disabled","disabled");
	 		    		$("#btn_save").prop("disabled","disabled");
	 		    		$("#btn_add").prop("disabled","disabled");
	 		    		$("#btn_del").prop("disabled","disabled");
	 		    		$("#btn_comment_add").prop("disabled","disabled");
	 		    		$("#btn_comment_del").prop("disabled","disabled");
	 		    	}else if("300"==result[0].CD_STATE){
	 		    		$("#btn_app").prop("disabled","disabled");
	 		    		$("#btn_cancel").prop("disabled","disabled");
	 		    		$("#btn_save").prop("disabled","disabled");
	 		    		$("#btn_add").prop("disabled","disabled");
	 		    		$("#btn_del").prop("disabled","disabled");
	 		    		$("#btn_comment_add").prop("disabled","disabled");
	 		    		$("#btn_comment_del").prop("disabled","disabled");
	 		    	}else{
	 		    		$("#btn_cancel").prop("disabled","disabled");
	 		    		$("#btn_app").prop("disabled","disabled");
	 		    		$("#btn_save").prop("disabled","");
	 		    		$("#btn_add").prop("disabled","");
	 		    		$("#btn_del").prop("disabled","");
	 		    		$("#btn_comment_add").prop("disabled","");
	 		    		$("#btn_comment_del").prop("disabled","");
	 		    	}
	 		    	dews.ui.grid("#grid_list").dataSource.data(result);
 		    	}
 	   	 	}); // end dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_reg", "list"), {
	 	} // end SelectData()
	 	
	 	function clean_input(){
	 		$('#form_ii input').each(function(){
	 			var input = $(this);
				input.val('');
	 		});
	 	}

	 	// 목표항목 그리드 로우 삭제
	 	$("#btn_del").on("click", function(){
		    var row = grid.select();
		    var rowData = grid.dataItem(row);
			if(row) {
				grid.removeRow(row);
			}
	 	});
	 	
	 	// 목표항목 그리드 로우 추가
	 	$("#btn_add").on("click", function(){
			var ym_evlu = dews.ui.dropdownlist("#ym_evlu").value();
			var cd_evunit = dews.ui.dropdownlist('#nm_unit').value();	
			var	cd_evgroup = dews.ui.dropdownlist('#nm_group').value();
			
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_reg_kpi_pop", "list"), {
		        async: false,
		        data:{
		        	ym_evlu	  : ym_evlu,
		        	cd_evunit : cd_evunit,
		        	cd_evgroup : cd_evgroup
		        }
			}).done(function(data) {
				var	dialog = dews.ui.dialog('p_whr_z_nham_goal_reg_kpi_pop', {
	                url: '~/p_whr_z_nham_goal_reg_kpi_pop',
	                title: 'KPI 선택 도움창',
	                width: 600,
	                height: 250,
	                ok:function(data){
	         			var data22 = grid.dataSource.data();
	         			var rowData = data22[0];
						var data2 = {
							CD_COMPANY : data.CD_COMPANY,
							YM_EVLU : data.YM_EVLU,
							CD_EVUNIT : rowData.CD_EVUNIT, // 평가단위
							NM_TASK : data.NM_TASK,
							NM_ITEM : data.NM_KPI,
							NUM_ITEMTYPE : data.NUM_ITEMTYPE.toFixed(2),
							CD_EVGROUP : data.CD_EVGROUP,
							TP_EVLU : rowData.TP_EVLU,		// ?
							NO_SEQ : rowData.NO_SEQ,		// ?
							NO_EMP : rowData.NO_EMP,		// ?
							CD_ITEM : data.CD_KPI,
							CD_STATE : rowData.CD_STATE,	// ?
							DT_CONSENT : rowData.DT_CONSENT,// ?
							DT_CHANGED : rowData.DT_CHANGED,// ?
							ID_UPDATE : rowData.ID_UPDATE,	// ?
							CD_TASK : data.CD_TASK,
							CD_LEVEL : data.CD_LEVEL,
							CD_SCALEH : data.CD_SCALEH
						};
						grid.dataSource.add(data2);
					}
		        });
			 	dialog.setInitData(data);
				dialog.open();
			}).fail(function(data){
		    	dews.error(data.responseJSON.message);
			});
	 	}); // end 목표항목 그리드 로우 추가
	 	
	 	//COMMENT 내역 추가
	 	$('#btn_comment_add').on('click', function (e){
	 		var today = new Date();
	 		var dd = today.getDate();
	 		var mm = today.getMonth()+1; 
	 		var yyyy = today.getFullYear();
	 		var row = grid.select();
 			var rowData = grid.dataItem(row);
 			
	 		if(dd<10)
	 		    dd = '0' + dd;
	 		
	 		if(mm<10)
	 		    mm = '0' + mm;
	 		
	 		today = yyyy + mm + dd;

 			if(rowData){
 				grid_commt.dataSource.add({
					//NM_EMPCMMT:rowData.NM_KOR,
					NM_EMPCMMT: $("#nm_user").val(),
					DT_CMMT:today,
					YM_EVLU:rowData.YM_EVLU,
					NO_SEQ:'0',
					CD_EVUNIT:rowData.CD_EVUNIT,
					CD_EVGROUP:rowData.CD_EVGROUP,
					NO_EMP:rowData.NO_EMP,
					TP_EVLUATOR:'100'//추후 수정
 				});
 			} else {
 				return;
 			}
	 	});
	 	
	 	// COMMENT 내역 삭제
	 	$('#btn_comment_del').on('click', function (e){
			var row = grid_commt.select();
			grid_commt.removeRow(row);
			
	 	});
	 	
/* 		 // 코멘트 클릭시 
	 	$('#grid_commt').on('click', function (e){
	 		var select_commt_row = grid_commt.select();
	 		var select_commt_rowData = grid_commt.dataItem(select_commt_row);
	 		
	 		console.log(JSON.stringify(select_commt_rowData));
	 	}); // 코멘트 클릭시 */
	 	
	 	// 승인신청
	 	$('#btn_app').on('click', function (e){
	 		
	 		if (datasource.getDirtyDataCount() > 0 || datasource2.getDirtyDataCount() > 0) {
	 			dews.error(dews.localize.get("변경사항이 있습니다. 저장을 먼저 실행 후 이용 하시기 바랍니다."));
	 			
	 			return false;
	 		}
	 		var app_row = grid.select();
	 		var app_rowData = grid.dataItem(app_row);
	 		var ym_evlu = app_rowData.YM_EVLU,
	        	cd_evunit = app_rowData.CD_EVUNIT ,
	        	cd_evgroup = app_rowData.CD_EVGROUP ;
	 		
	 		var sum_num_item = 0;
	 		var num_itemtype = 0;
	 		$(datasource.data()).each(function(){
	 			sum_num_item = sum_num_item + this.NUM_ITEM;
	 			num_itemtype = this.NUM_ITEMTYPE;
	 		});
	 		
	 		dews.confirm(dews.localize.get("승인신청 하시겠습니까?")).yes(function(){
	 			if('100' != sum_num_item){
		 			dews.error(dews.localize.get("승인신청을 하실 때 가중치의 합계는 100이여야 합니다."));
		 			
		 			return false;
		 		}
	 			
	 			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_reg", "app"), {
	 		        async: false,
	 		        data:{
	 		        	ym_evlu	  : ym_evlu,
	 		        	cd_evunit : cd_evunit,
	 		        	cd_evgroup : cd_evgroup,
	 		        	app_flag : 'app'
	 		        },							
					callback: function (result) {
						
                	},
                    error: function(message, data) {
						dews.error({
							"message": data.message,
							"error": data.error,
						});
                    }
	 		    }).done(function (result) {
	 		    	if (result && result.hasOwnProperty("error")) {
						dews.error(dews.localize.get("승인신청이 실패하였습니다."));
                    }else{
                    	dews.alert(dews.localize.get("정상적으로 승인신청되었습니다.")).done(function(){
                    		SelectData();
                    		SelectCmmt();
                    	});  	
                    }
	 	   	 	}).fail(function(){
	 	   	 		
	 	   	 	});	
	 		});
	 	}); // end 승인신청
	 	
	 	// 신청취소
	 	$('#btn_cancel').on('click', function (e){
	 		var app_row = grid.select();
	 		var app_rowData = grid.dataItem(app_row);
	 		var ym_evlu = app_rowData.YM_EVLU,
	        	cd_evunit = app_rowData.CD_EVUNIT ,
	        	cd_evgroup = app_rowData.CD_EVGROUP ;
	 		
	 		dews.confirm(dews.localize.get("신청취소 하시겠습니까?")).yes(function(){
	 			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_reg", "app"), {
	 		        async: false,
	 		        data:{
	 		        	ym_evlu	  : ym_evlu,
	 		        	cd_evunit : cd_evunit,
	 		        	cd_evgroup : cd_evgroup,
	 		        	app_flag : 'cancel'
	 		        },							
					callback: function (result) {
						
                	},
                    error: function(message, data) {
						dews.error({
							"message": data.message,
							"error": data.error,
						});
                    }
	 		    }).done(function (result) {
	 		    	if (result && result.hasOwnProperty("error")) {
						dews.error(dews.localize.get("신청취소를 실패하였습니다."));
                    }else{
                    	dews.alert(dews.localize.get("정상적으로 신청취소되었습니다.")).done(function(){
                    		SelectData();
                    		SelectCmmt();
                    	});  	
                    }
	 	   	 	}).fail(function(){
	 	   	 		alert('신청취소를 실패하였습니다.');
	 	   	 		
	 	   	 	});	
	 		});
	 	}); // end 신청취소
	 	
	 	// 저장  
	 	$('#btn_save').on('click', function (e){
	 		var sum_num_item = 0;
	 		
	 		$(datasource.data()).each(function(){
	 			sum_num_item = sum_num_item + this.NUM_ITEM;
	 		});
	 		
	 		if (datasource.getDirtyDataCount() > 0 || datasource2.getDirtyDataCount() > 0) {
				dews.confirm(dews.localize.get("저장하시겠습니까?")).yes(function(){
					
					if('100' <sum_num_item){
			 			dews.alert(dews.localize.get("가중치는 합계가 100을 넘을 수 없습니다."))
			 				.done(function(){
			 			});
			 			
			 			return false;
			 		}

                    if(datasource.getDirtyDataCount() > 0){
                    	datasource.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_goal_reg", "save"), {
    						async: false,
    						data: {
    						},							
    						callback: function (result) {
    							if (result && result.hasOwnProperty("error")) {
    								dews.error(dews.localize.get("저장이 실패하였습니다."));
    	                        }else{
    	                        	dews.alert(dews.localize.get("정상적으로 저장되었습니다.")).done(function(){
    	                        		SelectData();
    	                        		SelectCmmt();
    	                        	});  	
    	                        	
    	                        }
                        	},
                            error: function(message, data) {
        						dews.error({
        							"message": data.message,
        							"error": data.error,
        						});
                            }
    					});		
                    }
                    
                    if(datasource2.getDirtyDataCount() > 0){
                    	datasource2.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_goal_reg", "save_cmmt"), {
    						async: false,
    						data: {
    						},							
    						callback: function (result) {
    							if (result && result.hasOwnProperty("error")) {
    								dews.error(dews.localize.get("저장이 실패하였습니다."));
    	                        }else{
    	                        	dews.alert(dews.localize.get("정상적으로 저장되었습니다.")).done(function(){
    	                        		SelectCmmt();
    	                        	});  	
    	                        }
                        	},
                            success: function(e) {
                            },
                            error: function(message, data) {
        						dews.error({
        							"message": data.message,
        							"error": data.error,
        						});
                            }
    					});		
                    }
					                    	
				}); 
	        }else{
	    	   dews.alert(dews.localize.get("저장할 내용이 없습니다."));
	    	   return false;
	        }
	 	}); // end 저장
	 	
	 	// 조회
	 	$("#btn_search").on("click", function() {
	 	   		SelectData();
	 	   		SelectCmmt();
	 	});
	 	
	 	// 첨부파일
		$("#btn_file").on("click", function(){
			var row = grid.select();
		    var rowData = grid.dataItem(row);	
		    var flag = {flag: true};
		    if(300 == rowData.CD_STATE){
		    	flag = {flag : false};
		    }
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
	}); // end 첨부파일
	</script>
	
	<script src="scripts/util.js"></script>
	<script id="customize">
		dews.ready(function(){
	    	/* grid = util.customize.initCustomizeGrid(grid); */
	    	//util.customize.initCustomizeLabel();
	    });
	</script>
	
	<style scoped>
    	div > #form_ii > ul > li {
			width: 23%!important;
		}
	</style>
</tiles:putAttribute>
</tiles:insertDefinition>
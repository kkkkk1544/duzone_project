<%@page import="java.util.Enumeration"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
<tiles:putAttribute name="content">
	<!--   
		�ۼ��� : 
		�ۼ��� : 
		�޴��� : ���θ�ǥ���
		������ : 
		������ :
		�������� : 
	 -->
	 
    <!-- ��ư���� ���� -->
	<input type="hidden" id ='no_emp'/>
	<input type="hidden" id ='nm_user'/>
	<input type="hidden" id ='nm_dept'/>
	<input type="hidden" id ='CD_STATE'/>
	<div class="dews-button-group dews-button-group-primary">
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_search">��ȸ</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_save">����</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_app">���ν�û</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_cancel">��û���</button>
	</div>
    <!-- ��ư���� �� -->
  
    <!-- ��ȸ���� ���� -->  
    <div class="dews-condition-panel">
    	<form class="dews-condition-form">
    		<ul>
    			<li>
           			<label for='ym_evlu' class='required dews-ui-multilingual'>���س��</label>
					<span>
						<select id="ym_evlu" class="dews-ui-dropdownlist" 
								data-dews-value-field="YM_EVLU" 
								data-dews-text-field="NM_EVLU" 
								data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=200">
           				</select>
					</span>				
           			
           		</li>
				<li >
					<label class="dews-ui-multilingual" for="nm_unit">�򰡴���</label>
	                <span>
	                    <select  id="nm_unit" class="dews-ui-dropdownlist"
	                    	data-dews-value-field="CD_SYSDEF" 
	                    	data-dews-text-field="NM_SYSDEF"
	                    	data-dews-data-url="~/Data/help_p_whr_z_nham_eva_unit/EvaUnit"></select>
	                </span>
				</li> 
				<li>
	                <label class="dews-ui-multilingual" for="nm_group">�򰡱׷�</label>
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
    <!-- ��ȸ���� �� -->
    
    <!-- ������ �� ���� ���� ���� -->
   	<div class="dews-condition-panel div-4">
   		<form class="dews-condition-form" id='form_ii'>
    		<ul>
    			<li>
         			<label style="nowrap:true;" class='required dew-ui-multilingual'>�ۼ���(������)</label>
           			<span>
           				<input class="dews-ui-textbox readonly" style="width: 100%;" type="text" id="NM_KOR"/>
          			</span>
           		</li>
				<li>
           			<label class='required dew-ui-multilingual'>�ۼ�����</label>
           			<span>
           				<input class="dews-ui-textbox dews-ui-maskedtextbox readonly" data-dews-mask="####/##/##" style="width: 100%;"  type="text" id="DT_WRITE"/>
          			</span>
           		</li>
				<li>
           			<label class='required dew-ui-multilingual'>�������</label>
           			<span>
           				<input class="dews-ui-textbox dews-ui-maskedtextbox readonly" data-dews-mask="####/##/##" style="width: 100%;"  type="text" id="DT_LIMIT"/>
          			</span>
           		</li>
           		<li>
           			<label class='required dew-ui-multilingual'>�������</label>
           			<span>
           				<input class="dews-ui-textbox readonly" style="width: 100%;"  type="text" id="NM_STATE"/>
          			</span>
           		</li>
           		<li>
           			<label class='required dew-ui-multilingual'>������(����)</label>
           			<span>
           				<input class="dews-ui-textbox readonly" style="width: 100%;"  type="text" id="NM_TEAM"/>
          			</span>
           		</li>
				<li>
           			<label class='required dew-ui-multilingual'>��������</label>
           			<span>
           				<input class="dews-ui-textbox dews-ui-maskedtextbox readonly"  data-dews-mask="####/##/##" style="width: 100%;"  type="text" id="DT_CONSENT"/>
          			</span>
           		</li>
				<li>
           			<label class='required dew-ui-multilingual'>��������������</label>
           			<span>
           				<input class="dews-ui-textbox dews-ui-maskedtextbox readonly"  data-dews-mask="####/##/##" style="width: 100%;"  type="text" id="DT_CHANGED"/>
          			</span>
           		</li>
			</ul>
		</form>
   	</div>
    <!-- ������ �� ���� ���� �� -->
    <!-- ��ư���� ���� -->
	<div class="dews-button-group">
		<div class="dews-grid-title">
			<span>��ǥ�׸�</span>
		</div>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_file">÷������</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_add">�߰�</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_del">����</button>
	</div>
    <!-- ��ư���� �� -->
	<!-- �׸��� ���� ���� -->
	<div class="dews-grid-panel">
		<div id="grid_list" class="dews-ui-grid"></div>
	</div>
	<!-- �׸��� ���� �� -->
	 <!-- ��ư���� ���� -->
	<div class="dews-button-group">
		<div class="dews-grid-title">
			<span>COMMENT ����</span>
		</div>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_comment_add">�߰�</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_comment_del">����</button>
	</div>
    <!-- ��ư���� �� -->
	<!-- �׸��� ���� ���� -->
	<div class="dews-grid-panel">
		<div id="grid_commt" class="dews-ui-grid"></div>
	</div>
	<!-- �׸��� ���� �� -->
	<script type="text/javascript" charset="UTF-8">
	
	var grid, grid_commt;

	dews.ready(function(){
		var datasource,datasource2, datasource3;
	    //var useApproval = false;
	    
	    //groupSelect();
	    initPageData();
	    
	    datasource = dews.ui.dataSource("dataSource", {
        	batch: true,	//�׸��� �����
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
	                    title: dews.localize.get("������"),
	                    width: 70,
	                    align: "left"
	                },
	                {
	                    field: "NM_ITEM",
	                    title: dews.localize.get("KPI��"),
	                    width: 70
	                },
	                {
	                    field: "NUM_ITEMTYPE",
	                    title: dews.localize.get("����"),
	                    width: 40
	                },
	                
	                {
	                    field: "NUM_ITEM",
	                    title: dews.localize.get("����"),
	                    width: 40,
	           /*      },
	                {
	                    field: "NUM_ITEM",
	                    title: dews.localize.get("����ġ"),
	                    width: 50,
// 	                    template: dews.ui.grid.templates.mask("NUM_ITEM","0.00"),
// 						format: dews.ui.grid.formats.number('#.##'),
						//aggregates: ["min", "max", "sum"],
						//format: "{0:#,1:#}", */
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                                    // ���ǿ� ���� �ؽ�Ʈ�ڽ� ���
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
	                    title: dews.localize.get("������ǥ(KPI����)"),
	                    width: 90,
	                    align: "left",
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                                    // ���ǿ� ���� �ؽ�Ʈ�ڽ� ���
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
	                    title: dews.localize.get("��ȹ �� �޼�����"),
	                    width: 80,
	                    align: "left",
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                        	
	                                    // ���ǿ� ���� �ؽ�Ʈ�ڽ� ���
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
	                    title: dews.localize.get("�� �� ��޺ο�����(KPI ���)"),
	                    width: 120,
	                    align:"left",
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                        	
	                                    // ���ǿ� ���� �ؽ�Ʈ�ڽ� ���
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
	                    title: dews.localize.get("���"),
	                    width: 60,
	                    attributes: {style:"text-align:left;"},
	                    editor: function (container, options) {
	                        dews.ui.grid.editors.textbox(container, options,
	                                function (data) {
	                        	
	                                    // ���ǿ� ���� �ؽ�Ʈ�ڽ� ���
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
        
	     //COMMENT ����
	     datasource2 = dews.ui.dataSource("dataSource2", {
	     	batch: true,	//�׸��� �����
	         schema: {
	             model: {
	                 fields: {
	                 	DT_COMMT:   { editable: false, type: "string" },
	                 	NM_EMPCMMT:    	{ editable: false, type: "string" },
	                 	DC_COMMT:	{ editable: true, type: "string" }//��Ī**
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
					    title: dews.localize.get("�ۼ���"),
					    width: 40,
					    editor: dews.ui.grid.editors.readonly
					},
	                {
	                  field: "DT_CMMT",
	                  title: dews.localize.get("�ۼ�����"),
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
	     
	   //�򰡱׷� ��ȸ
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
	   //pageinit �� ����Ʈ���̴� ���� commonDataProvider.class-jar
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
	 		    	//���� �ð����·� ��ȯ ex> 90�� ---> 01:30
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

	 	// ��ǥ�׸� �׸��� �ο� ����
	 	$("#btn_del").on("click", function(){
		    var row = grid.select();
		    var rowData = grid.dataItem(row);
			if(row) {
				grid.removeRow(row);
			}
	 	});
	 	
	 	// ��ǥ�׸� �׸��� �ο� �߰�
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
	                title: 'KPI ���� ����â',
	                width: 600,
	                height: 250,
	                ok:function(data){
	         			var data22 = grid.dataSource.data();
	         			var rowData = data22[0];
						var data2 = {
							CD_COMPANY : data.CD_COMPANY,
							YM_EVLU : data.YM_EVLU,
							CD_EVUNIT : rowData.CD_EVUNIT, // �򰡴���
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
	 	}); // end ��ǥ�׸� �׸��� �ο� �߰�
	 	
	 	//COMMENT ���� �߰�
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
					TP_EVLUATOR:'100'//���� ����
 				});
 			} else {
 				return;
 			}
	 	});
	 	
	 	// COMMENT ���� ����
	 	$('#btn_comment_del').on('click', function (e){
			var row = grid_commt.select();
			grid_commt.removeRow(row);
			
	 	});
	 	
/* 		 // �ڸ�Ʈ Ŭ���� 
	 	$('#grid_commt').on('click', function (e){
	 		var select_commt_row = grid_commt.select();
	 		var select_commt_rowData = grid_commt.dataItem(select_commt_row);
	 		
	 		console.log(JSON.stringify(select_commt_rowData));
	 	}); // �ڸ�Ʈ Ŭ���� */
	 	
	 	// ���ν�û
	 	$('#btn_app').on('click', function (e){
	 		
	 		if (datasource.getDirtyDataCount() > 0 || datasource2.getDirtyDataCount() > 0) {
	 			dews.error(dews.localize.get("��������� �ֽ��ϴ�. ������ ���� ���� �� �̿� �Ͻñ� �ٶ��ϴ�."));
	 			
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
	 		
	 		dews.confirm(dews.localize.get("���ν�û �Ͻðڽ��ϱ�?")).yes(function(){
	 			if('100' != sum_num_item){
		 			dews.error(dews.localize.get("���ν�û�� �Ͻ� �� ����ġ�� �հ�� 100�̿��� �մϴ�."));
		 			
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
						dews.error(dews.localize.get("���ν�û�� �����Ͽ����ϴ�."));
                    }else{
                    	dews.alert(dews.localize.get("���������� ���ν�û�Ǿ����ϴ�.")).done(function(){
                    		SelectData();
                    		SelectCmmt();
                    	});  	
                    }
	 	   	 	}).fail(function(){
	 	   	 		
	 	   	 	});	
	 		});
	 	}); // end ���ν�û
	 	
	 	// ��û���
	 	$('#btn_cancel').on('click', function (e){
	 		var app_row = grid.select();
	 		var app_rowData = grid.dataItem(app_row);
	 		var ym_evlu = app_rowData.YM_EVLU,
	        	cd_evunit = app_rowData.CD_EVUNIT ,
	        	cd_evgroup = app_rowData.CD_EVGROUP ;
	 		
	 		dews.confirm(dews.localize.get("��û��� �Ͻðڽ��ϱ�?")).yes(function(){
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
						dews.error(dews.localize.get("��û��Ҹ� �����Ͽ����ϴ�."));
                    }else{
                    	dews.alert(dews.localize.get("���������� ��û��ҵǾ����ϴ�.")).done(function(){
                    		SelectData();
                    		SelectCmmt();
                    	});  	
                    }
	 	   	 	}).fail(function(){
	 	   	 		alert('��û��Ҹ� �����Ͽ����ϴ�.');
	 	   	 		
	 	   	 	});	
	 		});
	 	}); // end ��û���
	 	
	 	// ����  
	 	$('#btn_save').on('click', function (e){
	 		var sum_num_item = 0;
	 		
	 		$(datasource.data()).each(function(){
	 			sum_num_item = sum_num_item + this.NUM_ITEM;
	 		});
	 		
	 		if (datasource.getDirtyDataCount() > 0 || datasource2.getDirtyDataCount() > 0) {
				dews.confirm(dews.localize.get("�����Ͻðڽ��ϱ�?")).yes(function(){
					
					if('100' <sum_num_item){
			 			dews.alert(dews.localize.get("����ġ�� �հ谡 100�� ���� �� �����ϴ�."))
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
    								dews.error(dews.localize.get("������ �����Ͽ����ϴ�."));
    	                        }else{
    	                        	dews.alert(dews.localize.get("���������� ����Ǿ����ϴ�.")).done(function(){
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
    								dews.error(dews.localize.get("������ �����Ͽ����ϴ�."));
    	                        }else{
    	                        	dews.alert(dews.localize.get("���������� ����Ǿ����ϴ�.")).done(function(){
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
	    	   dews.alert(dews.localize.get("������ ������ �����ϴ�."));
	    	   return false;
	        }
	 	}); // end ����
	 	
	 	// ��ȸ
	 	$("#btn_search").on("click", function() {
	 	   		SelectData();
	 	   		SelectCmmt();
	 	});
	 	
	 	// ÷������
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
	}); // end ÷������
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
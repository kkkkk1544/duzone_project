<%@page import="java.util.Enumeration"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
<tiles:putAttribute name="content">
	<!--   
		�ۼ��� : 
		�ۼ��� : 
		�޴��� : ���θ�ǥ����
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
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_app">����</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_deny">�ݷ�</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_cancel">�������</button>
	</div>
    <!-- ��ư���� �� -->
  
  <!-- ��ȸ���� ���� -->  
    <div class="dews-condition-panel div-4">
    	<form class="dews-condition-form">
    		<ul>
    			<li style="width: 24%;">
           			<label for='ym_evlu' class='required dews-ui-multilingual'>���س��</label> 					
					<span>
						<select id="ym_evlu" class="dews-ui-dropdownlist" 
								data-dews-value-field="YM_EVLU" 
								data-dews-text-field="NM_EVLU" 
								data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=300">
           				</select>
					</span>				
           			
           		</li>
				<li style="width: 24%;">
					<label class="dews-ui-multilingual" for="nm_unit">�򰡴���</label>
	                <span>
	                    <select id="nm_unit" class="dews-ui-dropdownlist"
	                    	data-dews-value-field="CD_SYSDEF" 
	                    	data-dews-text-field="NM_SYSDEF"
	                    	data-dews-data-url="~/Data/help_p_whr_z_nham_eva_unit/EvaUnit"></select>
	                </span>
				</li> 
				<li style="width: 24%;">
	                <label class="dews-ui-multilingual" for="nm_group">�򰡱׷�</label>
	                <span>
	                	<select id='nm_group' class='dews-ui-dropdownlist'
	                		data-dews-value-field='CD_EVGROUP'
	                		data-dews-text-field='NM_EVGROUP'
	                		data-dews-data-url='~/Data/help_p_whr_z_nham_eva_group/EvaGroup'></select>
	                 
	                </span>
           		</li>
           		
           		<li style="width: 24%;">
	                <label class="dews-ui-multilingual" for="category">���ο���</label>
	                <span>
	                    <select id="YN_APPROVE" name="YN_APPROVE" class="dews-ui-dropdownlist" >
<!-- 	                        <option class="dews-ui-multilingual" value="000">000</option> -->
	                        <option class="dews-ui-multilingual"></option>
	                        <option class="dews-ui-multilingual" value="100">�ۼ���</option>
	                        <option class="dews-ui-multilingual" value="200">���ν�û</option>
	                        <option class="dews-ui-multilingual" value="300">���οϷ�</option>
<!-- 	                        <option class="dews-ui-multilingual" value="400">400</option> -->
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
		<div class="dews-grid-panel"id="Module_area" style="float:left;width:31.3%;height:100%;">
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
	    
		<div class="dews-grid-panel" style="float:right;width:68%;height:100%;margin-left:5px;">
			<div>	
				<div>
					<span>&nbsp;</span>
				</div>
			</div>
			<div class="dews-condition-panel div-4">
		   		<form class="dews-condition-form"  id='form_ii'>
		    		<ul>
		    			<li style="width: 33%;">
		           			<label class='required dew-ui-multilingual'>�ۼ���(������)</label>
		           			<span>
		           				<input class="dews-ui-textbox" style="width: 100%;"  type="text" readonly="readonly" id="NM_KOR" />
		          			</span>
		           		</li>
						<li style="width: 33%;">
		           			<label class='required dew-ui-multilingual'>�ۼ�����</label>
		           			<span>
		           				<input class="dews-ui-textbox dews-ui-maskedtextbox"  data-dews-mask="####/##/##" style="width: 100%;"  type="text" readonly="readonly" id="DT_WRITE" />
		          			</span>
		           		</li>
						<li style="width: 33%;">
		           			<label class='required dew-ui-multilingual'>�������</label>
		           			<span>
		           				<input class="dews-ui-textbox dews-ui-maskedtextbox"  data-dews-mask="####/##/##" style="width: 100%;"  type="text" readonly="readonly" id="DT_LIMIT"/>
		          			</span>
		           		</li>
		           		<li style="width: 33%;">
		           			<label class='required dew-ui-multilingual'>������(����)</label>
		           			<span>
		           				<input class="dews-ui-textbox" style="width: 100%;"  type="text" readonly="readonly" id="NM_TEAM" />
		          			</span>
		           		</li>
						<li style="width: 33%;">
		           			<label class='required dew-ui-multilingual'>��������</label>
		           			<span>
		           				<input class="dews-ui-textbox dews-ui-maskedtextbox"  data-dews-mask="####/##/##" style="width: 100%;"  type="text" readonly="readonly" id="DT_CONSENT" />
		          			</span>
		           		</li>
						<li style="width: 33%;">
		           			<label class='required dew-ui-multilingual'>��������������</label>
		           			<span>
		           				<input class="dews-ui-textbox dews-ui-maskedtextbox"  data-dews-mask="####/##/##" style="width: 100%;"  type="text" readonly="readonly" id="DT_CHANGED" />
		          			</span>
		           		</li>
		           		<li style="width: 33%;">
		           			<label class='required dew-ui-multilingual'>�������</label>
		           			<span>
		           				<input class="dews-ui-textbox" style="width: 100%;"  type="text" readonly="readonly" id="NM_STATE"/>
		          			</span>
		           		</li>
					</ul>
				</form>
		   	</div>
		   	<div class="dews-button-group">
				<div class="dews-grid-title">
					<span>��ǥ�׸�</span>
				</div>
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_file">÷������</button>
			</div>
			<div class="dews-grid-panel">
				<div id="grid_list" class="dews-ui-grid"></div>
			</div>
			<div class="dews-button-group">
				<div class="dews-grid-title">
					<span>COMMENT ����</span>
				</div>
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_comment_add">�߰�</button>
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_comment_del">����</button>
			</div>
			<div class="dews-grid-panel">
				<div id="grid_commt" class="dews-ui-grid"></div>
			</div>
		</div>	 
	</div>
	<!-- �׸��� ���� �� -->
	<script>
	var grid, grid_pipyeong, grid_list, grid_commt;
	
	dews.ready(function(){
		var datasource, datasource2,  datasource4;
	    //var useApproval = false;
	    
	    initPageData();
	   //groupSelect();
	    
	    datasource4 = dews.ui.dataSource("dataSource4", {
        	batch: true,	//�׸��� �����
            schema: {
                model: {
                    fields: {
                    	NM_EVGROUP:  { editable: false, type: "string" },
                    	NM_KOR:    	{ editable: false, type: "string" },
                    	NM_DUTY_RANK:	{ editable: false, type: "string" },	
                    	NO_EMP:    	{ editable: false, type: "string" },
                    	NM_STATE : { editable: false, type: "string" }
                    }
                }
            }
        });
         
        grid_subject = dews.ui.grid("#grid_pipyeong", {
            dataSource: datasource4,
            editable: {	createAt: 'bottom' },
            selectable: "row",
            autoBind: false,
            noData: true, 
            height: 600,
            change: onChange,

	           columns: [	
                   {
                    field: "NM_EVGROUP",
                    title: dews.localize.get("�򰡱׷�"),
                    width: 70,
                    align: "left",
                    editor: dews.ui.grid.editors.readonly
                },
                {
                    field: "NM_DUTY_RANK",
                    title: dews.localize.get("����"),
                    width: 70,
                    editor: dews.ui.grid.editors.readonly,
                    align: "left"
                },
                {
                    field: "NO_EMP",
                    title: dews.localize.get("�����ȣ"),
                    width: 100,
                    editor: dews.ui.grid.editors.readonly,
                    align: "left"
                },
                {
                    field: "NM_KOR",
                    title: dews.localize.get("����"),
                    width: 70,
                    editor: dews.ui.grid.editors.readonly
                },
                {
                    field: "NM_STATE",
                    title: dews.localize.get("���ο���"),
                    width: 70,
                    editor: dews.ui.grid.editors.readonly
                }
            ],
            dataBound: function (e) {
            	this.select(this.element.find("tbody tr:first"));
            }
       	 });
	 	
        //��ǥ�׸� �׸���
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
    	                NUM_ITEM:{ editable: false, type: "string" },
    	                DC_DEFINATION:{ editable: false, type: "string" },
    	                DC_PLAN:{ editable: false, type: "string" },
    	                DC_FORMULA:{ editable: false, type: "string" },
    	                DC_RMK:{ editable: false, type: "string" }
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
                    field: "NUM_ITEMTYPE",
                    title: dews.localize.get("����"),
                    width: 40,
              /*   },
                {
                    field: "NUM_ITEM",
                    title: dews.localize.get("����ġ"),
                    width: 50, */
                    editor: function (container, options) {
                        dews.ui.grid.editors.textbox(container, options,
                            function (data) {
                    	
                                // ���ǿ� ���� �ؽ�Ʈ�ڽ� ���
                                if (data.CD_STATE === "000") {
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
                                if (data.CD_STATE === "000") {
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
							    if (data.CD_STATE === "000") {
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
                                 if (data.CD_STATE === "000") {
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
                                 if (data.CD_STATE === "000") {
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
            ],
            dataBound: function (e) {
            	this.select(this.element.find("tbody tr:first"));
            },
            save: function(e) {
             },
            change: function(e){
            	SelectCmmt();
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
			 		if(select_commt_rowData.NO_EMPCMMT == $("#no_emp").val() && "100" == $("#CD_STATE").val()){
			 			$("#btn_comment_del").prop("disabled","");
			 		}else{
			 			$("#btn_comment_del").prop("disabled","disabled");
			 		}		 		 		
	          }
	     });
	     
	     //����� ����� 
	     $("#ym_evlu").on("change", function(e){
			 dews.ui.dropdownlist("#ym_evlu").value(e.target.value);
			 ym_evlu = e.target.value;
			 groupSelect();
		 });

	     //����  
	     $('#btn_save').on('click', function (e){
	    	 if (datasource2.getDirtyDataCount() > 0) {
	    		 dews.confirm(dews.localize.get("�����Ͻðڽ��ϱ�?")).yes(function(){
	    			 var row = grid.select();
	    			 var rowData = grid.dataItem(row);
	    			 
	    			 if(datasource2.getDirtyDataCount() > 0){
	    				 datasource2.batchSave(dews.urlHelper.getDataUrl("p_whr_z_nham_goal_appr", "save_cmmt"), {
    					 async: false,
	 						data: {
	 							no_empcmmt : rowData.NO_EMP
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
	    	} else {
	    		dews.alert(dews.localize.get("������ ������ �����ϴ�."));
	    		return false;
	    	}
	    });
	     
	    $("#nm_unit").on("change", function(e){
			 groupSelect();
		});
     
	    //�򰡱׷� ��ȸ
	 	function groupSelect() {
	 		dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_group", "EvaGroup"),{
        		async : false,
    			data  : {
    				ym_evlu : dews.ui.dropdownlist("#ym_evlu").value(), // ���س��
    				cd_evtype  : 300, // 1�� ����
    				cd_evunit	: dews.ui.dropdownlist("#nm_unit").value() // �򰡴���
                }
        	}).done(function(result){
        		var arr = new Array();
        		var evgroup_code = dews.ui.dropdownlist('#nm_group');
        		
	     		if(JSON.stringify(result) !== "[]" && result.length > 0) {
	     			for(var i=0; i<result.length; i++) {
	 	    			data = {
 	    					CD_EVGROUP : result[i].CD_EVGROUP,
 	    					NM_EVGROUP : result[i].NM_EVGROUP
	 	    			}	
	 	    			arr.push(data);
	     			}
	     		}
	     		
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
	        var cd_evgroup = dews.ui.dropdownlist('#nm_group').value();
	        var row = grid.select();
	        var rowData = grid.dataItem(row);
	 		
	        dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_appr", "list_cmmt"), {
 		        async: false,
 		        data:{
 		        	ym_evlu	  : ym_evlu,
 		        	cd_evunit : cd_evunit,
 		        	cd_evgroup : cd_evgroup,
 		        	p_no_emp: rowData.NO_EMP
 		        }
 		    }).done(function (result) {
 		    	//���� �ð����·� ��ȯ ex> 90�� ---> 01:30
 		    	dews.ui.grid("#grid_commt").dataSource.data(result);
 	   	 	});
	 	}
	 	
	 	function SelectData(){
	 		
			var row4 = grid_subject.select();
			var rowDt = grid_subject.dataItem(row4);
			var ym_evlu = rowDt.YM_EVLU;
			var cd_evunit = rowDt.CD_EVUNIT;	
			var	cd_evgroup = rowDt.CD_EVGROUP;
			var no_emp = rowDt.NO_EMP
			
 		    dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_appr", "list"), {
 		        async: false,
 		        data:{
 		        	ym_evlu	  : ym_evlu,
 		        	cd_evunit : cd_evunit,
 		        	cd_evgroup : cd_evgroup,
 		        	no_emp	:	no_emp
 		        }
 		    }).done(function (result) {
 		    	if(result.length){
 		    		//���� �ð����·� ��ȯ ex> 90�� ---> 01:30
	 		    	clean_input();
	 		    	$(result).each(function(){					    		
	 	    				hour =parseInt(this.DY_PROPOSAL/60);
	 	    				min = parseInt(this.DY_PROPOSAL%60);
	 	    				if(min==0){
	 	    					hour =hour+""+0;
	 	    				}
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
	 		    		
	 		    	
	 		    	$('#btn_save').prop('disabled','');
 		    		$('#btn_file').prop('disabled','');
 		    		$('#btn_comment_add').prop('disabled','');
 		    		$('#btn_comment_del').prop('disabled','');
 		    		$('#btn_deny').prop('disabled','');
 		    		$('#btn_cancel').prop('disabled','');
 		    		$('#btn_app').prop('disabled','');
	 		    	
	 		    	if('000' == result[0].CD_STATE){
	 		    		$('#btn_deny').prop('disabled','disabled');
	 		    		$('#btn_cancel').prop('disabled','disabled');
	 		    		$('#btn_app').prop('disabled','disabled');
	 		    		$("#btn_comment_add").prop("disabled","disabled");
	 		    		$("#btn_comment_del").prop("disabled","");
	 		    		$("#btn_save").prop("disabled","disabled");
	 		    	}else if('100' == result[0].CD_STATE){
	 		    		$('#btn_cancel').prop('disabled','disabled');
	 		    		$('#btn_deny').prop('disabled','');
	 		    		$('#btn_app').prop('disabled','');
	 		    		$("#btn_save").prop("disabled","");
	 		    		$("#btn_comment_add").prop("disabled","");
	 		    		$("#btn_comment_del").prop("disabled","");
	 		    	}else if('300' == result[0].CD_STATE){
	 		    		$('#btn_cancel').prop('disabled','');
	 		    		$('#btn_deny').prop('disabled','disabled');
	 		    		$('#btn_app').prop('disabled','disabled');	
	 		    		$("#btn_save").prop("disabled","disabled");
	 		    		$("#btn_comment_add").prop("disabled","disabled");
	 		    		$("#btn_comment_del").prop("disabled","disabled");
	 		    	}else{
	 		    		$('#btn_deny').prop('disabled','disabled');
	 		    		$('#btn_cancel').prop('disabled','disabled');
	 		    		$('#btn_app').prop('disabled','disabled');
	 		    		$("#btn_save").prop("disabled","disabled");
	 		    		$("#btn_comment_add").prop("disabled","disabled");
	 		    		$("#btn_comment_del").prop("disabled","disabled");
	 		    	}
	 		    	
	 		    	$(result).each(function(){
	 		    		
	 		    		if('1' == this.LB_EVGROUP){
	 		    			if(this.YN_DEADLINE1 == 'Y'){
	 		    				$('#btn_cancel').prop('disabled','disabled');
	 		    			}
	 		    		}else if('2' == this.LB_EVGROUP){
	 		    			if(this.YN_DEADLINE2 == 'Y'){
	 		    				$('#btn_cancel').prop('disabled','disabled');
	 		    			}
	 		    		}else if('3' == this.LB_EVGROUP){
	 		    			if(this.YN_DEADLINE3 == 'Y'){
	 		    				$('#btn_cancel').prop('disabled','disabled');
	 		    			}
	 		    		}else if('4' == this.LB_EVGROUP){
	 		    			if(this.YN_DEADLINE4 == 'Y'){
	 		    				$('#btn_cancel').prop('disabled','disabled');
	 		    			}
	 		    		}else if('5' == this.LB_EVGROUP){
	 		    			if(this.YN_DEADLINE5 == 'Y'){
	 		    				$('#btn_cancel').prop('disabled','disabled');
	 		    			}
	 		    		}
	 		    	});
	 		    	
	 		    	if(result[0].NO_TEAM != $("#no_emp").val()){
	 		    		$('#btn_save').prop('disabled','disabled');
	 		    		//$('#btn_file').prop('disabled','disabled');
	 		    		$('#btn_comment_add').prop('disabled','disabled');
	 		    		$('#btn_comment_del').prop('disabled','disabled');
	 		    		$('#btn_deny').prop('disabled','disabled');
	 		    		$('#btn_cancel').prop('disabled','disabled');
	 		    		$('#btn_app').prop('disabled','disabled');
	 		    	}
	 		    	
	 		    	dews.ui.grid("#grid_list").dataSource.data(result);
	 		    	SelectCmmt();
 		    	}
 	   	 	});
	 	}
	 	
	 	function SelectSubject(){
			var ym_evlu = dews.ui.dropdownlist("#ym_evlu").value();
			var cd_evunit = dews.ui.dropdownlist('#nm_unit').value();	
			var	cd_evgroup = dews.ui.dropdownlist('#nm_group').value();
			var	yn_approve = $('#YN_APPROVE').val();
	 		
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_appr", "list_subject"), {
 		        async: false,
 		        data:{
 		        	ym_evlu	  : ym_evlu,
 		        	cd_evunit : cd_evunit,
 		        	cd_evgroup : cd_evgroup,
 		        	yn_approve : yn_approve
 		        }
 		    }).done(function (result) {
 		    	//���� �ð����·� ��ȯ ex> 90�� ---> 01:30
 		    	clean_input();
 		 		grid.dataSource.data([]);
 		 		grid_commt.dataSource.data([]);
 		    	
 		 		$(result).each(function() {
 		 			var padString = "";
 		 			var masked = "";
 		 			
    				hour = parseInt(this.DY_PROPOSAL/60);
    				min = parseInt(this.DY_PROPOSAL%60);
    				
    				if(min==0)
    					hour =hour+""+0;
    				
    				padString = util.string.padLeft(hour + "" + min, "0", 4);
    				masked = dews.string.mask(padString, "00:00");
    				
    				this.DY_PROPOSAL = masked;
 		    	});
 		    	grid_subject.dataSource.data(result);
 	   	 	});
	 	}
	 	
	 	function clean_input(){
	 		$('#form_ii input').each(function(){
	 			var input = $(this);
				input.val('');
	 		});
	 	}
	 	
	 	//÷������ ������ 
		function fileCheck(no_emp){
			var ym_evlu = dews.ui.dropdownlist("#ym_evlu").value();
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
	 		
	 		today = yyyy+mm+dd;

			if(rowData){
				grid_commt.dataSource.add(
					{
						NM_EMPCMMT:$("#nm_user").val(),
						DT_CMMT:today,
						YM_EVLU:rowData.YM_EVLU,
						NO_SEQ:'0',
						CD_EVUNIT:rowData.CD_EVUNIT,
						CD_EVGROUP:rowData.CD_EVGROUP,
						NO_EMP:$("#no_emp").val(),
						TP_EVLUATOR:'100'//���� ����
					});
			} else {
				return;
			}
	 	});
	 	
	 	function onChange(arg) {
           var selected = $.map(this.select(), function(item) {
               return $(item).text();
           });
           
           SelectData();
		   var no_emp = grid_subject.dataItem(grid_subject.select()).NO_EMP;
       	   fileCheck(no_emp);
        }
	 	
	 	//COMMENT ���� ����
	 	$('#btn_comment_del').on('click', function (e){
			var row = grid_commt.select();
			grid_commt.removeRow(row);
	 	});
	      
	 	//��ȸ
	 	$("#btn_search").on("click", function() {
	 		SelectSubject();
	 	});
	 	
	 	//�ݷ�
	 	$("#btn_deny").on("click", function() {
	 		var app_row = grid.select();
	 		var app_rowData = grid.dataItem(app_row);
	 		var ym_evlu = app_rowData.YM_EVLU;
	        var cd_evunit = app_rowData.CD_EVUNIT;
	        var cd_evgroup = app_rowData.CD_EVGROUP;
	 		var app_emp = app_rowData.NO_EMP;
	 			
	 		if(app_rowData){
	 			dews.confirm(dews.localize.get("�ݷ� �Ͻðڽ��ϱ�?")).yes(function(){
		 			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_appr", "app"), {
		 		        async: false,
		 		        data:{
		 		        	ym_evlu	  : ym_evlu,
		 		        	cd_evunit : cd_evunit,
		 		        	cd_evgroup : cd_evgroup,
		 		        	app_flag : 'app_deny',
		 		        	app_emp :	app_emp
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
							dews.error(dews.localize.get("�ݷ��� �����Ͽ����ϴ�."));
		                   }else{
		                   	dews.alert(dews.localize.get("���������� �ݷ��Ǿ����ϴ�.")).done(function(){
		                   		SelectSubject();
		                   	});  	
		                   }
		 	   	 	}).fail(function(){
		 	   	 		
		 	   	 	});	
		 		});
	 		}
	 	});
	 	
	 	//�������
	 	$("#btn_cancel").on("click", function() {
	 		var app_row = grid.select();
	 		var app_rowData = grid.dataItem(app_row);
	 		var ym_evlu = app_rowData.YM_EVLU;
	        var cd_evunit = app_rowData.CD_EVUNIT;
	        var cd_evgroup = app_rowData.CD_EVGROUP;
	 		var app_emp = app_rowData.NO_EMP;
	 			
	 		dews.confirm(dews.localize.get("������� �Ͻðڽ��ϱ�?")).yes(function(){
	 			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_appr", "app"), {
	 		        async: false,
	 		        data:{
	 		        	ym_evlu	  : ym_evlu,
	 		        	cd_evunit : cd_evunit,
	 		        	cd_evgroup : cd_evgroup,
	 		        	app_flag : 'app_cancel',
	 		        	app_emp :	app_emp
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
						dews.error(dews.localize.get("������Ұ� �����Ͽ����ϴ�."));
	                   }else{
	                   	dews.alert(dews.localize.get("���������� ������ҵǾ����ϴ�.")).done(function(){
	                   		SelectSubject();
	                   	});  	
	                   }
	 	   	 	}).fail(function(){
	 	   	 		
	 	   	 	});	
	 		});
	 	});
	 	
	 	//����
	 	$("#btn_app").on("click", function() {
	 		if (datasource2.getDirtyDataCount() > 0) {
	 			dews.error(dews.localize.get("��������� �ֽ��ϴ�. ������ ���� ���� �� �̿� �Ͻñ� �ٶ��ϴ�."));
	 			
	 			return false;
	 		}
	 		var app_row = grid.select();
	 		var app_rowData = grid.dataItem(app_row);
	 		var ym_evlu = app_rowData.YM_EVLU;
	        var cd_evunit = app_rowData.CD_EVUNIT;
	        var cd_evgroup = app_rowData.CD_EVGROUP;
	 		var app_emp = app_rowData.NO_EMP;
 			var ddd = {
 		        	ym_evlu	  : ym_evlu,
 		        	cd_evunit : cd_evunit,
 		        	cd_evgroup : cd_evgroup,
 		        	app_flag : 'app_ok',
 		        	app_emp :	app_emp
 		        };
	 		
	 		dews.confirm(dews.localize.get("���� �Ͻðڽ��ϱ�?")).yes(function(){
	 			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_goal_appr", "app"), {
	 		        async: false,
	 		        data:{
	 		        	ym_evlu	  : ym_evlu,
	 		        	cd_evunit : cd_evunit,
	 		        	cd_evgroup : cd_evgroup,
	 		        	app_flag : 'app_ok',
	 		        	app_emp :	app_emp
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
						dews.error(dews.localize.get("������ �����Ͽ����ϴ�."));
	                   }else{
	                   	dews.alert(dews.localize.get("���������� ���εǾ����ϴ�.")).done(function(){
	                   		SelectSubject();
	                   	});  	
	                   }
	 	   	 	}).fail(function(){
	 	   	 		
	 	   	 	});	
	 		});
	 	});
		
	 	//���ε�
		$("#btn_file").on("click", function(){
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
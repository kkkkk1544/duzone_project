<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
<tiles:putAttribute name="content">
	<!--   
		�ۼ��� : NKH
		�ۼ��� : 2017-12-18
		�޴��� : ���� �߰���
		������ : 
		������ :
		�������� : p_whr_z_nham_eva_evalmid.jsp
	 -->
    <!-- ��ư���� ���� -->
	<div class="dews-button-group dews-button-group-primary">
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_search">��ȸ</button>
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_save">����</button>
	</div>
    <!-- ��ư���� �� -->
  
    <!-- ��ȸ���� ���� -->  
    <div class="dews-condition-panel">
    	<form class="dews-condition-form">
    		<ul>
    			<li>
           			<label for='dt_date' class='required dew-ui-multilingual'>���س��</label>
           			<span>
           				<select id="dt_date" class="dews-ui-dropdownlist" 
           				  data-dews-value-field="YM_EVLU" 
           				  data-dews-text-field="NM_EVLU" 
           				  data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=300"></select>
           			</span>
           			
           		</li>
				<li >
					<label class="dews-ui-multilingual" for="nm_unit">�򰡴���</label>
	                <span>
	                    <select id="nm_unit" class="dews-ui-dropdownlist"
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
    
    <!-- �׸��� ���� ���� -->
   <div class="dews-grid-panel" style="width:100%;height:100%;">
   		<!-- ���� -->
		<div class="dews-grid-panel" id="Module_area" style="float:left;width:31.3%;height:100%;">
			<div>	
				<div class="dews-grid-title">
					<span>�򰡴��</span>
				</div>
			</div>
		    <div class="dews-grid-panel" id="grid_subject_div">
		        <div id="grid_subject" class="dews-ui-grid"></div>
		    </div>
	    </div>
	    <!-- ���� -->
	    
		<div class="dews-grid-panel" style="float:right;width:68%;height:100%;margin-left:5px;">
			<div class="dews-button-group">	
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_file">÷������</button>
				<div class="dews-grid-title">
					<span>��ǥ�׸�</span>
				</div>
			</div>	
			<div class="dews-grid-panel">
	            <div id="grid" class="dews-ui-grid"></div>
	        </div>
	        <div>	
				<div class="dews-grid-title">
					<span>������ �ǰ�</span>
				</div>
			</div>
	        <div class="dews-grid-panel">
	        	<div id="grid_slf" class="dews_ui_grid"></div>
	        </div>
	        <div class="dews-button-group">	
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_add">�߰�</button>
			    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_del">����</button>
				<div class="dews-grid-title">
					<span>���� Feed back</span>
				</div>
			</div>
	        <div class="dews_gird_panel">
	        	<div id="grid_commt" class="dews_ui_grid"></div>
	        </div> 
		</div>	 
	</div>
	<!-- �׸��� ���� �� -->
	
	<!-- hidden -->
	<input type="hidden" class="dews-ui-textbox" id="nm_dept"> 
	<input type="hidden" class="dews-ui-textbox" id="nm_user"> 
	<input type="hidden" class="dews-ui-textbox" id="no_team"> 
	<input type="hidden" class="dews-ui-textbox" id="no_subject"> 
	<input type="hidden" class="dews-ui-textbox" id="no_emp">
	<input type="hidden" class="dews-ui-textbox" id="no_seq">
	<input type="hidden" class="dews-ui-textbox" id="no_itemseq">
	<script>
	var grid_subject, grid,grid_slf, grid_commt, Data;
	dews.ready(function(){
		var datasource, datasource2, datasource3, datasource4, codedata,
			num = 0;
		    initPageData();
		    groupSelect();
	    var useApproval = false;
	   
	    datasource4 = dews.ui.dataSource("dataSource4", {
        	batch: true,	//�׸��� �����
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
	                    title: dews.localize.get("�򰡱׷�"),
	                    width: 100,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NM_KOR",
	                    title: dews.localize.get("����"),
	                    width: 70,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NM_DUTY_RANK",
	                    title: dews.localize.get("����"),
	                    width: 60,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NO_EMP",
	                    title: dews.localize.get("�����ȣ"),
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
        	batch: true,	//�׸��� �����
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
	                    title: dews.localize.get("������"),
	                    width: 70,
	                    align: "left",
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NM_ITEM",
	                    title: dews.localize.get("KIP��"),
	                    width: 70,
	                    align:"left",
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "DC_DEFINATION",
	                    title: dews.localize.get("������ǥ(KIP����)"),
	                    width: 90,
	                    editor: dews.ui.grid.editors.readonly,
	                    align: "left"
	                },
	                {
	                    field: "DC_PLAN",
	                    title: dews.localize.get("��ȹ �� �޼�����"),
	                    width: 80,
	                    editor: dews.ui.grid.editors.readonly,
	                    align: "left"
	                },
	                {
	                    field: "DC_FORMULA",
	                    title: dews.localize.get("�� �� ��޺ο�����(KIP �Ž�)"),
	                    width: 120,
	                    align:"left",
	                    eitor: dews.ui.grid.editors.readonly
	                    //template: dews.ui.grid.templates.mask('NO_RES', '000000-0000000')
	                },
	                {
	                    field: "DC_RMK",		
	                    title: dews.localize.get("���"),
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
	            
	            
         //�������ǰ�
         datasource1 = dews.ui.dataSource("dataSource1", {
         	batch: true,	//�׸��� �����
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
 	                    title: dews.localize.get("�ۼ�����"),
 	                    width: 70,
 	                    align: "left",
 	                    editor: dews.ui.grid.editors.readonly,
 	                    template: dews.ui.grid.templates.date("DT_CMMT", "D"),
 	                },
 	                {
 	                    field: "NM_EMPCMMT",
 	                    title: dews.localize.get("�ۼ���"),
 	                    width: 40,
 	                    editor: dews.ui.grid.editors.readonly,
 	                },
 	                {
 	                    field: "DC_CMMT",
 	                    title: dews.localize.get("��ô����"),
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
            
	     //���� feed back
	     datasource2 = dews.ui.dataSource("dataSource2", {
	     	batch: true,	//�׸��� �����
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
					    title: dews.localize.get("�ۼ�����"),
					    width: 70,
					    align: "left",
					    editor: dews.ui.grid.editors.readonly,
					    template: dews.ui.grid.templates.date("DT_CMMT", "D"),
					},
					{
					    field: "NM_EMPCMMT",
					    title: dews.localize.get("�ۼ���"),
					    width: 40,
					    align: "left",
					    editor: dews.ui.grid.editors.readonly
					},
					{
					    field: "TP_PROGRESS",
					    title: dews.localize.get("���޼���"),
					    width: 60,
					    align: "left",
					    editor: dews.ui.grid.editors.readonly,
					    template: dews.ui.grid.templates.dataSource('TP_PROGRESS',
	                            {
	                                dataSourceID: 'codedata',
	                                dataValueField: 'code',
	                                dataTextField: 'text'
	                            }),
	                    //��Ӵٿ� ����Ʈ ��ȯ
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
					    title: dews.localize.get("��㳻��"),
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
		 		
		 		if(commt_rowData.NO_EMPCMMT == $('#no_emp').val()){
		 			$("#btn_del").prop("disabled","");
		 		}else{
		 			$("#btn_del").prop("disabled","disabled");
		 		}		 	
	          }
	     });

	  
     //����  
     $('#btn_save').on('click', function (e){
// 	   	alert(JSON.stringify(datasource2.getDirtyDataCount()));
		if (datasource2.getDirtyDataCount() > 0) {
			Save();
        }
		else{
    	   dews.alert(dews.localize.get("������ ������ �����ϴ�."));
        }
       });
	      
		//��ȸ
		$("#btn_search").on("click", function() {
			if(!dews.ui.dropdownlist('#dt_date').value()){		
				dews.ui.requiredTooltip.show('#dt_date');
			}else{
				EmpData();
// 		   		SelectData();
		   	}
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
							pCdFile: rowData.YM_EVLU + "_" + rowData.CD_EVUNIT + "_" + rowData.CD_EVGROUP + "_" + rowData.NO_EMP + "_0", //�������� ������� Ȯ���ؾ� ���� �ʳ�?		
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
		
		//��ǥ��� Ŭ���� ��ȸ
		$('#grid_subject').on("click",function(e){
			var grid = dews.ui.grid("#grid_subject");
			var row = grid.select();
			var rowData = grid.dataItem(row);
			
			SelectData(rowData);			
		});
		
		//feed Ŭ��
		$('#grid_commt').on("change",function(e){
			num = dews.ui.grid("#grid").dataItem(dews.ui.grid("#grid").select()).ROW_NO;
		});
		
		//��ǥ�׸� Ŭ���� ��ȸ
		$('#grid').on("click",function(e){
//			alert("����?");
			var grid = dews.ui.grid("#grid");
			var row = grid.select();
			var rowData = grid.dataItem(row);
			var num2 = rowData.ROW_NO;

			if(num > 0){
				if(num != num2 && grid_commt != Data){
	 				Save();
				}//if end
			}else{
				MidtData();			
			}
		});
		
		//�߰�
		$("#btn_add").on("click", function(){
			num = dews.ui.grid("#grid").dataItem(dews.ui.grid("#grid").select()).ROW_NO;
			
			if(dews.ui.textbox("#no_itemseq").text() != ''){
				var grid = dews.ui.grid('#grid_commt');
//	 		    grid.addRow();
				var today = util.date.toString(new Date());
			    var user = dews.ui.textbox("#nm_user").text();
			    
				data1 = {
						DT_CMMT		: today, 
						NM_EMPCMMT	: user,	
						TP_STATUS	: '100',
						TP_PROGRESS : '000'
				};
				grid.dataSource.add(data1);
			}
		});
		
		//����
		$("#btn_del").on("click", function(){
			num = dews.ui.grid("#grid").dataItem(dews.ui.grid("#grid").select()).ROW_NO;
			
			var grid = dews.ui.grid("#grid_commt");
			var row = grid.select();
			grid.removeRow(row);
// 			var rowData;
//         	rowData = grid.dataItem(rows);
			//dews.error(dews.localize.get("���ε� �����ʹ� ������ �� �����ϴ�."))	
			//var rows = grid.getCheckedRows("S");
			
		});
		 //�򰡱׷� ��ȸ
		$("#dt_date").on("change", function(e){
			 dews.ui.dropdownlist("#dt_date").value(e.target.value);
			 ym_evlu = e.target.value;
			 groupSelect();
		});
		 
		//�򰡴��� ��ȸ
		$("#nm_unit").on("change", function(e){
			 dews.ui.dropdownlist("#nm_unit").value(e.target.value);
			 groupSelect();
		});
		
		//�򰡱׷� ��ȸ
		function groupSelect() {
			dews.ajax.data(dews.url.getDataUrl("help_p_whr_z_nham_eva_group","EvaGroup"),{
		      		async : false,
		  			data  : {
		  				ym_evlu : dews.ui.dropdownlist("#dt_date").value(),
		  				cd_evtype: '300',
		  				cd_evunit : dews.ui.dropdownlist("#nm_unit").value()
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
		
		//��ǥ���
		function EmpData(){
			dews.ajax.data(dews.url.getDataUrl("p_whr_z_nham_eva_evalmid","empList"),{
				async: false,
				data: {
					ym_evlu		: dews.ui.dropdownlist("#dt_date").value(),
					cd_evunit	: dews.ui.dropdownlist("#nm_unit").value(),
					cd_evgroup	: dews.ui.dropdownlist("#nm_group").value()
				}
			}).done(function(result){
		    	if(result==0){
		    		dews.alert(dews.localize.get("��ϵ� �ڷᰡ ���ų� ���θ�ǥ����� ���ε��� �ʾҽ��ϴ�."));
		    	}
				dews.ui.grid("#grid_subject").dataSource.data(result);
			})
		}
		
		//��ǥ�׸�
		function SelectData(rowData){
// 			alert(((rowData != null) ? rowData.NO_EMP : ''));
			  dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_evalmid", "list"), {
			        async: false,
			        data:{
			        	no_subjectE	:  ((rowData != null) ? rowData.NO_EMP : ''),
			        	ym_evlu	  	: dews.ui.dropdownlist('#dt_date').value(),    
			        	cd_evunit 	: dews.ui.dropdownlist('#nm_unit').value(),
			        	cd_evgroup 	: dews.ui.dropdownlist('#nm_group').value()
			        }
			    }).done(function (result) {
			    	if(result[0].NO_TEAM != $("#no_emp").val()){
	 		    		$('#btn_save').prop('disabled','disabled');
	 		    		//$('#btn_file').prop('disabled','disabled');
	 		    		$('#btn_add').prop('disabled','disabled');
	 		    		$('#btn_del').prop('disabled','disabled');
	 		    	}
			    	dews.ui.grid("#grid").dataSource.data(result);   	
		   	 	});
		}
		
		//÷������ ������ 
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
		
		//������&���� ��������ȸ
		function MidtData(){
			//alert("selectdata"+rowData.NO_EMP+";;;;"+rowData.COPY_NO_EMP);
			var row = dews.ui.grid("#grid").select();
			var rowData = dews.ui.grid("#grid").dataItem(row);
			
			dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_evalmid","MidtList"),{
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
			dews.confirm(dews.localize.get("�����Ͻðڽ��ϱ�?")).yes(function(){
				num = 0;
				datasource2.batchSave(dews.url.getDataUrl("p_whr_z_nham_eva_evalmid", "dataSave"), {
					async: false,
					data: {
						no_subjectE: dews.ui.textbox('#no_subject').text(),
						ym_evlu	   : dews.ui.dropdownlist('#dt_date').value(),    
			        	cd_evunit  : dews.ui.dropdownlist('#nm_unit').value(),
			        	cd_evgroup : dews.ui.dropdownlist('#nm_group').value(),
			        	no_itemseq : dews.ui.textbox("#no_itemseq").text(),
						no_seq	   : "0"
					},							
					callback: function (result) {
						
						if (result && result.hasOwnProperty("error")) {
							dews.error(dews.localize.get("������ �����Ͽ����ϴ�."));
                        }else{
                        	dews.alert(dews.localize.get("���������� ����Ǿ����ϴ�.")).done(function(){
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


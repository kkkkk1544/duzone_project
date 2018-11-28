<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
<tiles:putAttribute name="content">
	<!--   
		작성자 : NKH
		작성일 : 2018-02-27
		메뉴명 : 평가결과조회
		수정자 : 
		수정일 :
		수정내용 : p_whr_z_nham_eva_rpt.jsp
	 -->
    <!-- 버튼영역 시작 -->
	<div class="dews-button-group dews-button-group-primary">
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_search">조회</button>
<!-- 	    <button class="dews-ui-button primary dews-ui-multilingual" id="btn_print">인쇄</button> -->
	</div>
    <!-- 버튼영역 끝 -->
  
    <!-- 조회조건 영역 -->  
    <div class="dews-condition-panel">
    	<form class="dews-condition-form">
    		<ul>
           		<li>
           			<label for='date' class='required dew-ui-multilingual'>기준년월</label>
           			<span>
           				<select id="dt_date" class="dews-ui-dropdownlist" 
           				  data-dews-value-field="YM_EVLU" 
           				  data-dews-text-field="NM_EVLU" 
           				  data-dews-data-url="~/Data/help_p_whr_z_nham_eva_rpt_ymg/YMG?ID=RPT"></select>
           			</span>
           		</li>
			</ul>
    	</form>
    </div> 
    <!-- 조회조건 끝 -->
     
    <!-- 버튼영역 시작 -->
    <div class="dews-grid-title">
		평가결과조회
	</div>
    <!-- 버튼영역 끝 -->
    
	<!-- 그리드 영역 시작 -->
	<div class="dews-grid-panel">
		<div id="grid" class="dews-ui-grid"></div>
	</div>
	<!-- 그리드 영역 끝 -->

	
	<!-- hidden -->
	<input type="hidden" class="dews-ui-textbox" id="nm_dept"> 
	<input type="hidden" class="dews-ui-textbox" id="nm_user"> 
	<input type="hidden" class="dews-ui-textbox" id="no_team"> 
	
	<script>
	var grid, grid_Admin;
	dews.ready(function(){
		var  datasource, datasourceA;
		    initPageData();
	 	
	    datasource = dews.ui.dataSource("dataSource", {
        	batch: true,	//그리드 저장시
            schema: {
                model: {
                    fields: {
                    	NM_DEPT:	{ editable: false, type: "string" },	
                    	NM_KOR:		{ editable: false, type: "string" },
                    	NO_EMP:		{ editable: false, type: "string" },
                    	NM_EVGROUP:	{ editable: false, type: "string" },
                    	
                    	PT_KPI:		{ editable: false, type: "string" },	// 업적점수
						NM_LVKPI:	{ editable: false, type: "string" },	// 업적등급  CD_LVKPI
						PT_CMPT:	{ editable: false, type: "string" },	// 역량점수
						NM_LVCMPT:	{ editable: false, type: "string" },	// 역량등급  CD_LVCMPT
						PT_RSLT:	{ editable: false, type: "string" },	// 종합점수
						NM_RSLT:	{ editable: false, type: "string" },	// 종합등급  CD_RSLT
                    	PT_ADJ:    	{ editable: false, type: "string" },	// 조정
                    	NM_ADJ:    	{ editable: false, type: "string" }		// 최종등급  CD_ADJ
                    }
                }
            }
        });  
    
        grid = dews.ui.grid("#grid", {
	            dataSource: datasource,
	            editable: {
	            	createAt: 'bottom'
	            },
	            selectable: "row",
	            autoBind: false,
	            noData: true, 
	            height: 630,
		           columns: [
					{
					    field: "NM_DEPT",
					    title: dews.localize.get("현재부서"),
					    width: 80,
					    editor: dews.ui.grid.editors.readonly
					},	
					{
	                    field: "NM_KOR",
	                    title: dews.localize.get("성명"),
	                    width: 70,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NO_EMP",
	                    title: dews.localize.get("사원번호"),
	                    width: 70,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NM_EVGROUP",
	                    title: dews.localize.get("최종평가그룹"),
	                    width: 90,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                
					{
					    field: "PT_KPI",
					    title: dews.localize.get("업적점수"),
					    width: 40,
					    editor: dews.ui.grid.editors.readonly
					},
					{
	                    field: "NM_LVKPI",
	                    title: dews.localize.get("업적등급"),
	                    width: 40,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "PT_CMPT",
	                    title: dews.localize.get("역량점수"),
	                    width: 40,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NM_LVCMPT",
	                    title: dews.localize.get("역량등급"),
	                    width: 40,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "PT_RSLT",
	                    title: dews.localize.get("종합점수"),
	                    width: 40,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "NM_RSLT",
	                    title: dews.localize.get("종합등급"),
	                    width: 40,
	                    editor: dews.ui.grid.editors.readonly
	                },
	                {
	                    field: "PT_ADJ",
	                    title: dews.localize.get("조정"),
	                    width: 40,
	                    editor: dews.ui.grid.editors.readonly
	                }, 
	                {
	                    field: "NM_ADJ",
	                    title: dews.localize.get("최종등급"),
	                    width: 60,
	                    editor: dews.ui.grid.editors.readonly
	                }	
					   
	            ],
	            dataBound: function (e) {
	            	this.select(this.element.find("tbody tr:first"));
	            }
	        });
        
      //인사평가 상세조회 popup  
      $('#grid').on('dblclick', function (e){
			var initData, dialog;   

			var row = dews.ui.grid("#grid").select();
			var rowData = dews.ui.grid("#grid").dataItem(row);
            initData = {
            		rowData : rowData
       			}
       		dialog = dews.ui.dialog('p_whr_z_nham_eva_rpt_sub', {
   	         	title:'인사평가 상세조회', 
   	         	url: '~/p_whr_z_nham_eva_rpt_sub', 
   					width : 1000,
   					height : 600,
   					data : { },
   					ok		: function() {
   					}
   				});
          		dialog.setInitData(initData);
   				dialog.open();       	
        });
	      
		//조회
		$("#btn_search").on("click", function() {
			if(dews.ui.dropdownlist("#dt_date").value()==null ){
				 dews.alert("기준년월을 확인해주세요");
			}
	    	else{
	    		SelectData();
	    	}
		});
		
		//인쇄    p_sem_cm_swgd_po_report
		$("#btn_print").on("click", function(){	 
			
			var rows = grid.getCheckedRows("S");
			if(rows.length == 0){
				dews.alert("출력할 데이터를 체크하세요.");
				return false;
			}
			var no_proposals = new Array();
			var cd_company = "";
			var no_emp = "";
			$(rows).each(function(){
				var data =  grid.dataItem(this);
				cd_company = data.CD_COMPANY;
				no_emp = data.NO_EMP;
				no_proposals.push(data.NO_PROPOSAL);
			});
			no_proposals = no_proposals.join('|');
			no_proposals = encodeURIComponent(no_proposals);
			
			console.log(no_proposals);
// 			alert("/Download/p_whr_z_nham_report/wreathPrint?cd_company="+cd_company+"&no_emp="+no_emp+"&no_proposals="+no_proposals+"")
		    var reports = [
                  {
                   drfName:"경조금신청서",
                   drfUrl:"/attach/drf/nham/R_HR_Z_NHAM_WREATHCON_001.drf",
                   dataUrl:"/Download/p_whr_z_nham_report/wreathPrint?cd_company="+cd_company+"&no_emp="+no_emp+"&no_proposals="+no_proposals+""   //"&no_proposal="+no_proposal+""  //"&grid_data="+grid_data+""    		   
                		   
                  },
                 ];
		     util.print.show(reports);
		});
		 
		 //pageinit 시 디폴트데이더 셋팅 commonDataProvider.class-jar
		function initPageData(){
			dews.ajax.data(dews.url.getDataUrl("CommonData","getCurrentUser"), { async: false }).done(function (currentUser) {	
				var no_emp = currentUser.NO_EMP;
				$("#no_emp").val(no_emp);
				});
			
// 			var date_from, date_to, date;
			
// 			date_to = util.date.toString(new Date());
// 			date_to = util.date.addDays(date_to, 7, true);
// 			date = date_to.substr(4,2) - 1;			
// 			date_from = util.date.addMonths(date_to, -date, true);
			
// 			dews.ui.datepicker("#dt_period1").value(date_from);
// 			dews.ui.datepicker("#dt_period2").value(date_to);
			}
		
		function SelectData(){
 		    dews.ajax.data( dews.url.getDataUrl("p_whr_z_nham_eva_rpt", "list"), {
		        async: false,
		        data:{
		        	 ym_evlu : dews.ui.dropdownlist("#dt_date").value()  
		        }
		    }).done(function (data) {
		    	if(data.length === 0){
		    		dews.alert("기간을 확인해주세요.","ico2");
		    	}
		    	dews.ui.grid("#grid").dataSource.data(data);   	
	   	 	});
		}//ln SelectData F
	
	});//ln read

	</script>	
	<script src="scripts/util.js"></script>
		
</tiles:putAttribute>
</tiles:insertDefinition>


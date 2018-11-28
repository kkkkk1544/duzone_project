<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<tiles:insertDefinition name="dialogTemplate">
<tiles:putAttribute name="content">
	<!--
	  작성자 : 임도경
	  작성일 : 2017.09.13
	  메뉴명 : 첨부파일 업다운로드
	  수정자 : 
	  수정일 :
	  수정내용 :
	  -->

	<div class="dews-button-group dews-button-group-action">
< 		<form id="form" method="post" enctype="multipart/form-data">
			<input type="file" id="uploadFile" name="uploadFiles" style="position:relative; width: 400px; diaplay: inline-block;" />
			<button class="dews-ui-button dews-ui-multilingual" id="btn_upload">업로드</button>
    		<button class="dews-ui-button dews-ui-multilingual" id="btn_download" >다운로드</button>
    		<button class="dews-ui-button dews-ui-multilingual" id="btn_delete">삭제</button>
    		<button class="dews-ui-button dews-ui-multilingual" id="btn_save">저장</button>
    	</form>
    </div>     
	<div class="dews-grid-panel">
		<div id="grid" class="dews-ui-grid"></div>
	</div>
	<div class="dews-button-group bottom">
	    <button class="dews-ui-button primary dews-ui-multilingual" id="btnOk">확인</button>
	</div>
	<iframe id="downloadFrame" style="display: none"></iframe>
	<script type="text/javascript">
	
	var dialog, initdata, pIdMenu, pFilePath, pCdFile;
	
	dews.ready(function(){
		
		dialog = dews.ui.dialog('p_whr_z_nham_file_attach_pop');
		initdata = dialog.getInitData();
		

		pIdMenu = initdata.pIdMenu;
		pFilePath = initdata.pFilePath;
		pCdFile = initdata.pCdFile;
		
		if(!initdata.params.data.flag){
			dews.ui.button('#uploadFile').enable(false);
			dews.ui.button('#btn_upload').enable(false);
			dews.ui.button('#btn_delete').enable(false);
			dews.ui.button('#btn_save').enable(false);
		}
		else{
			dews.ui.button('#uploadFile').enable(true);
			dews.ui.button('#btn_upload').enable(true);
			dews.ui.button('#btn_delete').enable(true);
			dews.ui.button('#btn_save').enable(true);
		}
		
		var grid, datasource;
        datasource = dews.ui.dataSource("dataSource", {
        	batch: true,	//그리드 저장시
            transport: {
                read: {
                    url: dews.urlHelper.getDataUrl("p_whr_z_nham_file_attach_pop", "loadRealFile"),
                    data: function () {
                        return {
            				pIdMenu: pIdMenu,
            				pFilePath: pFilePath,
            				pCdFile: pCdFile,
                        	cd_pool : initdata.cd_pool	
                        }  
                    }
                }
            },
            schema: {
                model: {
                    fields: {
                    	FILE_NAME: { editable: true, type: "string" },
                    	FILE_SIZE: { editable: true, type: "string" },
                    	NM_USER: { editable: true, type: "string" },
                    	FILE_DATE: { editable: true, type: "string" },
                    	FILE_PATH: { editable: true, type: "string" },
                    	TEMP_FILE_NAME: { editable: true, type: "string" },
                    	NO_SEQ: { editable: true, type: "string" }
                    }
                }
            },
        });
        grid = dews.ui.grid("#grid", {
			dataSource : datasource,
			autoBind: true,
			selectable : "row",
			height: 150,
			columns : [
			           { 
			        	   	field: "FILE_NAME",
						    title: "파일명",
						    width: 70			        	   
			           }, {
			        	    field: "FILE_SIZE",
						    title: "크기",
						    width: 50
			           }, { 
			        	    field: "FILE_DATE",
						    title: "등록일자",
						    width: 50,
						    template: dews.ui.grid.templates.date("FILE_DATE", "D")
			        	   
			           }, {
			        	   field : "CD_FILE",
			        	   title : "파일코드",
			        	   width : 50,
			        	   hidden : false
			           }, {
			        	   field:"FILE_PATH",
			        	   title : "파일경로",
			        	   width : 50,
			        	   hidden : false
			           }, {
			        	   field:"TEMP_FILE_NAME",
			        	   title : "임시파일명",
			        	   width : 50,
			        	   hidden : false
			           }, {
			        	   field:"NO_SEQ",
			        	   title : "순번",
			        	   width : 50,
			        	   hidden : false
			           }]
		});

		$("#btn_save").on("click", function(e){
			e.preventDefault();
			if (datasource.getDirtyDataCount() > 0) {
				dews.confirm('변경된 사항이 있습니다.\n저장하시겠습니까?').yes(function(){
					datasource.batchSave(dews.url.getDataUrl("p_whr_z_nham_file_attach_pop", "createRealFile"), {
                        callback: function (result) {
                        	dews.alert("저장되었습니다.").done(function(){
                        	});
                        },
                        error:function(msg, data){
                        	dews.alert(msg);
                        }
                    });
	            }).no(function(){
	            	
	            });
            } else {
            	dews.alert("저장할 내용이 없습니다.");
            }
		});
		
		
		$("#btn_upload").on("click", function(e) {
			dews.server.file.upload("#form", {
				url: "/Upload/p_whr_z_nham_file_attach_pop/createtempfile"
				, data: {
					pIdMenu: pIdMenu,
					pFilePath: pFilePath,
					pCdFile: pCdFile
				}, beforeSend: function() {
				}, complete: function(xhr, theStatus) {
					var data = JSON.parse(xhr.responseText);
					for(var i = 0 ; i < data["uploadInfo"].length ; i++) {
						datasource.add({"FILE_NAME" : data["uploadInfo"][i]["FILE_NAME"],
							"FILE_SIZE" : data["uploadInfo"][i]["FILE_SIZE"],
							"NM_USER" : data["uploadInfo"][i]["NM_USER"],
							"FILE_DATE" : data["uploadInfo"][i]["FILE_DATE"],
							"TEMP_FILE_NAME" : data["uploadInfo"][i]["TEMP_FILE_NAME"],
							"ID_MENU" : data["uploadInfo"][i]["ID_MENU"],
							"FILE_PATH" : data["uploadInfo"][i]["FILE_PATH"],
							"CD_FILE" : data["uploadInfo"][i]["CD_FILE"]
						});
					}
					$("#uploadFile").val("");					
				}
			});
			
			
		});	
		
		$("#btn_download").on("click", function(e) {
			e.preventDefault();
			
			var currentRow;
			var rowData;
			
			currentRow = grid.select();
			rowData = grid.dataItem(currentRow);
			var url = "/Download/p_whr_z_nham_file_attach_pop/downloadFile?FILE_NAME=" + encodeURI(encodeURIComponent(rowData.FILE_NAME))
																						 + "&FILE_PATH=" + rowData.FILE_PATH
																						 + "&CD_FILE=" + rowData.CD_FILE 
																						 + "&ID_MENU=" + rowData.ID_MENU 
																						 + "&NO_SEQ=" + rowData.NO_SEQ;
			dews.server.file.download(url);
		});
		
		$("#btn_delete").on("click", function(e) {
			e.preventDefault();
			var row = grid.rows('tr:eq(' + grid.select().index() + ')');
			grid.removeRow(row);
		});
		
		//확인
		$("#btnOk").on("click", function(e) {
			dews.ui.dialog('p_whr_z_nham_file_attach_pop').ok();
		});		
	});
	</script>
</tiles:putAttribute>
</tiles:insertDefinition>
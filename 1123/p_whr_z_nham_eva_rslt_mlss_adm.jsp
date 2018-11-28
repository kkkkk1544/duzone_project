<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<tiles:insertDefinition name="basicTemplate">
	<tiles:putAttribute name="content">
		<!--   
		�ۼ��� : KSK
		�ۼ��� : 2018-10-01
		�޴��� : �ٸ��� ������
		������ : 
		������ :
		�������� : p_whr_z_nham_eva_rslt_mlss_adm.jsp
	 -->

		<!-- ��ư���� ���� -->
		<div class="dews-button-group dews-button-group-primary">
			<button class="dews-ui-button primary dews-ui-multilingual" id="btn_search">��ȸ</button>
			<button class="dews-ui-button primary dews-ui-multilingual"	id="btn_save">����</button>
			<button class="dews-ui-button primary dews-ui-multilingual"	id="btn_submit_deadline">�Է¸���</button>
			<button class="dews-ui-button primary dews-ui-multilingual"	id="btn_cancel_deadline">�������</button>
		</div>
		<!-- ��ư���� �� -->

		<!-- ��ȸ���� ���� -->
		<div class="dews-condition-panel">
			<form class="dews-condition-form">
				<ul>
					<li>
						<label class="dews-ui-multilingual" for="NoEmp">���</label>
					<span> 
						<input name="NoEmp" 
							   id="NoEmp" 
							   type="text"
							   class="dews-ui-codepicker" 
							   data-dews-help-code="COMM_HELP_EMP"
							   data-dews-help-title="��� ����â" 
							   data-dews-code-field="NO_EMP"
							   data-dews-text-field="NM_EMP" />
					</span>
					</li>
					
					<li>
						<label for='ym_evlu' class='required dews-ui-multilingual'>���س��</label>
						<span> 
							<select id="ym_evlu" class="dews-ui-dropdownlist"
								data-dews-value-field="YM_EVLU" 
								data-dews-text-field="NM_EVLU">
									<!--data-dews-data-url="~/Data/help_p_whr_z_nham_eva_yyyymm/yyyymm?CD_EVTYPE=200" -->
							</select>
					</span>
				</li>
				<li>
					<label class="dews-ui-multilingual" for="cd_evunit">�򰡴���</label>
						<span>
						 <select class="dews-ui-dropdownlist" id="cd_evunit"
										data-dews-text-field="NM_SYSDEF"
										data-dews-value-field="CD_SYSDEF"
										data-dews-data-url="~/Data/CommonData/getCodeData?cd_field=HR_EV00006&dummy_yn=N">
						</select>
					</span>
				</li>
					
					<!-- 				<li > -->
					<!-- 					<label class="dews-ui-multilingual" for="tp_evlu">������</label> -->
					<!-- 	                <span> -->
					<!-- 	                	<select class="dews-ui-dropdownlist" id="tp_evlu"  -->
					<!-- 	                			data-dews-text-field="NM_SYSDEF"  -->
					<!-- 	                			data-dews-value-field="CD_SYSDEF"  -->
					<!-- 	                			data-dews-data-url="~/Data/CommonData/getCodeData?cd_field=HR_EV00004&dummy_yn=N" > -->
					<!-- 	                	</select> -->
					<!-- 	                </span> -->
					<!-- 				</li> -->
					
					<li>
					    <label class="dews-ui-multilingual" for="nm_group">�򰡱׷�</label>
						<span>
						   <select id='nm_group' class='dews-ui-dropdownlist'
							data-dews-value-field='CD_EVGROUP'
							data-dews-text-field='NM_EVGROUP'
							data-dews-data-url='~/Data/help_p_whr_z_nham_eva_group/EvaGroup?tp_evlu=300'>
						</select>
					</span>
				 </li>
				</ul>
			</form>
		</div>
		<!-- ��ȸ���� �� -->

		<!-- �׸��� ���� ����  -->
		<div class="dews-grid-panel">
			<!-- ���� -->
			<div class="dews-grid-panel" id="Module_area"
				style="float: left; width: 25.3%; height: 100%;">
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
			<div class="dews-grid-panel"
				style="float: right; width: 74%; height: 100%; margin-left: 5px;">
				<div class="dews-button-group">
					<div class="dews-grid-title">
						<span>���Է�</span>
					</div>
					<button class="dews-ui-button primary dews-ui-multilingual"
						id="btn_file">÷������</button>
				</div>
				<div class="dews-grid-panel">
					<div id="grid_list" class="dews-ui-grid"></div>
				</div>
			</div>
		</div>
		<!-- �׸��� ���� �� -->

		<!-- comment ���� ���� -->
		<div class="dews-button-group">
			<div class="dews-grid-title">
				<span>���� �ǰ�</span>
			</div>
		</div>

		<div class="dews-condition-panel div-3" style="text-align: center"
			id="dataForm">
			<form class="dews-condition-form">
				<ul>
					<li class="col-3"><label for='dc_rslt1'
						class='dews-ui-multilingual' style="float: left; width: 200px">�ؾ���������,��������,���ܷ�
							����</label> <span style="float: left; width: 800px"> <textarea
								id="dc_rslt1" class="dews-ui-textbox" rows="3" name="DC_RSLT1"
								onchange="dcRsltText(1, this.value);"></textarea>
					</span></li>

					<li class="col-3"><label for='dc_rslt2'
						class='dews-ui-multilingual' style="float: left; width: 200px">�ظ�����,�ǻ�������</label>
						<span style="float: left; width: 800px"> <textarea
								id="dc_rslt2" class="dews-ui-textbox" rows="3" name="DC_RSLT2"
								onchange="dcRsltText(2, this.value);"></textarea>
					</span></li>

					<li class="col-3"><label for='dc_rslt3'
						class='dews-ui-multilingual' style="float: left; width: 200px">��������������
							����</label> <span style="float: left; width: 800px"> <textarea
								id="dc_rslt3" class="dews-ui-textbox" rows="3" name="DC_RSLT3"
								onchange="dcRsltText(3, this.value);"></textarea>
					</span></li>

					<li class="col-3"><label for='dc_rslt4'
						class='dews-ui-multilingual' style="float: left; width: 200px">�ػ�Ȱ�µ�
							����</label> <span style="float: left; width: 800px"> <textarea
								id="dc_rslt4" class="dews-ui-textbox" rows="3" name="DC_RSLT4"
								onchange="dcRsltText(4, this.value);"></textarea>
					</span></li>

					<li class="col-3"><label for='dc_rslt5'
						class='dews-ui-multilingual' style="float: left; width: 200px">�ر�Ÿ
							�����ǰ� </label> <span style="float: left; width: 800px"> <textarea
								id="dc_rslt5" class="dews-ui-textbox" rows="3" name="DC_RSLT4"
								onchange="dcRsltText(5, this.value);"></textarea>
					</span></li>

				</ul>
			</form>
		</div>

		<script>
			var grid_pipyeong, pipyeong_datasource, grid, dataSource, rsltSclDataSource, sclArr, changeData, admin, cdEvtype, pipyeongRowNum;

			dews
					.ready(function() {
						//�ʱⵥ����
						initPageData();

						var cdScaleh;
						changeData = false;
						isDeadline = false;
						pipyeongRowNum = 0;
						$("#btn_cancel_deadline").attr("disabled", "disabled");

						// �򰡱׷� SET
						// 		groupSelect();

						pipyeong_datasource = dews.ui.dataSource(
								"pipyeong_datasource", {
									batch : true, //�׸��� �����
									schema : {
										model : {
											fields : {
												NM_EVGROUP : {
													editable : false,
													type : "string"
												},
												NM_KOR : {
													editable : false,
													type : "string"
												},
												NO_EMP : {
													editable : false,
													type : "string"
												},
												YN_APPROVE : {
													editable : false,
													type : "string"
												}
											}
										}
									}
								});

						grid_pipyeong = dews.ui
								.grid(
										"#grid_pipyeong",
										{
											dataSource : pipyeong_datasource,
											editable : {
												createAt : 'bottom'
											},
											selectable : "row",
											autoBind : false,
											noData : true,
											height : 300,
											columns : [
													{
														field : "NM_EVGROUP",
														title : dews.localize
																.get("�򰡱׷��"),
														width : 70,
														align : "left",
													},
													{
														field : "NM_KOR",
														title : dews.localize
																.get("����"),
														width : 55,
													},
													{
														field : "NO_EMP",
														title : dews.localize
																.get("�����ȣ"),
														width : 65
													},
													{
														field : "YN_APPROVE",
														title : dews.localize
																.get("��������"),
														width : 65
													} ],
											dataBound : function(e) {
												this
														.select(this.element
																.find("tbody tr:eq("
																		+ pipyeongRowNum
																		+ ")"));
												var row = grid_pipyeong
														.select(); // ���� ���õ� ROW
												if (row.length < 1) {
													//�����Ͱ� ���� ��� �ʱ�ȭ
													dataSource.data([]);
													$("#btn_cancel_deadline")
															.attr("disabled",
																	"disabled");
													$("#btn_submit_deadline")
															.removeAttr(
																	"disabled");

												}
											},
											change : function(e) {
												var row, rowData, lb_evgroup, currentNo, currentGroup;
												var row = grid_pipyeong
														.select(); // ���� ���õ� ROW
												if (row.length > 0) {
													// ���� ROW�� ������ ȹ��
													rowData = grid_pipyeong
															.dataItem(row);
													pipyeongRowNum = rowData.ROW_NO - 1;
													currentNo = rowData.NO_EMP;
													currentGroup = rowData.CD_EVGROUP;
												}
												detailData(currentNo,
														currentGroup);
											}
										});

						dataSource = dews.ui.dataSource("dataSource", {
							batch : true, //�׸��� �����
							schema : {
								model : {
									fields : {
										NM_ITEM : {
											editable : false,
											type : "string"
										},
										NM_ITEM2 : {
											editable : false,
											type : "string"
										},
										NUM_ITEM : {
											editable : false,
											type : "string"
										},
										NM_SCALED : {
											editable : true,
											type : "string"
										},
										NUM_CVTRSLT : {
											editable : false,
											type : "number"
										}
									}
								}
							}
						});

						grid = dews.ui
								.grid(
										"#grid_list",
										{
											dataSource : dataSource,
											editable : {
												createAt : 'bottom'
											},
											selectable : "row",
											autoBind : false,
											noData : true,
											height : 300,
											columns : [
													{
														field : "NM_ITEM",
														title : dews.localize
																.get("�׸��"),
														width : 200,
														align : "left"
													},
													{
														field : "NM_ITEM2",
														title : dews.localize
																.get("�׸��"),
														width : 450,
														align : "left"
													},
													{
														field : "NUM_ITEM",
														title : dews.localize
																.get("����"),
														width : 100
													},
													{
														field : "CD_RSLT",
														title : dews.localize
																.get("(1��)<br>�޼���"),
														width : 100,
														hidden : true
													},
													{
														field : "NM_SCALED",
														title : dews.localize
																.get("���ڴ޼���"),
														width : 100,
														template : dews.ui.grid.templates
																.dataSource(
																		'NM_SCALED',
																		{
																			dataSourceID : 'rsltSclDataSource',
																			dataValueField : 'CD_SYSDEF',
																			dataTextField : 'NM_SYSDEF'
																		}),
														editor : function(
																container,
																options) {
															if (options.model.ROW_NO < 21) {
																dews.ui.grid.editors
																		.dropdownlist(
																				container,
																				options,
																				{
																					dataValueField : 'CD_SYSDEF',
																					dataTextField : 'NM_SYSDEF',
																					dataSource : rsltSclDataSource,
																				},
																				function(
																						data) {
																					var lb_evgroup = data.LB_EVGROUP;
																					if ((lb_evgroup == "5" && data.YN_DEADLINE4 == "Y")
																							|| (lb_evgroup == "4" && data.YN_DEADLINE3 == "Y")
																							|| (lb_evgroup == "3" && data.YN_DEADLINE2 == "Y")
																							|| (lb_evgroup == "2" && data.YN_DEADLINE1 == "Y")) {
																						return false;
																					} else {
																						return true;
																					}
																				})
															}
														}
													},
													{
														field : "NUM_CVTRSLT",
														title : dews.localize
																.get("�� ȯ������"),
														width : 100,
														format : dews.ui.grid.formats
																.number("n02"),
														attributes : {
															id : "NUM_CVTRSLT"
														}
													},
													{
														field : "CD_SCALEH",
														title : dews.localize
																.get("��ô���ڵ�"),
														width : 100,
														hidden : true
													} ],
											dataBound : function(e) {
												this
														.select(this.element
																.find("tbody tr:nth-child(1)"));
											},
											change : function(e) {
												var currentRow, rowData, rowNum = 0;

												currentRow = grid.select(); // ���� ���õ� ROW
												if (currentRow.length > 0) {
													rowData = grid
															.dataItem(currentRow); // ���� ROW�� ������ ȹ��
													rowNum = rowData.ROW_NO;

													if (rowData && rowNum < 21) {

														//������ ���� �������� SET
														deadlineSet(rowData);

														cdScaleh = rowData.CD_SCALEH;

													} else if (rowNum == 0) {
														grid.closeCell();
													}
												} else {
													dataSource3.data([]);
												}

												if (rowNum < 21) {
													rsltSclList(cdScaleh);
												}
											},
											save : function(e) {
												// �޼����� �����Ǿ����� Ȯ��
												if (e.values
														.hasOwnProperty('NM_SCALED')) { // �����ϰ��� �ϴ� �÷��� �����Ǿ����� Ȯ���ϴ� ���
													var result = rsltScmList(
															cdScaleh,
															e.values.NM_SCALED,
															e.model.NUM_ITEM);
													e.model.CD_RSLT = e.values.NM_SCALED; // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
													e.model.NUM_RSLT = result.num_ptscale
															.toFixed(2);
													e.model.NUM_CVTRSLT = result.num_cvtrslt
															.toFixed(2); // �ٸ� �Է� ���� ���� ���� �����ŵ�ϴ�.
												}
											}
										});

					}); // END dew.ready

			//��ȸ
			$("#btn_search").on(
					"click",
					function() {
						dataSource.data([]);

						dews.ajax.data(
								dews.url.getDataUrl(
										"p_whr_z_nham_eva_rslt_mlss_adm",
										"planCheck"),
								{
									async : false,
									data : {
										ym_evlu : dews.ui.dropdownlist(
												"#ym_evlu").value(),
										cd_evunit : dews.ui.dropdownlist(
												"#cd_evunit").value(),
										tp_evlu : "300"
									}
								}).done(function(result) {
							if (result[0].CNT > 0) {
								//if(dews.ui.dropdownlist('#nm_group').value()){
								headerData();
								//	}
							} else {
								dews.alert("�Ⱓ�� Ȯ�����ּ���.", "ico2");
							}
						});
					});

			//����
			$('#btn_save')
					.on(
							'click',
							function(e) {

								//������ ����üũ
								var gridData = grid.dataItems();

								if (gridData == null) {
									dews.alert("�׸��� �������� �ʽ��ϴ�.");
									return;
								}

								dews.ajax
										.data(
												dews.url
														.getDataUrl(
																"p_whr_z_cblgt_eva_rslt_mlss_adm",
																"checkData"),
												{
													async : false,
													data : {
														ym_evlu : dews.ui
																.dropdownlist(
																		"#ym_evlu")
																.value(),
														cd_evunit : dews.ui
																.dropdownlist(
																		"#cd_evunit")
																.value(),
														tp_evlu : "300",
														cd_evgroup : dews.ui
																.dropdownlist(
																		"#nm_group")
																.value(),
														cd_evtype : cdEvtype,
														chData : JSON
																.stringify(gridData),
														no_emp : admin
													}
												}).done(function(result) {
											if (result.CHANGE_CNT > 0) {
												changeData = true;
											} else {
												changeData = false;
											}
										});

								if (!changeData) {
									dews.alert("���� �� ������ �������� �ʽ��ϴ�.");
									return;
								}

								dews
										.confirm('�����Ͻðڽ��ϱ�?')
										.yes(
												function() {
													dataSource
															.batchSave(
																	dews.urlHelper
																			.getDataUrl(
																					"p_whr_z_cblgt_eva_rslt_mlss_adm",
																					"rslt1Insert"),
																	{
																		async : false,
																		data : {
																			ym_evlu : dews.ui
																					.dropdownlist(
																							"#ym_evlu")
																					.value(),
																			cd_evunit : dews.ui
																					.dropdownlist(
																							"#cd_evunit")
																					.value(),
																			tp_evlu : "300",
																			cd_evgroup : dews.ui
																					.dropdownlist(
																							"#nm_group")
																					.value(),
																			cd_evtype : cdEvtype,
																			gridData : JSON
																					.stringify(gridData),
																			no_emp : admin
																		},
																		callback : function(
																				result) {
																			if (result
																					&& result
																							.hasOwnProperty("error")) {
																				dews
																						.error(dews.localize
																								.get("������ �����Ͽ����ϴ�."));
																				console
																						.log(result.error);
																			} else {
																				dews
																						.alert(
																								dews.localize
																										.get("���� �����Ͽ����ϴ�."))
																						.done(
																								function() {
																									headerData();

																								});
																			}
																		} // end callback 
																	}); // end batchSave
												}).no(function() {
											// ������
										});
							});

			// �Է¸���
			$('#btn_submit_deadline')
					.on(
							'click',
							function(e) {
								var gridData = grid.dataItems();

								if (gridData == null) {
									dews.alert("�׸��� �������� �ʽ��ϴ�.");
									return;
								}

								//�޼��� nullüũ
								for (var i = 0; i < gridData.length - 1; i++) {
									if (!gridData[i].NM_SCALED) {
										dews.alert("���ڴ޼����� ���� �׸��� �����մϴ�.");
										return;
									}
								}

								//���� �ǰ� nullüũ
								if (!gridData[0].DC_RSLT1) {
									dews
											.alert("����������,��������,���ܷ� ���� ���� �ǰ��� �������� �ʽ��ϴ�.");
									return;
								}
								if (!gridData[0].DC_RSLT2) {
									dews.alert("������,�ǻ������� ���� �ǰ��� �������� �ʽ��ϴ�.");
									return;
								}
								if (!gridData[0].DC_RSLT3) {
									dews.alert("������������ ���� ���� �ǰ��� �������� �ʽ��ϴ�.");
									return;
								}
								if (!gridData[0].DC_RSLT4) {
									dews.alert("��Ȱ�µ� ���� ���� �ǰ��� �������� �ʽ��ϴ�.");
									return;
								}
								if (!gridData[0].DC_RSLT5) {
									dews.alert("��Ÿ �����ǰ��� �������� �ʽ��ϴ�.");
									return;
								}

								//������ ����üũ
								dews.ajax
										.data(
												dews.url
														.getDataUrl(
																"p_whr_z_cblgt_eva_rslt_mlss_adm",
																"checkData"),
												{
													async : false,
													data : {
														ym_evlu : dews.ui
																.dropdownlist(
																		"#ym_evlu")
																.value(),
														cd_evunit : dews.ui
																.dropdownlist(
																		"#cd_evunit")
																.value(),
														tp_evlu : "300",
														cd_evgroup : dews.ui
																.dropdownlist(
																		"#nm_group")
																.value(),
														cd_evtype : cdEvtype,
														chData : JSON
																.stringify(gridData),
														no_emp : admin

													}
												}).done(function(result) {
											if (result.CHANGE_CNT > 0) {
												changeData = true;
											} else {
												changeData = false;
											}
										});

								if (changeData) {
									dews.alert("���� �� �Է� ������ �����մϴ�.");
									return;
								}

								dews
										.confirm('�Է¸��� �Ͻðڽ��ϱ�?')
										.yes(
												function() {
													dataSource
															.batchSave(
																	dews.urlHelper
																			.getDataUrl(
																					"p_whr_z_cblgt_eva_rslt_mlss_adm",
																					"deadLineUpdate"),
																	{
																		async : false,
																		data : {
																			ym_evlu : dews.ui
																					.dropdownlist(
																							"#ym_evlu")
																					.value(),
																			cd_evunit : dews.ui
																					.dropdownlist(
																							"#cd_evunit")
																					.value(),
																			tp_evlu : "300",
																			cd_evgroup : dews.ui
																					.dropdownlist(
																							"#nm_group")
																					.value(),
																			cd_evtype : cdEvtype,
																			yn_deadline : "Y",
																			gridData : JSON
																					.stringify(gridData),
																			no_emp : admin
																		},
																		callback : function(
																				result) {
																			if (result
																					&& result
																							.hasOwnProperty("error")) {
																				dews
																						.error(dews.localize
																								.get("�Է¸��� �۾��� �����Ͽ����ϴ�."));
																				console
																						.log(result.error);
																			} else {
																				dews
																						.alert(
																								dews.localize
																										.get("�Է¸��� �۾��� �Ϸ�Ǿ����ϴ�."))
																						.done(
																								function() {
																									headerData();
																									$(
																											"#btn_cancel_deadline")
																											.removeAttr(
																													"disabled");
																									$(
																											"#btn_submit_deadline")
																											.attr(
																													"disabled",
																													"disabled");
																									grid
																											.closeCell();
																								});
																			}
																		} // end callback 
																	}); // end batchSave
												}).no(function() {
											// ������
										});

							});

			// �������
			$('#btn_cancel_deadline')
					.on(
							'click',
							function(e) {
								var gridData = grid.dataItems();

								if (gridData == null) {
									dews.alert("�׸��� �������� �ʽ��ϴ�.");
									return;
								}

								dews
										.confirm('������� �Ͻðڽ��ϱ�?')
										.yes(
												function() {
													dataSource
															.batchSave(
																	dews.urlHelper
																			.getDataUrl(
																					"p_whr_z_cblgt_eva_rslt_mlss_adm",
																					"deadLineUpdate"),
																	{
																		async : false,
																		data : {
																			ym_evlu : dews.ui
																					.dropdownlist(
																							"#ym_evlu")
																					.value(),
																			cd_evunit : dews.ui
																					.dropdownlist(
																							"#cd_evunit")
																					.value(),
																			tp_evlu : "300",
																			cd_evgroup : dews.ui
																					.dropdownlist(
																							"#nm_group")
																					.value(),
																			cd_evtype : cdEvtype,
																			yn_deadline : "N",
																			gridData : JSON
																					.stringify(gridData),
																			no_emp : admin
																		},
																		callback : function(
																				result) {
																			if (result
																					&& result
																							.hasOwnProperty("error")) {
																				dews
																						.error(dews.localize
																								.get("������� �۾��� �����Ͽ����ϴ�."));
																				console
																						.log(result.error);
																			} else {
																				dews
																						.alert(
																								dews.localize
																										.get("������� �۾��� �Ϸ�Ǿ����ϴ�."))
																						.done(
																								function() {
																									headerData();
																									$(
																											"#btn_submit_deadline")
																											.removeAttr(
																													"disabled");
																									$(
																											"#btn_cancel_deadline")
																											.attr(
																													"disabled",
																													"disabled");
																								});
																			}
																		} // end callback 
																	}); // end batchSave
												}).no(function() {
											// ������
										});

							});

			// ����÷��
			$('#btn_file')
					.on(
							'click',
							function(e) {
								var row = grid.select();
								var rowData = grid.dataItem(row);
								var flag = {
									flag : true
								};
								$.extend(rowData, flag);
								if (rowData) {
									var initData = {
										pIdMenu : "p_whr_z_cblgt_goal_reg", //������ �༭ �׳� ���� �ɵ��մϴ�.
										pFilePath : "",
										pCdFile : rowData.YM_EVLU + "_"
												+ rowData.CD_EVUNIT + "_"
												+ rowData.CD_EVGROUP + "_"
												+ rowData.NO_EMP + "_0",
										params : {
											data : rowData
										}
									};
									var dialog = dews.ui
											.dialog(
													'p_whr_z_cblgt_file_attach_pop',
													{
														url : "~/p_whr_z_cblgt_file_attach_pop",
														title : "÷������ ���ٿ�ε�",
														width : 800,
														height : 300,
														ifram : true,
														ok : function(data) {
														}
													});
									dialog.setInitData(initData);
									dialog.open();
								}
							});

			//���ؿ���
			$("#ym_evlu").on("change", function(e) {
				dews.ui.dropdownlist("#ym_evlu").value(e.target.value);
				ym_evlu = e.target.value;
				groupSelect();
			});

			//�򰡴���
			$("#cd_evunit").on("change", function(e) {
				dews.ui.dropdownlist("#cd_evunit").value(e.target.value);
				cd_evunit = e.target.value;
				groupSelect();
			});

			//���� �ǰ�
			function dcRsltText(num, val) {
				var data = grid.dataItem("tr:eq(0)");
				if (data) {
					if (num == 1) {
						data["DC_RSLT1"] = val;
					} else if (num == 2) {
						data["DC_RSLT2"] = val;
					} else if (num == 3) {
						data["DC_RSLT3"] = val;
					} else if (num == 4) {
						data["DC_RSLT4"] = val;
					} else {
						data["DC_RSLT5"] = val;
					}

				}

			}

			//�򰡱׷� ��ȸ
			function groupSelect() {
				dews.ajax.data(
						dews.url.getDataUrl("help_p_whr_z_cblgt_eva_group",
								"EvaGroup"),
						{
							async : false,
							data : {
								ym_evlu : dews.ui.dropdownlist("#ym_evlu")
										.value(),
								cd_evunit : dews.ui.dropdownlist("#cd_evunit")
										.value(),
								tp_evlu : "300",
								cd_evtype : cdEvtype
							}
						}).done(function(result) {
					var arr = new Array();
					//     		arr.push({CD_EVGROUP:"", NM_EVGROUP : ""});
					if (JSON.stringify(result) !== "[]" && result.length > 0) {
						for (var i = 0; i < result.length; i++) {
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

			//���ڱ���(1������, 2������) ��������
			function getCDevtype() {
				cdEvtype = ""
				dews.ajax.data(
						dews.url.getDataUrl("p_whr_z_cblgt_eva_rslt2_adm",
								"getCDevtype"),
						{
							async : false,
							data : {
								ym_evlu : dews.ui.dropdownlist("#ym_evlu")
										.value(),
								cd_evunit : dews.ui.dropdownlist('#cd_evunit')
										.value(),
								tp_evlu : "300",
								cd_evgroup : dews.ui.dropdownlist('#nm_group')
										.value()
							}
						}).done(function(result) {
					cdEvtype = result.cd_evtype;
				});

			}

			//÷������ ������ 
			/* function fileCheck(no_emp){
				var ym_evlu = dews.ui.dropdownlist("#ym_evlu").value();
				var cd_evunit = dews.ui.dropdownlist("#cd_evunit").value();
				var cd_evgroup = dews.ui.dropdownlist("#nm_group").value();
					
				dews.ajax.data(dews.url.getDataUrl("p_whr_z_cblgt_file_attach_pop","loadRealFile"),{
			   		async : false,
					data  : {
						pIdMenu: "p_whr_z_cblgt_goal_reg",
						pCdFile: ym_evlu + "_" + cd_evunit + "_" + cd_evgroup + "_" + no_emp + "_0"
			           }
			   	}).done(function(result){
			   		if(result.length > 0) {
			   			$("#btn_file").enable(true);
			   		}else {
			   			$("#btn_file").enable(false);
			   		}
			   	})
			} */// END fileCheck
			
			//�����׸��� ��ȸ
			function headerData() {

				//���ڱ��а� ��������
				getCDevtype();

				var gridData;

				dews.ajax.data(
						dews.url.getDataUrl("p_whr_z_cblgt_eva_rslt_mlss_adm",
								"getPipyeongList"),
						{
							async : false,
							data : {
								ym_evlu : dews.ui.dropdownlist("#ym_evlu")
										.value(),
								cd_evunit : dews.ui.dropdownlist('#cd_evunit')
										.value(),
								tp_evlu : "300",
								cd_evgroup : dews.ui.dropdownlist('#nm_group')
										.value()
							}
						}).done(function(result) {
					if (result.length > 0) {
						gridData = result;
					}
				});

				grid_pipyeong.dataSource.data(gridData);
			}

			//�����׸��� ��ȸ
			function detailData(currentNo, currentGroup) {
				var gridData;

				dews.ajax
						.data(
								dews.url.getDataUrl(
										"p_whr_z_cblgt_eva_rslt_mlss_adm",
										"getList"),
								{
									async : false,
									data : {
										ym_evlu : dews.ui.dropdownlist(
												"#ym_evlu").value(),
										cd_evunit : dews.ui.dropdownlist(
												'#cd_evunit').value(),
										tp_evlu : "300",
										cd_evgroup : dews.ui.dropdownlist(
												'#nm_group').value(),
										s_cd_evgroup : currentGroup,
										s_no_emp : currentNo
									}
								})
						.done(
								function(result) {
									if (result.length > 0) {
										for (var i = 0; i < result.length; i++) {
											var lb_evgroup = result[i].LB_EVGROUP;
											var cd_evtype = result[i].CD_EVTYPE;
											var seq = result[i].NO_ITEMSEQ;
											if (i == 0) {
												dews.ui
														.textbox("#dc_rslt1")
														.text(
																result[i].DC_RSLT1);
												dews.ui
														.textbox("#dc_rslt2")
														.text(
																result[i].DC_RSLT2);
												dews.ui
														.textbox("#dc_rslt3")
														.text(
																result[i].DC_RSLT3);
												dews.ui
														.textbox("#dc_rslt4")
														.text(
																result[i].DC_RSLT4);
												dews.ui
														.textbox("#dc_rslt5")
														.text(
																result[i].DC_RSLT5);

											}
											if (seq != 99) {
												if (lb_evgroup == 5) {
													result[i].CD_RSLT = result[i].CD_RSLT4;
													result[i].NUM_RSLT = result[i].NUM_RSLT4;
													result[i].NM_SCALED = result[i].NM_SCALED4;
													result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT4;
												} else if (lb_evgroup == 4) {
													result[i].CD_RSLT = result[i].CD_RSLT3;
													result[i].NUM_RSLT = result[i].NUM_RSLT3;
													result[i].NM_SCALED = result[i].NM_SCALED3;
													result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT3;
												} else if (lb_evgroup == 3) {
													result[i].CD_RSLT = result[i].CD_RSLT2;
													result[i].NUM_RSLT = result[i].NUM_RSLT2;
													result[i].NM_SCALED = result[i].NM_SCALED2;
													result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT2;
												} else if (lb_evgroup == 2) {
													result[i].CD_RSLT = result[i].CD_RSLT1;
													result[i].NUM_RSLT = result[i].NUM_RSLT1;
													result[i].NM_SCALED = result[i].NM_SCALED1;
													result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT1;
												}
											} else {
												result[i].NM_SCALED = "-";
												if (lb_evgroup == 5) {
													result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT4;
												} else if (lb_evgroup == 4) {
													result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT3;
												} else if (lb_evgroup == 3) {
													result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT2;
												} else if (lb_evgroup == 2) {
													result[i].NUM_CVTRSLT = result[i].NUM_CVTRSLT1;
												}
											}
										}
										gridData = result;

										//	fileCheck(no_emp);
									} else {
										dataSource.data([]);
									}
								});
				grid.dataSource.data(gridData);
			}

			//�޼���SET
			function rsltSclList(cd_scaleh) {
				dews.ajax.data(
						dews.url.getDataUrl("p_whr_z_cblgt_eva_rslt_mlss",
								"rsltSclList"),
						{
							async : false,
							data : {
								ym_evlu : dews.ui.dropdownlist("#ym_evlu")
										.value(),
								cd_scaleh : cd_scaleh
							}
						}).done(function(result) {
					sclArr = new Array();
					//     		sclArr.push({CD_SYSDEF:"", NM_SYSDEF : ""});
					if (JSON.stringify(result) !== "[]" && result.length > 0) {
						for (var i = 0; i < result.length; i++) {
							data = {
								CD_SYSDEF : result[i].CODE,
								NM_SYSDEF : result[i].NAME
							}
							sclArr.push(data);
						}
					}
				});

				rsltSclDataSource = dews.ui.dataSource("rsltSclDataSource", {
					data : sclArr
				});

			}

			//�޼����� ���� ȯ������ SET
			function rsltScmList(cd_scaleh, cd_scaled, num_item) {
				var num_ptscale, num_cvtrslt;
				dews.ajax.data(
						dews.url.getDataUrl("p_whr_z_cblgt_eva_rslt_mlss",
								"rsltScmList"),
						{
							async : false,
							data : {
								ym_evlu : dews.ui.dropdownlist("#ym_evlu")
										.value(),
								cd_scaleh : cd_scaleh,
								cd_scaled : cd_scaled
							}
						}).done(
						function(result) {
							if (JSON.stringify(result) !== "[]"
									&& result.length > 0) {
								num_ptscale = result[0].NUM_PTSCALE;
								num_cvtrslt = num_ptscale; //(num_item/100) * num_ptscale;
								$("tr.k-state-selected td#NUM_CVTRSLT").text(
										num_cvtrslt.toFixed(2));
							}
						});
				return {
					num_ptscale : num_ptscale,
					num_cvtrslt : num_cvtrslt
				};

			}

			//������ ���� �������� SET
			function deadlineSet(rowData) {
				if ((rowData.LB_EVGROUP == 5 && rowData.YN_DEADLINE4 == "Y")
						|| (rowData.LB_EVGROUP == 4 && rowData.YN_DEADLINE3 == "Y")
						|| (rowData.LB_EVGROUP == 3 && rowData.YN_DEADLINE2 == "Y")
						|| (rowData.LB_EVGROUP == 2 && rowData.YN_DEADLINE1 == "Y")) {
					$("#btn_cancel_deadline").removeAttr("disabled");
					$("#btn_submit_deadline").attr("disabled", "disabled");
					$("#btn_save").attr("disabled", "disabled");
					grid.closeCell();
				} else {
					$("#btn_save").removeAttr("disabled");
					$("#btn_cancel_deadline").attr("disabled", "disabled");
					$("#btn_submit_deadline").removeAttr("disabled");
				}
			}

			function initPageData() {
				dews.ajax.data(
						dews.url.getDataUrl("CommonData", "getCurrentUser"), {
							async : false
						}).done(function(currentUser) {
					no_emp = currentUser.NO_EMP;
				});
			}
		</script>
		<script src="scripts/util.js"></script>
		<script id="customize">
			dews.ready(function() {
				/* grid = util.customize.initCustomizeGrid(grid); */
				//util.customize.initCustomizeLabel();
			});
		</script>

	</tiles:putAttribute>
</tiles:insertDefinition>


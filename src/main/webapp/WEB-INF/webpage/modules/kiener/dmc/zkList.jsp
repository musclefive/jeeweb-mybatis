<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%--<meta name="decorator" content="single"/>--%>
	<title>ZKG List</title>

	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="${staticPath}/assets/css/bootstrap.min.css" />
	<!--<link rel="stylesheet" href="../assets/css/font-awesome.min.css" />-->
	<link rel="stylesheet" href="${staticPath}/assets/css/font-awesome.min.css" />

	<!-- page specific plugin styles -->
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/datatable/buttons.bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/datatable/TableTools.css">
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/bootstrap-datetimepicker.css" />
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/chosen.css" />

	<!-- text fonts -->
	<link rel="stylesheet" href="${staticPath}/assets/css/ace-fonts.css" />

	<!-- ace styles -->
	<link rel="stylesheet" href="${staticPath}/assets/css/ace.min.css"/>

</head>
<body class="no-skin">
<div class="main-container" id="main-container">

	<div class="main-content">
		<!-- /section:basics/content.breadcrumbs -->
		<div class="page-content">

			<div class="page-content-area">
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="space-6"></div>

						<div class="row">
							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active">
										<a data-toggle="tab" href="#divZKList">
											<i class="blue ace-icon fa fa-tachometer bigger-110"></i>
											<span id="spanCount">缸盖发交数量 </span>
										</a>
									</li>

									<li>
										<a data-toggle="tab" href="#divZKGQuery">
											<i class="pink ace-icon fa fa-bar-chart-o bigger-110"></i>
											缸盖查询
										</a>
									</li>
								</ul>

								<div class="tab-content">

									<div id="divZKList" class="tab-pane in active">

										<div class="space-6"></div>
										<div class="row">
											<div class="col-sm-12 table-bordered border">
												<div class="row">
													<div class="col-sm-2">
														<label>&nbsp;From:&nbsp;</label>
														<div class="input-group">
															<input id="date-timepicker-start" type="text" class="form-control" placeholder="Start Time" />
															<span class="input-group-addon">
																<i class="fa fa-clock-o bigger-110"></i>
															</span>
														</div>
													</div>
													<div class="col-sm-2">
														<label>&nbsp;To:&nbsp;</label>

														<div class="input-group">
															<input id="date-timepicker-end" type="text" class="form-control" placeholder="End Time" />
															<span class="input-group-addon">
																<i class="fa fa-clock-o bigger-110"></i>
															</span>
														</div>
													</div>
													<div class="col-sm-3">
														<label>&nbsp;Shift:&nbsp;</label>

														<div class="form-inline padding-0">
															<!-- #section:custom/checkbox -->
															<div class="checkbox">
																<label>
																	<input name="shift-checkbox" type="checkbox" class="ace ace-checkbox-2" value="shift_1" checked/>
																	<span class="lbl">一班</span>
																</label>
															</div>

															<div class="checkbox">
																<label>
																	<input name="shift-checkbox" type="checkbox" class="ace ace-checkbox-2" value="shift_2" checked/>
																	<span class="lbl">二班</span>
																</label>
															</div>

															<div class="checkbox">
																<label>
																	<input name="shift-checkbox" type="checkbox" class="ace ace-checkbox-2"  value="shift_3"/>
																	<span class="lbl">三班</span>
																</label>
															</div>

															<!-- /section:custom/checkbox -->
														</div>

													</div>

													<div class="col-sm-3">
														<br/>
														<!-- #section:plugins/date-time.datetimepicker -->
														<button class="btn btn-sm btn-success" id="btnQuery">
															查询
															<i class="ace-icon fa fa-search icon-on-right bigger-110"></i>
														</button>
														<button class="btn btn-sm btn-warning" id="btnClear">
															<i class="ace-icon fa fa-undo bigger-110"></i>
															清除
														</button>
													</div>
												</div>
												<div class="space-6"></div>
											</div>
										</div>
										<div class="space-6"></div>

										<div class="row">
											<table id="tableZKList" class="table table-striped table-bordered table-hover">

											</table>
											<div class="modal fade" id="ZKDetialModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
															<h4 class="modal-title" id="myModalLabel">
																<label>缸盖详细信息</label>
															</h4>
														</div>
														<div class="modal-body">
															<table id="tableZKGDetailList" class="table table-striped table-bordered table-hover">

															</table>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn " data-dismiss="modal" id="btnClose">Close</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div id="divZKGQuery" class="tab-pane fade">
										<div class="space-6"></div>
										<div class="row">
											<div class="col-sm-12 table-bordered border">
												<div class="row">
													<div class="col-sm-4">
														<%--<textarea id="form-field-11" class="autosize-transition form-control"></textarea>--%>
														<textarea class="form-control" rows="25" id="txtDMCList" placeholder="Input Example
														0CC260118224837106L103064B_"></textarea>
														<br/>
														<!-- #section:plugins/date-time.datetimepicker -->
														<button class="btn btn-sm btn-success" id="btnQueryByDMC">
															查询
															<i class="ace-icon fa fa-search icon-on-right bigger-110"></i>
														</button>
													</div>

													<div class="col-sm-8">

														<table id="tableZKQueryList" class="table table-striped table-bordered table-hover">

														</table>
													</div>

												</div>
												<div class="space-6"></div>
											</div>
										</div>
										<div class="space-6"></div>
										<div class="row">

										</div>
									</div>

								</div>
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content-area -->

		</div><!-- /.page-content -->
	</div><!-- /.main-content -->

</div><!-- /.main-container -->
<!-- 闁稿繈鍔岄惇鐞穝 -->
<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

<!-- 闁煎浜滈悾鐐▕婵夌灚 -->
<script src="${staticPath}/assets/js/jquery.min.js"></script>
<script src="${staticPath}/assets/js/bootstrap.min.js"></script>
<script src="${staticPath}/assets/js/jquery.dataTables.min.js"></script>
<script src="${staticPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="${staticPath}/assets/js/tableexport/TableTools.js"></script>
<script src="${staticPath}/assets/js/tableexport/ZeroClipboard.js"></script>
<script src="${staticPath}/assets/js/date-time/moment.min.js"></script>
<script src="${staticPath}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script>
<script src="${staticPath}/assets/js/ace.min.js"></script>
<script src="${staticPath}/assets/js/ace-elements.min.js"></script>
<script src="${staticPath}/assets/js/chosen.jquery.min.js"></script>
<script src="${staticPath}/assets/js/highcharts/highcharts.js"></script>
<script src="${staticPath}/assets/js/highcharts/exporting.js"></script>
<script src="${staticPath}/assets/js/jquery.blockUI.js"></script>
<script src="${staticPath}/assets/js/jquery.autosize.min.js"></script>

<script type="text/javascript">

	var tableList;
	var tableDetailList;
	var tableQueryList;
	var minTakt = "";
	var maxTakt = "";
	var station = "590";

	$.blockUI.defaults.message = '<h4><img style="height: 30px;width: 30px" src="${staticPath}/assets/img/loading.gif" /> Just a moment...</h4>';
	$.blockUI.defaults.overlayCSS.opacity = .2;
	$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

	$(document).ready(function() {

		$('#date-timepicker-start').datetimepicker({
			"maxDate" : moment().subtract(-1, "days"),
//				"sideBySide" : true,
			"viewDate" : true,
			"format" : "YYYY-MM-DD HH:mm",
			"defaultDate" : moment().format("YYYY-MM-DD 07:30")
//				"format" : "YYYY-MM-DD HH:mm"
//				"minDate" : moment().subtract(8, "days")
		});
		$('#date-timepicker-end').datetimepicker({
			"maxDate" : moment().subtract(-1, "days"),
//				"sideBySide" : true,
			"viewDate" : true,
			"format" : "YYYY-MM-DD HH:mm",
			"defaultDate" : moment().subtract(-1,"days").format("YYYY-MM-DD 01:30")
//				"format" : "YYYY-MM-DD HH:mm"
//				"minDate" : moment().subtract(8, "days")
		});

		$('textarea[class*=autosize]').autosize({append: "\n"});


		/*
		 * all the check box for shift query setting
		 * */
		$("input[type='checkbox'][name='shift-checkbox']").click(function(){
			var shift_1_flag = false;
			var shift_2_flag = false;
			var shift_3_flag = false;

			$("input[type='checkbox'][name='shift-checkbox']").each(function (i,e){
				console.info(i + " " + $(this).val() + " : " + $(this).is(':checked'));
//					shift-1
				if($(this).val() == "shift_1" && $(this).is(':checked')){
					shift_1_flag = true;
				}else if ($(this).val() == "shift_2" && $(this).is(':checked')){
					shift_2_flag = true;
				}else if ($(this).val() == "shift_3" && $(this).is(':checked')){
					shift_3_flag = true;
				}
			});

			console.info("shift_1:" + shift_1_flag + " shift_2:" + shift_2_flag + " shift_3:" + shift_3_flag)
			if(shift_1_flag && shift_2_flag && shift_3_flag){
				//query for all the 3 shift
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(-1, "days").format("YYYY-MM-DD 07:30");

				$("#date-timepicker-end").val(ShiftDate);
			}else if(shift_1_flag && shift_2_flag && !shift_3_flag){
				//query for all the 2 shifts by default
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(-1, "days").format("YYYY-MM-DD 01:30");

				$("#date-timepicker-end").val(ShiftDate);

			}else if(shift_1_flag && !shift_2_flag && !shift_3_flag){
				//query for only the first shift
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(0, "days").format("YYYY-MM-DD 16:30");

				$("#date-timepicker-end").val(ShiftDate);

			}else if(!shift_1_flag && shift_2_flag && !shift_3_flag){
				//query only the second shift
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(0, "days").format("YYYY-MM-DD 16:30");
				$("#date-timepicker-start").val(ShiftDate);
			}else if(!shift_1_flag && !shift_2_flag && shift_3_flag){
				//query only the third shift

			}else if(!shift_1_flag && !shift_2_flag && !shift_3_flag){
				//default select the first and second shift
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(-1, "days").format("YYYY-MM-DD 01:30");

				$("#date-timepicker-end").val(ShiftDate);
			}
		});


		$("#btnQuery").click(function() {
			var startDate = $("#date-timepicker-start").val();
			var endDate = $("#date-timepicker-end").val();
			//default value
//				var selectType = $("#selectType").find("option:selected").val();
			console.info("query data startDate:" + startDate + " endDate:" + endDate);
			if (startDate == "" || endDate == "") {
				return false;
			}

			if(tableList){
				$('#tableZKList').dataTable().fnDestroy();
			}
			initTable(startDate,endDate,station);
		});

		$("#btnQueryByDMC").click(function() {
			var data = $("#txtDMCList").val();

			if (data == "" ) {
				return false;
			}

			if(tableQueryList){
				$('#tableZKQueryList').dataTable().fnDestroy();
			}
			initQueryTable(data, "list");

		});

		$("#btnClear").click(function(){
			$("#date-timepicker-start").val("");
			$("#date-timepicker-end").val("");
		});

	});


	function initTable(start, end, station){
//			console.info("inti table :" + dataResult.length);
		tableList = $('#tableZKList').dataTable( {
			"dom": '<"row"<"col-sm-8 "l><"col-sm-2 "f><"col-sm-2 "T>>t<"row"<"col-sm-6"i><"col-sm-6"p>>',
			oTableTools: {
				"aButtons": [
					{
						"sExtends": "copy",
						"sButtonText": "Copy"
					},
					{
						"sExtends": "xls",
						"sButtonText": "Excel"
					}
				]
			},
			"language" :{
				"zeroRecords" : "No Record for this period"
			},
			"ajax": {
				"url" : "${adminPath}/kiener/dmc/ajaxList_dmc_zk_kw?measureDate="+start +
				"&endDate=" + end + "&station=" + station,
				"dataSrc" : "results",
//					"success": fnCallback,
				"timeout": 35000,   // optional if you want to handle timeouts (which you should)
				"error": handleAjaxError // this sets up jQuery to give me errors
			},
			bAutoWidth: false,
//								"aoColumns": [
//									{ "bSortable": false },
//									null, null,null, null, null,
//									{ "bSortable": false }
//								],
//								"aaSorting": [],
			"createdRow":function(row,data, index){
//					console.info(data['summary'] + data['summary'] > 1);
				if (data['summary'] > 1){
					$('td',row).eq(0).css('backgroundColor','#FFFF00');
//						$(row).css('backgroundColor','#FFFF00');
				}
			},
			"fnDrawCallback" : function(object){
				$("#spanCount").html("缸盖发交数量(" + object.aoData.length + ")");
				console.info("count:" + object.aoData.length);
			},
			"order": [[ 5, "desc" ]],
			"columns":[
				{
					"data": "partNumber",
					"sTitle":"发动机号"
				},
				{
					"data": "variety",
					"sTitle":"机型",
					"render": function(data, type, row) {
						return data.substring(1);
					}
				},
				{
					"data": "measureDate",
					"sTitle":"发动机上线时间"
				},

				{
					"data": "dmc",
					"sTitle":"缸盖型号",
					"render": function(data, type, row) {
						var queryType = "single";
						var str = "<a href=javascript:submitData('" + data +"','"+queryType+"'); >" + data.substring(16); + "</a>";
						return str;
					}
				},
				{
					"data": "dmc",
					"sTitle":"缸盖生产时间",
					"render": function(data, type, row) {
						return moment(data.substring(3,15),"DDMMYYhhmmss").format("YYYY-MM-DD HH:mm:ss");
					}
				},
				{
					"data": "summary",
					"sTitle":"重复上线次数"
				}
			]
		} );
	}

	function initQueryTable(data, queryType){
//			console.info("inti table :" + dataResult.length);
		tableQueryList = $('#tableZKQueryList').dataTable( {
			"dom": '<"row"<"col-sm-4 "l><"col-sm-4 "f><"col-sm-4 "T>>t<"row"<"col-sm-6"i><"col-sm-6"p>>',
			"language" :{
				"zeroRecords" : "No Record for this period"
			},
			oTableTools: {
				"aButtons": [
					{
						"sExtends": "copy",
						"sButtonText": "Copy"
					},
					{
						"sExtends": "xls",
						"sButtonText": "Excel"
					}
				]
			},
			"destroy":true, //every time will destroy the table when the function is recalled
			"ajax": {
				"url" : "${adminPath}/kiener/dmc/ajaxList_dmc_single",
				"type" : "POST",
				"data" : {"dmc" : data,"queryType" : queryType,"station":station},
				"dataSrc" : "single"
			},
			"paging":true,
			"searching":true,
			bAutoWidth: false,
			"columns":[{
				"data": "partNumber",
				"sTitle":"发动机号"
			},
				{
					"data": "variety",
					"sTitle":"机型",
					"render": function(data, type, row) {
						return data.substring(1);
					}
				},
				{
					"data": "measureDate",
					"sTitle":"发动机上线时间"
				},
//				{
//					"data": "dmcNew",
//					"sTitle":"缸体型号",
//					"render": function(data, type, row) {
//						data.substring(0,11);
//					}
//				},
				{
					"data": "dmcNew",
					"sTitle":"缸体ID号"
				}
			]
		} );
	}

	function submitData(data,queryType){

		$("#ZKDetialModal").modal('show');
		tableDetailList = $('#tableZKGDetailList').dataTable( {
			"language" :{
				"zeroRecords" : "No Record for this period"
			},
			"destroy":true, //every time will destroy the table when the function is recalled
			"ajax": {
				"url" : "${adminPath}/kiener/dmc/ajaxList_dmc_single",
				"type" : "POST",
				"data" : {"dmc" : data,"queryType" : queryType, "station":station},
				"dataSrc" : "single"
			},
			"paging":false,
			"searching":false,
			bAutoWidth: false,
			"columns":[
				{
					"data": "partNumber",
					"sTitle":"发动机号"
				},
				{
					"data": "variety",
					"sTitle":"机型",
					"render": function(data, type, row) {
						return data.substring(1);
					}
				},
				{
					"data": "measureDate",
					"sTitle":"发动机上线时间"
				},
				{
					"data": "dmcNew",
					"sTitle":"缸盖ID号"
				}
			]
		} );

	}

	function handleAjaxError( xhr, textStatus, error ) {
		if ( textStatus === 'timeout' ) {
			alert( 'The server took too long to send the data.' );
		}
		else {
			alert( 'An error occurred on the server. Please try again again.');
		}

//			$('.dataTable').dataTable().fnProcessingIndicator( false );
	}


</script>

</body>

</html>
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
							<div class="col-sm-12 table-bordered border">
								<div class="row">
									<%--<div class="col-sm-2">--%>
										<%--<label>&nbsp;缸体型号:&nbsp;</label>--%>
										<%--<select class="form-control" id="selectType">--%>
											<%--<option value="all">All Type</option>--%>
											<%--<option value="06H103011BA">06H103011BA</option>--%>
											<%--<option value="06H103011BB">06H103011BB</option>--%>
											<%--<option value="06K103011AE">06K103011AE</option>--%>
											<%--<option value="06K103011AF">06K103011AF</option>--%>
											<%--<option value="06K103011CP">06K103011CP</option>--%>
											<%--<option value="06H103011BG">06H103011BG</option>--%>
										<%--</select>--%>
									<%--</div>--%>
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
							<table id="tableZKGList" class="table table-striped table-bordered table-hover">

							</table>

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

	<script type="text/javascript">

		var tableList;
		var minTakt = "";
		var maxTakt = "";

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
					$('#tableZKGList').dataTable().fnDestroy();
				}
				initTable(startDate,endDate,"");
			});

			$("#btnClear").click(function(){
				$("#date-timepicker-start").val("");
				$("#date-timepicker-end").val("");
			});

		});


		function initTable(start, end, type){
//			console.info("inti table :" + dataResult.length);
			tableList = $('#tableZKGList').dataTable( {
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
					"url" : "${adminPath}/kiener/dmc/ajaxList_dmc_zkg?measureDate="+start +
					"&endDate=" + end + "&type=" + type,
					"dataSrc" : "results"
				},
				bAutoWidth: false,
//								"aoColumns": [
//									{ "bSortable": false },
//									null, null,null, null, null,
//									{ "bSortable": false }
//								],
//								"aaSorting": [],
				"columns":[
					{
						"data": "partNumber",
						"sTitle":"发动机号"
//						"render": function(data, type, row) {
////							var url = "cc";
//							return "<a href='../taketime/single/"+data+"' target='_self'>" + data+ "</a>";
//						}
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
						"sTitle":"缸体ID号",
						"render": function(data, type, row) {
							return data.substring(11,19);
						}
					},
					{
						"data": "dmcNew",
						"sTitle":"缸体型号",
						"render": function(data, type, row) {
							return data.substring(0,11);
						}
					},
					//					11 11 17 05 03 38
					{
						"data": "dmc",
						"sTitle":"缸体生产日期",
						"render": function(data, type, row) {
							return moment(data.substring(3,15),"DDMMYYhhmmss").format("YYYY-MM-DD HH:mm:ss");
						}
					},
					{
						"data": "dmcNew",
						"sTitle":"分级",
						"render": function(data, type, row) {
							return data.substring(data.length-5);
						}
					}
				]
			} );

		}


	</script>

</body>

</html>
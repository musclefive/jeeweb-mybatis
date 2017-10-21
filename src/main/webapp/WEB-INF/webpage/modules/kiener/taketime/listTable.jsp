<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>Takt Time</title>

	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="${staticPath}/assets/css/bootstrap.min.css" />
	<!--<link rel="stylesheet" href="../assets/css/font-awesome.min.css" />-->
	<link rel="stylesheet" href="${staticPath}/assets/css/font-awesome.min.css" />

	<!-- page specific plugin styles -->
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/datatable/buttons.bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/datatable/TableTools.css">
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/bootstrap-datetimepicker.css" />

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
							<div class="col-sm-12">
								<div class="form-inline">
									<!-- #section:plugins/date-time.datetimepicker -->

									<label>&nbsp;From:&nbsp;</label>
									<div class="input-group">
										<input id="date-timepicker-start" type="text" class="form-control" placeholder="Start Time" />
										<span class="input-group-addon">
											<i class="fa fa-clock-o bigger-110"></i>
										</span>
									</div>
									<label>&nbsp;To:&nbsp;</label>

									<div class="input-group">
										<input id="date-timepicker-end" type="text" class="form-control" placeholder="End Time" />
										<span class="input-group-addon">
											<i class="fa fa-clock-o bigger-110"></i>
										</span>
									</div>

									<button class="btn btn-sm btn-success" id="btnQuery">
										<i class="ace-icon fa fa-refresh bigger-110"></i>
										Reload
									</button>
									<button class="btn btn-sm btn-warning" id="btnClear">
										<i class="ace-icon fa fa-undo bigger-110"></i>
										Undo
									</button>
								</div>
							</div>
						</div>
						<div class="space-6"></div>
						<div class="row">
							<div class="col-xs-12">
								<table id="tableTakttime" class="table table-striped table-bordered table-hover">

								</table>

							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content-area -->

		</div><!-- /.page-content -->
	</div><!-- /.main-content -->

</div><!-- /.main-container -->
<!-- 全局js -->
	<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

	<!-- 自定义js -->
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

	<script type="text/javascript">

		var tableList;

		$(document).ready(function() {

			$('#date-timepicker-start').datetimepicker({
				"maxDate" : moment().subtract(1, "days"),
				"sideBySide" : true,
				"viewDate" : true,
//				"format" : "YYYY-MM-DD"
				"format" : "YYYY-MM-DD h:mm"
//				"minDate" : moment().subtract(8, "days")
			});
			$('#date-timepicker-end').datetimepicker({
				"maxDate" : moment().subtract(1, "days"),
			"sideBySide" : true,
				"format" : "YYYY-MM-DD h:mm"
//			"minDate" : moment().subtract(8, "days")
			});

//			$("#btnQuery").click(function() {
//				var startDate = $("#date-timepicker-start").val();
//				var endDate = $("#date-timepicker-end").val();
//
//				if (startDate == "" || endDate == "") {
//					return false;
//				}
////				startDate = startDate + " 06:30";
////				endDate = endDate + " 06:30";
//				console.info("startDate: " + startDate + "  to : " + endDate );
//
//				//如果table 已经存在 则先注销
//				if(tableList){
//					$('#tableTakttime').dataTable().fnDestroy();
//				}
//				initTable(startDate,endDate);
//			});

			$("#btnClear").click(function(){
				$("#date-timepicker-start").val("");
				$("#date-timepicker-end").val("");
			});

			initTable("2017-08-10 06:30","2017-08-17 06:30");
		});

		function initTable(start, end){
			tableList = $('#tableTakttime').dataTable( {
				"dom": '<"row"<"col-sm-8 "l><"col-sm-2 "f><"col-sm-2 "T>>t<"row"<"col-sm-6"i><"col-sm-6"p>>',
				oTableTools: {
					"aButtons": [
						{
							"sExtends": "copy",
							"sButtonText": "复制"
						},
						{
							"sExtends": "xls",
							"sButtonText": "导出"
						}
					]
				},
				"ajax": {
					"url" : "${adminPath}/kiener/taketime/ajaxList_takttime?measureDate="+start + "&endDate=" + end,
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
						"data": "id",
						"sTitle":"id"
					},
					{
						"data": "partNumber",
						"sTitle":"partNumber",
						"render": function(data, type, row) {
//							var url = "cc";
							return "<a href='../single/"+data+"' target='_self'>" + data+ "</a>";
						}
					},
					{
						"data": "station",
						"sTitle":"station"
					},
					{
						"data": "currentType",
						"sTitle":"currentType",
						"render": function(data, type, row) {
							return data.substring(1);
						}
					},
					{
						"data": "nextType",
						"sTitle":"nextType",
						"render": function(data, type, row) {
							return data.substring(1);
						}
					},
					{
						"data": "measureDate",
						"sTitle":"start time"
					},
					{
						"data": "endDate",
						"sTitle":"end time"
					},
					{
						"data": "takeTime",
						"sTitle":"taktime"
					},
					{
						"data": "changeType",
						"sTitle":"change Type"
					}
				]
			} );

		}


	</script>

</body>

</html>
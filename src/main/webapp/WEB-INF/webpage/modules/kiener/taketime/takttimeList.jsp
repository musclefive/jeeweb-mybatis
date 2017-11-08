<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>Takt Time List</title>

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
									<div class="col-sm-2">
										<label for="selectStationType">Chosen</label>

										<br />
										<select class="chosen-select" id="selectStationType" data-placeholder="Choose a Station...">
										</select>
									</div>
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
									<div class="col-sm-2">
										<br/>
										<!-- #section:plugins/date-time.datetimepicker -->
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
						</div>
						<div class="space-6"></div>
						<div class="row">

							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab3">
									<li class="active">
										<a data-toggle="tab" href="#home3">
											<i class="pink ace-icon fa fa-tachometer bigger-110"></i>
											Home
										</a>
									</li>

									<li>
										<a data-toggle="tab" href="#profile3">
											<i class="blue ace-icon fa fa-user bigger-110"></i>
											Profile
										</a>
									</li>
								</ul>

								<div class="tab-content">
									<div id="home3" class="tab-pane in active">
										<table id="tableTakttime" class="table table-striped table-bordered table-hover">

										</table>
									</div>

									<div id="profile3" class="tab-pane">
										<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
										<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
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
<!-- 鍏ㄥ眬js -->
	<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

	<!-- 鑷畾涔塲s -->
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

	<script type="text/javascript">

		var tableList;

		$(document).ready(function() {


			$('#date-timepicker-start').datetimepicker({
				"maxDate" : moment().subtract(1, "days"),
				"sideBySide" : true,
				"viewDate" : true,
//				"format" : "YYYY-MM-DD"
				"format" : "YYYY-MM-DD HH:mm"
//				"minDate" : moment().subtract(8, "days")
			});
			$('#date-timepicker-end').datetimepicker({
				"maxDate" : moment().subtract(1, "days"),
			"sideBySide" : true,
				"format" : "YYYY-MM-DD HH:mm"
//			"minDate" : moment().subtract(8, "days")
			});

			$.ajax({
				type : "post",
				url : "${adminPath}/kiener/station/ajaxList_station",
				dataType : "json",
				success : function(data) {
					if(data.results.length == 0){
						//handle empty

					}else{
						var record = data.results;
						console.info("record:" + record.length);
						$("#selectStationType").empty();
						$("#selectStationType").append("<option value=''>  </option>");

						for(var i = 0; i < record.length; i++) {
							var text =  record[i]["type"] + record[i]["identifier"];
							var value = record[i]["identifier"];
//							console.info(text);
							$("#selectStationType").append("<option value='"+value+"'>"+text+"</option>");
						}
						$("#selectStationType").chosen({allow_single_deselect:true});

						$("#selectStationType").off('resize.chosen').on('resize.chosen', function() {
							$('.chosen-select').each(function() {
								var $this = $(this);
								$this.next().css({'width': $this.parent().width()});
							})
						}).trigger('resize.chosen');
					}
//					console.info(val_avgTakTime);
//					console.info(val_station);
				}
			});


			$("#btnQuery").click(function() {
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
				var selectStation = $("#selectStationType").find("option:selected").val();
				console.info("query data startDate:" + startDate + " endDate:" + endDate + " selectStation:" + selectStation);
				if (startDate == "" || endDate == "" || selectStation == "") {
					return false;
				}
//				startDate = startDate + " 06:30";
//				endDate = endDate + " 06:30";

				if(tableList){
					$('#tableTakttime').dataTable().fnDestroy();
				}
				initTable(startDate,endDate, selectStation);
			});

			$("#btnClear").click(function(){
				$("#date-timepicker-start").val("");
				$("#date-timepicker-end").val("");
			});

//			initTable("2017-08-10 06:30","2017-08-17 06:30");
		});

		function initTable(start, end, station){
			tableList = $('#tableTakttime').dataTable( {
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
				"ajax": {
					"url" : "${adminPath}/kiener/taketime/ajaxList_takttime?measureDate="+start + "&endDate=" + end + "&station=" + station,
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
							return "<a href='../taketime/single/"+data+"' target='_self'>" + data+ "</a>";
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
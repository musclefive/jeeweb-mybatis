<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>Engine List </title>

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
						<div class="space-10"></div>
						<div class="row">
							<div class="col-sm-12">
								<div class="row">
									<!-- #section:plugins/date-time.datetimepicker -->
									<div class="col-sm-2">
										<label for="selectStationType">Station</label>

										<br />
										<select class="chosen-select" id="selectStationType" data-placeholder="Select">
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

									<%--<div class="col-sm-1">--%>

									<%--</div>--%>

									<%--<div class="col-sm-1">--%>

									<%--</div>--%>
									<div class="col-sm-1">
										<label>&nbsp;&nbsp;</label><br/>
										<button class="btn btn-sm btn-success" id="btnQuery">
											<i class="ace-icon fa fa-refresh bigger-110"></i>
											Query
										</button>
									</div>
									<%--<button class="btn btn-sm btn-warning" id="btnClear">--%>
										<%--<i class="ace-icon fa fa-undo bigger-110"></i>--%>
										<%--Undo--%>
									<%--</button>--%>
								</div>
							</div>
						</div>
						<div class="space-20"></div>
						<div class="row" id="divShowChart">
							<div class="col-xs-12">
								<table id="tableEngineList" class="table table-striped table-bordered table-hover">

								</table>
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content-area -->

		</div><!-- /.page-content -->
	</div><!-- /.main-content -->

</div><!-- /.main-container -->
<!-- 闂佺绻堥崝宀勬儑閻炵 -->
	<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

	<!-- 闂佺厧顨庢禍婊堟偩閻愵剛鈻曞┑澶岀仛 -->
	<script src="${staticPath}/assets/js/jquery.min.js"></script>
	<script src="${staticPath}/assets/js/bootstrap.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
	<script src="${staticPath}/assets/js/tableexport/TableTools.js"></script>
	<script src="${staticPath}/assets/js/tableexport/ZeroClipboard.js"></script>
	<script src="${staticPath}/assets/js/highcharts/highcharts.js"></script>
	<script src="${staticPath}/assets/js/highcharts/exporting.js"></script>
	<script src="${staticPath}/assets/js/highcharts/annotations.js"></script>

	<script src="${staticPath}/assets/js/date-time/moment.min.js"></script>
	<script src="${staticPath}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script>
	<script src="${staticPath}/assets/js/chosen.jquery.min.js"></script>

	<script src="${staticPath}/assets/js/ace.min.js"></script>
	<script src="${staticPath}/assets/js/ace-elements.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.blockUI.js"></script>
	<script src="${staticPath}/assets/js/fuelux/fuelux.spinner.min.js"></script>

	<script type="text/javascript">

		var tableEngineList;
		$.blockUI.defaults.message = '<h4><img style="height: 30px;width: 30px" src="${staticPath}/assets/img/loading.gif" /> Just a moment...</h4>';
		$.blockUI.defaults.overlayCSS.opacity = .2;
		$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

		$(document).ready(function() {

			$("#noDataMsg").hide();

//			get all the stations ajax method
			$.ajax({
				type : "post",
				url : "${adminPath}/kiener/station/ajaxList_station",
				dataType : "json",
				success : function(data) {
					if(data.results.length == 0){
						//handle empty

					}else{
						var record = data.results;
						console.info("total station record:" + record.length);
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

			$('#date-timepicker-start').datetimepicker({
				"maxDate" : moment().subtract(0, "days"),
//			"sideBySide" : true,
				"viewDate" : true,
				"defaultDate" : moment().format("YYYY-MM-DD 07:30"),
				"format" : "YYYY-MM-DD HH:mm"
//			"format" : "YYYY-MM-DD h:mm"
//			"minDate" : moment().subtract(8, "days")
			}).on('dp.change',function(){
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
				console.info("startDate:" + startDate + " endDate:" + endDate);
			});
			$('#date-timepicker-end').datetimepicker({
				"maxDate" : moment().subtract(0, "days"),
//			"sideBySide" : true
				"defaultDate" : moment().subtract(-1,"days").format("YYYY-MM-DD 01:30"),
				"format" : "YYYY-MM-DD HH:mm"
//			"minDate" : moment().subtract(8, "days")
			}).on('dp.change',function(){
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
				console.info("startDate:" + startDate + " endDate:" + endDate);
			});

//			inital the engine type with the default date
//			getAllEngineType($("#date-timepicker-start").val(), $("#date-timepicker-end").val());

			$("#btnQuery").click(function(){
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
//				var currentType = $("#selectType").find("option:selected").val();
				var selectStation = $("#selectStationType").find("option:selected").val();
				var stationName = $("#selectStationType").find("option:selected").text();
				if(startDate == "" || endDate == "" || selectStation == "")
				{
					top.layer.alert('选择岗位', {icon: 0, title:'警告'});
					return false;
				}
//				startDate = startDate +  " 06:30";
//				endDate = endDate + " 06:30";
				console.info("startDate: " + startDate + "  to : " + endDate + " selectStation:" + selectStation);
				if(tableEngineList){
					$('#tableEngineList').dataTable().fnDestroy();
				}
				initEgineListTable(startDate,endDate,selectStation)
			});
		});

		function initEgineListTable(start, end, station){
			tableEngineList = $('#tableEngineList').dataTable( {
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
				"displayLength": 100,
				"language" :{
					"zeroRecords" : "No Record for this period"
				},
				"ajax": {
					"url" : "${adminPath}/kiener/measure/ajaxList_engineList?measureDate="+start +
					"&endDate=" + end + "&station=" + station,
					"dataSrc" : "results",
//					"success": fnCallback,
					"timeout": 35000,   // optional if you want to handle timeouts (which you should)
					"error": handleAjaxError // this sets up jQuery to give me errors
				},
				"order": [[ 2, "desc" ]],
				bAutoWidth: false,
				"columns":[
					{
						"data": "partNumber",
						"sTitle":"发动机序列号"
					},
					{
						"data": "variety",
						"sTitle":"发动机型号"
					},

					{
						"data": "measureDate",
						"sTitle":"发动机生成时间"
					},
					{
						"data": "ok",
						"sTitle":"是否合格"
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
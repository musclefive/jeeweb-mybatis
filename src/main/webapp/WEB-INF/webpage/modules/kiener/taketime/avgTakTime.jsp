<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>AVG Takt Time</title>

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
						<div class="space-10"></div>
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
									<label>&nbsp;Type:&nbsp;</label>

									<select class="form-control" id="selectType">
										<%--<option value="">please select</option>--%>
										<%--<option value="05703">--5703--</option>--%>
										<%--<option value="05705">--5705--</option>--%>
										<%--<option value="05710">--5710--</option>--%>
										<%--<option value="05711">--5711--</option>--%>
										<%--<option value="05732">--5732--</option>--%>
										<%--<option value="05776">--5776--</option>--%>
										<%--<option value="05778">--5778--</option>--%>
										<%--<option value="05791">--5791--</option>--%>
										<%--<option value="05792">--5792--</option>--%>
									</select>
									<label>&nbsp;&nbsp;</label>

									<label>&nbsp;Max:&nbsp;</label>

									<div class="input-group">
										<input id="txtMaxTaktTime" type="text" class="form-control input-mini"  value="90"/>
									</div>

									<label>&nbsp;Min:&nbsp;</label>

									<div class="input-group">
										<input id="txtMinTaktTime" type="text" class="form-control input-mini"  value="30"/>
									</div>

									<label>&nbsp;&nbsp;</label>
									<button class="btn btn-sm btn-success" id="btnQuery">
										<i class="ace-icon fa fa-refresh bigger-110"></i>
										Query
									</button>
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
								<div id="chartPanel" style="min-width:400px;height: 400px"></div>
								<div id="noDataMsg" class="alert-danger align-center"></div>
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
	<script src="${staticPath}/assets/js/highcharts/highcharts.js"></script>
	<script src="${staticPath}/assets/js/highcharts/exporting.js"></script>
	<script src="${staticPath}/assets/js/date-time/moment.min.js"></script>
	<script src="${staticPath}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script>

	<script src="${staticPath}/assets/js/ace.min.js"></script>
	<script src="${staticPath}/assets/js/ace-elements.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.blockUI.js"></script>
	<script src="${staticPath}/assets/js/fuelux/fuelux.spinner.min.js"></script>

	<script type="text/javascript">

		var val_avgTakTime = new Array();
		var val_station = new Array();

		$.blockUI.defaults.message = '<h4><img style="height: 30px;width: 30px" src="${staticPath}/assets/img/loading.gif" /> Just a moment...</h4>';
		$.blockUI.defaults.overlayCSS.opacity = .2;
		$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

		$(document).ready(function() {

			$("#noDataMsg").hide();

			$('#txtMaxTaktTime').ace_spinner({value:0,min:0,max:200,step:1, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
					.on('change', function(){
						//alert(this.value)
					});
			$('#txtMinTaktTime').ace_spinner({value:0,min:0,max:200,step:1, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
					.on('change', function(){
						//alert(this.value)
					});

			var options = {
				chart: {
					renderTo: 'chartPanel',
					type: 'column'
				},
				title: {
					text: ''
				},
				subtitle: {
//					text: ''
				},
				xAxis: {
					crosshair: true
				},
				yAxis: {
					min: 0,
					title: {
						text: 'Takt Time(ss)'
					},
					plotLines:[{
						label:{
							text:'38s',     //鏍囩鐨勫唴瀹�
							align:'left',                //鏍囩鐨勬按骞充綅缃紝姘村钩灞呭乏,榛樿鏄按骞冲眳涓璫enter
							x:-10                         //鏍囩鐩稿浜庤瀹氫綅鐨勪綅缃按骞冲亸绉荤殑鍍忕礌锛岄噸鏂板畾浣嶏紝姘村钩灞呭乏10px
						},
						color:'red',           //绾跨殑棰滆壊锛屽畾涔変负绾㈣壊
						dashStyle:'solid',     //榛樿鍊硷紝杩欓噷瀹氫箟涓哄疄绾�
						value:38,               //瀹氫箟鍦ㄩ偅涓�间笂鏄剧ず鏍囩ず绾匡紝杩欓噷鏄湪x杞翠笂鍒诲害涓�3鐨勫�煎鍨傜洿鍖栦竴鏉＄嚎
						width:2               //鏍囩ず绾跨殑瀹藉害锛�2px
					}]
				},
				tooltip: {
					headerFormat: '<span style="font-size:10px">Station:{point.key}</span><table>',
					pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
					'<td style="padding:0"><b>{point.y:.0f} s</b></td></tr>',
					footerFormat: '</table>',
					shared: true,
					useHTML: true
				},
				plotOptions: {
					column: {
						pointPadding: 0.2,
						borderWidth: 0
					}
				},
				series:[{
//					name : "Avg Tak Time",
//					data : [ 37, 38, 39, 38, 38, 40, 39, 39, 38, 38]
				}]
			};

			$('#date-timepicker-start').datetimepicker({
				"maxDate" : moment().subtract(0, "days"),
//			"sideBySide" : true,
				"viewDate" : true,
				"defaultDate" : moment().subtract(7,"days").format("YYYY-MM-DD"),
				"format" : "YYYY-MM-DD"
//			"format" : "YYYY-MM-DD h:mm"
//			"minDate" : moment().subtract(8, "days")
			});
			$('#date-timepicker-end').datetimepicker({
				"maxDate" : moment().subtract(0, "days"),
//			"sideBySide" : true
				"defaultDate" : moment().subtract(0,"days").format("YYYY-MM-DD"),
				"format" : "YYYY-MM-DD"
//			"minDate" : moment().subtract(8, "days")
			}).on('dp.change',function(){
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
				console.info("startDate:" + startDate + " endDate:" + endDate);
				getAllEngineType(startDate, endDate);
			});

//			inital the engine type with the default date
			getAllEngineType($("#date-timepicker-start").val(), $("#date-timepicker-end").val());

			$("#btnQuery").click(function(){
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
				var currentType = $("#selectType").find("option:selected").val();
				var max = $("#txtMaxTaktTime").val();
				var min = $("#txtMinTaktTime").val();

				if(startDate == "" || endDate == "" || currentType == "")
				{
					$("#noDataMsg").html("<h2>Input the query parameter</h2>");
					$("#noDataMsg").show();
					$("#chartPanel").hide();
					top.layer.alert('请选择岗位！', {icon: 0, title:'警告'});
					return false;
				}
				startDate = startDate +  " 06:30";
				endDate = endDate + " 06:30";
				console.info("startDate: " + startDate + "  to : " + endDate + " currentType:" + currentType);

				$.ajax({
					type : "post",
					url : "${adminPath}/kiener/taketime/ajaxList_avgTakttime",
					dataType : "json",
					data: {"measureDate":startDate,"endDate":endDate, "currentType":currentType, "max": max,"min":min},
					success : function(data) {
						if(data.results.length == 0){
							//handle empty
							$("#noDataMsg").show();
							$("#chartPanel").hide();
							$("#noDataMsg").html("<h2>No Data</h2>");

						}else{
							$("#chartPanel").show();
							$("#noDataMsg").hide();
							var record = data.results;
							for(var p in record){
//								console.info("station:" + record[p]["station"] + " takTime: " + record[p]["avgTakTime"]);
//							val_station.push("'" + record[p]["station"] + "'");
//							val_avgTakTime.push("'" + record[p]["avgTakTime"] + "'")
								val_station.push(record[p]["station"]);
								val_avgTakTime.push(record[p]["avgTakTime"]);
							}
							options.xAxis.categories = eval('['+ val_station +']');
							options.series[0].name = "Avg Tak Time";
							options.series[0].data = eval('['+ val_avgTakTime +']');
							options.title.text = "Average Takt Time - Engine Type: " + currentType.substr(1);
							options.subtitle.text = "From " + startDate + " To " + endDate;
						}
						new Highcharts.Chart(options);
						val_avgTakTime = [];
						val_station = [];
//					console.info(val_avgTakTime);
//					console.info(val_station);
					}
				});
			});
//			$("#btnClear").click(function(){
//				$("#date-timepicker-start").val("");
//				$("#date-timepicker-end").val("");
//				$("#selectType").val("");
//			});
		});

		function getAllEngineType(startDate, endDate){
			// 				dynamic show the engine type list
			$.ajax({
				type : "post",
				url : "${adminPath}/kiener/taketime/ajaxList_engineType",
				dataType : "json",
				data: {"startDate":startDate,"endDate":endDate},
				success : function(data) {
					if(data.results.length == 0){
						//handle empty
						$("#selectType").empty();
						$("#selectType").append("<option value=''>No Data</option>");

					}else{
						var record = data.results;
						$("#selectType").empty();
						for(var i = 0; i < record.length; i++) {
							var text = "--" + record[i]["currentType"].substr(1) + "--";
							var value = record[i]["currentType"];
							if(value != ""){
								$("#selectType").append("<option value='"+value+"'>"+text+"</option>");
							}
						}
					}
//					console.info(val_avgTakTime);
//					console.info(val_station);
				}
			});
		}

	</script>

</body>

</html>
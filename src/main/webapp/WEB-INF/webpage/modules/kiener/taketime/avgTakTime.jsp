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
						<div class="row">
							<div class="col-xs-12">
								<div id="chartPanel" style="min-width:400px;height: 400px"></div>
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

	<script src="${staticPath}/assets/js/ace.min.js"></script>
	<script src="${staticPath}/assets/js/ace-elements.min.js"></script>

	<script type="text/javascript">

		var val_avgTakTime = new Array();
		var val_station = new Array();
		$(document).ready(function() {

			var options = {
				chart: {
					renderTo: 'chartPanel',
					type: 'column'
				},
				title: {
					text: '月平均降雨量'
				},
				subtitle: {
//					text: '数据来源: WorldClimate.com'
				},
				xAxis: {
//					categories: [
//						'一月',
//						'二月',
//						'三月',
//						'四月',
//						'五月',
//						'六月',
//						'七月',
//						'八月',
//						'九月',
//						'十月'
//					],
					crosshair: true
				},
				yAxis: {
					min: 0,
					title: {
						text: 'Takt Time(ss)'
					}
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

			var startDate = "2017-08-25 06:30";
			var endDate = "2017-08-26 06:30";
			var currentType = "05710";

			$.ajax({
				type : "post",
				url : "${adminPath}/kiener/taketime/ajaxList_avgTakttime",
				dataType : "json",
				data: {"measureDate":startDate,"endDate":endDate, "currentType":currentType},
				success : function(data) {
					if(data.results.length == 0){
						//handle empty
					}else{
						var record = data.results;
						for(var p in record){
							console.info("station:" + record[p]["station"] + " takTime: " + record[p]["avgTakTime"]);
//							val_station.push("'" + record[p]["station"] + "'");
//							val_avgTakTime.push("'" + record[p]["avgTakTime"] + "'")
							val_station.push(record[p]["station"]);
							val_avgTakTime.push(record[p]["avgTakTime"]);
						}
						options.xAxis.categories = eval('['+ val_station +']');
						options.series[0].name = "Avg Tak Time";
						options.series[0].data = eval('['+ val_avgTakTime +']');
						options.title.text = "Takt Time";
						options.subtitle.text = "Engine Type:" + currentType.substr(1);
					}
					new Highcharts.Chart(options);
					console.info(val_avgTakTime);
					console.info(val_station);
				}
			});

//			$('#chartPanel').highcharts({
//				chart: {
//					type: 'column'
//				},
//				title: {
//					text: '月平均降雨量'
//				},
//				subtitle: {
//					text: '数据来源: WorldClimate.com'
//				},
//				xAxis: {
//					categories: [
//						'一月',
//						'二月',
//						'三月',
//						'四月',
//						'五月',
//						'六月',
//						'七月',
//						'八月',
//						'九月',
//						'十月',
//						'十一月',
//						'十二月'
//					],
//					crosshair: true
//				},
//				yAxis: {
//					min: 0,
//					title: {
//						text: '降雨量 (mm)'
//					}
//				},
//				tooltip: {
//					headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
//					pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
//					'<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
//					footerFormat: '</table>',
//					shared: true,
//					useHTML: true
//				},
//				plotOptions: {
//					column: {
//						pointPadding: 0.2,
//						borderWidth: 0
//					}
//				},
//				series: [{
//					name: '东京',
//					data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
//				}]
//			});
		})

	</script>

</body>

</html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>Real Time Takt Time</title>

	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="${staticPath}/assets/css/bootstrap.min.css" />
	<!--<link rel="stylesheet" href="../assets/css/font-awesome.min.css" />-->
	<link rel="stylesheet" href="${staticPath}/assets/css/font-awesome.min.css" />

	<!-- page specific plugin styles -->
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
<!-- 闁稿繈鍔岄惇鐞穝 -->
	<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

	<!-- 闁煎浜滈悾鐐▕婵夌灚 -->
	<script src="${staticPath}/assets/js/jquery.min.js"></script>
	<script src="${staticPath}/assets/js/bootstrap.min.js"></script>
	<script src="${staticPath}/assets/js/highcharts/highcharts.js"></script>
	<script src="${staticPath}/assets/js/highcharts/exporting.js"></script>
	<script src="${staticPath}/assets/js/date-time/moment.min.js"></script>
	<script src="${staticPath}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script>
	<script src="${staticPath}/assets/js/ace.min.js"></script>
	<script src="${staticPath}/assets/js/ace-elements.min.js"></script>
	<script src="${staticPath}/assets/js/prototype.js"></script>

	<script type="text/javascript">

		var val_taktTime = new Array();
		var val_station = new Array();
		var type ="";
		var partNumber = "";

		$(document).ready(function() {
			var sh; // Interval
			var startDate = "2017-08-18 06:30";
			var endDate = "2017-08-18 09:00";

			var options = {
				chart: {
					renderTo: 'chartPanel',
					type: 'column'
				},
				title: {
					text: ''
				},
				subtitle: {
					text: ''
				},
				xAxis: {
				},
				yAxis: {
					title: {
						text: 'Second'
					}
				},
				plotOptions: {
					column: {
						stacking: 'normal',
						dataLabels: {
							enabled: true,
							style: {
								textShadow: '0 0 3px black'
							}
						},
						enableMouseTracking: false
					}
				},
				series: [
					{color: '#4572A7'}
//					{color: '#89A54E'}
				]
			};

			var realtimeTaktTime = function () {
				endDate = new Date(new Date(endDate).getTime() + 300000).format("yyyy-MM-dd hh:mm:ss");
				var m10_num = 0;
				var m30_num = 0;
				$.ajax({
					type : "post",
					url : "${adminPath}/kiener/taketime/ajaxList_realTimeTaktTime",
					dataType : "json",
					data: {"measureDate":startDate,"measureDateEnd":endDate},
					success : function(data) {
						if (data.results.length == 0) {
							//handle empty

						} else {
							var record = data.results;
							console.info("record: " + record);
							for(var i = 0; i < record.length; i++){
								if(record[i]["station"] = "10"){
									m10_num = m10_num + 1;
									if(m10_num == 1){
										val_station.push(record[i]["station"]);
										val_taktTime.push(record[i]["takeTime"]);
									}
								}
								if(record[i]["station"] = "30"){
									m30_num = m30_num + 1;
									if(m30_num == 1){
										val_station.push(record[i]["station"]);
										val_taktTime.push(record[i]["takeTime"]);
									}
								}

								type = record[i]["currentType"].substr(1);
								partNumber = record[i]["partNumber"];
							}
							console.info("val_station:" + val_station);
							console.info("val_taktTime:" + val_taktTime);
							options.xAxis.categories = eval('['+ val_station +']');
							options.series[0].name = "Takt Time";
							options.series[0].data = eval('['+ val_taktTime +']');
							options.title.text = "Real Time Takt Time ";
						}
						new Highcharts.Chart(options);
						val_taktTime = [];
						val_station = [];
					}
				});

			};

			realtimeTaktTime();

//			sh = setInterval(realtimeTaktTime, 6000);

		})

	</script>

</body>

</html>
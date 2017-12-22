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
						<div class="space-6"></div>
						<div class="row pull-left">
							<button class="btn btn-xs btn-success" id="btnReturn">
								<i class="ace-icon fa fa-arrow-left icon-on-left"></i>
								Return to Table
							</button>
						</div>
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
<!-- 閸忋劌鐪琷s -->
	<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

	<!-- 閼奉亜鐣炬稊濉瞫 -->
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

	<script type="text/javascript">

		var val_taktTime = new Array();
		var val_station = new Array();
		var type ="";
		var partNumber = "";
		$(document).ready(function() {

			var options = {
				chart: {
					renderTo: 'chartPanel',
					type: 'column'
				},
				title: {
					text: '月平均气温'
				},
				subtitle: {
					text: '数据来源: WorldClimate.com'
				},
				xAxis: {
//					categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
				},
				yAxis: {
					title: {
						text: 'Second'
					},
					plotLines:[{
						label:{
							text:'Standard 38s',     //标签的内容
							align:'left',                //标签的水平位置，水平居左,默认是水平居中center
							x:-60                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
						},
						color:'grey',           //线的颜色，定义为红色
						dashStyle:'solid',     //默认值，这里定义为实线
                        value:38,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
						width:2               //标示线的宽度，2px
					}]
				},
				plotOptions: {
					line: {
						dataLabels: {
							enabled: true          // 开启数据标签
						},
						enableMouseTracking: false // 关闭鼠标跟踪，对应的提示框、点击事件会失效
					}
				},
				series: [
					{color: '#4572A7'}
//					{color: '#89A54E'}
				]
			};

			$.ajax({
				type : "post",
				url : "${adminPath}/kiener/taketime/ajaxList_singleEngine",
				dataType : "json",
				success : function(data) {
					if (data.results.length == 0) {
						//handle empty
						top.layer.alert('没有数据！', {icon: 0, title:'警告'});

					} else {
						var record = data.results;
						for(var p in record){
							val_station.push(record[p]["station"]);
							val_taktTime.push(record[p]["takeTime"]);
							type = record[p]["currentType"].substr(1);
							partNumber = record[p]["partNumber"];
						}
						console.info("val_station:" + val_station);
						console.info("val_taktTime:" + val_taktTime);
						options.xAxis.categories = eval('['+ val_station +']');
						options.series[0].name = "Takt Time";
						options.series[0].data = eval('['+ val_taktTime +']');
						options.title.text = "Takt Time for " + partNumber;
						options.subtitle.text = "Engine Type:" + type;
					}
					new Highcharts.Chart(options);
					val_taktTime = [];
					val_station = [];
				}
			});

			$("#btnReturn").click(function(){
				window.history.go(-1);
			});

		})

	</script>

</body>

</html>
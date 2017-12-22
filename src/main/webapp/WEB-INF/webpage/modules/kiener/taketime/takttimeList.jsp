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
										<label for="selectStationType">Station</label>

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
									<div class="col-sm-1">
										<label>&nbsp;Min:&nbsp;</label>

										<div class="input-group">
											<input id="txtMinTaktTime" type="text" class="form-control" placeholder="0s" value="0"/>
										</div>
									</div>
									<div class="col-sm-1">
										<label>&nbsp;Max:&nbsp;</label>

										<div class="input-group">
											<input id="txtMaxTaktTime" type="text" class="form-control" placeholder="2000s" value="2000"/>
										</div>
									</div>
									<div class="col-sm-4">
										<br/>
										<!-- #section:plugins/date-time.datetimepicker -->
										<button class="btn btn-sm btn-info" id="btnQuery">
											<i class="ace-icon fa fa-tachometer  bigger-110"></i>
											Show Chart
										</button>
										<button class="btn btn-sm btn-success" id="btnChart">
											<i class="ace-icon fa fa-tasks bigger-110"></i>
											Show Table
										</button>
										<button class="btn btn-sm btn-warning" id="btnClear">
											<i class="ace-icon fa fa-undo bigger-110"></i>
											Clear
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="space-6"></div>
						<div class="row">

							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active">
										<a data-toggle="tab" href="#divChart">
											<i class="blue ace-icon fa fa-tachometer bigger-110"></i>
											Chart
										</a>
									</li>

									<li>
										<a data-toggle="tab" href="#divPie">
											<i class="pink ace-icon fa fa-bar-chart-o bigger-110"></i>
											Pie & Bar
										</a>
									</li>

									<li>
										<a data-toggle="tab" href="#divTable">
											<i class="green ace-icon fa fa-tasks bigger-110"></i>
											Table
										</a>
									</li>
								</ul>

								<div class="tab-content">

									<div id="divChart" class="tab-pane  in active">
										<div class="row">
											<div id="chartPanel"></div>
										</div>
									</div>

									<div id="divPie" class="tab-pane fade">
										<div class="row">
											<div class="col-sm-6">
												<div id="chartPie"></div>
											</div>
											<div class="col-sm-6">
												<div id="chartBar"></div>
											</div>
										</div>
									</div>

									<div id="divTable" class="tab-pane fade">
										<table id="tableTakttime" class="table table-striped table-bordered table-hover">

										</table>
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
				"maxDate" : moment().subtract(1, "days"),
				"sideBySide" : true,
				"viewDate" : true,
//				"format" : "YYYY-MM-DD"
				"format" : "YYYY-MM-DD HH:mm",
				"defaultDate" : moment().subtract(1,"days").format("YYYY-MM-DD 07:30")
//				"minDate" : moment().subtract(8, "days")
			});
			$('#date-timepicker-end').datetimepicker({
				"maxDate" : moment().subtract(1, "days"),
				"sideBySide" : true,
				"format" : "YYYY-MM-DD HH:mm",
				"defaultDate" : moment().format("YYYY-MM-DD 01:30")
//				"minDate" : moment().subtract(8, "days")
			});

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


			$("#btnQuery").click(function() {
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
				var selectStation = $("#selectStationType").find("option:selected").val();
				var stationName = $("#selectStationType").find("option:selected").text();
				minTakt = $("#txtMinTaktTime").val();
				maxTakt = $("#txtMaxTaktTime").val();
				console.info("query data startDate:" + startDate + " endDate:" + endDate + " selectStation:" + selectStation);
				if (startDate == "" || endDate == "" || selectStation == "") {
					top.layer.alert('请选择岗位！', {icon: 0, title:'警告'});
					return false;
				}
				$("#myTab a[href='#divChart']").tab('show');
				var options = {
					chart: {
						renderTo: "chartPanel",
						zoomType: 'x'
					},
					title: {
						text: ''
					},
					subtitle: {
						text: document.ontouchstart === undefined ?
								'鼠标拖动可以进行缩放' : '手势操作进行缩放'
					},
					xAxis: {
						tickInterval : 30,
						tickmarkPlacement : 'on',
						type: 'datetime',
						dateTimeLabelFormats: {
							millisecond: '%H:%M:%S.%L',
							second: '%H:%M:%S',
							minute: '%H:%M',
							hour: '%H:%M',
							day: '%m-%d',
							week: '%m-%d',
							month: '%Y-%m',
							year: '%Y'
						},
						labels: {
							formatter: function () {
								return moment(this.value).format("HH:mm")
							},
							align: 'right'
						}
					},
					tooltip: {
						dateTimeLabelFormats: {
							millisecond: '%H:%M:%S.%L',
							second: '%H:%M:%S',
							minute: '%H:%M',
							hour: '%H:%M',
							day: '%Y-%m-%d',
							week: '%m-%d',
							month: '%Y-%m',
							year: '%Y'
						}
					},
					yAxis: {
						title: {
							text: 'Takt Time'
						}
					},
					legend: {
						enabled: false
					},
					plotOptions: {
						area: {
							fillColor: {
								linearGradient: {
									x1: 0,
									y1: 0,
									x2: 0,
									y2: 1
								},
								stops: [
									[0, Highcharts.getOptions().colors[0]],
									[1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
								]
							},
							marker: {
								radius: 2
							},
							lineWidth: 1,
							states: {
								hover: {
									lineWidth: 1
								}
							},
							threshold: null
						}
					},
					series: [{
						type: 'area',
						name: 'Takt Time'
//						data: data
					}]
				};

				var pieOption = {
					chart: {
						renderTo: "chartPie",
						plotBackgroundColor: null,
						plotBorderWidth: null,
						plotShadow: false
					},
					title: {
						text: ''
					},
					tooltip: {
						headerFormat: '{series.name}<br>',
						pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
					},
					plotOptions: {
						pie: {
							allowPointSelect: true,
							cursor: 'pointer',
							dataLabels: {
								enabled: true,
								format: '<b>{point.name}</b>: {point.percentage:.1f} %',
								style: {
									color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
								}
							},
							showInLegend: true
						}
					},
					series: [{
						type: 'pie'
//						name: '浏览器访问量占比'
//						data: [
//							['Firefox',   45.0],
//							['IE',       26.8],
//							['Safari',    8.5],
//							['Opera',     6.2],
//							['其他',   0.7]
//						]
					}]
				};

				var barOption = {
					chart: {
						renderTo: 'chartBar',
						type: 'column'
					},
					title: {
						text: ''
					},
					subtitle: {
						text: ''
					},
					xAxis: {
//					categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
					},
					yAxis: {
						title: {
							text: 'Quantity'
						}
//						plotLines:[{
//							label:{
//								text:'Standard 38s',     //标签的内容
//								align:'left',                //标签的水平位置，水平居左,默认是水平居中center
//								x:-60                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
//							},
//							color:'grey',           //线的颜色，定义为红色
//							dashStyle:'solid',     //默认值，这里定义为实线
//							value:38,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
//							width:2               //标示线的宽度，2px
//						}]
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

				initChart(startDate, endDate, selectStation,stationName, options, pieOption, barOption);

			});

			$("#btnChart").click(function() {
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
				var selectStation = $("#selectStationType").find("option:selected").val();
				minTakt = $("#txtMinTaktTime").val();
				maxTakt = $("#txtMaxTaktTime").val();
				console.info("query data startDate:" + startDate + " endDate:" + endDate + " selectStation:" + selectStation);

				console.info("query data startDate:" + startDate + " endDate:" + endDate + " selectStation:" + selectStation);
				if (startDate == "" || endDate == "" || selectStation == "") {
					top.layer.alert('请选择岗位！', {icon: 0, title:'警告'});
					return false;
				}
				$("#myTab a[href='#divTable']").tab('show');
				if(tableList){
					$('#tableTakttime').dataTable().fnDestroy();
				}
				initTable(startDate, endDate, selectStation);
			});

			$("#btnClear").click(function(){
				$("#date-timepicker-start").val(moment().subtract(1,"days").format("YYYY-MM-DD 07:30"));
				$("#date-timepicker-end").val( moment().format("YYYY-MM-DD 01:30"));
			});

//			$('a[href="#divTable"]').on('shown.bs.tab', function (e) {
////				console.info("show the Table:" + dataResult.length );
////				if(tableList){
////					$('#tableTakttime').dataTable().fnDestroy();
////				}
//				initTable();
//
//			});

//			initTable("2017-08-10 06:30","2017-08-17 06:30");

		});

		function initChart(start, end, station,stationName, options, pieOption, barOption) {
			var val_time = [];
			var val_takttime = [];
			var val_pie = [];
			var val_bar_xCategory = []; //show the category for the Bar Chart
			var val_bar_quantity = [];
			var strTemp = "";
			var map_takt = {"<33s":0,"34s":0,"35s":0,"36s":0,"37s":0,"Standard 38s":0,"39s":0,"40s":0,"41s":0,"42s":0,">43s":0};
			var count_lt_33 = 0;
			var count_34 = 0;
			var count_35 = 0;
			var count_36 = 0;
			var count_37 = 0;
			var count_38 = 0;
			var count_39 = 0;
			var count_40 = 0;
			var count_41 = 0;
			var count_42 = 0;
			var count_gt_42 = 0;

			$.ajax({
				type : "post",
				url : "${adminPath}/kiener/taketime/ajaxList_takttime",
				dataType : "json",
				data: {"measureDate":start,"endDate":end, "station":station, "min":minTakt, "max": maxTakt},
				error : function (xhr, textStatus){
					console.info("queryData ajax error,textStatus:" + textStatus);
				},
				success : function(data) {
					if(data.results.length == 0){
						//handle empty
						console.info("empty");
						top.layer.alert('没有数据！', {icon: 0, title:'警告'});

					}else{
						var record = data.results;
						console.info("chart data total length: " + record.length);
						for(var i = 0; i < record.length; i++) {
							val_time.push("'" + record[i]["measureDate"] + "'");
							val_takttime.push(record[i]["takeTime"]);

							if(record[i]["takeTime"] <= 33){
								count_lt_33 = count_lt_33 + 1;
							}else if (record[i]["takeTime"] == 34){
								count_34 = count_34 + 1;
							}else if (record[i]["takeTime"] == 35){
								count_35 = count_35 + 1;
							}else if (record[i]["takeTime"] == 36){
								count_36 = count_36 + 1;
							}else if (record[i]["takeTime"] == 37){
								count_37 = count_37 + 1;
							}else if (record[i]["takeTime"] == 38){
								count_38 = count_38 + 1;
							}else if (record[i]["takeTime"] == 39){
								count_39 = count_39 + 1;
							}else if (record[i]["takeTime"] == 40){
								count_40 = count_40 + 1;
							}else if (record[i]["takeTime"] == 41){
								count_41 = count_41 + 1;
							}else if (record[i]["takeTime"] == 42){
								count_42 = count_42 + 1;
							}else{
								count_gt_42 = count_gt_42 + 1;
							}
						}
					}

					console.info("<33:" + count_lt_33 + " 34:" + count_34 + " 35:" + count_35 + " 36:" + count_36
					+ " 37:" + count_37 + " 38:" + count_38 + " 39:" + count_39 + " 40:" + count_40 + " 41:"
							+count_41 + " 42:" + count_42 + " >42:" + count_gt_42);
					map_takt['<33s'] = count_lt_33;
					map_takt['34s'] = count_34;
					map_takt['35s'] = count_35;
					map_takt['36s'] = count_36;
					map_takt['37s'] = count_37;
					map_takt['Standard 38s'] = count_38;
					map_takt['39s'] = count_39;
					map_takt['40s'] = count_40;
					map_takt['41s'] = count_41;
					map_takt['42s'] = count_42;
					map_takt['>43s'] = count_gt_42;

					/*strTemp = "['Firefox',45.0],['IE',26.8],['Safari',8.5],['Opera',6.2],['其他',0.7]";
					* map_takt is the data for the pie chart*/
					$.each(map_takt, function(key, value){
						console.info("map_takt:" + key + " " + value);
						strTemp = strTemp + "[";
						strTemp = strTemp + "'"+key + "'" + "," + value +"],";
						val_bar_xCategory.push("'"+key+"'");
						val_bar_quantity.push(value);
					});
//					strTemp = strTemp.substr(strTemp.length - 1);
					val_pie.push(strTemp);
					console.info("val_pie:" + val_pie);
					console.info("val_time:" + val_time);
					console.info("val_takttime:" + val_takttime);
					console.info("val_bar_xCategory:" + val_bar_xCategory);
					console.info("val_bar_quantity:" + val_bar_quantity);


					options.series[0].name = "Takt Time";
					options.series[0].data = eval('['+ val_takttime +']');
					options.xAxis.categories = eval('['+ val_time +']');
					options.title.text = stationName + " Takt Time";

					pieOption.series[0].name = "Percentage for Takt Time";
					pieOption.title.text = "Percentage for Takt Time";
					pieOption.series[0].data = eval('['+ val_pie +']');

					barOption.series[0].name = "Takt Time";
					barOption.title.text = "Takt Time Distribution";
					barOption.series[0].data = eval('['+ val_pie +']');
					barOption.xAxis.categories = eval('['+ val_bar_xCategory +']');

//					barOption.series[0].name = "Takt Time";
//					barOption.series[0].data = eval('['+ val_bar_quantity +']');

					new Highcharts.Chart(options);
					new Highcharts.Chart(pieOption);
					new Highcharts.Chart(barOption);

					val_takttime = [];
					val_time = [];
					val_pie = [];
					val_bar_xCategory = []; //show the category for the Bar Chart
					val_bar_quantity = [];
				}
			});

		}

		function initTable(start, end, station){
//			console.info("inti table :" + dataResult.length);
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
					"url" : "${adminPath}/kiener/taketime/ajaxList_takttime?measureDate="+start +
					"&endDate=" + end + "&station=" + station + "&min=" + minTakt +"&max=" + maxTakt ,
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
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>Leak Test</title>

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
										<label>&nbsp;select station:&nbsp;</label>
										<select class="form-control" id="selectType">
											<option value="1420" selected>M1420</option>
											<option value="1430">M1430</option>
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
											<input id="txtMin" type="text" class="form-control" placeholder="Min" value=""/>
										</div>
									</div>
									<div class="col-sm-1">
										<label>&nbsp;Max:&nbsp;</label>

										<div class="input-group">
											<input id="txtMax" type="text" class="form-control" placeholder="Max" value=""/>
										</div>
									</div>
									<div class="col-sm-1">
										<label>&nbsp;Step:&nbsp;</label>

										<div class="input-group">
											<input id="txtStep" type="text" class="form-control" placeholder="Step" value=""/>
										</div>
									</div>
									<div class="col-sm-3">
										<br/>
										<!-- #section:plugins/date-time.datetimepicker -->
										<button class="btn btn-sm btn-info" id="btnQuery">
											<i class="ace-icon fa fa-tachometer  bigger-110"></i>
											Query
										</button>
										<button class="btn btn-sm btn-success" id="btnTable">
											<i class="ace-icon fa fa-tasks bigger-110"></i>
											Table
										</button>
										<button class="btn btn-sm btn-warning" id="btnClear">
											<i class="ace-icon fa fa-undo bigger-110"></i>
											Clear
										</button>
									</div>
								</div>
								<div class="space-6"></div>
							</div>
						</div>
						<div class="space-6"></div>
						<div class="row">

							<div class="tabbable">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active">
										<a data-toggle="tab" href="#divChart">
											<i class="blue ace-icon fa fa-tachometer bigger-110"></i>
											Leak Rate
										</a>
									</li>

									<li>
										<a data-toggle="tab" href="#divPie">
											<i class="pink ace-icon fa fa-bar-chart-o bigger-110"></i>
											Pie & Bar
										</a>
									</li>
									<li>
										<a data-toggle="tab" href="#divChartPressure">
											<i class="grey ace-icon fa fa-cog  bigger-110"></i>
											Pressure
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

									<div id="divChart" class="tab-pane in active">
										<div class="row">
											<div id="chartPanel"></div>
										</div>
									</div>

									<div id="divPie" class="tab-pane fade">
										<div class="row">
											<div id="chartBar"></div>
										</div>
									</div>

									<div id="divChartPressure" class="tab-pane fade">
										<div class="row">
											<div id="chartPanelForPressure"></div>
										</div>
									</div>

									<div id="divTable" class="tab-pane fade">
										<table id="tableLeakTest" class="table table-striped table-bordered table-hover">

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
<!-- 闂佺绻堥崝宀勬儑閻炵 -->
	<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

	<!-- 闂佺厧顨庢禍婊堟偩閻愵剛鈻曞┑澶岀仛 -->
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
	<script src="${staticPath}/assets/js/highcharts/annotations.js"></script>

	<script type="text/javascript">

		var tableList;
		var minTakt = "";
		var maxTakt = "";
		var map_column_x = {};
		var colum_max;
		var colum_min;
		var colum_step;
		$(document).ready(function() {

//			var startDate = "2017-11-18 08:30";
//			var endDate = "2017-11-18 09:30";
//			var selectStation = "1420";

//			initColumCategory(colum_min,colum_max,colum_step);

			$('#date-timepicker-start').datetimepicker({
				"maxDate" : moment().subtract(-1, "days"),
				"sideBySide" : true,
				"viewDate" : true,
				"format" : "YYYY-MM-DD HH:mm",
				"defaultDate" : moment().format("YYYY-MM-DD 07:30")
//				"format" : "YYYY-MM-DD HH:mm"
//				"minDate" : moment().subtract(8, "days")
			});
			$('#date-timepicker-end').datetimepicker({
				"maxDate" : moment().subtract(-1, "days"),
				"sideBySide" : true,
				"viewDate" : true,
				"format" : "YYYY-MM-DD HH:mm",
				"defaultDate" : moment().subtract(-1,"days").format("YYYY-MM-DD 01:30")
//				"format" : "YYYY-MM-DD HH:mm"
//				"minDate" : moment().subtract(8, "days")
			});

			/*
			* click the tab and query the data in the DataTable.
			* */
			$("#myTab a[href='#divTable']").on('shown.bs.tab', function(e){
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
//				default value
				var selectStation = $("#selectType").find("option:selected").val();

				console.info("query data startDate:" + startDate + " endDate:" + endDate + " station:" + selectStation);
				if (startDate == "" || endDate == "") {
					return false;
				}

				$("#myTab a[href='#divTable']").tab('show');

				if(tableList){
					$('#tableLeakTest').dataTable().fnDestroy();
				}
				initTable(startDate,endDate,selectStation);
			});


			$("#btnQuery").click(function() {
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
//				var startDate = "2017-11-18 08:30";
//				var endDate = "2017-11-18 19:30";
				//default value
				var selectStation = $("#selectType").find("option:selected").val();
				var minValue = $("#txtMin").val().toString();
				var maxValue = $("#txtMax").val().toString();
				var stepValue = $("#txtStep").val().toString();

				var floatMin = parseFloat(minValue);
				var floatMax = parseFloat(maxValue);
				var floatStep = parseFloat(stepValue);

				initColumCategory( floatMin,floatMax,floatStep);
				$("#myTab a[href='#divChart']").tab('show');

				console.info("query data startDate:" + startDate + " endDate:" + endDate + " station:" + selectStation);
				if (startDate == "" || endDate == "") {
					return false;
				}
				initChart(options,optionPressure,barOption, startDate, endDate, selectStation);

			});


			$("#btnTable").click(function() {
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
//				default value
				var selectStation = $("#selectType").find("option:selected").val();

				console.info("query data startDate:" + startDate + " endDate:" + endDate + " station:" + selectStation);
				if (startDate == "" || endDate == "") {
					return false;
				}

				$("#myTab a[href='#divTable']").tab('show');

				if(tableList){
					$('#tableLeakTest').dataTable().fnDestroy();
				}
				initTable(startDate,endDate,selectStation);

			});

			$("#btnClear").click(function(){
				$("#date-timepicker-start").val(moment().format("YYYY-MM-DD 07:30"));
				$("#date-timepicker-end").val( moment().subtract(-1,"days").format("YYYY-MM-DD 01:30"));
				$("#txtMin").val("");
				$("#txtMax").val("");
				$("#txtStep").val("");
			});

			var options = {
				chart: {
					renderTo: 'chartPanel',
					zoomType: 'x'
				},
				title: {
					text: ''
				},
				subtitle: {
//					text: ''
				},
				labels:{
					style:{
						color : "#ff0000"
					},
					items:[{
						html:'',
						style:{
							left:'0px',
							top:'-40px'
						}
					}]
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
				yAxis: {
					title: {
						text: 'Leak Test'
					}
				},
				tooltip: {
					valueDecimals: 2,
					shared: true,
					formatter:function(){
                        return this.x + '<br/>' + '<b>Leak Rate ='+this.points[0].point.y + '</b><br/>' +
								'PartNumber=' + this.points[0].point.partNumber + '<br/>' +
								'Variety=' + this.points[0].point.variety.substr(1) + ' Station=' + this.points[0].point.station + '<br/>' +
								'UW-T=' + this.points[1].y + ' DW-T=' + this.points[2].y;
					}
				},
				plotOptions: {
//					turboThreshold:200000 //set 0 to disable the cheack
				},
				series:[
					{
	//					name : "Leak"
						turboThreshold:0,
						color: '#1C86EE'
					},{
						name : "UW-T",
						turboThreshold:0,
						color: '#FF3030'
					},{
						name : "DW-T",
						turboThreshold:0,
						color: '#FF7256'
					}]
			};

			var optionPressure = {
				chart: {
					renderTo: 'chartPanelForPressure',
					zoomType: 'x'
				},
				title: {
					text: ''
				},
				subtitle: {
//					text: ''
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
				yAxis: {
					title: {
						text: 'Leak Pressure'
					}
				},
				tooltip: {
					valueDecimals:2
				},
				plotOptions: {
//					turboThreshold:200000 //set 0 to disable the cheack
				},
				series:[{
//					name : "Pressure",
//					data : [ 37, 38, 39, 38, 38, 40, 39, 39, 38, 38]
					turboThreshold:0,
					color: '#1C86EE'
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
				},
				yAxis: {
					title: {
						text: 'Quantity'
					}
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


//			initChart(options,optionPressure,barOption, startDate, endDate, selectStation);

		});

		function initChart(options, optionsPressure,barOption, start, end, station) {
			var val_time = [];
			var val_pressure = [];
			var val_leakRate = [];
			var val_leakRateStr = []; //contain the partNumber, variety, and station and so on.
			var val_pie = []; //
			var val_bar_xCategory = []; //show the category for the Bar Chart and column chart
			var strTemp = "";

			var val_uwt = [];
			var val_dwt = [];
			var max = 0;
			var min = 0;
			var avg = 0;
			var sum = 0.00;
			var rval = 0.00;
			var uwt = 0;
			var dwt = 0;
			$.ajax({
				type : "post",
				url : "${adminPath}/kiener/leak/ajaxList_leaktest",
				dataType : "json",
				data: {"measureDate":start,"endDate":end, "station":station},
				error : function (xhr, textStatus){
					console.info("queryData ajax error,textStatus:" + textStatus);
				},
				success : function(data){
					var length = data.results.length;
					if(length == 0){
						//handle empty
						console.info("empty");
						top.layer.alert('没有数据！', {icon: 0, title:'警告'});
					}else{
						var record = data.results;
						var tempStr = "";
						var tmpLeakRate = 0.00;
						var tmpInt = 0;
						console.info("chart data total length: " + length);
						for(var i = 0; i < length; i++) {
							val_time.push("'" + record[i]["measureDate"] + "'");
							val_leakRate.push(record[i]["leakRate"].toString().substring(0,4));
							tempStr = "{y:" + record[i]["leakRate"].toString().substring(0,4) + ",partNumber:'" + record[i]["partNumber"]
							+ "',variety:'" + record[i]["variety"] + "',station:'" + record[i]["station"] + "'}";

							val_pressure.push(record[i]["pressure"]);
//							val_pressure.push(tempStr);
							val_leakRateStr.push(tempStr);
							sum = sum +  parseFloat(record[i]["leakRate"].toString());


							//inital map_column_x for column chart
							tmpLeakRate =  parseFloat(record[i]["leakRate"].toString().substring(0,4));

							if(tmpLeakRate <= colum_min){
								map_column_x[colum_min.toFixed(1)] =  map_column_x[colum_min.toFixed(1)] + 1;
								tmpInt = 0;
//								console.info("LeakRate:" + tmpLeakRate + " tmpInt:" + tmpInt + " key:" + colum_min.toFixed(1).toString());
							}else if (tmpLeakRate >= colum_max){
								map_column_x[colum_max.toFixed(1)] =  map_column_x[colum_max.toFixed(1)] + 1;
								tmpInt = 0;
//								console.info("LeakRate:" + tmpLeakRate + " tmpInt:" + tmpInt + " key:" + colum_max.toFixed(1).toString());
							}else{
								tmpInt = Math.ceil(parseFloat(((tmpLeakRate-colum_min)/colum_step).toFixed(2)));
								map_column_x[(colum_min + tmpInt * colum_step).toFixed(1).toString()] = map_column_x[(colum_min + tmpInt * colum_step).toFixed(1).toString()] + 1;
//								console.info("LeakRate:" + tmpLeakRate + " tmpInt:" + tmpInt +
//										":" + (tmpLeakRate-colum_min)/colum_step + " key:" + (colum_min + tmpInt * colum_step).toFixed(1).toString());
							}
						}

						max = Math.max.apply(null, val_leakRate);
						min = Math.min.apply(null, val_leakRate);
						avg = sum/length;

						//STDEV Sigma
						for(var i = 0; i < length; i++) {
							tmpLeakRate = parseFloat(record[i]["leakRate"].toString());
							rval = rval + Math.pow((tmpLeakRate - avg),2);
						}
						rval = rval / (length-1);
						rval = Math.sqrt(rval);

						uwt = avg + 3 * rval;
						dwt = avg - 3 * rval;

						//set the up_t and down_t array value
						for(var i = 0; i < length; i++) {
							val_uwt.push(uwt.toFixed(2));
							val_dwt.push(dwt.toFixed(2));
						}

//						console.info("val_time:" + val_time);
//						console.info("val_leakRateStr:" + val_leakRateStr);
//						console.info("val_leakRate:" + val_leakRate);
						console.info("max:" + max + " min:" + min + " avg:" + avg.toFixed(2) +
								" rval:" + rval.toFixed(2) + " uwt:" + uwt.toFixed(2) +
								" dwt:" + dwt.toFixed(2) + " sum:" + sum.toFixed(2));
//						initial the column chart
						$.each(map_column_x, function(key, value){
							console.info("map_column_x after caculate:" + key + " " + value);
							strTemp = strTemp + "[";
							strTemp = strTemp + "'"+key + "'" + "," + value +"],";
							val_bar_xCategory.push("'"+key+"'");
						});
						//val_pie for column and pie chart
						//strTemp = "['1.0',16],['1.3',3],['1.6',1]";
						val_pie.push(strTemp);

						options.series[0].name = "Leak Rate";

						options.series[0].data = eval('['+ val_leakRateStr+']');
						options.series[1].data = eval('['+ val_uwt +']');
						options.series[2].data = eval('['+ val_dwt +']');
						options.labels.items[0].html = "Max:" + max +" Min:" + min + "<br/>Avg:" + avg.toFixed(2) +
						" Sigma:" + rval.toFixed(2) + "<br/> 3-Sigma:" + (3* rval).toFixed(2) + " Count:" + length;
						options.xAxis.categories = eval('['+ val_time +']');
						options.title.text = "Leak Test for " + "M" + station;

						optionsPressure.series[0].data = eval('['+ val_pressure +']');
						optionsPressure.series[0].name = "Leak Pressure";
						optionsPressure.xAxis.categories = eval('['+ val_time +']');
						optionsPressure.title.text = "Pressure for " + "M" + station;

						barOption.series[0].name = "Leak Rate Count";
						barOption.title.text = "Leak Rate Distribution";
						barOption.series[0].data = eval('['+ val_pie +']');
						barOption.xAxis.categories = eval('['+ val_bar_xCategory +']');

						new Highcharts.Chart(options);
						new Highcharts.Chart(optionsPressure);
						new Highcharts.Chart(barOption);


						val_pressure = [];
						val_time = [];
						val_leakRate = [];
						val_bar_xCategory = [];
						val_pie = [];
					}

				}
			});

		}

		function initTable(start, end, station){
			tableList = $('#tableLeakTest').dataTable( {
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
					"url" : "${adminPath}/kiener/leak/ajaxList_leaktest?measureDate="+start +
					"&endDate=" + end + "&station=" + station,
					"dataSrc" : "results"
				},
				"order" :[[2,'asc']],
				bAutoWidth: false,
				"columns":[
					{
						"data": "partNumber",
						"sTitle":"PartNumber"
					},
					{
						"data": "variety",
						"sTitle":"Variety",
						"render": function(data, type, row) {
							return data.substring(1);
						}
					},
					{
						"data": "measureDate",
						"sTitle":"Date"
					},
					{
						"data": "station",
						"sTitle":"Station"
					},
					{
						"data": "pressure",
						"sTitle":"Pressure"
					},
					{
						"data": "leakRate",
						"sTitle":"Leak Rate",
						"render": function(data, type, row) {
							return data.substring(0,4);
						}
					},
					{
						"data": "checkProg",
						"sTitle":"CheckProg"
					}
				]
			} );

		}

		/*
		* create a map to store all the min, step and max
		* */
		function initColumCategory(min, max, step){
			colum_max = max;
			colum_min = min;
			colum_step = step;
			//initial first
			map_column_x = {};
			while(min <= max){
				map_column_x[min.toFixed(1)] = 0;

				min = min + step;
				if(min > max){
					map_column_x[max.toFixed(1)] = 0;
				}
			}

		}
	</script>

</body>

</html>
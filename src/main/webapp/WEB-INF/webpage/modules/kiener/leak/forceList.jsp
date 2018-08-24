<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>Force Info</title>

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
									<div class="col-sm-1">
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
									<div class="col-sm-2">
										<label for="selectPosSpin">Stroke&HW</label>
										<br />
										<select class="form-control" id="selectPosSpin">
										</select>
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
									<div class="col-sm-1">
										<label>&nbsp;</label><br/>
										<!-- #section:plugins/date-time.datetimepicker -->
										<button class="btn btn-sm btn-info" id="btnQuery">
											<i class="ace-icon fa fa-tachometer  bigger-110"></i>
											Query
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
											Force
										</a>
									</li>

									<li>
										<a data-toggle="tab" href="#divNormalDist">
											<i class="pink ace-icon fa fa-bar-chart-o bigger-110"></i>
											Force NORMDIST
										</a>
									</li>
									<li>
										<a data-toggle="tab" href="#divChartPressure">
											<i class="grey ace-icon fa fa-cog  bigger-110"></i>
											Dist
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

									<div id="divNormalDist" class="tab-pane fade">
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
<!-- 闂傚倷鑳堕…鍫㈡崲閸儱绀夌�癸拷閸曨剙鍓抽梺鑽ゅ仧椤拷 -->
	<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

	<!-- 闂傚倷鑳堕崢褔銆冩惔銏㈩洸婵犲﹤鐗婇崑鈺呮煟閹伴潧澧伴柍缁樻礀閳规垶寰勫畝锟芥禒锟� -->
	<script src="${staticPath}/assets/js/jquery.min.js"></script>
	<script src="${staticPath}/assets/js/bootstrap.min.js"></script>

	<script src="${staticPath}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
	<script src="${staticPath}/assets/js/tableexport/TableTools.js"></script>
	<script src="${staticPath}/assets/js/tableexport/ZeroClipboard.js"></script>
	<script src="${staticPath}/assets/js/date-time/moment.min.js"></script>
	<script src="${staticPath}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script>
	<script src="${staticPath}/assets/js/chosen.jquery.min.js"></script>
	<script src="${staticPath}/assets/js/highcharts/highcharts.js"></script>
	<script src="${staticPath}/assets/js/highcharts/exporting.js"></script>
	<script src="${staticPath}/assets/js/highcharts/annotations.js"></script>
	<script src="${staticPath}/common/js/func.js"></script>
	<script src="${staticPath}/assets/js/jquery.blockUI.js"></script>
	<script src="${staticPath}/assets/js/ace-elements.min.js"></script>
	<script src="${staticPath}/assets/js/ace.min.js"></script>

	<script type="text/javascript">

		var tableList;
		var minTakt = "";
		var maxTakt = "";
		/*
		* the following parameters are for normal distribution chart
		* */
		var record; //the total data record
		var map_column_x = {};
		var colum_max;
		var colum_min;
		var colum_step;
		var colum_max_end; //map_column_x the last index
		var stdev;
		var mean;

		$.blockUI.defaults.message = '<h4><img style="height: 30px;width: 30px" src="${staticPath}/assets/img/loading.gif" /> Just a moment...</h4>';
		$.blockUI.defaults.overlayCSS.opacity = .2;
		$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

		$(document).ready(function() {

//			var startDate = "2018-03-14 06:30";
//			var endDate = "2018-03-15 01:30";
//			var selectStation = "1420";

//			get all the screw stations ajax method
			$.ajax({
				type : "post",
				url : "${adminPath}/kiener/screw/ajaxList_screw?type=force",
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
				}
			});

//			when the force station change, get the stroke and hw from the database
			$("#selectStationType").on('change', function(){
				var identifier = $(this).children('option:selected').val();
				console.info("identifier:" + identifier);

				$.ajax({
					type : "post",
					url : "${adminPath}/kiener/screw/ajaxList_screw_pos_spin",
					dataType : "json",
					data: {"identifier":identifier},
					success : function(data) {
						if(data.results.length == 0){
							//handle empty
							$("#selectPosSpin").empty();
							$("#selectPosSpin").append("<option value=''>No Data</option>");

						}else{
							var record = data.results;
							$("#selectPosSpin").empty();

							for(var i = 0; i < record.length; i++) {
								var text = "Stroke("+record[i]["pos"]+")" + "--" + "HW("+record[i]["spin"]+")";
								var value = record[i]["pos"] + "-" + record[i]["spin"];
								if(i == 0){
									$("#selectPosSpin").append("<option value='"+value+"' selected>"+text+"</option>");
								}else{
									$("#selectPosSpin").append("<option value='"+value+"'>"+text+"</option>");
								}
							}
						}
					}
				});

			});

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

//				var startDate = $("#date-timepicker-start").val();
//				var endDate = $("#date-timepicker-end").val();
//
				var startDate = "2017-11-11 06:30";
				var endDate = "2017-11-12 01:30";

				var forceStation = $("#selectStationType").find("option:selected").val();
				var pos_spin = $("#selectPosSpin").find("option:selected").val();
				var arr = pos_spin.split('-');
				var pos = arr[0]; //stroke
				var spin = arr[1]; //HW

				if (startDate == "" || endDate == "") {
					return false;
				}

				$("#myTab a[href='#divTable']").tab('show');

				if(tableList){
					$('#tableLeakTest').dataTable().fnDestroy();
				}
				initTable(startDate,endDate,forceStation,pos,spin);
			});

//			click the NormalDist show the normal dist for the leak rate
			$("#myTab a[href='#divNormalDist']").on('shown.bs.tab', function(e){

				var val_bar_xCategory = []; //show the category for the Bar Chart and column chart
				var val_pie = []; //
				var val_normdist = []; // show the normal distribution chart
				var strTemp = "";

				var tmpForce = 0.00;
				var tmpInt = 0;
				console.info("max:" + colum_max + " min:" + colum_min + " mean:" + mean +
						" stdev:" + stdev + " length: " + record.length);

				//initial the map colum
				initColumCategory(parseFloat(colum_min),parseFloat(colum_max),parseFloat(colum_step));

				for(var i = 0; i < record.length; i++) {
					//inital map_column_x for column chart
					tmpForce =  parseFloat(record[i]["forceAct"].toString());

					if(tmpForce <= colum_min){
						map_column_x[colum_min.toFixed(2)] =  map_column_x[colum_min.toFixed(2)] + 1;
						tmpInt = 0;
					}else if (tmpForce >= colum_max){
						map_column_x[colum_max_end] =  map_column_x[colum_max_end] + 1;
						tmpInt = 0;
					}else{
						tmpInt = Math.ceil(parseFloat(((tmpForce-colum_min)/colum_step).toFixed(2)));
						map_column_x[(colum_min + tmpInt * colum_step).toFixed(2).toString()] = map_column_x[(colum_min + tmpInt * colum_step).toFixed(2).toString()] + 1;
					}
				}

//					initial the column chart
				$.each(map_column_x, function(key, value){
					console.info("map_column_x after caculate:" + key + " " + value);
					strTemp = strTemp + "[";
					strTemp = strTemp + "'"+key + "'" + "," + value +"],";
					val_bar_xCategory.push("'"+key+"'");
//					console.info("Normal Dist:" + normalDist(key,mean,stdev));
					val_normdist.push(normalDist(key,mean,stdev));
				});

//				val_pie for column and pie chart
//				strTemp = "['1.0',16],['1.3',3],['1.6',1]";
				val_pie.push(strTemp);

				var barOption = {
					chart: {
						renderTo: 'chartBar',
						zoomType: 'xy'
					},
					title: {
						text: ''
					},
					subtitle: {
						text: ''
					},
					xAxis: {
					},
					yAxis: [{
						labels: {
							format: '{value}',
							style: {
								color: Highcharts.getOptions().colors[1]
							}
						},
						title: {
							text: 'Quantity',
							style: {
								color: Highcharts.getOptions().colors[1]
							}
						}
					}, { // Secondary yAxis
						title: {
							text: 'Normal Distribution',
							style: {
								color: Highcharts.getOptions().colors[0]
							}
						},
						labels: {
							format: '{value}',
							style: {
								color: Highcharts.getOptions().colors[0]
							}
						},
						opposite: true
					}],
					plotOptions: {
						line: {
							dataLabels: {
								enabled: true          // 瀵拷閸氼垱鏆熼幑顔界垼缁涳拷
							},
							enableMouseTracking: false // 閸忔娊妫存Η鐘崇垼鐠虹喕閲滈敍灞筋嚠鎼存梻娈戦幓鎰仛濡楀棎锟戒胶鍋ｉ崙璁崇皑娴犳湹绱版径杈ㄦ櫏
						}
					},
					tooltip: {
						shared: true
					},

					series: [
						{
							color: '#4572A7',
							type: 'column',
							yAxis: 1
						},
						{
							color: '#89A54E',
							type: 'spline'
						}
					]
				};

				barOption.title.text = "Force Distribution";

				barOption.series[0].name = "Force Act Count";
				barOption.series[0].data = eval('['+ val_pie +']');

				barOption.series[1].name = "Normal Distribution";
				barOption.series[1].data = eval('['+ val_normdist +']');

				barOption.xAxis.categories = eval('['+ val_bar_xCategory +']');
				new Highcharts.Chart(barOption);

			});


			$("#btnQuery").click(function() {

//				var startDate = $("#date-timepicker-start").val();
//				var endDate = $("#date-timepicker-end").val();

				var startDate = "2017-11-11 06:30";
				var endDate = "2017-11-12 01:30";

				$("#myTab a[href='#divChart']").tab('show');

				var forceStation = $("#selectStationType").find("option:selected").val();
				var pos_spin = $("#selectPosSpin").find("option:selected").val();
				var pos = pos_spin;
				var arr = pos_spin.split('-');
				var pos = arr[0]; //stroke
				var spin = arr[1]; //hw

				if (forceStation == "" || pos_spin == "" ) {
					top.layer.alert('请选择岗位', {icon: 0, title:'警告'});
					return false;
				}
				console.info("query data startDate:" + startDate + " endDate:" + endDate + " station:" + forceStation + "" +
						" pos_spin " + pos_spin + " pos:" + pos + " spin:" + spin);

				initChart(options,optionAngle, startDate, endDate, forceStation, pos, spin);

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
						text: 'Force'
					},
					plotLines:[
						{
							label:{
//								text:'38s',     //閺嶅洨顒烽惃鍕敶鐎癸拷
								align:'left',                //閺嶅洨顒烽惃鍕寜楠炲厖缍呯純顕嗙礉濮樻潙閽╃仦鍛箯,姒涙顓婚弰顖涙寜楠炲啿鐪虫稉鐠玡nter
								x:-10                         //閺嶅洨顒烽惄绋款嚠娴滃氦顫︾�规矮缍呴惃鍕秴缂冾喗鎸夐獮鍐蹭焊缁夎崵娈戦崓蹇曠閿涘矂鍣搁弬鏉跨暰娴ｅ稄绱濆鏉戦挬鐏炲懎涔�10px
							},
							color:'blue',           //缁捐法娈戞０婊嗗閿涘苯鐣炬稊澶夎礋缁俱垼澹�
							dashStyle:'solid',     //姒涙顓婚崐纭风礉鏉╂瑩鍣风�规矮绠熸稉鍝勭杽缁撅拷
//							value:38,               //鐎规矮绠熼崷銊╁亝娑擃亜锟介棿绗傞弰鍓с仛閺嶅洨銇氱痪鍖＄礉鏉╂瑩鍣烽弰顖氭躬x鏉炵繝绗傞崚璇插娑擄拷3閻ㄥ嫬锟界厧顦╅崹鍌滄纯閸栨牔绔撮弶锛勫殠
							width:2               //閺嶅洨銇氱痪璺ㄦ畱鐎硅棄瀹抽敍锟�2px
						},
						{
							label:{
//								text:'38s',     //閺嶅洨顒烽惃鍕敶鐎癸拷
								align:'left',                //閺嶅洨顒烽惃鍕寜楠炲厖缍呯純顕嗙礉濮樻潙閽╃仦鍛箯,姒涙顓婚弰顖涙寜楠炲啿鐪虫稉鐠玡nter
								x:-10                         //閺嶅洨顒烽惄绋款嚠娴滃氦顫︾�规矮缍呴惃鍕秴缂冾喗鎸夐獮鍐蹭焊缁夎崵娈戦崓蹇曠閿涘矂鍣搁弬鏉跨暰娴ｅ稄绱濆鏉戦挬鐏炲懎涔�10px
							},
							color:'green',           //缁捐法娈戞０婊嗗閿涘苯鐣炬稊澶夎礋缁俱垼澹�
							dashStyle:'solid',     //姒涙顓婚崐纭风礉鏉╂瑩鍣风�规矮绠熸稉鍝勭杽缁撅拷
//							value:38,               //鐎规矮绠熼崷銊╁亝娑擃亜锟介棿绗傞弰鍓с仛閺嶅洨銇氱痪鍖＄礉鏉╂瑩鍣烽弰顖氭躬x鏉炵繝绗傞崚璇插娑擄拷3閻ㄥ嫬锟界厧顦╅崹鍌滄纯閸栨牔绔撮弶锛勫殠
							width:2               //閺嶅洨銇氱痪璺ㄦ畱鐎硅棄瀹抽敍锟�2px
						}
					]
				},
				tooltip: {
					valueDecimals: 2,
					shared: true,
					formatter:function(){
                        return this.x + '<br/>' + '<b>Force ='+this.points[0].point.y + '</b><br/>' +
								'PartNumber=' + this.points[0].point.partNumber + '<br/>' +
								'Variety=' + this.points[0].point.variety.substr(1) + ' Station=' + this.points[0].point.station + '<br/>' +
								'UW-T=' + this.points[1].y + ' DW-T=' + this.points[2].y + '<br/>' +
								'Max=' + this.points[3].y + ' Min=' + this.points[4].y;
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
					},{
						name : "Force Max",
						turboThreshold:0,
						color: '#73BF00'
					},
					{
						name : "Force Min",
						turboThreshold:0,
						color: '#8F4586'
					}
				]
			};

			var optionAngle = {
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
					valueDecimals: 2,
					shared: true,
					formatter:function(){
						return this.x + '<br/>' + '<b>Dist ='+this.points[0].point.y + '</b><br/>' +
								'PartNumber=' + this.points[0].point.partNumber + '<br/>' +
								'Variety=' + this.points[0].point.variety.substr(1) + ' Station=' + this.points[0].point.station + '<br/>';
					}
				},
				plotOptions: {
//					turboThreshold:200000 //set 0 to disable the cheack
				},
				series:[{
					turboThreshold:0,
					color: '#1C86EE'
				}]
			};

		});

		function initChart(options, optionsAngle, start, end, station, pos, spin) {
			var val_time = [];
			var val_DistAct = [];
			var val_ForceAct = [];
			var val_Force = []; //contain the partNumber, variety, and station and so on.

			var val_forceMax = [];
			var val_forceMin = [];
			var val_uwt = [];
			var val_dwt = [];
			var max = 0;
			var min = 0;
			var sum = 0.00;
			var rval = 0.00;
			var uwt = 0;
			var dwt = 0;
			$.ajax({
				type : "post",
				url : "${adminPath}/kiener/leak/ajaxList_forceinfo",
				dataType : "json",
				data: {"measureDate":start,"endDate":end, "station":station,"pos":pos,"spin":spin},
				error : function (xhr, textStatus){
					console.info("queryData ajax error,textStatus:" + textStatus);
				},
				success : function(data){
					record = data.results;
					var length = record.length;
					if(length == 0){
						//handle empty
						console.info("empty");
						top.layer.alert('没有数据', {icon: 0, title:'警告'});
					}else{
						var tempStr = "";
						var tempStrDistAct = "";
						var tmpForceAct = 0.00;
						var tmpInt = 0;
						console.info("chart data total length: " + length);
						for(var i = 0; i < length; i++) {
							val_time.push("'" + record[i]["measureDate"] + "'");

							tmpForceAct = parseFloat(record[i]["forceAct"].toString()).toFixed(2);

							val_ForceAct.push(tmpForceAct.toString());
							tempStr = "{y:" + tmpForceAct.toString() + ",partNumber:'" + record[i]["partNumber"]
							+ "',variety:'" + record[i]["variety"] + "',station:'" + record[i]["station"] + "'}";
							tempStrDistAct = "{y:" + record[i]["distAct"].toString() + ",partNumber:'" + record[i]["partNumber"]
									+ "',variety:'" + record[i]["variety"] + "',station:'" + record[i]["station"] + "'}";
							val_DistAct.push(tempStrDistAct);
							val_Force.push(tempStr);
							val_forceMax.push(record[i]["forceMax"].toString());
							val_forceMin.push(record[i]["forceMin"].toString());

							sum = sum +  parseFloat(record[i]["forceAct"].toString());

							//inital map_column_x for column chart
							tmpForceAct =  parseFloat(record[i]["forceAct"].toString());

							if(tmpForceAct <= colum_min){
								map_column_x[colum_min.toFixed(1)] =  map_column_x[colum_min.toFixed(1)] + 1;
								tmpInt = 0;
//								console.info("LeakRate:" + tmpLeakRate + " tmpInt:" + tmpInt + " key:" + colum_min.toFixed(1).toString());
							}else if (tmpForceAct >= colum_max){
								map_column_x[colum_max.toFixed(1)] =  map_column_x[colum_max.toFixed(1)] + 1;
								tmpInt = 0;
//								console.info("LeakRate:" + tmpLeakRate + " tmpInt:" + tmpInt + " key:" + colum_max.toFixed(1).toString());
							}else{
								tmpInt = Math.ceil(parseFloat(((tmpForceAct-colum_min)/colum_step).toFixed(2)));
								map_column_x[(colum_min + tmpInt * colum_step).toFixed(1).toString()] = map_column_x[(colum_min + tmpInt * colum_step).toFixed(1).toString()] + 1;
//								console.info("LeakRate:" + tmpLeakRate + " tmpInt:" + tmpInt +
//										":" + (tmpLeakRate-colum_min)/colum_step + " key:" + (colum_min + tmpInt * colum_step).toFixed(1).toString());
							}
						}

						colum_max = Math.max.apply(null, val_ForceAct);
						colum_min = Math.min.apply(null, val_ForceAct);
						mean = sum/length;
						colum_step = (colum_max/Math.ceil(Math.sqrt(length))).toFixed(2);
						//fill the input text
						$("#txtMin").val(colum_min);
						$("#txtMax").val(colum_max);
						$("#txtStep").val(colum_step);

						console.info("sqrt:" + Math.sqrt(length).toFixed(2) + " ceil: " + Math.ceil(Math.sqrt(length)) + " " +
								" " + (colum_max/Math.ceil(Math.sqrt(length))).toFixed(2));

						//STDEV Sigma
						for(var i = 0; i < length; i++) {
							tmpForceAct = parseFloat(record[i]["forceAct"].toString());
							rval = rval + Math.pow((tmpForceAct - mean),2);
						}
						rval = rval / (length-1);
						stdev = Math.sqrt(rval);

						uwt = mean + 3 * stdev;
						dwt = mean - 3 * stdev;

						//set the up_t and down_t array value
						for(var i = 0; i < length; i++) {
							val_uwt.push(uwt.toFixed(2));
							val_dwt.push(dwt.toFixed(2));
						}

						console.info("max:" + colum_max + " min:" + colum_min + " mean:" + mean.toFixed(2) +
								" stdev:" + stdev.toFixed(2) + " uwt:" + uwt.toFixed(2) +
								" dwt:" + dwt.toFixed(2) + " sum:" + sum.toFixed(2));

						options.series[0].name = "Force";

						options.series[0].data = eval('['+ val_Force+']');
						options.series[1].data = eval('['+ val_uwt +']');
						options.series[2].data = eval('['+ val_dwt +']');
						options.series[3].data = eval('['+ val_forceMax +']');
						options.series[4].data = eval('['+ val_forceMin +']');

						options.labels.items[0].html = "Max:" + colum_max +" Min:" + colum_min + "<br/>Mean:" + mean.toFixed(2) +
						" Sigma:" + stdev.toFixed(2) + "<br/> 3-Sigma:" + (3* stdev).toFixed(2) + " Count:" + length;
						options.xAxis.categories = eval('['+ val_time +']');
						options.title.text = "Force Value for " + "M" + station;
						options.subtitle.text = start + " to " + end + " Stroke:" + pos + " HW:" + spin ;


						optionsAngle.series[0].data = eval('['+ val_DistAct +']');
						optionsAngle.series[0].name = "Dist Act";
						optionsAngle.xAxis.categories = eval('['+ val_time +']');
						optionsAngle.title.text = "Dist Value for " + "M" + station;
						optionsAngle.subtitle.text = start + " to " + end + " Stroke:" + pos + " HW:" + spin ;

						new Highcharts.Chart(options);
						new Highcharts.Chart(optionsAngle);

						val_DistAct = [];
						val_time = [];
						val_ForceAct = [];

					}

				}
			});

		}

		function initTable(start, end, station,pos,spin){
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
					"url" : "${adminPath}/kiener/leak/ajaxList_forceinfo?measureDate="+start +
					"&endDate=" + end + "&station=" + station + "&pos=" + pos + "&spin=" +spin,
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
						"data": "forceMax",
						"sTitle":"ForceMax"
					},
					{
						"data": "forceAct",
						"sTitle":"ForceAct",
						"render": function(data, type, row) {
							return "<B>" + data + "</B>"
						}
					},
					{
						"data": "forceMin",
						"sTitle":"ForceMin"
					},
					{
						"data": "distMax",
						"sTitle":"DistMax"
					},
					{
						"data": "distAct",
						"sTitle":"DistAct",
						"render": function(data, type, row) {
							return "<B>" + data + "</B>"
						}
					},
					{
						"data": "distMin",
						"sTitle":"DistMin"
					}
				]
			} );

		}

		/*
		* create a map to store all the min, step and max
		* */
		function initColumCategory(min, max, step){
			console.info("min:" + min + " max:" + max + " step:" + step);
			//initial first
			map_column_x = {};
			while(min <= max){
				map_column_x[min.toFixed(2)] = 0;

				min = min + step;
				if(min > max){
					colum_max_end = min.toFixed(2);
					map_column_x[colum_max_end] = 0;
				}
			}

		}
	</script>

</body>

</html>
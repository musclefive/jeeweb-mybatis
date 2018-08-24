<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>Employee Efficiency Analysis</title>

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

									<div class="col-sm-1">
										<label>&nbsp;Type:&nbsp;</label>

										<select class="form-control" id="selectType">

										</select>
									</div>

									<div class="col-sm-1">
										<label>&nbsp;Max:&nbsp;</label>

										<div class="input-group">
											<input id="txtMaxTaktTime" type="text" class="form-control input-mini"  value="90"/>
										</div>

									</div>

									<div class="col-sm-1">
										<label>&nbsp;Min:&nbsp;</label>

										<div class="input-group">
											<input id="txtMinTaktTime" type="text" class="form-control input-mini"  value="20"/>
										</div>

										<label>&nbsp;&nbsp;</label>
									</div>

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
	<script src="${staticPath}/assets/js/highcharts/annotations.js"></script>

	<script src="${staticPath}/assets/js/date-time/moment.min.js"></script>
	<script src="${staticPath}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script>
	<script src="${staticPath}/assets/js/chosen.jquery.min.js"></script>

	<script src="${staticPath}/assets/js/ace.min.js"></script>
	<script src="${staticPath}/assets/js/ace-elements.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.blockUI.js"></script>
	<script src="${staticPath}/assets/js/fuelux/fuelux.spinner.min.js"></script>

	<script type="text/javascript">

		var val_avgTakTime = new Array();
		var val_station = new Array();
		var val_total = new Array();

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

//			var options = {
//				chart: {
//					renderTo: 'chartPanel',
//					zoomType: 'x',
//					type: 'column'
//				},
//				title: {
//					text: ''
//				},
//				subtitle: {
////					text: ''
//				},
//				labels:{
//					style:{
//						color : "#ff0000"
//					},
//					items:[{
//						html:'',
//						style:{
//							left:'0px',
//							top:'-40px'
//						}
//					}]
//				},
//				xAxis: {
//					crosshair: true
//				},
//				yAxis: {
//					min: 0,
//					title: {
//						text: 'Takt Time(ss)'
//					},
//					plotLines:[{
//						label:{
//							text:'38s',     //閺嶅洨顒烽惃鍕敶鐎癸拷
//							align:'left',                //閺嶅洨顒烽惃鍕寜楠炲厖缍呯純顕嗙礉濮樻潙閽╃仦鍛箯,姒涙顓婚弰顖涙寜楠炲啿鐪虫稉鐠玡nter
//							x:-10                         //閺嶅洨顒烽惄绋款嚠娴滃氦顫︾�规矮缍呴惃鍕秴缂冾喗鎸夐獮鍐蹭焊缁夎崵娈戦崓蹇曠閿涘矂鍣搁弬鏉跨暰娴ｅ稄绱濆鏉戦挬鐏炲懎涔�10px
//						},
//						color:'red',           //缁捐法娈戞０婊嗗閿涘苯鐣炬稊澶夎礋缁俱垼澹�
//						dashStyle:'solid',     //姒涙顓婚崐纭风礉鏉╂瑩鍣风�规矮绠熸稉鍝勭杽缁撅拷
//						value:38,               //鐎规矮绠熼崷銊╁亝娑擃亜锟介棿绗傞弰鍓с仛閺嶅洨銇氱痪鍖＄礉鏉╂瑩鍣烽弰顖氭躬x鏉炵繝绗傞崚璇插娑擄拷3閻ㄥ嫬锟界厧顦╅崹鍌滄纯閸栨牔绔撮弶锛勫殠
//						width:2               //閺嶅洨銇氱痪璺ㄦ畱鐎硅棄瀹抽敍锟�2px
//					}]
//				},
//				tooltip: {
//					headerFormat: '<span style="font-size:10px"><B>Employee ID:{point.key}</B></span><table>',
//					pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
//					'<td style="padding:0"><b>{point.y:.0f} s</b></td></tr>' +
//					'<tr><td style="color:{series.color};padding:0">Total Record: </td>' +
//					'<td style="padding:0"><b>{point.total:.0f}</b></td></tr>',
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
//				series:[{
////					name : "Avg Tak Time",
////					data : [ 37, 38, 39, 38, 38, 40, 39, 39, 38, 38]
//					dataLabels: {
//						enabled: true,
//						rotation: 0,
//						color: '#FFFFFF',
//						align: 'center',
//						format: '{point.total}', // one decimal
//						y: 25, // 10 pixels down from the top
//						style: {
//							fontSize: '13px',
//							fontFamily: 'Verdana, sans-serif'
//						}
//					}
//				}]
//			};

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
					crosshair: true
				},
				yAxis: [
					{
						min: 0,
						title: {
							text: 'Takt Time(ss)'
						},
						plotLines:[{
							label:{
								text:'38s',     //閺嶅洨顒烽惃鍕敶鐎癸拷
								align:'left',                //閺嶅洨顒烽惃鍕寜楠炲厖缍呯純顕嗙礉濮樻潙閽╃仦鍛箯,姒涙顓婚弰顖涙寜楠炲啿鐪虫稉鐠玡nter
								x:-10                         //閺嶅洨顒烽惄绋款嚠娴滃氦顫︾�规矮缍呴惃鍕秴缂冾喗鎸夐獮鍐蹭焊缁夎崵娈戦崓蹇曠閿涘矂鍣搁弬鏉跨暰娴ｅ稄绱濆鏉戦挬鐏炲懎涔�10px
							},
							color:'red',           //缁捐法娈戞０婊嗗閿涘苯鐣炬稊澶夎礋缁俱垼澹�
							dashStyle:'solid',     //姒涙顓婚崐纭风礉鏉╂瑩鍣风�规矮绠熸稉鍝勭杽缁撅拷
							value:38,               //鐎规矮绠熼崷銊╁亝娑擃亜锟介棿绗傞弰鍓с仛閺嶅洨銇氱痪鍖＄礉鏉╂瑩鍣烽弰顖氭躬x鏉炵繝绗傞崚璇插娑擄拷3閻ㄥ嫬锟界厧顦╅崹鍌滄纯閸栨牔绔撮弶锛勫殠
							width:2               //閺嶅洨銇氱痪璺ㄦ畱鐎硅棄瀹抽敍锟�2px
						}]
					},
					{
						min: 0,
						title: {
							text: 'Total Engine'
						},
						opposite: true
					}
				],
				tooltip: {
//					headerFormat: '<span style="font-size:10px"><B>Employee ID:{point.key}</B></span><table>',
//					pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
//					'<td style="padding:0"><b>{point.y:.0f} s</b></td></tr>' +
//					'<tr><td style="color:{series.color};padding:0">Total Record: </td>' +
//					'<td style="padding:0"><b>{point.total:.0f}</b></td></tr>',
//					footerFormat: '</table>',
					shared: true,
					useHTML: true
				},
				plotOptions: {
					column: {
						pointPadding: 0.2,
						borderWidth: 0
					}
				},
				series:[
					{
//					name : "Avg Tak Time",
//					data : [ 37, 38, 39, 38, 38, 40, 39, 39, 38, 38]
					type: 'column'
				},
					{
						type: 'spline',
						yAxis: 1
					}
				]
			};

			$('#date-timepicker-start').datetimepicker({
				"maxDate" : moment().subtract(0, "days"),
//			"sideBySide" : true,
				"viewDate" : true,
				"defaultDate" : moment().subtract(4,"days").format("YYYY-MM-DD 07:30"),
//				"format" : "YYYY-MM-DD"
			"format" : "YYYY-MM-DD HH:mm"
//			"minDate" : moment().subtract(8, "days")
			}).on('dp.change',function(){
				var startDate = $("#date-timepicker-start").val();
				var endDate = $("#date-timepicker-end").val();
				console.info("startDate:" + startDate + " endDate:" + endDate);
				getAllEngineType(startDate, endDate);
			});
			$('#date-timepicker-end').datetimepicker({
				"maxDate" : moment().subtract(0, "days"),
//			"sideBySide" : true
				"defaultDate" : moment().subtract(0,"days").format("YYYY-MM-DD 01:30"),
				"format" : "YYYY-MM-DD HH:mm"
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
				var selectStation = $("#selectStationType").find("option:selected").val();
				var stationName = $("#selectStationType").find("option:selected").text();
//				var currentType = "all"; //temp value no use
				var max = $("#txtMaxTaktTime").val();
				var min = $("#txtMinTaktTime").val();

				if(startDate == "" || endDate == "" || selectStation == "")
				{
					top.layer.alert('请选择岗位！', {icon: 0, title:'警告'});
					return false;
				}
//				startDate = startDate +  " 06:30";
//				endDate = endDate + " 06:30";
				console.info("startDate: " + startDate + "  to : " + endDate + " currentType:" + currentType);

				$.ajax({
					type : "post",
					url : "${adminPath}/kiener/taketime/ajaxList_takttime_employee",
					dataType : "json",
					data: {"measureDate":startDate,"endDate":endDate,
						"currentType":currentType, "max": max,"min":min,
						"station":selectStation,"currentType":currentType},
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
							var tempStr ="";
							var workerID = "";
							console.info("record:" + record.length);
							for(var p in record){
								console.info("WorkerID: " + record[p]["workerID"] + " avgTakTime:" +
										record[p]["avgTakTime"] + " total:" + record[i]["total"]);
								if(!record[p].hasOwnProperty("workerID") ){
									workerID = "None";
								}else{
									workerID = record[p]["workerID"];
								}
								val_station.push(workerID);
//								val_avgTakTime.push(record[p]["avgTakTime"]);
								tempStr = "{y:" + record[p]["avgTakTime"] + ",total:'" + record[p]["total"] + "'}";
								val_avgTakTime.push(tempStr);
								val_total.push(record[p]["total"]);

							}
							console.info("val_station:" + val_station);
							console.info("val_avgTakTime:" + val_avgTakTime);

//							options.xAxis.categories = eval('['+ val_station +']');
							options.xAxis.categories = val_station;
							if(currentType != "all"){
								currentType = currentType.substr(1);
							}
////							options.labels.items[0].html = "Total Record:" + record.length + "<br/>" + "Mean:cc";
//
							options.series[0].name = "Avg Tak Time";
							options.series[0].data = eval('['+ val_avgTakTime +']');
//							options.series[0].data = val_avgTakTime;

							options.series[1].name = "Total Produce Engine";
							options.series[1].data = eval('['+ val_total +']');

//							if(currentType != "all"){
//								currentType = currentType.substr(1);
//							}
							options.title.text = "Average Takt Time for Employees --" + stationName;
							options.subtitle.text = "From " + startDate + " To " + endDate + " Engine Type:" + currentType;
						}
						new Highcharts.Chart(options);
						val_avgTakTime = [];
						val_station = [];
						val_total = [];

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
						$("#selectType").append("<option value='all' selected>--All--</option>");

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
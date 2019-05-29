<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%--<meta name="decorator" content="single"/>--%>
	<title>ZKG Online List</title>

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
										<label>&nbsp;Type:&nbsp;</label>

										<select class="form-control" id="selectType">
										</select>
									</div>
									<div class="col-sm-3">
										<label>&nbsp;Shift:&nbsp;</label>

										<div class="form-inline padding-0">
											<!-- #section:custom/checkbox -->
											<div class="checkbox">
												<label>
													<input name="shift-checkbox" type="checkbox" class="ace ace-checkbox-2" value="shift_1" checked/>
													<span class="lbl">一班</span>
												</label>
											</div>

											<div class="checkbox">
												<label>
													<input name="shift-checkbox" type="checkbox" class="ace ace-checkbox-2" value="shift_2" checked/>
													<span class="lbl">二班</span>
												</label>
											</div>

											<div class="checkbox">
												<label>
													<input name="shift-checkbox" type="checkbox" class="ace ace-checkbox-2"  value="shift_3"/>
													<span class="lbl">三班</span>
												</label>
											</div>

											<!-- /section:custom/checkbox -->
										</div>

									</div>

									<div class="col-sm-3">
										<label>&nbsp;</label><br/>
										<!-- #section:plugins/date-time.datetimepicker -->
										<button class="btn btn-sm btn-success" id="btnQuery">
											查询
											<i class="ace-icon fa fa-search icon-on-right bigger-110"></i>
										</button>
										<button class="btn btn-sm btn-warning" id="btnClear">
											<i class="ace-icon fa fa-undo bigger-110"></i>
											清除
										</button>
									</div>
								</div>
								<div class="space-6"></div>
							</div>
						</div>
						<div class="space-6"></div>
						<div class="row">
							<div class="col-sm-12 table-bordered border">
								<div class="row">
									<div class="infobox infobox-grey infobox-small infobox-dark">
										<div class="infobox-data">
											<div class="infobox-content">缸体上线</div>
											<div class="infobox-content" id="divZKGTotal">0</div>
										</div>
									</div>
									<div class="infobox infobox-grey infobox-small infobox-dark">
										<div class="infobox-data">
											<div class="infobox-content">瓦片总数</div>
											<div class="infobox-content" id="divWapianTotal">0</div>
										</div>
									</div>
									<div class="infobox infobox-red infobox-small infobox-dark">
										<div class="infobox-data">
											<div class="infobox-content">红色 R</div>
											<div class="infobox-content" id="divRedNumber">0</div>
										</div>
									</div>
									<div class="infobox infobox-orange infobox-small infobox-dark">
										<div class="infobox-data">
											<div class="infobox-content">黄色 G</div>
											<div class="infobox-content" id="divYellowNumber">0</div>
										</div>
									</div>
									<div class="infobox infobox-black infobox-small infobox-dark">
										<div class="infobox-data">
											<div class="infobox-content">黑色 S</div>
											<div class="infobox-content" id="divBlackNumber">0</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<table id="tableZKGWapianList" class="table table-striped table-bordered table-hover">

							</table>
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
<script src="${staticPath}/assets/js/jquery.blockUI.js"></script>
<script src="${staticPath}/assets/js/jquery.autosize.min.js"></script>

<script type="text/javascript">

	var tableList;
	var tableDetailList;
	var tableQueryList;
	var tableZKGDailyList;
	var minTakt = "";
	var maxTakt = "";
	var station = "10";
	var strTotalColoredWapian = "";

	$.blockUI.defaults.message = '<h4><img style="height: 30px;width: 30px" src="${staticPath}/assets/img/loading.gif" /> Just a moment...</h4>';
	$.blockUI.defaults.overlayCSS.opacity = .2;
	$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);

	$(document).ready(function() {

		$('#date-timepicker-start').datetimepicker({
			"maxDate" : moment().subtract(1, "days"),
//				"sideBySide" : true,
			"viewDate" : true,
			"format" : "YYYY-MM-DD HH:mm",
			"defaultDate" : moment().subtract(1, "days").format("YYYY-MM-DD 08:00")
//				"format" : "YYYY-MM-DD HH:mm"
//				"minDate" : moment().subtract(8, "days")
		}).on('dp.change',function(){
			var startDate = $("#date-timepicker-start").val();
			var endDate = $("#date-timepicker-end").val();
			console.info("startDate:" + startDate + " endDate:" + endDate);
			getAllEngineType(startDate, endDate);
		});
		$('#date-timepicker-end').datetimepicker({
			"maxDate" : moment().subtract(0, "days"),
//				"sideBySide" : true,
			"viewDate" : true,
			"format" : "YYYY-MM-DD HH:mm",
			"defaultDate" : moment().subtract(0,"days").format("YYYY-MM-DD 01:30")
//				"format" : "YYYY-MM-DD HH:mm"
//				"minDate" : moment().subtract(8, "days")
		}).on('dp.change',function(){
			var startDate = $("#date-timepicker-start").val();
			var endDate = $("#date-timepicker-end").val();
			console.info("startDate:" + startDate + " endDate:" + endDate);
			getAllEngineType(startDate, endDate);
		});

		$('textarea[class*=autosize]').autosize({append: "\n"});


		//			inital the engine type with the default date
		getAllEngineType($("#date-timepicker-start").val(), $("#date-timepicker-end").val());

		/*
		 * all the check box for shift query setting
		 * */
		$("input[type='checkbox'][name='shift-checkbox']").click(function(){
			var shift_1_flag = false;
			var shift_2_flag = false;
			var shift_3_flag = false;

			$("input[type='checkbox'][name='shift-checkbox']").each(function (i,e){
				console.info(i + " " + $(this).val() + " : " + $(this).is(':checked'));
//					shift-1
				if($(this).val() == "shift_1" && $(this).is(':checked')){
					shift_1_flag = true;
				}else if ($(this).val() == "shift_2" && $(this).is(':checked')){
					shift_2_flag = true;
				}else if ($(this).val() == "shift_3" && $(this).is(':checked')){
					shift_3_flag = true;
				}
			});

			console.info("shift_1:" + shift_1_flag + " shift_2:" + shift_2_flag + " shift_3:" + shift_3_flag)
			if(shift_1_flag && shift_2_flag && shift_3_flag){
				//query for all the 3 shift
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(-1, "days").format("YYYY-MM-DD 08:00");

				$("#date-timepicker-end").val(ShiftDate);
			}else if(shift_1_flag && shift_2_flag && !shift_3_flag){
				//query for all the 2 shifts by default
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(-1, "days").format("YYYY-MM-DD 01:30");

				$("#date-timepicker-end").val(ShiftDate);

			}else if(shift_1_flag && !shift_2_flag && !shift_3_flag){
				//query for only the first shift
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(0, "days").format("YYYY-MM-DD 16:30");

				$("#date-timepicker-end").val(ShiftDate);

			}else if(!shift_1_flag && shift_2_flag && !shift_3_flag){
				//query only the second shift
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(0, "days").format("YYYY-MM-DD 16:30");
				$("#date-timepicker-start").val(ShiftDate);
			}else if(!shift_1_flag && !shift_2_flag && shift_3_flag){
				//query only the third shift

			}else if(!shift_1_flag && !shift_2_flag && !shift_3_flag){
				//default select the first and second shift
				var startDate = $("#date-timepicker-start").val();
				var ShiftDate = moment(startDate).subtract(-1, "days").format("YYYY-MM-DD 01:30");

				$("#date-timepicker-end").val(ShiftDate);
			}
		});
/*
* query the zk/zkg/kw online list between start and end
* */
		$("#btnQuery").click(function() {
			var startDate = $("#date-timepicker-start").val();
			var endDate = $("#date-timepicker-end").val();
			//default value
			var currentType = $("#selectType").find("option:selected").val();

			console.info("query data startDate:" + startDate + " endDate:" + endDate);
			if (startDate == "" || endDate == "") {
				return false;
			}

			if(tableList){
				$('#tableZKGWapianList').dataTable().fnDestroy();
			}
			//station:70 for kw station:10 for ZKG
			initTable(startDate,endDate,"10", currentType);
		});

		$("#btnClear").click(function(){
			$("#date-timepicker-start").val("");
			$("#date-timepicker-end").val("");
		});
	});

	function initTable(start, end, station, currentType){
//			console.info("inti table :" + dataResult.length);
		tableList = $('#tableZKGWapianList').dataTable( {
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
				"url" : "${adminPath}/kiener/dmc/ajaxList_dmc_part_online_list?measureDate="+start +
				"&endDate=" + end + "&station=" + station + "&currentType=" + currentType,
				"dataSrc" : "results",
//					"success": fnCallback,
				"timeout": 35000,   // optional if you want to handle timeouts (which you should)
				"error": handleAjaxError // this sets up jQuery to give me errors
			},
			bAutoWidth: false,
			"createdRow":function(row,data, index){
				strTotalColoredWapian = strTotalColoredWapian + data['total'];
//				console.info(strTotalColoredWapian);
			},
			"initComplete":function(settings, json){
//				strTotalColoredWapian = "RRRSSR";
//				console.info("init complete: " + strTotalColoredWapian);
				console.info("total :" + json.results.length);
				$("#divRedNumber").html("");
				$("#divYellowNumber").html("");
				$("#divBlackNumber").html("");
				$("#divWapianTotal").html("");
				$("#divZKGTotal").html("");
				$("#divRedNumber").html (parseInt(strTotalColoredWapian.split("R").length) - 1);
				$("#divYellowNumber").html (parseInt(strTotalColoredWapian.split("G").length) - 1);
				$("#divBlackNumber").html (parseInt(strTotalColoredWapian.split("S").length) - 1);
				$("#divWapianTotal").html(parseInt(strTotalColoredWapian.length));
				$("#divZKGTotal").html(json.results.length);
				strTotalColoredWapian = "";

			},
			"order": [[ 2, "desc" ]],
			"columns":[
				{
					"data": "partNumber",
					"sTitle":"发动机号"
				},
				{
					"data": "variety",
					"sTitle":"发动机型号",
					"render": function(data, type, row) {
						return data.substring(1);
					}
				},
				{
					"data": "measureDate",
					"sTitle":"上线时间"
				},

				{
					"data": "type",
					"sTitle":"缸体型号"
				},
				{
					"data": "total",
					"sTitle":"瓦片颜色"
				}
			]
		} );

	}

	function getAllEngineType(startDate, endDate){

		console.info("startDate:" + startDate + " endDate:" + endDate);
		// 				dynamic show the engine type list
		$.ajax({
			type : "post",
			url : "${adminPath}/kiener/measure/ajaxList_engineType",
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
						var text = "--" + record[i]["variety"].substr(1) + "--";
						var value = record[i]["variety"];
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


	function handleAjaxError( xhr, textStatus, error ) {
		if ( textStatus === 'timeout' ) {
			alert( 'The server took too long to send the data.' );
		}
		else {
			alert( 'An error occurred on the server. Please try again again.');
		}
	}



</script>

</body>

</html>
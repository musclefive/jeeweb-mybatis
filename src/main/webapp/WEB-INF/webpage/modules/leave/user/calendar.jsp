<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>Calendar View</title>

	<!-- bootstrap & fontawesome -->
	<link rel="stylesheet" href="${staticPath}/assets/css/bootstrap.min.css" />
	<!--<link rel="stylesheet" href="../assets/css/font-awesome.min.css" />-->
	<link rel="stylesheet" href="${staticPath}/assets/css/font-awesome.min.css" />

	<!-- page specific plugin styles -->
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/datatable/buttons.bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/datatable/TableTools.css">
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/bootstrap-datetimepicker.css" />
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/chosen.css" />
	<link rel="stylesheet" type="text/css" href="${staticPath}/assets/css/fullcalendar.css" />

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
						<div class="space-6"></div>
						<div class="row">
							<div class="col-sm-6">
								<div class="space"></div>

								<!-- #section:plugins/data-time.calendar -->
								<div id="calendar"></div>

								<!-- /section:plugins/data-time.calendar -->
							</div>
							<div class="col-sm-6">
								<div class="space-8"></div>

								<div class="widget-box transparent">
									<div class="widget-header">
										<h3 class="widget-title lighter">统计情况</h3>
										<div class="space-12"></div>

									</div>

									<div class="widget-body">
										<div class="widget-main padding-6 no-padding-left no-padding-right">
											<table id="tableLeaveList" class="table table-striped table-bordered table-hover">

											</table>
										</div>
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
<!-- 閸忋劌鐪琷s -->
	<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

	<!-- 閼奉亜鐣炬稊濉瞫 -->
	<script src="${staticPath}/assets/js/jquery.min.js"></script>
	<script src="${staticPath}/assets/js/bootstrap.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
	<script src="${staticPath}/assets/js/tableexport/TableTools.js"></script>
	<script src="${staticPath}/assets/js/tableexport/ZeroClipboard.js"></script>
	<script src="${staticPath}/assets/js/moment.min.js"></script>
	<script src="${staticPath}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script>
	<script src="${staticPath}/assets/js/ace.min.js"></script>
	<script src="${staticPath}/assets/js/ace-elements.min.js"></script>
	<script src="${staticPath}/assets/js/chosen.jquery.min.js"></script>
	<script src="${staticPath}/assets/js/highcharts/highcharts.js"></script>
	<script src="${staticPath}/assets/js/highcharts/exporting.js"></script>
	<script src="${staticPath}/assets/js/jquery.blockUI.js"></script>
	<script src="${staticPath}/assets/js/fuelux/fuelux.spinner.min.js"></script>
	<script src="${staticPath}/assets/js/fullcalendar.js"></script>

	<script type="text/javascript">

		$(document).ready(function() {

			/* initialize the calendar
			 -----------------------------------------------------------------*/

			var date = new Date();
			var tableList;


//			var start = "2018-01-01";
//			var end = "2018-12-31";

			var start = moment().startOf("month").format("YYYY-MM-DD");
			var end = moment().endOf("month").format("YYYY-MM-DD");

			initLeaveTable(start, end);

			var calendar = $('#calendar').fullCalendar({
				//isRTL: true,
				buttonHtml: {
					prev: '<i class="ace-icon fa fa-chevron-left"></i>',
					next: '<i class="ace-icon fa fa-chevron-right"></i>'
				},
				firstDay: 1,

				businessHours: true, // display business hours
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,basicWeek,basicDay,listMonth'
				},
				views:{
					month:{
						titleFormat: "YYYY MMMM"
					},
					basicWeek:{
						titleFormat: "YYYY-MM-DD  wo"
					},
					basicDay:{
						titleFormat: "YYYY-MM-DD  dddd"
					}
				},
				events: function(start, end, timezone, callback){

					var queryStart = moment(start);
					var queryEnd = moment(end);
					var startOfMonth;
					var endOfMonth;

					if (queryStart.from(queryEnd) == "a month ago"){
						 startOfMonth = moment(end).subtract(1, "months").startOf("month").format("YYYY-MM-DD");
						 endOfMonth = moment(end).subtract(1, "months").endOf("month").format("YYYY-MM-DD");
					}else{
						startOfMonth = moment(end).startOf("month").format("YYYY-MM-DD");
						endOfMonth = moment(end).endOf("month").format("YYYY-MM-DD");
					}

					console.info("length:" + length + " start:" + start + " end:" + end
							+ " queryStart:" +queryStart.format("YYYY-MM-DD") + " queryEnd:" + queryEnd.format("YYYY-MM-DD")
							+ " startOfMonth:" + startOfMonth + " endOfMonth:" + endOfMonth
							+ " tableList:" + tableList);

					$('#tableLeaveList').dataTable().fnDestroy();
					tableList = null;
					initLeaveTable(startOfMonth, endOfMonth);

					$.ajax({
						url : "${adminPath}/leave/user/ajaxList_event",
						cache : false,
						data:{
							start: startOfMonth,
							end: endOfMonth
						},
						type : 'POST',
						success : function(data){
							var events = [];
							var record = data.results;
							var length = record.length;
							if(length == 0){
								//handle empty
//								console.info("empty");
//								top.layer.alert('没有数据！', {icon: 0, title:'警告'});
							}else {
								for (var i = 0; i < length; i++) {
									var username = record[i]["username"];
									var startdate = record[i]["startdate"];
									var enddate = record[i]["enddate"];
									var nextEnddate = moment(enddate).add(1, 'days');

									var leavetype = record[i]["leavetype"];
									var remark = record[i]["remark"];
									var className = "";
									var type_color = "";
									if(leavetype == "vocation"){
										className = "label-success";
									}else if(leavetype == "business trip"){
										className = "label-important";
									}

									switch (leavetype){
										case("事假"):
											type_color = "rgb(237,125,49)";
											break;
										case("国内差旅"):
											type_color = "rgb(0,32,96)";
											break;
										case("带薪年假"):
											type_color = "rgb(112,173,71)";
											break;
										case("特殊加班"):
											type_color = "rgb(192,0,0)";
											break;
										case("补充年假"):
											type_color = "rgb(0,176,240)";
											break;
										case("国际差旅"):
											type_color = "rgb(112,48,169)";
											break;
										case("加班"):
											type_color = "rgb(255,0,0)";
											break;
										case("加班串休"):
											type_color = "rgb(255,192,71)";
											break;
										case("病假"):
											type_color = "rgb(175,171,171)";
											break;
									}

									console.info("username:" + username + " start:"
											+ startdate + " end:"+enddate +" leavetype:"
											+ leavetype + " remark:" + remark + " nextEnddate:" + nextEnddate.format("YYYY-MM-DD"));
									events.push({
										title: username + " " + leavetype,
										start: startdate,
										end:nextEnddate.format("YYYY-MM-DD"),
//										className: className
										color : type_color
									});
								}
							}
							callback(events);
						}
					})


				},
//				events: [
//					{
//						title: 'All Day Event',
//						start: new Date(y, m, 1),
//						className: 'label-important'
//					},
//					{
//						title: 'Long Event',
//						start: new Date(y, m, d-5),
//						end: new Date(y, m, d-2),
//						className: 'label-success'
//					},
//					{
//						title: 'Some Event',
//						start: new Date(y, m, d-3, 16, 0),
//						allDay: false
//					}
//				],
				editable: false,
				droppable: false, // this allows things to be dropped onto the calendar !!!
				drop: function(date, allDay) { // this function is called when something is dropped

					// retrieve the dropped element's stored Event Object
					var originalEventObject = $(this).data('eventObject');
					var $extraEventClass = $(this).attr('data-class');


					// we need to copy it, so that multiple events don't have a reference to the same object
					var copiedEventObject = $.extend({}, originalEventObject);

					// assign it the date that was reported
					copiedEventObject.start = date;
					copiedEventObject.allDay = allDay;
					if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];

					// render the event on the calendar
					// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
					$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

					// is the "remove after drop" checkbox checked?
					if ($('#drop-remove').is(':checked')) {
						// if so, remove the element from the "Draggable Events" list
						$(this).remove();
					}

				}
				,
				selectable: true,
				selectHelper: true
//				select: function(start, end, allDay) {
//
//					bootbox.prompt("New Event Title:", function(title) {
//						if (title !== null) {
//							calendar.fullCalendar('renderEvent',
//									{
//										title: title,
//										start: start,
//										end: end,
//										allDay: allDay
//									},
//									true // make the event "stick"
//							);
//						}
//					});
//
//
//					calendar.fullCalendar('unselect');
//				}

//				eventClick: function(calEvent, jsEvent, view) {
//
//					//display a modal
//					var modal =
//							'<div class="modal fade">\
//                              <div class="modal-dialog">\
//                               <div class="modal-content">\
//                                 <div class="modal-body">\
//                                   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
//                                   <form class="no-margin">\
//                                      <label>Change event name &nbsp;</label>\
//                                      <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
//					 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
//				   </form>\
//				 </div>\
//				 <div class="modal-footer">\
//					<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
//					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
//				 </div>\
//			  </div>\
//			 </div>\
//			</div>';
//
//
//					var modal = $(modal).appendTo('body');
//					modal.find('form').on('submit', function(ev){
//						ev.preventDefault();
//
//						calEvent.title = $(this).find("input[type=text]").val();
//						calendar.fullCalendar('updateEvent', calEvent);
//						modal.modal("hide");
//					});
//					modal.find('button[data-action=delete]').on('click', function() {
//						calendar.fullCalendar('removeEvents' , function(ev){
//							return (ev._id == calEvent._id);
//						})
//						modal.modal("hide");
//					});
//
//					modal.modal('show').on('hidden', function(){
//						modal.remove();
//					});
//
//
//					//console.log(calEvent.id);
//					//console.log(jsEvent);
//					//console.log(view);
//
//					// change the border color just for fun
//					//$(this).css('border-color', 'red');
//
//				}

			});

		});

		function initLeaveTable(start, end){

			console.info("start for datatable:" + start + " end:" + end);

			tableList = $('#tableLeaveList').dataTable( {
				"dom": '<"row"<"col-sm-4 "l><"col-sm-4 "f><"col-sm-4 "T>>t<"row"<"col-sm-6"i><"col-sm-6"p>>',
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
					"url" : "${adminPath}/leave/user/ajaxList_statics?start="+start + "&end=" + end,
					"dataSrc" : "results"
				},
				bAutoWidth: false,

				"columns":[
					{
						"data": "username",
						"sTitle":"姓名"
					},
					{
						"data": "affair",
						"sTitle":"事假"
					},
					{
						"data": "sick",
						"sTitle":"病假"
					},
					{
						"data": "paid",
						"sTitle":"带薪年假"
					},
					{
						"data": "addition",
						"sTitle":"补充年假"
					},
					{
						"data": "workover",
						"sTitle":"加班串休"
					},
					{
						"data": "overtime",
						"sTitle":"加班"
					},
					{
						"data": "special",
						"sTitle":"特殊加班"
					},
					{
						"data": "domestic",
						"sTitle":"国内差旅"
					},
					{
						"data": "international",
						"sTitle":"国际差旅"
					}
				]
			} );
		}


	</script>

</body>

</html>
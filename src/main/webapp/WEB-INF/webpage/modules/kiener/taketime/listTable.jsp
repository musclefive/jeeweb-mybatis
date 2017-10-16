<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>Takt Time</title>

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
								<table id="tableTakttime" class="table table-striped table-bordered table-hover">

								</table>

							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content-area -->

		</div><!-- /.page-content -->
	</div><!-- /.main-content -->

</div><!-- /.main-container -->
<!-- 全局js -->
	<%--<html:js  name="jquery,bootstrap,ace-theme"/>--%>

	<!-- 自定义js -->
	<script src="${staticPath}/assets/js/jquery.min.js"></script>
	<script src="${staticPath}/assets/js/bootstrap.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.dataTables.min.js"></script>
	<script src="${staticPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
	<script src="${staticPath}/assets/js/tableexport/TableTools.js"></script>
	<script src="${staticPath}/assets/js/tableexport/ZeroClipboard.js"></script>

	<script src="${staticPath}/assets/js/ace.min.js"></script>
	<script src="${staticPath}/assets/js/ace-elements.min.js"></script>

	<script type="text/javascript">

		$(document).ready(function() {
			var oTable1 =
					$('#tableTakttime')
						//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
							.dataTable( {
								"dom": '<"row"<"col-sm-8 "l><"col-sm-2 "f><"col-sm-2 "T>>t<"row"<"col-sm-6"i><"col-sm-6"p>>',
								oTableTools: {
									"aButtons": [
										{
											"sExtends": "copy",
											"sButtonText": "复制"
										},
										{
											"sExtends": "xls",
											"sButtonText": "导出"
										}
									]
								},
								"ajax": {
									"url" : "${adminPath}/kiener/taketime/ajaxList_takttime",
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
										"sTitle":"partNumber"
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

								//,
								//"sScrollY": "200px",
								//"bPaginate": false,

								//"sScrollX": "100%",
								//"sScrollXInner": "120%",
								//"bScrollCollapse": true,
								//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
								//you may want to wrap the table inside a "div.dataTables_borderWrap" element

								//"iDisplayLength": 50
							} );

//			$(document).on('click', 'th input:checkbox' , function(){
//				var that = this;
//				$(this).closest('table').find('tr > td:first-child input:checkbox')
//						.each(function(){
//							this.checked = that.checked;
//							$(this).closest('tr').toggleClass('selected');
//						});
//			});
//
//			$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
//			function tooltip_placement(context, source) {
//				var $source = $(source);
//				var $parent = $source.closest('table')
//				var off1 = $parent.offset();
//				var w1 = $parent.width();
//
//				var off2 = $source.offset();
//				//var w2 = $source.width();
//
//				if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
//				return 'left';
//			}

		})

	</script>

</body>

</html>
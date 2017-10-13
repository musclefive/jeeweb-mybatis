<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<meta name="decorator" content="single"/>--%>
    <title>节拍</title>

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

						<div id="modal-table" class="modal fade" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header no-padding">
										<div class="table-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
												<span class="white">&times;</span>
											</button>
											Results for "Latest Registered Domains
										</div>
									</div>

									<div class="modal-body no-padding">
										<table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
											<thead>
											<tr>
												<th>Domain</th>
												<th>Price</th>
												<th>Clicks</th>

												<th>
													<i class="ace-icon fa fa-clock-o bigger-110"></i>
													Update
												</th>
											</tr>
											</thead>

											<tbody>
											<tr>
												<td>
													<a href="#">ace.com</a>
												</td>
												<td>$45</td>
												<td>3,330</td>
												<td>Feb 12</td>
											</tr>

											<tr>
												<td>
													<a href="#">base.com</a>
												</td>
												<td>$35</td>
												<td>2,595</td>
												<td>Feb 18</td>
											</tr>

											<tr>
												<td>
													<a href="#">max.com</a>
												</td>
												<td>$60</td>
												<td>4,400</td>
												<td>Mar 11</td>
											</tr>

											<tr>
												<td>
													<a href="#">best.com</a>
												</td>
												<td>$75</td>
												<td>6,500</td>
												<td>Apr 03</td>
											</tr>

											<tr>
												<td>
													<a href="#">pro.com</a>
												</td>
												<td>$55</td>
												<td>4,250</td>
												<td>Jan 21</td>
											</tr>
											</tbody>
										</table>
									</div>

									<div class="modal-footer no-margin-top">
										<button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
											<i class="ace-icon fa fa-times"></i>
											Close
										</button>

										<ul class="pagination pull-right no-margin">
											<li class="prev disabled">
												<a href="#">
													<i class="ace-icon fa fa-angle-double-left"></i>
												</a>
											</li>

											<li class="active">
												<a href="#">1</a>
											</li>

											<li>
												<a href="#">2</a>
											</li>

											<li>
												<a href="#">3</a>
											</li>

											<li class="next">
												<a href="#">
													<i class="ace-icon fa fa-angle-double-right"></i>
												</a>
											</li>
										</ul>
									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div><!-- PAGE CONTENT ENDS -->
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
										"sTitle":"currentType"
									},
									{
										"data": "nextType",
										"sTitle":"nextType"
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
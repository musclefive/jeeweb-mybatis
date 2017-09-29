<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="decorator" content="single"/>
    <title>实时产量</title>
    <!-- 导入CSS -->
    <html:css  name="favicon,bootstrap,font-awesome,ace-theme"/>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="main-content">
        <!-- #section:basics/content.breadcrumbs -->

        <!-- /section:basics/content.breadcrumbs -->
        <div class="page-content">
            <!-- #section:settings.box -->

            <!-- /section:settings.box -->
            <div class="page-content-area">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <div class="row">
                            <div class="space-6"></div>

                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M45</h4>
                                        <div class="widget-toolbar">
													<span class="label label-success" id="m45_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m45_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M140</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m140_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m140_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M295</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m295_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m295_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M320</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m320_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m320_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M335</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m335_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m335_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M480</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m480_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m480_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M540</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m540_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m540_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M550</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m550_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m550_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M670</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m670_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m670_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M700</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m700_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m700_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M730</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m730_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m730_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                <div class="widget-box widget-color-blue">
                                    <div class="widget-header">
                                        <h4 class="widget-title smaller">M770</h4>
                                        <div class="widget-toolbar">
                                            <span class="label label-success" id="m770_total_output"></span>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main padding-6">
                                            <!-- #section:elements.popover -->
                                            <div id="m770_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                <span class="center"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div><!-- /.row -->

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content-area -->
        </div><!-- /.page-content -->
    </div><!-- /.main-content -->

    <!-- 全局js -->
    <!-- 全局js -->
    <html:js  name="jquery,bootstrap,metisMenu,slimscroll,layer,ace-theme"/>
    <!-- 自定义js -->
    <%--<script src="${staticPath}/common/js/content.js?v=1.0.0"></script>--%>

    <script type="text/javascript">

        var station_amount = 0;
        /*initial the page method
        * get the real output from ajax method*/

        $(document).ready(function() {
            $.ajax({
                type : "post",
                url : "${adminPath}/kiener/measure/ajaxList_output",
                dataType : "json",
                //data:{key:'1'},
                success : function(data) {
                    //遍历所有json数据，将相同station的数据放入到一个数组中
//                    [{"output":"1062","station":45,"variety":"05710"},{"output":"5","station":45,"variety":"05776"}]
                    for(var p in data){
//                        console.info("output:" + data[p].output + " type:" + typeof(data[p].output)+
//                                " station: " + data[p].station + " type: " + typeof(data[p].station) +
//                                " variety: " + data[p].variety);
//
                        if(data[p].station == 45 ){
                            $("#m45_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m45_total_output").html(station_amount);
                        }
                        if(data[p].station == 140 ){
                            $("#m140_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m140_total_output").html(station_amount);
                        }
                        if(data[p].station == 295 ){
                            $("#m295_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m295_total_output").html(station_amount);
                        }
                        if(data[p].station == 320 ){
                            $("#m320_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m320_total_output").html(station_amount);
                        }
                        if(data[p].station == 335 ){
                            $("#m335_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m335_total_output").html(station_amount);
                        }
                        if(data[p].station == 480 ){
                            $("#m480_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m480_total_output").html(station_amount);
                        }
                        if(data[p].station == 540 ){
                            $("#m540_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m540_total_output").html(station_amount);
                        }
                        if(data[p].station == 550 ){
                            $("#m550_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m550_total_output").html(station_amount);
                        }
                        if(data[p].station == 670 ){
                            $("#m670_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m670_total_output").html(station_amount);
                        }
                        if(data[p].station == 700 ){
                            $("#m700_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m700_total_output").html(station_amount);
                        }
                        if(data[p].station == 730 ){
                            $("#m730_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m730_total_output").html(station_amount);
                        }
                        if(data[p].station == 770 ){
                            $("#m770_type_1 .center").append(data[p].variety + " : " + data[p].output + "<br />");
                            station_amount = station_amount + parseInt(data[p].output);
                            $("#m770_total_output").html(station_amount);
                        }
                    }
                }
            });
        })
    </script>

</body>

</html>
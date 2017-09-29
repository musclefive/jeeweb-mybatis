<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>实时产量</title>
    <!-- 导入CSS -->
    <html:css  name="favicon,bootstrap,font-awesome,ace-theme"/>

</head>
<body class="no-skin">
<!-- #section:basics/navbar.layout -->
    <div id="navbar" class="navbar navbar-default">

        <div class="navbar-container" id="navbar-container">
            <div class="navbar-header pull-left">
                <!-- #section:basics/navbar.layout.brand -->
                <a href="#" class="navbar-brand">
                    <small>
                        <i class="fa fa-leaf"></i>
                        Ace Admin
                    </small>
                </a>
            </div>
        </div><!-- /.navbar-container -->
    </div>

<!-- /section:basics/navbar.layout -->
    <div class="main-container" id="main-container">

        <div class="main-content">
            <!-- #section:basics/content.breadcrumbs -->
            <div class="breadcrumbs" id="breadcrumbs">

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Real-Time Production Output</a>
                    </li>
                </ul><!-- /.breadcrumb -->

            </div>

            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">

                <div class="page-content-area">
                    <div class="row">
                        <label class="pull-left inline">
                            <small class="muted smaller-90">是否开启实时计数:</small>

                            <input id="id-button-borders" checked="True" type="checkbox" class="ace ace-switch ace-switch-5" />
                            <span class="lbl middle"></span>
                        </label>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->

                            <div class="row">
                                <div class="space-6"></div>

                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-orange">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M1560</h4>
                                            <div class="widget-toolbar" id="m1560_total_output">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m1560_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-purple">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M1530</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m1530_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m1530_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M1410</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m1410_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m1410_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M1360</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m1360_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m1360_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M1190</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m1190_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m1190_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M1080</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m1080_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m1080_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M1050</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m1050_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m1050_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M1030</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m1030_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m1030_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M1020</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m1020_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m1020_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.row -->

                            <div class="space-10" ></div>
                            <div class="row">
                                <div class="col-sm-1 col-sm-offset-11" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M960</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m960_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m960_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="space-10"></div>
                            <div class="row">
                                <div class="col-sm-1 col-sm-offset-11" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M990</h4>
                                            <div class="widget-toolbar">
                                                <span class="label label-success" id="m990_total_output"></span>
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main padding-6">
                                                <!-- #section:elements.popover -->
                                                <div id="m990_type_1" class="alert alert-info align-center" style="padding: 4px;margin-bottom: 4px;">
                                                    <span class="center"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="space-10"></div>
                            <div class="row">
                                <div class="space-6"></div>

                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-orange">
                                        <div class="widget-header">
                                            <h4 class="widget-title smaller">M45</h4>
                                            <div class="widget-toolbar" id="m45_total_output">
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
                                    <div class="widget-box widget-color-purple">
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

        <div class="footer">
            <div class="footer-inner">
                <!-- #section:basics/footer -->
                <div class="footer-content">
                            <span class="bigger-120">
                                <span class="blue bolder">VWED CC</span>
                                 &copy; 2017-2018
                            </span>

                    &nbsp; &nbsp;
                </div>

                <!-- /section:basics/footer -->
            </div>
        </div>

    </div><!-- /.main-container -->

<html:js  name="jquery,bootstrap,metisMenu,slimscroll,layer,ace-theme,common"/>
<%--<script src="${staticPath}/common/js/prototype.js"></script>--%>
<script type="text/javascript">

    /*initial the page method
     * get the real output from ajax method*/

    $(document).ready(function() {
        var station_amount = 0;

        var sh; // Interval
        var startDate = "2017-09-01 06:30";
        var endDate = "2017-09-01 09:30";
        //initial value
        $('#id-button-borders').attr('checked' , 'checked').on('click', function(){
            $('#default-buttons .btn').toggleClass('no-border');
            console.info("checked status" + this.checked);
            if(this.checked == false){
                //stop the counting
                clearInterval(sh);
                console.info("stop the interval");
            }
            if(this.checked == true){
                //start the counting
                sh = setInterval(realtimeOutput, 6000);
                console.info("Prepare to start the interval ");

            }

        });

        var realtimeOutput = function (){
//            var startDate = "2017-09-01 06:30";
            endDate = new Date(new Date(endDate).getTime() + 300000).format("yyyy-MM-dd hh:mm:ss");
            console.info("query time from :" + startDate + " to " + endDate + " checked status: " +
                    $('#id-button-borders').checked );
            $("#m45_type_1 .center").html("");
            $("#m140_type_1 .center").html("");
            $("#m295_type_1 .center").html("");
            $("#m320_type_1 .center").html("");
            $("#m335_type_1 .center").html("");
            $("#m480_type_1 .center").html("");
            $("#m540_type_1 .center").html("");
            $("#m550_type_1 .center").html("");
            $("#m670_type_1 .center").html("");
            $("#m700_type_1 .center").html("");
            $("#m730_type_1 .center").html("");
            $("#m770_type_1 .center").html("");

            $("#m1560_type_1 .center").html("");
            $("#m1530_type_1 .center").html("");
            $("#m1410_type_1 .center").html("");
            $("#m1360_type_1 .center").html("");
            $("#m1190_type_1 .center").html("");
            $("#m1080_type_1 .center").html("");
            $("#m1050_type_1 .center").html("");
            $("#m1030_type_1 .center").html("");
            $("#m1020_type_1 .center").html("");
            $("#m990_type_1 .center").html("");
            $("#m960_type_1 .center").html("");
            var m45_amount = 0;
            var m45_typeNum = 0;
            var m140_amount = 0;
            var m140_typeNum = 0;
            var m295_amount = 0;
            var m295_typeNum = 0;
            var m320_amount = 0;
            var m320_typeNum = 0;
            var m335_amount = 0;
            var m335_typeNum = 0;
            var m480_amount = 0;
            var m480_typeNum = 0;
            var m540_amount = 0;
            var m540_typeNum = 0;
            var m550_amount = 0;
            var m550_typeNum = 0;
            var m670_amount = 0;
            var m670_typeNum = 0;
            var m700_amount = 0;
            var m700_typeNum = 0;
            var m730_amount = 0;
            var m730_typeNum = 0;
            var m770_amount = 0;
            var m770_typeNum = 0;

            var m1560_typeNum = 0;
            var m1560_amount = 0;
            var m1530_typeNum = 0;
            var m1530_amount = 0;
            var m1410_typeNum = 0;
            var m1410_amount = 0;
            var m1360_typeNum = 0;
            var m1360_amount = 0;
            var m1190_typeNum = 0;
            var m1190_amount = 0;
            var m1080_typeNum = 0;
            var m1080_amount = 0;
            var m1050_typeNum = 0;
            var m1050_amount = 0;
            var m1030_typeNum = 0;
            var m1030_amount = 0;
            var m1020_typeNum = 0;
            var m1020_amount = 0;
            var m990_typeNum = 0;
            var m990_amount = 0;
            var m960_typeNum = 0;
            var m960_amount = 0;

            $.ajax({
                type : "post",
                url : "${adminPath}/kiener/measure/ajaxList_output",
                dataType : "json",
                data: {"measureDate":startDate,"measureDateEnd":endDate},
                success : function(data) {
                    //遍历所有json数据，将相同station的数据放入到一个数组中
//                    [{"output":"1062","station":45,"variety":"05710"},{"output":"5","station":45,"variety":"05776"}]
                    for(var p in data){
//                        console.info("output:" + data[p].output + " type:" + typeof(data[p].output)+
//                                " station: " + data[p].station + " type: " + typeof(data[p].station) +
//                                " variety: " + data[p].variety);
                        if(data[p].station == 45 ){
                            m45_typeNum = m45_typeNum + 1;
                            console.info("m45_typeNum: " + m45_typeNum);
                            if (m45_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m45_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m45_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            if (m45_typeNum == 2){
//                                console.info("ParentNode " + $("#m45_type_1").getParent());
                            }
                            m45_amount = m45_amount + parseInt(data[p].output);
                            $("#m45_total_output").html(m45_amount);
                        }
                        if(data[p].station == 140 ){
                            m140_typeNum = m140_typeNum + 1;
                            if (m140_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m140_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m140_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m140_amount = m140_amount + parseInt(data[p].output);
                            $("#m140_total_output").html(m140_amount);
                        }
                        if(data[p].station == 295 ){
                            m295_typeNum = m295_typeNum + 1;
                            if (m295_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m295_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m295_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m295_amount = m295_amount + parseInt(data[p].output);
                            $("#m295_total_output").html(m295_amount);
                        }
                        if(data[p].station == 320 ){
                            m320_typeNum = m320_typeNum + 1;
                            if (m320_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m320_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m320_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m320_amount = m320_amount + parseInt(data[p].output);
                            $("#m320_total_output").html(m320_amount);
                        }
                        if(data[p].station == 335 ){
                            m335_typeNum = m335_typeNum + 1;
                            if (m335_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m335_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m335_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m335_amount = m335_amount + parseInt(data[p].output);
                            $("#m335_total_output").html(m335_amount);
                        }
                        if(data[p].station == 480 ){
                            m480_typeNum = m480_typeNum + 1;
                            if (m480_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m480_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m480_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m480_amount = m480_amount + parseInt(data[p].output);
                            $("#m480_total_output").html(m480_amount);
                        }
                        if(data[p].station == 540 ){
                            m540_typeNum = m540_typeNum + 1;
                            if (m540_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m540_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m540_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m540_amount = m540_amount + parseInt(data[p].output);
                            $("#m540_total_output").html(m540_amount);
                        }
                        if(data[p].station == 550 ){
                            m550_typeNum = m550_typeNum + 1;
                            if (m550_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m550_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m550_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m550_amount = m550_amount + parseInt(data[p].output);
                            $("#m550_total_output").html(m550_amount);
                        }
                        if(data[p].station == 670 ){
                            m670_typeNum = m670_typeNum + 1;
                            if (m670_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m670_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m670_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m670_amount = m670_amount + parseInt(data[p].output);
                            $("#m670_total_output").html(m670_amount);
                        }
                        if(data[p].station == 700 ){
                            m700_typeNum = m700_typeNum + 1;
                            if (m700_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m700_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m700_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m700_amount = m700_amount + parseInt(data[p].output);
                            $("#m700_total_output").html(m700_amount);
                        }
                        if(data[p].station == 730 ){
                            m730_typeNum = m730_typeNum + 1;
                            if (m730_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m730_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m730_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m730_amount = m730_amount + parseInt(data[p].output);
                            $("#m730_total_output").html(m730_amount);
                        }
                        if(data[p].station == 770 ){
                            m770_typeNum = m770_typeNum + 1;
                            if (m770_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m770_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m770_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m770_amount = m770_amount + parseInt(data[p].output);
                            $("#m770_total_output").html(m770_amount);
                        }

                        if(data[p].station == 1560 ){
                            m1560_typeNum = m1560_typeNum + 1;
                            if (m1560_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m1560_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m1560_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m1560_amount = m1560_amount + parseInt(data[p].output);
                            $("#m1560_total_output").html(m1560_amount);
                        }
                        if(data[p].station == 1530 ){
                            m1530_typeNum = m1530_typeNum + 1;
                            if (m1530_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m1530_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m1530_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m1530_amount = m1530_amount + parseInt(data[p].output);
                            $("#m1530_total_output").html(m1530_amount);
                        }
                        if(data[p].station == 1410 ){
                            m1410_typeNum = m1410_typeNum + 1;
                            if (m1410_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m1410_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m1410_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m1410_amount = m1410_amount + parseInt(data[p].output);
                            $("#m1410_total_output").html(m1410_amount);
                        }
                        if(data[p].station == 1360 ){
                            m1360_typeNum = m1360_typeNum + 1;
                            if (m1360_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m1360_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m1360_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m1360_amount = m1360_amount + parseInt(data[p].output);
                            $("#m1360_total_output").html(m1360_amount);
                        }
                        if(data[p].station == 1190 ){
                            m1190_typeNum = m1190_typeNum + 1;
                            if (m1190_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m1190_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m1190_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m1190_amount = m1190_amount + parseInt(data[p].output);
                            $("#m1190_total_output").html(m1190_amount);
                        }
                        if(data[p].station == 1080 ){
                            m1080_typeNum = m1080_typeNum + 1;
                            if (m1080_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m1080_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m1080_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m1080_amount = m1080_amount + parseInt(data[p].output);
                            $("#m1080_total_output").html(m1080_amount);
                        }
                        if(data[p].station == 1050 ){
                            m1050_typeNum = m1050_typeNum + 1;
                            if (m1050_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m1050_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m1050_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m1050_amount = m1050_amount + parseInt(data[p].output);
                            $("#m1050_total_output").html(m1050_amount);
                        }
                        if(data[p].station == 1030 ){
                            m1030_typeNum = m1030_typeNum + 1;
                            if (m1030_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m1030_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m1030_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m1030_amount = m1030_amount + parseInt(data[p].output);
                            $("#m1030_total_output").html(m1030_amount);
                        }
                        if(data[p].station == 1020 ){
                            m1020_typeNum = m1020_typeNum + 1;
                            if (m1020_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m1020_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m1020_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m1020_amount = m1020_amount + parseInt(data[p].output);
                            $("#m1020_total_output").html(m1020_amount);
                        }
                        if(data[p].station == 990 ){
                            m990_typeNum = m990_typeNum + 1;
                            if (m990_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m990_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m990_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m990_amount = m990_amount + parseInt(data[p].output);
                            $("#m990_total_output").html(m990_amount);
                        }
                        if(data[p].station == 960 ){
                            m960_typeNum = m960_typeNum + 1;
                            if (m960_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m960_type_1 .center").append("<span class='label label-success'><B>" + data[p].variety + " : " + data[p].output + "</B></span><br />");
                            }else {
                                $("#m960_type_1 .center").append("<span class='label'>" + data[p].variety + " : " + data[p].output + "</span><br />");
                            }
                            m960_amount = m960_amount + parseInt(data[p].output);
                            $("#m960_total_output").html(m960_amount);
                        }
                    }
                }
            });
            return realtimeOutput;

        };
        realtimeOutput();
//        realtimeOutput(startDate);
    });
</script>

</body>

</html>
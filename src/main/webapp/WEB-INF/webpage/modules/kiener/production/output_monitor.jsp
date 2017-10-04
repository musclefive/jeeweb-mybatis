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
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M670</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m670_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M540</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m540_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M210</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m210_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M150</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m150_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M140</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m140_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div><!-- /.row -->

                            <div class="space-10" ></div>
                            <div class="row">
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M770</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m770_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1 col-sm-offset-10" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M010</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m010_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
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
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M810</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m810_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M950</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m950_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M1090</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m1090_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M1310</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m1310_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M1610</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m1610_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-1" style="padding-left:1px;padding-right: 1px">
                                    <div class="widget-box widget-color-blue3">
                                        <div class="widget-header align-center">
                                            <h2 class="widget-title smaller">M1620</h2>
                                            <div class="widget-toolbar">
                                            </div>
                                        </div>
                                        <div class="widget-body">
                                            <div class="widget-main" style="padding: 0px">
                                                <!-- #section:elements.popover -->
                                                <div id="m1620_type_1" class="alert alert-info align-center" style="height: 80px;padding: 0px">
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px;"></h3>
                                                    <h3 style="padding: 0px;margin-top:10px;margin-bottom: 5px"></h3>
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
        var sh; // Interval
        var startDate = "2017-09-02 06:30";
        var endDate = "2017-09-10 19:30";
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
            $("#m010_type_1").children().first().html("");
            $("#m010_type_1").children().last().html("");
            $("#m140_type_1").children().first().html("");
            $("#m140_type_1").children().last().html("");
            $("#m150_type_1").children().first().html("");
            $("#m150_type_1").children().last().html("");
            $("#m210_type_1").children().first().html("");
            $("#m210_type_1").children().last().html("");
            $("#m540_type_1").children().first().html("");
            $("#m540_type_1").children().last().html("");
            $("#m670_type_1").children().first().html("");
            $("#m670_type_1").children().last().html("");
            $("#m770_type_1").children().first().html("");
            $("#m770_type_1").children().last().html("");
            $("#m810_type_1").children().first().html("");
            $("#m810_type_1").children().last().html("");
            $("#m950_type_1").children().first().html("");
            $("#m950_type_1").children().last().html("");
            $("#m1090_type_1").children().first().html("");
            $("#m1090_type_1").children().last().html("");
            $("#m1310_type_1").children().first().html("");
            $("#m1310_type_1").children().last().html("");
            $("#m1610_type_1").children().first().html("");
            $("#m1610_type_1").children().last().html("");
            $("#m1620_type_1").children().first().html("");
            $("#m1620_type_1").children().last().html("");
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
            var m010_typeNum = 0;
            var m140_typeNum = 0;
            var m150_typeNum = 0;
            var m210_typeNum = 0;
            var m540_typeNum = 0;
            var m670_typeNum = 0;
            var m770_typeNum = 0;
            var m810_typeNum = 0;
            var m950_typeNum = 0;
            var m1090_typeNum = 0;
            var m1310_typeNum = 0;
            var m1610_typeNum = 0;
            var m1620_typeNum = 0;

            $.ajax({
                type : "post",
                url : "${adminPath}/kiener/measure/ajaxList_output",
                dataType : "json",
                data: {"measureDate":startDate,"measureDateEnd":endDate, "type":"klt"},
                success : function(data) {
                    //遍历所有json数据，将相同station的数据放入到一个数组中
//                    [{"output":"1062","station":45,"variety":"05710"},{"output":"5","station":45,"variety":"05776"}]
                    for(var p in data){
//                        console.info("output:" + data[p].output + " type:" + typeof(data[p].output)+
//                                " station: " + data[p].station + " type: " + typeof(data[p].station) +
//                                " variety: " + data[p].variety);
                        if(data[p].station == 10 ){
                            m010_typeNum = m010_typeNum + 1;
                            if (m010_typeNum == 1){
                                //the current production type, identitied with the production date
                                $("#m010_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m010_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 140 ){
                            m140_typeNum = m140_typeNum + 1;
                            if (m140_typeNum == 1){
                                $("#m140_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m140_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 150 ){
                            m150_typeNum = m150_typeNum + 1;
                            if (m150_typeNum == 1){
                                $("#m150_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m150_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 210 ){
                            m210_typeNum = m210_typeNum + 1;
                            if (m210_typeNum == 1){
                                $("#m210_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m210_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 540 ){
                            m540_typeNum = m540_typeNum + 1;
                            if (m540_typeNum == 1){
                                $("#m540_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m540_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 670 ){
                            m670_typeNum = m670_typeNum + 1;
                            if (m670_typeNum == 1){
                                $("#m670_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m670_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 770 ){
                            m770_typeNum = m770_typeNum + 1;
                            if (m770_typeNum == 1){
                                $("#m770_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m770_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 810 ){
                            m810_typeNum = m810_typeNum + 1;
                            if (m810_typeNum == 1){
                                $("#m810_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m810_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 950 ){
                            m950_typeNum = m950_typeNum + 1;
                            if (m950_typeNum == 1){
                                $("#m950_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m950_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 1090 ){
                            m1090_typeNum = m1090_typeNum + 1;
                            if (m1090_typeNum == 1){
                                $("#m1090_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m1090_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 1310 ){
                            m1310_typeNum = m1310_typeNum + 1;
                            if (m1310_typeNum == 1){
                                $("#m1310_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m1310_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 1610 ){
                            m1610_typeNum = m1610_typeNum + 1;
                            if (m1610_typeNum == 1){
                                $("#m1610_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m1610_type_1").children().last().append(data[p].output);
                            }
                        }
                        if(data[p].station == 1620 ){
                            m1620_typeNum = m1620_typeNum + 1;
                            if (m1620_typeNum == 1){
                                $("#m1620_type_1").children().first().append(data[p].variety.substr(1));
                                $("#m1620_type_1").children().last().append(data[p].output);
                            }
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
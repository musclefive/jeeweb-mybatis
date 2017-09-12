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

                            <div class="col-sm-7 infobox-container">
                                <!-- #section:pages/dashboard.infobox -->
                                <div class="infobox infobox-green">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-comments"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">32</span>
                                        <div class="infobox-content">comments + 2 reviews</div>
                                    </div>

                                    <!-- #section:pages/dashboard.infobox.stat -->
                                    <div class="stat stat-success">8%</div>

                                    <!-- /section:pages/dashboard.infobox.stat -->
                                </div>

                                <div class="infobox infobox-blue">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-twitter"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">11</span>
                                        <div class="infobox-content">new followers</div>
                                    </div>

                                    <div class="badge badge-success">
                                        +32%
                                        <i class="ace-icon fa fa-arrow-up"></i>
                                    </div>
                                </div>

                                <div class="infobox infobox-pink">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-shopping-cart"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">8</span>
                                        <div class="infobox-content">new orders</div>
                                    </div>
                                    <div class="stat stat-important">4%</div>
                                </div>

                                <div class="infobox infobox-red">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-flask"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-data-number">7</span>
                                        <div class="infobox-content">experiments</div>
                                    </div>
                                </div>

                                <div class="infobox infobox-orange2">
                                    <!-- #section:pages/dashboard.infobox.sparkline -->
                                    <div class="infobox-chart">
                                        <span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
                                    </div>

                                    <!-- /section:pages/dashboard.infobox.sparkline -->
                                    <div class="infobox-data">
                                        <span class="infobox-data-number">6,251</span>
                                        <div class="infobox-content">pageviews</div>
                                    </div>

                                    <div class="badge badge-success">
                                        7.2%
                                        <i class="ace-icon fa fa-arrow-up"></i>
                                    </div>
                                </div>

                                <div class="infobox infobox-blue2">
                                    <div class="infobox-progress">
                                        <!-- #section:pages/dashboard.infobox.easypiechart -->
                                        <div class="easy-pie-chart percentage" data-percent="42" data-size="46">
                                            <span class="percent">42</span>%
                                        </div>

                                        <!-- /section:pages/dashboard.infobox.easypiechart -->
                                    </div>

                                    <div class="infobox-data">
                                        <span class="infobox-text">traffic used</span>

                                        <div class="infobox-content">
                                            <span class="bigger-110">~</span>
                                            58GB remaining
                                        </div>
                                    </div>
                                </div>

                                <!-- /section:pages/dashboard.infobox -->
                                <div class="space-6"></div>

                                <!-- #section:pages/dashboard.infobox.dark -->
                                <div class="infobox infobox-green infobox-small infobox-dark">
                                    <div class="infobox-progress">
                                        <!-- #section:pages/dashboard.infobox.easypiechart -->
                                        <div class="easy-pie-chart percentage" data-percent="61" data-size="39">
                                            <span class="percent">61</span>%
                                        </div>

                                        <!-- /section:pages/dashboard.infobox.easypiechart -->
                                    </div>

                                    <div class="infobox-data">
                                        <div class="infobox-content">Task</div>
                                        <div class="infobox-content">Completion</div>
                                    </div>
                                </div>

                                <div class="infobox infobox-blue infobox-small infobox-dark">
                                    <!-- #section:pages/dashboard.infobox.sparkline -->
                                    <div class="infobox-chart">
                                        <span class="sparkline" data-values="3,4,2,3,4,4,2,2"></span>
                                    </div>

                                    <!-- /section:pages/dashboard.infobox.sparkline -->
                                    <div class="infobox-data">
                                        <div class="infobox-content">Earnings</div>
                                        <div class="infobox-content">$32,000</div>
                                    </div>
                                </div>

                                <div class="infobox infobox-grey infobox-small infobox-dark">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-download"></i>
                                    </div>

                                    <div class="infobox-data">
                                        <div class="infobox-content">Downloads</div>
                                        <div class="infobox-content">1,205</div>
                                    </div>
                                </div>

                                <!-- /section:pages/dashboard.infobox.dark -->
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

    </script>

</body>

</html>
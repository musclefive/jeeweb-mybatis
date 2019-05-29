package cn.jeeweb.modules.kiener.controller;

import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.utils.QueryableConvertUtils;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import cn.jeeweb.modules.kiener.service.IMeasureDataService;
import cn.jeeweb.modules.sys.utils.DataSourceContextHolder;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/leak")
@RequiresPathPermission("kiener:leak")
public class LeakTestController extends BaseCRUDController<MeasureData, Long> {

    private static Logger logger = LoggerFactory.getLogger(LeakTestController.class);

    public final static List leakTestStation = Arrays.asList("1420", "1430");
    @Autowired
    private IMeasureDataService measureDataService;

    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletRequest response, Model model) {

        String mStation = request.getParameter("station");
        logger.info("preAjaxList param:" + mStation);
        return "cc";
    }

    @RequestMapping(value = "/leakList")
    public String takttimeList(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter the takt time list, then show the station list and query time
        preList(model, request, response);
        return display("leakList");
    }

    @RequestMapping(value = "/screwList")
    public String screwList(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter the takt time list, then show the station list and query time
        preList(model, request, response);
        return display("screwList");
    }

    @RequestMapping(value = "/forceList")
    public String forceList(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter the takt time list, then show the station list and query time
        preList(model, request, response);
        return display("forceList");
    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<MeasureData> entityWrapper, HttpServletRequest request, HttpServletResponse response) {

//        DataSourceContextHolder.setDbType("dataSource1");
//      change to the production enviroment
      DataSourceContextHolder.setDbType("dataSource_production");
    }

    /*
    * query the Leak Test
    * */
    @RequestMapping(value = "ajaxList_leaktest", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_leaktest(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                           HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate").toString();
        String endDate = request.getParameter("endDate").toString();
        String station = request.getParameter("station").toString();

//        String startDate = "2017-11-18 07:30";
//        String endDate = "2017-11-19 07:30";
//        entityWrapper.in("A.station", leakTestStation);
        entityWrapper.eq("A.station", station);

        entityWrapper.eq("A.Ok", true);
        entityWrapper.eq("B.Ok", true);
        entityWrapper.between("A.Date", startDate, endDate);
//        entityWrapper.orderBy("measureDate");

        propertyPreFilterable.addQueryProperty("id", "partNumber", "station", "variety", "measureDate", "leakID",
                "pressure", "leakRate", "checkProg");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryLeakTest(entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

    /*
    * query the screw data list from table [ScrewingMeasurements]
    * */
    @RequestMapping(value = "ajaxList_screwinfo", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_screwinfo(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                   HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate").toString();
        String endDate = request.getParameter("endDate").toString();
        String station = request.getParameter("station").toString();
        String pos = request.getParameter("pos").toString();
        String spin = request.getParameter("spin").toString();
        String jobid = request.getParameter("jobid").toString();

        entityWrapper.between("A.Date", startDate, endDate);
        entityWrapper.eq("A.station", station);
        entityWrapper.eq("A.Ok", true);

        entityWrapper.eq("B.ScrewPos", Integer.valueOf(pos));
        entityWrapper.eq("B.SpindleID", Integer.valueOf(spin));
        entityWrapper.eq("B.JobID", jobid);

        entityWrapper.eq("B.OK", true);

        propertyPreFilterable.addQueryProperty("id", "partNumber", "station", "variety", "measureDate", "scewID",
                "spinID", "screwpos", "torqueMin","torqueMax","torqueAct","angleMin","angleMax","angleAct");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryScrweList(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }


    /*
    * query the force data list from table [ForceMeasurements]
    * */
    @RequestMapping(value = "ajaxList_forceinfo", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_forceinfo(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                    HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate").toString();
        String endDate = request.getParameter("endDate").toString();
        String station = request.getParameter("station").toString();
        String pos = request.getParameter("pos").toString(); //stroke
        String spin = request.getParameter("spin").toString(); //hw


        entityWrapper.between("A.Date", startDate, endDate);
        entityWrapper.eq("A.station", station);
        entityWrapper.eq("A.Ok", true);

        entityWrapper.eq("B.StrokeNumber", Integer.valueOf(pos));
        entityWrapper.eq("B.Hardware", Integer.valueOf(spin));
        entityWrapper.eq("B.OK", true);

        propertyPreFilterable.addQueryProperty("id", "partNumber", "station", "variety", "measureDate", "forceID",
                "strokeNumber", "hardware", "forceMin","forceMax","forceAct","distMin","distMax","distAct");


        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryForceList(queryable,entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

}

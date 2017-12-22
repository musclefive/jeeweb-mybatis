package cn.jeeweb.modules.kiener.controller;

import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.PageJson;
import cn.jeeweb.core.query.annotation.PageableDefaults;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.utils.QueryableConvertUtils;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import cn.jeeweb.modules.kiener.service.ITakeTimeService;
import cn.jeeweb.modules.sys.utils.DataSourceContextHolder;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeFilter;
import org.apache.axis.client.Call;
import org.apache.axis.encoding.XMLType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceException;
import java.io.IOException;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import org.apache.axis.client.Service;
/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/taketime")
@RequiresPathPermission("kiener:taketime")
public class TakeTimeController extends BaseCRUDController<TakeTime, Long> {

    private static Logger logger = LoggerFactory.getLogger(TakeTimeController.class);

    public final static List filterStation = Arrays.asList("10", "140", "150", "210", "300", "320", "335",
            "400", "480", "540", "670", "770", "810", "820", "950", "960", "990", "1030", "1050", "1090", "1190",
            "1310", "1350", "1530", "1560", "1610", "1650");

    public final static List excludedStation = Arrays.asList("40", "110", "310", "410", "1135", "1425", "1420", "1430",
            "2002");
    @Autowired
    private ITakeTimeService takeTimeService;

    private String mStation = "";
    private String mPartNumber = "";

    @RequestMapping(value = "/list/{station}")
    public String list(@PathVariable String station,Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        mStation = station;
        logger.info("preAjaxList param:" + mStation);
        return display("list");
    }

    @RequestMapping(value = "/takttimeList")
    public String takttimeList(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter the takt time list, then show the station list and query time
        preList(model, request, response);
        logger.info("takttimeList param:" + mStation);
        return display("takttimeList");
    }

    @RequestMapping(value = "/single/{partNumber}")
    public String listSingle(@PathVariable String partNumber,Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        mPartNumber = partNumber;
        logger.info("preAjaxList mPartNumber param:" + mPartNumber);
        return display("singleEngine");
    }

    /*
    * the average taktTime for all key staions
    * show in a chart.
    * */
    @RequestMapping(value = "/avg")
    public String avgTakTime(HttpServletRequest request, HttpServletResponse response, Model model) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        return display("avgTakTime");
    }

    @RequestMapping(value = "/listTable/{station}")
    public String listTable(@PathVariable String station,Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        mStation = station;
        logger.info("listTable param:" + mStation);
        return display("listTable");
    }

    @RequestMapping(value = "/realTimeTakt")
    public String realTimeTakt(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
//        mStation = station;
//        logger.info("listTable param:" + mStation);
        return display("realTimeTakt");
    }

    @Override
    public void preList(Model model, HttpServletRequest request, HttpServletResponse response) {
        logger.info("Enter TakeTimeController preList");
//       change to the default datasource
        DataSourceContextHolder.setDbType("dataSource");
//        DataSourceContextHolder.setDbType("dataSource_production");

    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<TakeTime> entityWrapper, HttpServletRequest request, HttpServletResponse response) {

//        DataSourceContextHolder.setDbType("dataSource");
        DataSourceContextHolder.setDbType("dataSource_production");
    }

    /*
    * query takt time list and takt time chcart
    *
    * */
    @RequestMapping(value = "ajaxList_takttime", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_ouput(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<TakeTime> entityWrapper = new EntityWrapper<>(entityClass);
        //input the start and end param
        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("endDate");
        String station = request.getParameter("station");

        String minTaktTime = request.getParameter("min");
        String maxTaktTime = request.getParameter("max");
        //add condition select all the Ok parts
        entityWrapper.eq("station", station);
        entityWrapper.lt("cast(takeTime as int)", Integer.valueOf(maxTaktTime));
        entityWrapper.gt("cast(takeTime as int)", Integer.valueOf(minTaktTime));
        entityWrapper.orderBy("measureDate");
        //customize search condition; will improve later
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("id", "partNumber", "station", "currentType", "nextType",
                "measureDate", "endDate", "takeTime", "changeType");

        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<TakeTime> record = takeTimeService.selectTakeTimePage(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

    /*
    * query the avgerage takt time for all station in one day
    * */
    @RequestMapping(value = "ajaxList_avgTakttime", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_avgTakTime(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<TakeTime> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("endDate");
        String currentType = request.getParameter("currentType");

//        startDate =  "2017-08-25 06:30";
//        endDate = "2017-08-26 06:30";
//        currentType = "05710";

        logger.info("TakeTimeController ajaxList_avgTakTime param:" + mStation + " startDate: " + startDate +
                " endDate: " + endDate + " currentType: " + currentType);

        //add condition select all the Ok parts
        entityWrapper.eq("currentType", currentType);
        entityWrapper.lt("cast(takeTime as int)", 90);
        entityWrapper.gt("cast(takeTime as int)", 10);
        entityWrapper.notIn("station", excludedStation);
//        entityWrapper.lt("takeTime", 90);

        //customize search condition; will improve later
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("station","avgTakTime");

        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<TakeTime> record = takeTimeService.selectAvgTakeTimePage(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);

        DataSourceContextHolder.setDbType("dataSource");

    }

    /*
    * query one single engine to show in a chart
    * */
    @RequestMapping(value = "ajaxList_singleEngine", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_singleEngine(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                     HttpServletResponse response) throws IOException {
        EntityWrapper<TakeTime> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        entityWrapper.eq("partNumber", mPartNumber);
        entityWrapper.lt("cast(takeTime as int)", 200);
        entityWrapper.gt("cast(takeTime as int)", 0);
        entityWrapper.orderBy("station");
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("station","takeTime","partNumber","currentType");

        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<TakeTime> record = takeTimeService.selectTakeTimePage(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);

        DataSourceContextHolder.setDbType("dataSource");

    }

    /*
    * query key staions for the real-time takt time
    * */
    @RequestMapping(value = "ajaxList_realTimeTaktTime", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_realTimeTaktTime(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                       HttpServletResponse response) throws IOException {
        EntityWrapper<TakeTime> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);
//        entityWrapper.eq("partNumber", mPartNumber);

//        String measureStart = "2017-08-17 10:20";
//        String measureEnd = "2017-08-17 10:30";

        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("measureDateEnd");

        entityWrapper.between("measureDate", startDate, endDate);
        entityWrapper.in("station", filterStation);

        entityWrapper.orderBy("station");

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("partNumber","station","currentType",
                "takeTime","changeType");

        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<TakeTime> record = takeTimeService.selectTakeTimePage(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);

        DataSourceContextHolder.setDbType("dataSource");

    }

    /*
    * query key staions for the real-time takt time
    * */
    @RequestMapping(value = "ajaxList_engineType", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_engineType(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                           HttpServletResponse response) throws IOException {
        EntityWrapper<TakeTime> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
//        String startDate = "2017-08-16 06:30";
//        String endDate = "2017-08-17 06:30";
        entityWrapper.between("measureDate", startDate, endDate);

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("currentType");

        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<TakeTime> record = takeTimeService.selectEngineType(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");

    }
}

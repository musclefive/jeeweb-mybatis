package cn.jeeweb.modules.kiener.controller;

import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.model.PageJson;
import cn.jeeweb.core.query.annotation.PageableDefaults;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.utils.QueryableConvertUtils;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import cn.jeeweb.modules.kiener.service.IMeasureDataService;
import cn.jeeweb.modules.sys.data.HySmsSetting;
import cn.jeeweb.modules.sys.entity.Attachment;
import cn.jeeweb.modules.sys.security.shiro.realm.UserRealm;
import cn.jeeweb.modules.sys.service.IAttachmentService;
import cn.jeeweb.modules.sys.utils.DataSourceContextHolder;
import cn.jeeweb.modules.sys.utils.MultipleDataSource;
import cn.jeeweb.modules.sys.utils.UserUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializeFilter;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceException;
import java.io.IOException;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/measure")
@RequiresPathPermission("kiener:measure")
public class MeasureDataController extends BaseCRUDController<MeasureData, Long> {

    private static Logger logger = LoggerFactory.getLogger(MeasureDataController.class);

//  define the filtered station as requirements
    public final static List kltFilteredStation = Arrays.asList("10", "140", "150", "210", "540", "670",
        "770", "810", "950", "1090", "1310", "1610", "1620");
    public final static List gltFilteredStation = Arrays.asList("10", "300", "320","335","400","480",
            "540","810","990","960","1030","1050","1190","1350","1530","1560","1620");

    public final static List filterStation = Arrays.asList("10", "140", "150", "210", "300", "320" , "335" ,
            "400", "480", "530", "670", "770", "810", "820", "950", "960", "990", "1030", "1050", "1090", "1190",
            "1310", "1350", "1530", "1560", "1610", "1650");

    public final static List filterStationForTakTime = Arrays.asList("10", "50", "80", "130", "300", "320" , "330" ,
            "420", "480", "640", "670", "770", "810", "820", "950", "960", "990", "1030", "1050", "1090", "1190",
            "1310", "1390", "1530", "1560", "1610", "1650");

    @Autowired
    private IMeasureDataService measureDataService;

    private String mStation = "";
    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletRequest response, Model model) {

        String mStation = request.getParameter("station");
        logger.info("preAjaxList param:" + mStation);
        return "cc";
    }

//    public void preList(Model model, HttpServletRequest request, HttpServletResponse response) {
//        mStation = request.getParameter("station");
//        logger.info("preList Test");
//    }

    @RequestMapping(value = "/list/{station}")
    public String list(@PathVariable String station,Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        mStation = station;
        logger.info("preAjaxList param:" + mStation);
        return display("list");
    }

    @RequestMapping(value = "/output")
    public String showOutput(HttpServletRequest request, HttpServletRequest response, Model model) {
        //enter list to get station parm in the url and return the list view
        logger.info("MeasureDataController showOutput Method:" + display("show"));
//        older version of output show page
//        return "modules/kiener/production/production";
        return "modules/kiener/production/output_monitor";

    }

    @RequestMapping(value = "/engine")
    public String engineList(HttpServletRequest request, HttpServletRequest response, Model model) {
        //enter list to get station parm in the url and return the list view
        logger.info("MeasureDataController engineList Method:" + display("show"));
//        older version of output show page
//        return "modules/kiener/production/production";
        return display("engineList");
    }


    /*
    * query the real time output production from startDate to endDate
    * change the datasource if needed
    * return json object with no pages
    * */
    @RequestMapping(value = "ajaxList_engineList", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_engineList(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("endDate");
        String station = request.getParameter("station");

//        String startDate = "2017-09-01 06:30";
//        String endDate = "2017-09-02 06:30";
//        String station = "10";
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                logger.info("output querying startDate:" + startDate + " endDate:" + endDate);
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }

        entityWrapper.eq("station", station);
        entityWrapper.orderBy("measureDate");
//        entityWrapper.eq("Ok", true);
//        propertyPreFilterable.addQueryProperty("id");
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("id", "partNumber", "measureDate", "variety", "ok");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryEngineList(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

    /*
    * query the real time output production from startDate to endDate
    * change the datasource if needed
    * return json object with no pages
    * */
    @RequestMapping(value = "ajaxList_output", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_ouput(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                  HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("measureDateEnd");
        String type = request.getParameter("type");

//        String startDate = "2017-09-01 06:30";
//        String endDate = "2017-09-02 06:30";
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                logger.info("output querying startDate:" + startDate + " endDate:" + endDate);
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }

//        entityWrapper.in("station",filterStation);
        entityWrapper.eq("Ok", true);
//        propertyPreFilterable.addQueryProperty("id");
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("output", "station", "variety", "nextDate", "latestNumber");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryOutput(queryable,entityWrapper);

        String content = JSON.toJSONString(record, filter);
        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }


    /*
    * query the real time output production from startDate to endDate
    * return json object with no pages
    * get the change time number from table [MeasurementGeneralTemp]
    *
    * */
    @RequestMapping(value = "ajaxList_output_change", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_ouput_change(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("measureDateEnd");

//        String startDate = "2018-02-27 06:30";
//        String endDate = "2018-02-28 06:30";
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                logger.info("output querying startDate:" + startDate + " endDate:" + endDate);
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }

        entityWrapper.in("station",filterStation);
        entityWrapper.eq("Ok", true);
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("output", "station", "variety", "nextDate", "latestNumber", "changeCount");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryOutputChangeType(queryable, entityWrapper);

        String content = JSON.toJSONString(record, filter);
        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

    /*
    * query the real time output production from startDate to endDate
    * change the datasource if needed
    * return json object with no pages
    * */
    @RequestMapping(value = "ajaxList_outputForSingleStation", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_ouputSingleStation(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("measureDateEnd");
        String station = request.getParameter("station");
//         startDate = "2018-01-22 06:30";
//         endDate = "2018-01-23 06:30";
//        station = "10";
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                logger.info("output querying startDate:" + startDate + " endDate:" + endDate);
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }

        entityWrapper.eq("station", station);
        entityWrapper.eq("Ok", true);
//        propertyPreFilterable.addQueryProperty("id");
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("output", "station", "variety", "nextDate", "latestNumber");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryOutput(queryable,entityWrapper);

        String content = JSON.toJSONString(record, filter);
        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<MeasureData> entityWrapper, HttpServletRequest request, HttpServletResponse response) {

//        DataSourceContextHolder.setDbType("dataSource1");
//      change to the production enviroment
      DataSourceContextHolder.setDbType("dataSource_production");
    }

    /*
    * query daily production from webservice
    * */
    @RequestMapping(value = "ajaxList_getPlan", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_getPlan(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                  HttpServletResponse response) throws IOException {

        try {

            String service_url = "http://10.120.78.102:8031/GetProductInfo.svc?wsdl";
            String service_method = "GetProductInfoByProduceDate";
            Service service = new Service();
//            String queryDate = "2017-10-25";
            String queryDate = request.getParameter("queryDate");

            Call call = null;
            try {
                call = (Call)service.createCall();
            } catch (ServiceException e) {
                e.printStackTrace();
            }
            call.setTargetEndpointAddress(new URL(service_url));
            call.setOperationName(new QName("http://tempuri.org/", service_method));
            call.setSOAPActionURI("http://tempuri.org/IService1/GetProductInfoByProduceDate");
            call.addParameter(new QName("http://tempuri.org/", "date"), XMLType.XSD_STRING, javax.xml.rpc.ParameterMode.IN);
            call.setReturnType(XMLType.XSD_STRING);
            String xmlString = call. invoke(new Object[]{queryDate}).toString();

            JSONArray object = JSON.parseArray(xmlString.toString());

            String content = "{\"results\":" + object.toJSONString() + "}";
            StringUtils.printJson(response, content);
            logger.info("Production plan from webservice:" + content + " length:" + object.size());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
    * query the real time output production from startDate to endDate for key stations
    * filterStationForTakTime
    * change the datasource if needed
    * return json object with no pages
    * */
    @RequestMapping(value = "ajaxList_realTimeTaktTime", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_realTimeTaktTime(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);
        EntityWrapper<MeasureData> entityWrapper_1 = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("measureDateEnd");
        logger.info("ajaxList_realTimeTaktTime para: " + startDate + " to: " + endDate);
//        String startDate = "2017-08-26 06:30";
//        String endDate = "2017-08-26 11:40";
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                logger.info("output querying startDate:" + startDate + " endDate:" + endDate);
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }

        entityWrapper.in("station", filterStationForTakTime);
        entityWrapper.eq("Ok", true);
//        entityWrapper_1.le("cast(rowId as int)",2);
//        propertyPreFilterable.addQueryProperty("id");
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("rowId", "id","station", "variety", "measureDate");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryTaktTime(queryable, entityWrapper, entityWrapper_1);

        String content = JSON.toJSONString(record, filter);
        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

    /*
    * query the real time takttime production from startDate to endDate for one single
    * station
    * change the datasource if needed
    * return json object with no pages
    * */
    @RequestMapping(value = "ajaxList_realTimeTaktTimeForSingleStation", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_realTimeTaktTimeSingle(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                           HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("measureDateEnd");
        String station = request.getParameter("station");
        String currentType = request.getParameter("currentType");

        logger.info("ajaxList_realTimeTaktTimeForSingleStation para: " + startDate + " to: " + endDate + " station:" + station);
//        String startDate = "2017-08-26 06:30";
//        String endDate = "2017-08-26 11:40";
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                logger.info("output querying startDate:" + startDate + " endDate:" + endDate);
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }

        //add condition select all the Ok parts
        if(!currentType.equals("all")){
            entityWrapper.eq("variety", currentType);
        }

        entityWrapper.eq("station", station);
        entityWrapper.eq("Ok", true);
        entityWrapper.orderBy("measureDate");

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("id","station", "variety", "measureDate", "partNumber");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.querySingleTaktTime(entityWrapper);

        String content = JSON.toJSONString(record, filter);
        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

    @RequestMapping(value = "ajaxList_measure", method = { RequestMethod.GET, RequestMethod.POST })
    @PageableDefaults(sort = "id=desc")
    private void ajaxList_measure(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                          HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);
        preAjaxList_measure(queryable, entityWrapper, request, response);
        propertyPreFilterable.addQueryProperty("id");
        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        //get all the list with page problem
//        PageJson<MeasureData> pagejson = new PageJson<MeasureData>(measureDataService.selectTakeTimePage(queryable,entityWrapper));
        //override list method with pages
        PageJson<MeasureData> pagejson = new PageJson<MeasureData>(measureDataService.listWithSQL(queryable,entityWrapper));

        String content = JSON.toJSONString(pagejson, filter);
        StringUtils.printJson(response, content);
    }

    public void preAjaxList_measure(Queryable queryable,EntityWrapper<MeasureData> entityWrapper, HttpServletRequest request, HttpServletResponse response) {
        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("measureDateEnd");
        String partNumber = request.getParameter("partNumber");

        logger.info("preAjaxList_measure param:" + mStation + " startDate: " + startDate +
                " endDate: " + endDate + " partNumber: " + partNumber);
        //多数据源配置、切换数据源
        DataSourceContextHolder.setDbType("dataSource1");

        //add condition select all the Ok parts
//        entityWrapper.eq("A.Ok", true);
        entityWrapper.eq("A.station", mStation);
        //customize search condition; will improve later
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }
    }
}

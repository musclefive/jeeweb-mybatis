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
import java.io.IOException;
import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/taketime")
@RequiresPathPermission("kiener:taketime")
public class TakeTimeController extends BaseCRUDController<TakeTime, Long> {

    private static Logger logger = LoggerFactory.getLogger(TakeTimeController.class);

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

    @Override
    public void preList(Model model, HttpServletRequest request, HttpServletResponse response) {
        logger.info("Enter TakeTimeController preList");
//       change to the default datasource
        DataSourceContextHolder.setDbType("dataSource");
    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<TakeTime> entityWrapper, HttpServletRequest request, HttpServletResponse response) {
        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("endDate");
        String partNumber = request.getParameter("partNumber");

        DataSourceContextHolder.setDbType("dataSource");

        logger.info("TakeTimeController preAjaxList param:" + mStation + " startDate: " + startDate +
                " endDate: " + endDate + " partNumber: " + partNumber);

        //add condition select all the Ok parts
        entityWrapper.eq("station", mStation);
        //customize search condition; will improve later
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }
    }

    /*
    * query takt time list for a datatable
    *
    * */
    @RequestMapping(value = "ajaxList_takttime", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_ouput(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<TakeTime> entityWrapper = new EntityWrapper<>(entityClass);
        //input the start and end param
        preAjaxList(queryable, entityWrapper, request, response);

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("id", "partNumber", "station", "currentType", "nextType",
                "measureDate", "endDate", "takeTime", "changeType");

        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<TakeTime> record = takeTimeService.selectTakeTimePage(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);
    }

    /*
    * query the avgerage takt time for all station in one day
    * */
    @RequestMapping(value = "ajaxList_avgTakttime", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_avgTakTime(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<TakeTime> entityWrapper = new EntityWrapper<>(entityClass);


        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("endDate");
//        String partNumber = request.getParameter("partNumber");
        String currentType = request.getParameter("currentType");

//        startDate =  "2017-08-25 06:30";
//        endDate = "2017-08-26 06:30";
//        currentType = "05710";

        DataSourceContextHolder.setDbType("dataSource");

        logger.info("TakeTimeController ajaxList_avgTakTime param:" + mStation + " startDate: " + startDate +
                " endDate: " + endDate + " currentType: " + currentType);

        //add condition select all the Ok parts
        entityWrapper.eq("currentType", currentType);
        entityWrapper.lt("cast(takeTime as int)", 90);
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
    }

    /*
    * query one single engine to show in a chart
    * */
    @RequestMapping(value = "ajaxList_singleEngine", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_singleEngine(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                     HttpServletResponse response) throws IOException {
        EntityWrapper<TakeTime> entityWrapper = new EntityWrapper<>(entityClass);


        DataSourceContextHolder.setDbType("dataSource");
        entityWrapper.eq("partNumber", mPartNumber);
        entityWrapper.orderBy("station");
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("station","takeTime","partNumber","currentType");

        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<TakeTime> record = takeTimeService.selectTakeTimePage(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);
    }

}

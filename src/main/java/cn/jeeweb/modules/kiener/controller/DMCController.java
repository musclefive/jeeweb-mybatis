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
import cn.jeeweb.modules.kiener.service.IMeasureDataService;
import cn.jeeweb.modules.sys.utils.DataSourceContextHolder;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceException;
import java.io.IOException;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/dmc")
@RequiresPathPermission("kiener:dmc")
public class DMCController extends BaseCRUDController<MeasureData, Long> {

    private static Logger logger = LoggerFactory.getLogger(DMCController.class);

    @Autowired
    private IMeasureDataService measureDataService;

    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletRequest response, Model model) {

        String mStation = request.getParameter("station");
        logger.info("preAjaxList param:" + mStation);
        return "cc";
    }

    @RequestMapping(value = "/zkgList")
    public String takttimeList(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter the takt time list, then show the station list and query time
        preList(model, request, response);
        return display("zkgList");
    }

    @RequestMapping(value = "/zkList")
    public String zkList(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter the takt time list, then show the station list and query time
        preList(model, request, response);
        return display("zkList");
    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<MeasureData> entityWrapper, HttpServletRequest request, HttpServletResponse response) {

//        DataSourceContextHolder.setDbType("dataSource1");
//      change to the production enviroment
      DataSourceContextHolder.setDbType("dataSource_production");
    }

    /*
    * query the DMC code from the table[DMCMeasurements]
    * to show the ZKG part table
    * */
    @RequestMapping(value = "ajaxList_dmc_zkg", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_dmc_zkg(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                           HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);
        EntityWrapper<MeasureData> entityWrapper_1 = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate").toString();
        String endDate = request.getParameter("endDate").toString();
//        String zkgType = request.getParameter("endDate").toString();
//        zkgType = "06K103011CP014693";
//        String startDate = "2018-01-30 07:30";
//        String endDate = "2018-01-31 07:30";

        entityWrapper.between("Date", startDate, endDate);

        entityWrapper_1.groupBy("DMC");

        entityWrapper_1.having("Min(A.Date) > {0}", startDate);
        entityWrapper_1.having("Min(A.Date) < {0}", endDate);

//        propertyPreFilterable.addQueryProperty("id","partNumber", "variety", "measureDate", "dmc", "dmcNew");
        propertyPreFilterable.addQueryProperty("id", "partNumber", "variety", "measureDate", "dmc","summary");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryZKGDMC(queryable,entityWrapper,entityWrapper_1);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }


    /*
    * query the DMC code from the table[DMCMeasurements]
    * to show the ZK and KW part table
    * */
    @RequestMapping(value = "ajaxList_dmc_zk_kw", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_dmc_zk(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                  HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);
        EntityWrapper<MeasureData> entityWrapper_1 = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate").toString();
        String endDate = request.getParameter("endDate").toString();
        String station = request.getParameter("station").toString();
//        String zkgType = request.getParameter("endDate").toString();
//        zkgType = "06K103011CP014693";
//        String startDate = "2018-01-30 07:30";
//        String endDate = "2018-01-31 07:30";
//        String type = "590";
//        type = "70"; KW

        entityWrapper.eq("station", station);
        entityWrapper.between("Date", startDate, endDate);


        entityWrapper_1.eq("station", station);
        entityWrapper_1.groupBy("DMC");

        entityWrapper_1.having("Min(A.Date) > {0}", startDate);
        entityWrapper_1.having("Min(A.Date) < {0}", endDate);

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("id","partNumber", "variety", "measureDate", "dmc","summary");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryZKGAndKWDMC(queryable, entityWrapper, entityWrapper_1);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

    /*
    * query the DMC code from the table[DMCMeasureDailyData]
    * to show the daily zkg output group by zk/zk/kw type
    * */
    @RequestMapping(value = "ajaxList_dailydmc", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_dailydmc(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                 HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate").toString();
        String endDate = request.getParameter("endDate").toString();
        String station = request.getParameter("station").toString();
//        String zkgType = request.getParameter("endDate").toString();
//        zkgType = "06K103011CP014693";
//        String startDate = "2018-01-30 07:30";
//        String endDate = "2018-01-31 07:30";
//        String type = "590";
//        type = "70"; KW

        entityWrapper.eq("station", station);
        entityWrapper.between("maxDate", startDate, endDate);
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("station", "maxDate", "type", "summary", "total");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryDailyDMC(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }


    /*
    * query the DMC code from the table[DMCMeasureDailyData]
    * to show the daily zkg output group by zk/zk/kw type
    * */
    @RequestMapping(value = "ajaxList_dailydmcforZK", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_dailydmcforZK(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                   HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate").toString();
        String endDate = request.getParameter("endDate").toString();
        String station = request.getParameter("station").toString();
//        String zkgType = request.getParameter("endDate").toString();
//        zkgType = "06K103011CP014693";
//        String startDate = "2018-01-30 07:30";
//        String endDate = "2018-01-31 07:30";
//        String type = "590";
//        type = "70"; KW

        entityWrapper.eq("station", station);
        entityWrapper.between("maxDate", startDate, endDate);
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("station", "maxDate", "type", "summary", "total");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryDailyDMCforZK(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }


    /*
* query the DMC code from the table[DMCMeasurements]
* to show the ZKG part table
* */
    @RequestMapping(value = "ajaxList_dmc_single", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_dmc_single(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                  HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);
        List filterString;
//        zkgType = "06K103011CP014693";
        String dmc = request.getParameter("dmc").toString();
        String station = request.getParameter("station").toString();
//        String dmc = "06K103011CP01555189RRRRR";
        String queryType = request.getParameter("queryType").toString();
        logger.info("ajaxList_dmc_single method queryType: " + queryType + " dmc:" + dmc + " station:" + station);

        entityWrapper.eq("station", station);
//        entityWrapper.eq("B.Ok", true);

        if(queryType.equals("list")){
            String[] ss = dmc.split("\n");
            filterString = Arrays.asList(ss);
            logger.info("After Split" + filterString.size());
            entityWrapper.in("B.DMC", filterString);

        }else{
            entityWrapper.eq("B.DMC", dmc);
        }

        propertyPreFilterable.addQueryProperty("partNumber", "variety", "measureDate", "dmcNew");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.querySingleDMC(queryable, entityWrapper);

        String content = "{\"single\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }


}

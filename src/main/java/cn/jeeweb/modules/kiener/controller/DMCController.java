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
import java.util.List;

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
//        startDate = "2017-11-18 07:30";
//        endDate = "2017-11-19 07:30";
        entityWrapper.eq("station", "10");
        entityWrapper.eq("B.Ok", true);
        entityWrapper.between("A.Date", startDate, endDate);

//        entityWrapper_1.eq("C.JobID", 13);
//        entityWrapper_1.eq("D.JobID", 14);
//        entityWrapper_1.like("A.Date","06K103011CP014693");
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("id","partNumber", "variety", "measureDate", "dmc", "dmcNew");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryZKGDMC(queryable,entityWrapper,entityWrapper_1);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

}

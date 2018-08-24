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
@RequestMapping("${admin.url.prefix}/kiener/ratio")
@RequiresPathPermission("kiener:ratio")
public class StationRatioController extends BaseCRUDController<MeasureData, Long> {

    private static Logger logger = LoggerFactory.getLogger(StationRatioController.class);

    public final static List excludedStation = Arrays.asList("40", "110", "310", "410", "1135", "1425", "1420", "1430",
            "2002");

    @Autowired
    private IMeasureDataService measureDataService;

    @RequestMapping(value = "/station")
    public String takttimeList(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter the takt time list, then show the station list and query time
        preList(model, request, response);
        return display("stationratio");
    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<MeasureData> entityWrapper, HttpServletRequest request, HttpServletResponse response) {

//        DataSourceContextHolder.setDbType("dataSource1");
//      change to the production enviroment
      DataSourceContextHolder.setDbType("dataSource_production");
    }

    /*
    * query the station ratio from start date to end date.
    * */
    @RequestMapping(value = "ajaxList_stationratio", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_stationratio(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                           HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);
        SerializeFilter filter;
        List<MeasureData> record;
        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("measureDate").toString();
        String endDate = request.getParameter("endDate").toString();

//        String startDate = "2017-11-14 07:00";
//        String endDate = "2017-11-15 07:30";

        String currentType = request.getParameter("currentType");
//

        entityWrapper.notIn("station", excludedStation);

        entityWrapper.between("Date", startDate, endDate);




        //add condition select all single variety type
        if(!currentType.equals("all")){

            entityWrapper.eq("variety", currentType);
            entityWrapper.groupBy("station, variety");
            propertyPreFilterable.addQueryProperty("station", "variety", "total", "summary", "totalNok");

            // 预处理
            QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
            filter = propertyPreFilterable.constructFilter(entityClass);
            record = measureDataService.queryOKRate(queryable, entityWrapper);
        }else{

            entityWrapper.groupBy("station");

            propertyPreFilterable.addQueryProperty("station", "total", "summary", "totalNok");

            // 预处理
            QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
            filter = propertyPreFilterable.constructFilter(entityClass);
            record = measureDataService.queryOKRatewithNoVariety(queryable,entityWrapper);

        }

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";

        StringUtils.printJson(response, content);
        DataSourceContextHolder.setDbType("dataSource");
    }

}

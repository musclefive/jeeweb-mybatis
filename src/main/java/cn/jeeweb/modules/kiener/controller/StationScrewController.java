package cn.jeeweb.modules.kiener.controller;

import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.kiener.entity.Station;
import cn.jeeweb.modules.kiener.entity.StationScrew;
import cn.jeeweb.modules.kiener.service.IStationScrewService;
import cn.jeeweb.modules.kiener.service.IStationService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/screw")
@RequiresPathPermission("kiener:screw")
public class StationScrewController extends BaseCRUDController<StationScrew, String> {

    private static Logger logger = LoggerFactory.getLogger(StationScrewController.class);

    @Autowired
    private IStationScrewService stationScrewService;

    @RequestMapping(value = "/list")
    public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        return display("list");
    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<StationScrew> entityWrapper, HttpServletRequest request, HttpServletResponse response) {

//        entityWrapper.eq("enabled", true);
//        entityWrapper.eq("isRework", false);
//        entityWrapper.eq("isOffline", "0");
//        entityWrapper.eq("isConveyorSystem", false);
//        entityWrapper.orderBy("identifier");

    }

    /*
    * query all the stations for select type
    *
    * */
    @RequestMapping(value = "ajaxList_stationscrew", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_stationscrew(PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<StationScrew> entityWrapper = new EntityWrapper<>(entityClass);
        //input the start and end param
        DataSourceContextHolder.setDbType("dataSource");

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("id", "identifier", "type", "pos","spin");

//      filer condition
//        entityWrapper.eq("enabled", true);
//        entityWrapper.eq("isRework", false);
//        entityWrapper.eq("isOffline", "0");
//        entityWrapper.eq("isConveyorSystem", false);
//        entityWrapper.orderBy("identifier");

//        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<StationScrew> record = stationScrewService.selectList(entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);
    }


    /*
    * query all the stations for select type
    *
    * */
    @RequestMapping(value = "ajaxList_screw_pos_spin", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_screw_pos_spin(Queryable queryable,PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                       HttpServletResponse response) throws IOException {
        EntityWrapper<StationScrew> entityWrapper = new EntityWrapper<>(entityClass);
        //input the start and end param
        DataSourceContextHolder.setDbType("dataSource");
        String identifier = request.getParameter("identifier").toString();

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("id", "identifier", "type", "pos","spin");

//      filer condition
        entityWrapper.eq("Identifier", identifier);
//        entityWrapper.eq("isRework", false);
//        entityWrapper.eq("isOffline", "0");
//        entityWrapper.eq("isConveyorSystem", false);
        entityWrapper.orderBy("pos");

//        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<StationScrew> record = stationScrewService.selectList(entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);
    }


    /*
* query all the screw station for select type from table [tblStationScrew]
*
* */
    @RequestMapping(value = "ajaxList_screw", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_screw(Queryable queryable,PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                       HttpServletResponse response) throws IOException {
        EntityWrapper<StationScrew> entityWrapper = new EntityWrapper<>(entityClass);
        //input the start and end param
        DataSourceContextHolder.setDbType("dataSource");

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("identifier", "type");

        entityWrapper.groupBy("identifier");
        entityWrapper.groupBy("type");
        entityWrapper.orderBy("identifier");

        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<StationScrew> record = stationScrewService.selectScrewStation(queryable,entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);
    }

}
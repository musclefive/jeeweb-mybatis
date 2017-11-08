package cn.jeeweb.modules.kiener.controller;

import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.utils.QueryableConvertUtils;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.kiener.entity.Station;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import cn.jeeweb.modules.kiener.service.IStationService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/station")
@RequiresPathPermission("kiener:station")
public class StationController extends BaseCRUDController<Station, Long> {

    private static Logger logger = LoggerFactory.getLogger(StationController.class);

    @Autowired
    private IStationService stationService;

    @RequestMapping(value = "/list")
    public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        return display("list");
    }

    /*
    * query all the stations for select type
    *
    * */
    @RequestMapping(value = "ajaxList_station", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_station(PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {
        EntityWrapper<Station> entityWrapper = new EntityWrapper<>(entityClass);
        //input the start and end param
//        preAjaxList(queryable, entityWrapper, request, response);

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("id", "identifier", "type");

//      filer condition
        entityWrapper.eq("enabled", true);
        entityWrapper.eq("isRework", false);
        entityWrapper.eq("isOffline", "0");
        entityWrapper.eq("isConveyorSystem", false);
        entityWrapper.orderBy("identifier");

//        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<Station> record = stationService.selectList(entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);
    }

}
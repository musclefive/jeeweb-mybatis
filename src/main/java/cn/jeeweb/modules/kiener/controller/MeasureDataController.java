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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/measure")
@RequiresPathPermission("kiener:measure")
public class MeasureDataController extends BaseCRUDController<MeasureData, Long> {

    private static Logger logger = LoggerFactory.getLogger(MeasureDataController.class);
    @Autowired
    private IMeasureDataService measureDataService;

    @Autowired
    private IAttachmentService attachmentService;

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

    /*
    * query the real time output production from startDate to endDate
    * change the datasource if needed
    * return json object with no pages
    * */
    @RequestMapping(value = "ajaxList_output", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_ouput(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                  HttpServletResponse response) throws IOException {
        EntityWrapper<MeasureData> entityWrapper = new EntityWrapper<>(entityClass);

        DataSourceContextHolder.setDbType("dataSource1");
//        String startDate = request.getParameter("measureDate");
//        String endDate = request.getParameter("measureDateEnd");
        String startDate = "2017-09-01 06:30";
        String endDate = "2017-09-02 06:30";
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }

//        propertyPreFilterable.addQueryProperty("id");
        //output json with query conditions
        propertyPreFilterable.addQueryProperty("output", "station", "variety");

        // 预处理
        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<MeasureData> record = measureDataService.queryOutput(queryable,entityWrapper);

        String content = JSON.toJSONString(record, filter);
        StringUtils.printJson(response, content);
    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<MeasureData> entityWrapper, HttpServletRequest request, HttpServletResponse response) {
        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("measureDateEnd");
        String partNumber = request.getParameter("partNumber");

        logger.info("preAjaxList param:" + mStation + " startDate: " + startDate +
                " endDate: " + endDate + " partNumber: " + partNumber);
        //多数据源配置、切换数据源
        DataSourceContextHolder.setDbType("dataSource1");

        //add condition select all the Ok parts
        entityWrapper.eq("Ok", true);
        entityWrapper.eq("station", mStation);
        //customize search condition; will improve later
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }
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
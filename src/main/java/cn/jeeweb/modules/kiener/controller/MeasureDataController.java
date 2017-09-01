package cn.jeeweb.modules.kiener.controller;

import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.model.AjaxJson;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.kiener.entity.MeasureData;
import cn.jeeweb.modules.sys.data.HySmsSetting;
import cn.jeeweb.modules.sys.security.shiro.realm.UserRealm;
import cn.jeeweb.modules.sys.utils.DataSourceContextHolder;
import cn.jeeweb.modules.sys.utils.MultipleDataSource;
import cn.jeeweb.modules.sys.utils.UserUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/measure")
@RequiresPathPermission("kiener:measure")
public class MeasureDataController extends BaseCRUDController<MeasureData, Long> {

    private static Logger logger = LoggerFactory.getLogger(MeasureDataController.class);
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

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<MeasureData> entityWrapper, HttpServletRequest request, HttpServletResponse response) {
        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("measureDateEnd");
        String partNumber = request.getParameter("partNumber");

        logger.info("preAjaxList param:" + mStation + " startDate: " + startDate +
                " endDate: " + endDate + " partNumber: " + partNumber);
        //多数据源配置、切换数据源
        DataSourceContextHolder.setDbType("dataSource1");

//        if (!StringUtils.isEmpty(organizationid)) {
        //add condition select all the Ok parts
        entityWrapper.eq("Ok", true);
        entityWrapper.eq("station", mStation);
        //customize search condition; will improve later
        if(startDate != null && endDate != null ){
            if(!startDate.equals("") && !startDate.equals("")){
                entityWrapper.between("measureDate",startDate,endDate);
            }
        }
//        entityWrapper.between("measureDate","2017-06-12","2017-06-13");

//        }
    }
}

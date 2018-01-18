package cn.jeeweb.modules.leave.controller;

import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.query.data.PropertyPreFilterable;
import cn.jeeweb.core.query.data.Queryable;
import cn.jeeweb.core.query.utils.QueryableConvertUtils;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.utils.StringUtils;
import cn.jeeweb.modules.kiener.entity.TakeTime;
import cn.jeeweb.modules.leave.entity.UserLeave;
import cn.jeeweb.modules.leave.service.IUserLeaveService;
import cn.jeeweb.modules.sys.entity.Role;
import cn.jeeweb.modules.sys.utils.DataSourceContextHolder;
import cn.jeeweb.modules.sys.utils.UserUtils;
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
import java.util.List;

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/leave/user")
@RequiresPathPermission("leave:leave")
public class UserLeaveController extends BaseCRUDController<UserLeave, String> {

    private static Logger logger = LoggerFactory.getLogger(UserLeaveController.class);

    @Autowired
    private IUserLeaveService userLeaveService;

    @RequestMapping(value = "/list")
    public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        logger.info("entry the test list userName:" + UserUtils.getUser().getUsername());

        return display("list");
    }

    @RequestMapping(value = "/calendar")
    public String login(Model model, HttpServletRequest request, HttpServletResponse response) {

        logger.info("entry the calendar view");
        return display("calendar");
    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<UserLeave> entityWrapper, HttpServletRequest request, HttpServletResponse response) {
        String currentUser = UserUtils.getUser().getRealname();
        List<Role> roleList = UserUtils.getRoleList();
        Boolean flag = true;
        for (Role r : roleList){
            logger.info("preAjaxList User Role:" + r.getCode() +
                    " Name:" + r.getName() + " realname:" + currentUser);
            if (r.getCode().equals("admin")){
                flag = false;
            }
        }
        if(flag){
            entityWrapper.eq("username", currentUser);
        }
    }

    /*
    * query the events(leave type, business trip ,vocation) for a specific data time
    * */
    @RequestMapping(value = "ajaxList_event", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_event(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                     HttpServletResponse response) throws IOException {

        DataSourceContextHolder.setDbType("dataSource");

        EntityWrapper<UserLeave> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("start");
        String endDate = request.getParameter("end");

//        startDate =  "2018-12-31";
//        endDate = "2018-01-01";

        logger.info("UserLeaveController ajaxList_event param: startDate:" + startDate +
                " endDate: " + endDate);

//        entityWrapper.where("startdate <=  {0}" , startDate).
//                or("enddate <= {0}", endDate);
        entityWrapper.where("startdate >=  {0}" , startDate).and("startdate <=  {0}", endDate).
        orNew("enddate <= {0}", endDate).and("enddate >= {0}", startDate);

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("username","leavetype",
                "startdate", "enddate", "leavename", "remark","userid");

        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<UserLeave> record = userLeaveService.selectUserLeave(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);

        DataSourceContextHolder.setDbType("dataSource");

    }


    /*
    * query the statics for all the users
    * */
    @RequestMapping(value = "ajaxList_statics", method = { RequestMethod.GET, RequestMethod.POST })
    private void ajaxList_statics(Queryable queryable, PropertyPreFilterable propertyPreFilterable, HttpServletRequest request,
                                HttpServletResponse response) throws IOException {

        DataSourceContextHolder.setDbType("dataSource");

        EntityWrapper<UserLeave> entityWrapper = new EntityWrapper<>(entityClass);

        preAjaxList(queryable, entityWrapper, request, response);

        String startDate = request.getParameter("start");
        String endDate = request.getParameter("end");

//        startDate =  "2018-01-31";
//        endDate = "2018-01-31";

        logger.info("UserLeaveController ajaxList_statics param: startDate:" + startDate +
                " endDate: " + endDate);

        entityWrapper.where("startdate >=  {0}" , startDate).and("startdate <=  {0}", endDate).
                orNew("enddate <= {0}", endDate).and("enddate >= {0}", startDate);

        //output json with query conditions
        propertyPreFilterable.addQueryProperty("username","affair",
                "sick", "paid", "addition","workover","overtime","special","domestic","international");

        QueryableConvertUtils.convertQueryValueToEntityValue(queryable, entityClass);
        SerializeFilter filter = propertyPreFilterable.constructFilter(entityClass);
        List<UserLeave> record = userLeaveService.selectUserLeaveStatics(queryable, entityWrapper);

        String content = "{\"results\":" + JSON.toJSONString(record, filter) + "}";
        StringUtils.printJson(response, content);

        DataSourceContextHolder.setDbType("dataSource");

    }

}
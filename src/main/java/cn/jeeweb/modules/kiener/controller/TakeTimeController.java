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
import cn.jeeweb.modules.kiener.service.IMeasureDataService;
import cn.jeeweb.modules.sys.service.IAttachmentService;
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

/**
 * Created by Chao.Cui.VWED on 2017/8/25.
 */
@Controller
@RequestMapping("${admin.url.prefix}/kiener/taketime")
@RequiresPathPermission("kiener:taketime")
public class TakeTimeController extends BaseCRUDController<TakeTime, Long> {

    private static Logger logger = LoggerFactory.getLogger(TakeTimeController.class);

    private String mStation = "";

    @RequestMapping(value = "/list/{station}")
    public String list(@PathVariable String station,Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        mStation = station;
        logger.info("preAjaxList param:" + mStation);
        return display("list");
    }

    @Override
    public void preAjaxList(Queryable queryable,EntityWrapper<TakeTime> entityWrapper, HttpServletRequest request, HttpServletResponse response) {
        String startDate = request.getParameter("measureDate");
        String endDate = request.getParameter("endDate");
        String partNumber = request.getParameter("partNumber");

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
}

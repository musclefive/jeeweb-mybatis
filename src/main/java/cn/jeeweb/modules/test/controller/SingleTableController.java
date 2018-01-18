package cn.jeeweb.modules.test.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.modules.test.entity.SingleTable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**   
 * @Title: 单表测试
 * @Description: 单表测试
 * @author jeeweb
 * @date 2017-07-27 09:05:34
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("${admin.url.prefix}/test/singletable")
@RequiresPathPermission("test:singletable")
public class SingleTableController extends BaseCRUDController<SingleTable, String> {

    private static Logger logger = LoggerFactory.getLogger(SingleTableController.class);

    @RequestMapping(value = "/list")
    public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
        //enter list to get station parm in the url and return the list view
        preList(model, request, response);
        logger.info("entry the SingleTableController list");
        return display("list");
    }

    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletRequest response, Model model) {

        logger.info("entry the SingleTableController login");
        return "cc";
    }
}

package cn.jeeweb.modules.test.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.jeeweb.core.common.controller.BaseCRUDController;
import cn.jeeweb.core.security.shiro.authz.annotation.RequiresPathPermission;
import cn.jeeweb.core.query.wrapper.EntityWrapper;
import java.util.List;

import cn.jeeweb.modules.test.entity.TestOrderMain;
import cn.jeeweb.modules.test.entity.TestOrderTicket;
import cn.jeeweb.modules.test.service.ITestOrderTicketService;
import cn.jeeweb.modules.test.entity.TestOrderCustomer;
import cn.jeeweb.modules.test.service.ITestOrderCustomerService;
import org.springframework.web.bind.annotation.ResponseBody;

/**   
 * @Title: 订单主表
 * @Description: 订单主表
 * @author jeeweb
 * @date 2017-07-22 20:05:35
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("${admin.url.prefix}/test/testordermain")
@RequiresPathPermission("test:testordermain")
public class TestOrderMainController extends BaseCRUDController<TestOrderMain, String> {
	@Autowired
	private ITestOrderTicketService testOrderTicketService;
	@Autowired
	private ITestOrderCustomerService testOrderCustomerService;

	private static Logger logger = LoggerFactory.getLogger(TestOrderMainController.class);

	@Override
	public void preEdit(TestOrderMain testOrderMain, Model model, HttpServletRequest request, HttpServletResponse response) {
		// 获得机票信息数据
		List<TestOrderTicket> testOrderTicketList = testOrderTicketService.selectList(new EntityWrapper<TestOrderTicket>(TestOrderTicket.class).eq("order.id",testOrderMain.getId()));
		model.addAttribute("testOrderTicketList", testOrderTicketList);
		// 获得客户信息数据
		List<TestOrderCustomer> testOrderCustomerList = testOrderCustomerService.selectList(new EntityWrapper<TestOrderCustomer>(TestOrderCustomer.class).eq("order.id",testOrderMain.getId()));
		model.addAttribute("testOrderCustomerList", testOrderCustomerList);
	}

	@RequestMapping(value = "/list")
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
		//enter list to get station parm in the url and return the list view
		preList(model, request, response);
		logger.info("entry the TestOrderMainController list");
		return display("list");
	}

	@RequestMapping(value = "/login")
	@ResponseBody
	public String login(HttpServletRequest request, HttpServletRequest response, Model model) {

		logger.info("entry the TestOrderMainController login");
		return "cc";
	}
}

package com.zs.pms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.exception.AppException;

import com.zs.pms.po.TUSer;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@Controller
/**
 * 登录页和主页
 * 
 * @author Administrator
 *
 */
public class FrameController {
	@Autowired
	UserService us;// 注入业务

	/**
	 * 去登录页
	 * 
	 * @return
	 */
	@RequestMapping("/tologin.do")
	public String tologin() {
		return "login";
	}

	@RequestMapping("/login.do")
	/**
	 * 检测登录
	 * 
	 * @param query登录名和密码
	 * @param code
	 *            验证码
	 * @param session
	 *            产生会话
	 * @param model
	 *            回带数据
	 * @return 返回页面
	 */
	public String login(QueryUser query, String code, HttpSession session, ModelMap model) {
		// 验证验证码
		// 从session中取得kaptcha生成的验证码
		String ocode = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		// 验证码不同
		if (!ocode.equals(code)) {
			// 页面回带信息
			model.addAttribute("MSG", "验证码输入有误，请重新输入");
			// 回到登录页面
			return "login";
		}
		// 验证码相同 校验登录
		TUSer user;
		try {
			user = us.chklogin(query);
			session.setAttribute("CUSER", user);
			return "main";
			// 业务异常
		} catch (AppException e) {
			// TODO: handle exception
			// 页面带信息
			model.addAttribute("MSG", e.getErrMsg());
			// 回到登录页面
			return "login";
		}
		// 系统异常
		catch (Exception e1) {
			e1.printStackTrace();
			return "error";
		}
	}

	@RequestMapping("/totop.do")
	/**
	 * 去top页
	 * 
	 * @return
	 */
	public String totop() {
		return "top";
	}

	@RequestMapping("/toleft.do")
	// 去左侧菜单
	public String toleft() {
		return "left";
	}

	@RequestMapping("/toright")
	// 右侧页面
	public String toright() {
		return "right";
	}
}

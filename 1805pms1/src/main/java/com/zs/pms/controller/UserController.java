package com.zs.pms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDept;
import com.zs.pms.po.TUSer;
import com.zs.pms.service.DepService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

/**
 * 用户控制器
 * @author Administrator
 *
 */
@Controller
public class UserController {

	@Autowired
	UserService us;//用户服务
	
	@Autowired
	DepService ds;//部门服务
	
	@RequestMapping("/user/list.do")
	public String list(QueryUser query,String page,ModelMap model){
		//page是空
		if(page==null||"".equals(page)){
			page="1";//默认第一页
		}
		//带回分页数据
		model.addAttribute("LIST",us.queryByPage(query, Integer.parseInt(page)));
		//带回总页数
		model.addAttribute("PAGECOUNT",us.queryPageCount(query));
		//回带当前页数
		model.addAttribute("PAGE",page);
		//回带查询条件
		model.addAttribute("QUERY",query);
		//返回user/list.jsp
		return "user/list";
	}
	@RequestMapping("/user/toadd.do")
	public String toadd(ModelMap model){
		//获得一级部门列表
	 List<TDept>list1=ds.queryByPid(0);
		model.addAttribute("DLIST",ds.queryByPid(0));
		//获得默认一级部门下的二级部门列表
		List<TDept>list2=ds.queryByPid(list1.get(0).getId());
		model.addAttribute("DLIST2",list2);
		return "user/add";
		}
	
	@RequestMapping("/user/add.do")
	public String add(TUSer user,ModelMap model,HttpSession session){
		
		try{
			//获得session中的用户信息
			TUSer cuser=(TUSer)session.getAttribute("CUSER");
			user.setCreator(cuser.getId());
			user.setIsenabled(1);//可用
			us.insert(user);
			//跳转到指定url上
			return "redirect:list.do";
			
		}catch(AppException e){
			model.addAttribute("MSG",e.getErrMsg());
			//执行方法  传参
			return this.toadd(model);
		}
	}
	
	
	
	@RequestMapping("/user/getdep.do")
	@ResponseBody
	/*
	 * 以ajax方式响应
	 * 方法返回string 直接返回文本
	 * 
	 * 方法返回对象 返回json格式 自动调用jsonarray
	 */
	public List<TDept>getDept(int pid){
		List<TDept>list=ds.queryByPid(pid);
		return list;
	}
	/**
	 * 删单条
	 * @param id
	 * @return
	 */
	@RequestMapping("/user/delete.do")
	public String delete(int id){
		try {
			us.delete(id);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:list.do";
	}
	//删多条
	@RequestMapping("/user/deletes.do")
	public String deletes(int[] ids){
		us.deleteById(ids);
		return "redirect:list.do";

	}
	@RequestMapping("/user/get.do")
	public String get(int id,ModelMap model){
		TUSer user=us.queryById(id);
		model.addAttribute("USER",user);
		//获得一级部门表
		List<TDept>list1=ds.queryByPid(0);
		model.addAttribute("DLIST",list1);
		//获得该用户的一级部门下的二级部门列表
		List<TDept>list2=ds.queryByPid(user.getDept().getPid());
		model.addAttribute("DLIST2",list2);
		
		return "user/update";
	}
	@RequestMapping("/user/update.do")
	public String update(TUSer user,HttpSession session,ModelMap model){
		//获得session中的用户信息
		TUSer cuser=(TUSer)session.getAttribute("CUSER");
		user.setUpdator(cuser.getId());
		try {
			us.update(user);
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			model.addAttribute("MSG",e.getErrMsg());
			return get(user.getId(),model);
		}
	}
}


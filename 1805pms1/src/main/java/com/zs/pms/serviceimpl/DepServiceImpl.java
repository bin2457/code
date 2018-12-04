package com.zs.pms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.DepDao;
import com.zs.pms.dao.UserDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDept;
import com.zs.pms.po.TUSer;
import com.zs.pms.service.DepService;
import com.zs.pms.service.UserService;
import com.zs.pms.utils.Constants;
import com.zs.pms.utils.MD5;
import com.zs.pms.vo.QueryUser;

@Service

public class DepServiceImpl implements DepService {
	@Autowired // 注入
	DepDao dao;

	public List<TDept> queryByPid(int pid) {
		// TODO Auto-generated method stub
		return dao.queryByPid(pid);
	}
	



}

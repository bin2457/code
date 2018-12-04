package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TUSer;
import com.zs.pms.vo.QueryUser;

public interface UserService {
	// 登陆
	public TUSer chklogin(QueryUser query) throws AppException;

	// 按条件查询
	public List<TUSer> queryByCon(QueryUser query);

	// 修改
	public void update(TUSer user) throws AppException;

	// 查分页
	public List<TUSer> queryByPage(QueryUser query, int page);

	// 批量删除
	public void deleteById(int[] ids);

	// 获取一条
	public TUSer queryById(int id);

	// 新增
	public int insert(TUSer user) throws AppException;

	// 删除一条
	public void delete(int id) throws AppException;

	// 获取总页数
	public int queryPageCount(QueryUser query);

}

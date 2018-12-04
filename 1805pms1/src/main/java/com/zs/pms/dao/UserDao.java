package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TUSer;
import com.zs.pms.vo.QueryUser;

public interface UserDao {
	// 按条件查询
	public List<TUSer> queryByCon(QueryUser query);

	// 查分页
	public List<TUSer> queryByPage(QueryUser query);

	// 根据主键查询
	public TUSer queryById(int id);

	// 批量删除
	public void deleteById(int[] ids);

	// 修改
	public void update(TUSer user);

	// 新增
	public int insert(TUSer user);

	// 删除
	public void delete(int id);

	// 查询总数
	public int queryConunt(QueryUser query);
}

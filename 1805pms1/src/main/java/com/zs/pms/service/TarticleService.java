package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.Tarticle;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryPage;

public interface TarticleService {
    // 按条件查询
	public List<Tarticle> queryByCon(QueryArticle article);

	// 修改
	public void update(Tarticle article) throws AppException;

	// 查分页
	public List<Tarticle> queryByPage(QueryArticle article, int page);

	// 批量删除
	public void deleteById(int[] ids);

	// 获取一条
	public Tarticle queryById(int id);

	// 新增
	public int insert(Tarticle article) throws AppException;

	// 删除一条
	public void delete(int id) throws AppException;

	// 获取总页数
	public int queryPageCount(QueryArticle article);
}

package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.Tarticle;
import com.zs.pms.vo.QueryArticle;
import com.zs.pms.vo.QueryPage;

public interface TarticleDao {
	//按条件查询
	public List<Tarticle> queryByCon(QueryArticle article);

	// 查分页
	public List<Tarticle> queryByPage(QueryArticle article);

	// 根据主键查询
	public Tarticle queryById(int id);

	// 批量删除
	public void deleteById(int[] ids);

	// 修改
	public void update(Tarticle article);

	// 新增
	public int insert(Tarticle article);

	// 删除
	public void delete(int id);

	// 查询总数
	public int queryConunt(QueryArticle article);
}

package com.etms.core.mapper;

import java.util.List;
import com.etms.core.page.Page;

public interface BaseMapper<T> {
	//添加单个对象
	public int insert(T entity);
	
	//修改单个对象
	public int update(T entity);
	
	//删除单个对象 
	public int delete(T entity);
	
	//通过主键（数组）批量删除数据
	public int deleteList(String[] pks);
	
	//查询单个对象
	public T select(T entity);
	
	//查询所有对象
	public List<T> selectAll();
	
	//通过关键字分页查询数据列表
	public List<T> selectPageListUseDyc(Page<T> page);
		
	//通过关键字分页查询，返回总记录数
	public Integer selectPageCountUseDyc(Page<T> page);		
	
}

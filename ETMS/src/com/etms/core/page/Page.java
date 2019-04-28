package com.etms.core.page;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Page<T> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6833195581492592844L;
	
	private Integer page;//当前页
	private Integer rows;//页大小
	private Integer totalRecord;// 总记录 数
	private List<T> list;//页面数据列表
	private T paramEntity;//多条件查询
	private Integer start;//需要这里处理
	private String temp;  //其它查询条件
	private Map<String, Object> pageMap = new HashMap<String, Object>() ;
	public Map<String, Object> getPageMap() {
		return pageMap;
	}
	public T getParamEntity() {
		return paramEntity;
	}
	public void setParamEntity(T paramEntity) {
		this.paramEntity = paramEntity;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public void setTotalRecord(Integer totalRecord) {
		pageMap.put("total", totalRecord);
		this.totalRecord = totalRecord;
	}
	public void setList(List<T> list) {
		pageMap.put("rows", list);
		this.list = list;
	}

	public Integer getStart() {
		this.start = (page-1)*rows;
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	@Override
	public String toString() {
		return "Page [page=" + page + ", rows=" + rows + ", totalRecord="
				+ totalRecord + ", list=" + list +", paramEntity=" + paramEntity + ", start=" + start + "]";
	}
}

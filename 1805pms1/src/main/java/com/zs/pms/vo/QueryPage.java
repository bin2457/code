package com.zs.pms.vo;

import java.sql.Connection;

import com.zs.pms.utils.Constants;

public class QueryPage {
protected int start;
protected int end;
protected int page;
public int getStart() {
	return (page-1)*Constants.PAGECOUNT+1;
}
public void setStart(int start) {
	this.start = start;
}
public int getEnd() {
	return page*Constants.PAGECOUNT;
}
public void setEnd(int end) {
	this.end = end;
}
public int getPage() {
	return page;
}
public void setPage(int page) {
	this.page = page;
}
}

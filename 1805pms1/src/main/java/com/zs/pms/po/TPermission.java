package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TPermission implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7512049132416900243L;
private int id;
private String pname;
private int pid;
private String url;
private int lev;
private int iself;
private String npic;
private List<TPermission> children=new ArrayList<TPermission>();

public List<TPermission> getChildren() {
	return children;
}
public void setChildren(List<TPermission> children) {
	this.children = children;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public int getLev() {
	return lev;
}
public void setLev(int lev) {
	this.lev = lev;
}
public int getIself() {
	return iself;
}
public void setIself(int iself) {
	this.iself = iself;
}
public String getNpic() {
	return npic;
}
public void setNpic(String npic) {
	this.npic = npic;
}

}

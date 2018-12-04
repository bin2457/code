package com.zs.pms.po;

import java.io.Serializable;
import java.util.Date;

public class TSku implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5273509742477251059L;
	
private int id;
private int pid;
private String color;
private int sizes;
private String feature;
private double trancost;
private double sellcost;
private int recont;
private int limit;
private String wpos;
private String skupic;
private String skuname;
private double price;
private int sellcont;
private int creator;
private Date creatime;
private int updator;
private Date updatime;
private int safcont;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public String getColor() {
	return color;
}
public void setColor(String color) {
	this.color = color;
}
public int getSizes() {
	return sizes;
}
public void setSizes(int sizes) {
	this.sizes = sizes;
}
public String getFeature() {
	return feature;
}
public void setFeature(String feature) {
	this.feature = feature;
}
public double getTrancost() {
	return trancost;
}
public void setTrancost(double trancost) {
	this.trancost = trancost;
}
public double getSellcost() {
	return sellcost;
}
public void setSellcost(double sellcost) {
	this.sellcost = sellcost;
}
public int getRecont() {
	return recont;
}
public void setRecont(int recont) {
	this.recont = recont;
}
public int getLimit() {
	return limit;
}
public void setLimit(int limit) {
	this.limit = limit;
}
public String getWpos() {
	return wpos;
}
public void setWpos(String wpos) {
	this.wpos = wpos;
}
public String getSkupic() {
	return skupic;
}
public void setSkupic(String skupic) {
	this.skupic = skupic;
}
public String getSkuname() {
	return skuname;
}
public void setSkuname(String skuname) {
	this.skuname = skuname;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public int getSellcont() {
	return sellcont;
}
public void setSellcont(int sellcont) {
	this.sellcont = sellcont;
}
public int getCreator() {
	return creator;
}
public void setCreator(int creator) {
	this.creator = creator;
}
public Date getCreatime() {
	return creatime;
}
public void setCreatime(Date creatime) {
	this.creatime = creatime;
}
public int getUpdator() {
	return updator;
}
public void setUpdator(int updator) {
	this.updator = updator;
}
public Date getUpdatime() {
	return updatime;
}
public void setUpdatime(Date updatime) {
	this.updatime = updatime;
}
public int getSafcont() {
	return safcont;
}
public void setSafcont(int safcont) {
	this.safcont = safcont;
}

}

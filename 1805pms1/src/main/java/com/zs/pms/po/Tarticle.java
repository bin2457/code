package com.zs.pms.po;

import java.io.Serializable;
import java.util.Date;

public class Tarticle implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -697462935145647617L;

	private int id;//文章的id
	private String title;//文章的题目
	private String content;//文章的内容
	private String author;//文章的作者
	private Date crtime;//文章的添加时间
	private Tchannel channel;//文章的所属
	private int isremod;//是否推荐
	private int ishot;//是否热点
	private int creator;
	private Date creatime;
	private int updator;
	private Date updatime;
	public Tchannel getChannel() {
		return channel;
	}
	public void setChannel(Tchannel channel) {
		this.channel = channel;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getCrtime() {
		return crtime;
	}
	public void setCrtime(Date crtime) {
		this.crtime = crtime;
	}
	public int getIsremod() {
		return isremod;
	}
	public void setIsremod(int isremod) {
		this.isremod = isremod;
	}
	public int getIshot() {
		return ishot;
	}
	public void setIshot(int ishot) {
		this.ishot = ishot;
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
}

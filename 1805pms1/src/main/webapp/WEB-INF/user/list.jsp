<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>
<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="../res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>
<link rel="stylesheet" href="../res/css/style.css" />
<!-- 引入标签库 -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>User-list</title>
<script type="text/javascript">





//文档加载
$(function(){
	
	$("#ids").click(function(){
		
		$(":checkbox").prop("checked",this.checked);

	});
});
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="javascript:window.location.href='toadd.do'"/>
	</form>
	
	<div class="clear"></div>
</div>
<div class="body-box">
<form action="list.do"method="post"style="padding-top:5px">
登录名：<input type="text"name="loginname"value="${QUERY.loginname}"/>
<select name="isenabled">
<c:if test="${QUERY.isenabled==0}">
<option value="0"selected="selected">请选择</option>
<option value="1">有效</option>
<option value="-1">无效</option>
</c:if>

<c:if test="${QUERY.isenabled==1}">
<option value="0">请选择</option>
<option value="1"selected="selected">有效</option>
<option value="-1">无效</option>
</c:if>

<c:if test="${QUERY.isenabled==-1}">
<option value="0">请选择</option>
<option value="1">有效</option>
<option value="-1"selected="selected">无效</option>
</c:if>
</select>
<input type="submit"class="query"value="查询"/>
</form>
<input type="hidden" name="pageNo" value=""/>
<form method="post" id="tableForm" action="deletes.do">
<input type="hidden" value="" name="pageNo"/>
<input type="hidden" value="" name="queryName"/>

<table cellspacing="1" cellpadding="0" border="0" width="100%" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onclick="Pn.checkbox('ids',this.checked)"/></th>
			<th>用户编号</th>
			<th>用户名</th>
			<th>真实姓名</th>
			<th>性别</th>
			<th>出生年月</th>
			<th>邮箱</th>
			<th>部门名称</th>
			<th>是否可用</th>
			<th>头像</th>
			<th>操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
		<c:forEach items="${LIST}" var="user">
			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td><input type="checkbox" name="ids" value="${user.id}"/></td>
			<td align="center">${user.id}</td>
			<td align="center">${user.loginname}</td>
			<td align="center">${user.realname}</td>
			<td align="center">${user.sex}</td>
			<td align="center">${user.birthdayTxt}</td>
			<td align="center">${user.email}</td>
			<td align="center">${user.dept.name}</td>
			<td align="center">${user.isenabledTxt}</td>
			<td align="center"><img src="../upload/${user.picurl}" height="50px"width="50px"/></td>
			<td align="center">
			<a href="get.do?id=${user.id}" onclick="if(!confirm('确定修改该用户的信息？')){return false;}" class="pn-opt">修改</a>
			<a href="delete.do?id=${user.id}"onclick="if(!confirm('确定要删除该用户的信息？')){return false;}" class="pn-opt">删除</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<div class="page pd15">
<input class="del_button" type="submit" value="删除" /><!-- onclick="if(!confirm('确定删除吗？')){return false;}" -->
</div>
<div class="page pb15" style="float:right">
	<span class="r inb_a page_b">
		<a href="list.do?page=1&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">首页</a>
		
		<a href="list.do?page=${PAGE-1<=0?1:(PAGE-1)}&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">上一页</a>
			
		<a href="list.do?page=${PAGE+1>PAGECOUNT?PAGECOUNT:PAGE+1}&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">下一页</a>
		
		<a href="list.do?page=${PAGECOUNT}&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">尾页</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前第${PAGE}页/共${PAGECOUNT}页
	</span>

</div >
<%-- <div class="page pd15" style="float:right;">
<span class="r inb_a page_b">
<!-- 当前页/尾页 -->
[${requestScope.currentPage }/${requestScope.pageCount }]
<a href="list.do?currentPage=1&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">首页</a>
<c:if test="${requestScope.currentPage-1>0 }">
<a href="list.do?currentPage=${requestScope.currentPage-1}&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">上一页</a>
</c:if>
<c:if test="${requestScope.currentPage+1<=requestScope.pageCount }">
<a href="list.do?currentPage=${requestScope.currentPage+1}&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">下一页</a>
</c:if>
<a href="list.do?currentPage=${requestScope.pageCount }&loginname=${QUERY.loginname}&isenabled=${QUERY.isenabled}">尾页</a>
</span>
</div> --%>
<div style="margin-top:15px;">
<!-- 	<input class="del-button" type="button" value="取消" onclick="optCancel();"/>
	<input class="submit" type="button" value="通过" onclick="optPass();"/> -->
</div>
</form>
</div>

</body>
</html>
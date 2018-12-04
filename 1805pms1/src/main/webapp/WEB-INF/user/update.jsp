<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->


<script type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="../res/css/style.css" />

<script type="text/javascript">



//文档就绪事件 
$(function() {

		//在一级部门的改变事件中
		$("#dep1").change(
				function() {
					//清空下拉框2
					$("#dep2").empty();

					//发ajax请求
					$.post("getdep.do", //url
					{
						pid : this.value
					}, //json类型数据 传值
					function(data) {
						//装载数据
						if (data != null) {
							$(data).each(
									function() {
										//装到下拉框中
										$("#dep2").append("<option value="+this.id+">"+ this.name+ "</option>");
									});
						}
					}, //成功后执行
					"json" //返回类型
					)
				});
	});
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 用户管理 - 修改 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="pn-frequired">${MSG}</span></div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='userlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="update.do?id=${USER.id}" method="post"  >
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						登录名:</td><td width="80%" class="pn-fcontent">
						<input id="loginname" type="text" class="required" name="loginname" maxlength="100" value="${USER.loginname}" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						密码:</td>
						<td width="80%" class="pn-fcontent">
						<input id="password" type="password" class="required" name="password" maxlength="100" value="${USER.password}"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						确认密码:</td>
						<td width="80%" class="pn-fcontent">
						<input id="conpwd"  type="password" class="required" name="conpwd" maxlength="100"  value="${USER.password}"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						
						真实姓名:</td>
						<td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="realname" maxlength="100" value="${USER.realname}"/>
					</td>
				</tr>
		
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
						<c:if test="${USER.sex=='男'}">
							<input type="radio"  name="sex"   value="男" checked="checked"/>男
							<input type="radio"  name="sex"   value="女"/>女
						</c:if>
						<c:if test="${USER.sex=='女'}">
							<input type="radio"  name="sex"   value="男" />男
							<input type="radio"  name="sex"   value="女" checked="checked"/>女
						</c:if>
						
					</td>
				</tr>
			<tr>
						<td width="20%" class="pn-flabel pn-flabel-h">出生日期:</td>
						<td width="80%" class="pn-fcontent"><input type="text" 
						name="birthday" maxlength="80" class="Wdate"
							onclick="WdatePicker()" readonly="readonly"  value="${USER.birthdayTxt }"/></td>
					</tr>
					<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
						<select id="dep1" name="dep1">
							<c:forEach items="${DLIST}" var="dep1">
							<!-- 该用户所在部门的上级部门id等于一级部门id就选择 -->
							<c:if test="${USER.dept.pid==dep1.id }">
							<option value="${dep1.id}"selected="selected">${dep1.name}</option>
							</c:if>
							<!-- 否则不选中 -->	
							<c:if test="${USER.dept.pid!=dep1.id }">
							<option value="${dep1.id}">${dep1.name}</option>
							</c:if>
							</c:forEach>
					</select>
					
					<select id="dep2" name="dept.id">
							<c:forEach items="${DLIST2}" var="dep2">
							<!-- 该用户所在部门的上级部门id等于二级部门id就选择 -->
							<c:if test="${USER.dept.id==dep2.id }">
							<option value="${dep2.id}"selected="selected">${dep2.name}</option>
							</c:if>
							<!-- 否则不选中 -->	
							<c:if test="${USER.dept.id!=dep2.id }">
							<option value="${dep2.id}">${dep2.name}</option>
							</c:if>
							</c:forEach>
					</select>
					</td>
				</tr>

	
				
				
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						email:</td><td width="80%" class="pn-fcontent">
						<input id="email" type="text"  name="email" maxlength="80" value="${USER.email}"/>
					</td>
				</tr>

			</tbody>
			<tbody>
				<tr>
					<td class="pn-fbutton" colspan="2">
						<input type="submit" class="submit" value="提交"/> &nbsp; <input type="reset" class="reset" value="重置"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../res/lecheng/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="../res/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>
<!-- 引入jQuery -->
<script type="text/javascript" language="javascript" src="js/jquery-1.11.0.min.js"></script>
<!-- 引入日期控件 -->
<script type="text/javascript" language="javascript" src="../js/DatePicker/WdatePicker.js"></script>
<!-- <script src="/thirdparty/ckeditor/ckeditor.js" type="text/javascript"></script> -->
<!-- <script src="/thirdparty/My97DatePicker/WdatePicker.js" type="text/javascript"></script> -->
<script type="text/javascript" src="res/fckeditor/fckeditor.js"></script>
<script src="../res/common/js/jquery.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.ext.js" type="text/javascript"></script>
<script src="../res/common/js/jquery.form.js" type="text/javascript"></script>
<script src="../res/common/js/lecheng.js" type="text/javascript"></script>
<script src="../res/lecheng/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="res/css/style.css" />
<title>user-add</title>
<!-- 添加表单验证 -->
<script type="text/javascript">
//用户名：数字+字母，结束之前不能全部都是数字 ，6-16
var CHKLOGINNAME="^(?![0-9]+$)[a-zA-Z0-9]{6,16}$";
//密码：数字+字母，结束之前不能全部都是数字 ，6-16
var CHKPASSWORD="^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,16}$";
//出生日期    yyyy-MM-dd  月份1-12   日期1-31
var CHKDATE="^[0-9]{4}-0?[1-9]|1[0-2]-0?[1-9]|[1-2][0-9]|3[0-1]$";
//邮箱 xxxxxx@xxx.com,可以包含_    企业邮箱qwe@huawei.com.cn   
var CHKEMAIL="^[a-zA-Z0-9_]+@[a-z0-9]{2,5}(\\.[a-z]{2,3}){1,2}$";
//真实姓名
var CHKREALNAME="^[\u4e00-\u9fa5]{2,}$";

//文件上传
function upload(){
	//ajax请求 局部提交
	//设置参数
	var args={
			//url 绝对路径
			url:$("#path").val()+"/upload/common.do",
			//返回类型
			dataType:"text",
			//提交方式
			type:"post",
			success:function(result){
				$("#img").attr("src",$("#path").val()+"/upload/"+result);
				//将路径设置到隐藏域中
				$("#picurl").val(result);
			}
	}
	//表单局部提交
	$("#jvForm").ajaxSubmit(args);
	
}



//文档就绪事件
	$(function(){
		//下拉框change事件
		$("#dep1").change(
			function(){
			//清空第二个下拉框
			$("#dep2").empty();
				
			//ajax的异步提交
			$.post("getdep.do", //url
				{
				pid:this.value
				},//json类型数据 传值
				function(data){
				if(data!=null){
					$(data).each(
						function(){
							//添加数据到第二个下拉框中
							$("#dep2").append("<option value="+this.id+">"+this.name+"</option>")
						}		
					);
				}	
				},//成功执行
				"json"//返回类型
			)
			
		}		
		);
		
	});
	
	
	
	
	



/* //验证用户名
function chkloginname(){
	//获取用户名
	var lgEle=document.getElementById("loginname");
	var loginname=lgEle.value;
	//定义匹配用户名的正则表达式
	var reg=new RegExp(CHKLOGINNAME);
	//获取用户名是否输入成功的元素对象
	var spanEle=document.getElementById("resultName");
	if(reg.test(loginname)){//表示输入正确
		spanEle.innerHTML="✔";
	    spanEle.style.color="green";
	    return true;
	}else{//输入失败
		spanEle.innerHTML="用户名必须包含数字和字母，并且不能低于六位";
	    spanEle.style.color="red";
	    //清空文本框
	    lgEle.value="";
	    //重新聚焦
	    lgEle.focus();
	    return false;
	}
} */
//验证用户名
function chkloginname(){
	//获取用户名
	var loginname=$("#loginname").val();
	//定义匹配用户名的 正则表达式
	var reg=new RegExp(CHKLOGINNAME);
	if(reg.test(loginname)){//正确
		if(chkExistLoginname(loginname)){
			return true;
		}else{
			return false;
		}
	}else{
		$("#resultName").html("用户名必须包含数字和字母，并且不能低于六位");
	    $("#resultName").css("color","red");
	    $("#loginname").val("");
        $("#loginname").focus();
        return false;
	}
}
//检查用户名是否重复
/* function chkExistLoginname(loginname){
	var flag=false;
	$.ajax({
		//请求路径
		url:'chkuser.do',
		//请求方式
		type:'post',
		//请求参数
		data:'type=1&loginname='+loginname,
		//是否异步
		async:false,
		//预期服务器返回的数据类型
		dataType:'text',
		//响应成功调用回调函数
		success:function(flag){
			if(flag=='true'){//没有重复
				$("#resultName").html("✔");
				$("#resultName").css("color","green");
				flag=true;
			}else{
				$("#resultName").html("此用户名已存在");
				$("#resultName").css("color","red");
				flag=false;
			}
		},
		error:function(){
			alert('请求数据失败。。。');
		}
	});
	return flag;
} */
//验证密码
function chkpassword(){
	//获取密码
	var password=$("#password").val();
	//定义匹配密码的 正则表达式
	var reg=new RegExp(CHKPASSWORD);
	if(reg.test(password)){//正确
		$("#resultPwd").html("✔");
	    $("#resultPwd").css("color","green");
	    return true;
	}else{
		$("#resultPwd").html("密码必须包含数字和字母，并且不能低于六位");
	    $("#resultPwd").css("color","red");
	    $("#password").val("");
        return false;
	}
}
/* //验证密码
function chkpassword(){
	//获取密码
	var pwdEle=document.getElementById("password");
	var password=pwdEle.value;
	//定义匹配密码的正则表达式
	var reg=new RegExp(CHKPASSWORD);
	//获取密码是否输入成功的元素对象
	var spanEle=document.getElementById("resultPwd");
	if(reg.test(password)){//表示输入正确
		spanEle.innerHTML="✔";
	    spanEle.style.color="green";
	    return true;
	}else{//输入失败
		spanEle.innerHTML="密码必须包含数字和字母，并且不能低于六位";
	    spanEle.style.color="red";
	    //清空文本框
	    pwdEle.value="";
	    return false;
	}
} */
//验证二次密码
function chkRePwd(){
	//获取二次密码
	var repwd=$("#repwd").val();
	//定义匹配二次密码的 正则表达式
	var reg=new RegExp(CHKPASSWORD);
	if(reg.test(repwd)){//正确
		$("#resultRePwd").html("✔");
	    $("#resultRePwd").css("color","green");
	    return true;
	}else{
		$("#resultRePwd").html("两次密码不一致");
	    $("#resultRePwd").css("color","red");
	    $("#repwd").val("");
        return false;
	}
}
/* //验证两次密码是否一致
function chkRePwd(){
	//获取密码
	var repwdEle=document.getElementById("repwd");
	var repwd=repwdEle.value;
	var password=document.getElementById("password").value;
	//定义匹配密码的正则表达式
	var reg=new RegExp(CHKPASSWORD);
	//获取密码是否输入成功的元素对象
	var spanEle=document.getElementById("resultRePwd");
	if(repwd==password){//表示输入正确
		spanEle.innerHTML="✔";
	    spanEle.style.color="green";
	    return true;
	}else{//输入失败
		spanEle.innerHTML="两次密码不一致";
	    spanEle.style.color="red";
	    //清空文本框
	    repwdEle.value="";
	    return false;
	}
} */
//验证真实姓名
function chkReNm(){
	//获取姓名
	var realname=$("#realname").val();
	//定义匹配姓名的 正则表达式
	var reg=new RegExp(CHKREALNAME);
	if(reg.test(realname)){//正确
		$("#resultReNm").html("✔");
	    $("#resultReNm").css("color","green");
	    return true;
	}else{
		$("#resultReNm").html("名字过短，请重新输入");
	    $("#resultReNm").css("color","red");
	    $("#realname").val("");
        return false;
	}
}
/* //验证真实姓名
function chkReNm(){
	//获取真实姓名
	var renmEle=document.getElementById("realname");
	var realname=renmEle.value;
	//定义匹配姓名的正则表达式
	var reg=new RegExp(CHKREALNAME);
	//获取姓名是否输入成功的元素对象
	var spanEle=document.getElementById("resultReNm");
	if(reg.test(realname)){//表示输入正确
		spanEle.innerHTML="✔";
	    spanEle.style.color="green";
	    return true;
	}else{//输入失败
		spanEle.innerHTML="名字过短，请重新输入";
	    spanEle.style.color="red";
	    //清空文本框
	    renmEle.value="";
	    return false;
	}
} */
//检查邮箱是否唯一
/* function chkExistEmail(email){
	var flag=false;
	$.ajax({
		//请求路径
		url:'chkemail.do',
		//请求方式
		type:'post',
		//请求参数
		data:'type=2&email='+email,
		//是否异步
		async:false,
		//预期服务器返回的数据类型
		dataType:'text',
		//响应成功调用回调函数
		success:function(flag){
			if(flag=='true'){//没有重复
				$("#resultEmail").html("✔");
				$("#resultEmail").css("color","green");
				flag=true;
			}else{
				$("#resultEmail").html("此邮箱已存在");
				$("#resultEmail").css("color","red");
				flag=false;
			}
		},
		error:function(){
			alert('请求数据失败。。。');
		}
	});
	return flag;
} */
//验证邮箱
function chkEmail(){
	//获取邮箱
	var email=$("#email").val();
	//定义匹配邮箱的 正则表达式
	var reg=new RegExp(CHKEMAIL);
	if(reg.test(email)){//正确
		if(chkExistEmail(email)){
			return true;
		}else{
			return false;
		}
	}else{
		$("#resultEmail").html("邮箱格式: xxxxxx@xxx.com(.cn)");
	    $("#resultEmail").css("color","red");
	    $("#email").val("");
        return false;
	}
}
/* //验证邮箱
function chkEmail(){
	//获取邮箱
	var emEle=document.getElementById("email");
	var email=emEle.value;
	//定义匹配邮箱的正则表达式
	var reg=new RegExp(CHKEMAIL);
	//获取邮箱是否输入成功的元素对象
	var spanEle=document.getElementById("resultEmail");
	if(reg.test(email)){//表示输入正确
		spanEle.innerHTML="✔";
	    spanEle.style.color="green";
	    return true;
	}else{//输入失败
		spanEle.innerHTML="邮箱格式: xxxxxx@xxx.com(.cn)";
	    spanEle.style.color="red";
	    //清空文本框
	    emEle.value="";
	    return false;
	}
} */
</script>
</head>
<body>
<!-- 获得应用的绝对路径 -->
<input type="hidden" id="path" value="${pageContext.request.contextPath}">
<div class="box-positon">
	<div class="rpos">当前位置:用户管理-添加</div>
	<form class="ropt">
		<input type="submit" onclick="this.form.action='userlist.do';" value="返回列表" class="return-button"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box" style="float:right">
	<form id="jvForm" action="add.do" method="post" enctype="multipart/form-data">
		<table cellspacing="1" cellpadding="2" width="100%" border="0" class="pn-ftable">
			<tbody>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired"></span>
						<span class="pn-frequired">${msg}</span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
					用户名</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="loginname" id="loginname" maxlength="100"
						 onblur="chkloginname()"/>
					    <span id="resultName"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						密码:</td><td width="80%" class="pn-fcontent">
						<input type="password" class="required" name="password" 
						id="password" maxlength="100" onblur="chkpassword()"/>
					    <span id="resultPwd"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						确认密码:</td><td width="80%" class="pn-fcontent">
						<input type="password" class="required" name="repwd" 
						id="repwd" maxlength="100" onblur="chkRePwd()"/>
						<span id="resultRePwd">${pwdMsg }</span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						<span class="pn-frequired">*</span>
						真实姓名:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="realname" 
						id="realname" maxlength="100" onblur="chkReNm()"/>
					    <span id="resultReNm"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						性别:</td><td width="80%" class="pn-fcontent">
						<input type="radio" name="sex" value="男" checked="checked"/>男
						<input type="radio" name="sex" value="女"/>女
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						出生日期:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="Wdate" name="birthday" maxlength="80"
						onclick="WdatePicker()"/>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						部门:</td><td width="80%" class="pn-fcontent">
						<select id="dep1"name="dep1">
							<c:forEach items="${DLIST}" var="dep1">
								<option value="${dep1.id}" name="id">${dep1.name}</option>
							</c:forEach>
					</select>
						<select id="dep2"name="dept.id">
							<c:forEach items="${DLIST2}" var="dep2">
								<option value="${dep2.id}" name="id">${dep2.name}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						邮箱:</td><td width="80%" class="pn-fcontent">
						<input type="text" class="required" name="email" 
						id="email" maxlength="80" onblur="chkEmail()"/>
					    <sapn id="resultEmail"></sapn>
					</td>
				</tr>
					<tr>
					<td width="20%" class="pn-flabel pn-flabel-h">
						头像:</td><td width="80%" class="pn-fcontent">
						<input type="file" name="file" onchange="upload()"> 
						<img id="img" width="150px" height="150px">
						<input type="hidden" name="picurl" id="picurl">
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
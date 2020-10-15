<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登陆 </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginT.css">
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
</head>
<body id="login">
<div class="login">
    <h2>后台登录</h2>
    <form class="layui-form" method="post" action="${pageContext.request.contextPath}/admin/login">
        <div class="layui-form-item">
            <input type="text" name="username" placeholder="用户名"   class="layui-input">
            <i class="layui-icon input-icon">&#xe66f;</i>
        </div>
        <div class="layui-form-item">
            <input type="password" name="password" placeholder="密码"   class="layui-input">
            <i class="layui-icon input-icon">&#xe673;</i>
        </div>

        <div class="layui-form-item">
            <button style="width: 100%" class="layui-btn" lay-submit lay-filter="login">立即登录</button>
        </div>
    </form>
</div>
            <input type="hidden" id="msg" value="${msg}">
            <script type="text/javascript">
		$(document).ready(function(){
		        //jQuery代码
		       var msg = $("#msg").val();
		       if(!isEmpty(msg)){
		             alert(msg);
		       }
		});
		function isEmpty(value){
		    if(value == null || value == "" || value == "undefined" || value ==  undefined || value == "null"){
		        return true;
		    }
		    else{
		        value = value.replace(/\s/g,"");
		        if(value == ""){
		            return true;
		        }
		        return false;
		    }
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 注册页面 -->
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
		<title>注册界面</title>   
	</head>
	<body>
		<div class="container-fluid" id="sp-main">
			<div class="row align-items-center">  
				<!-- 注册框 -->
				<div class="offset-1 col-xs-10 offset-sm-2 col-sm-8 offset-md-3 col-md-6 offset-lg-4 col-lg-4 rounded-lg" id="sp-register">
					<div class="text-center mt-3">
						<h2><strong>注册账号</strong></h2>
						<img src="${pageContext.request.contextPath}/img/star.png" />
					</div>
					<form action="${pageContext.request.contextPath}/user/register" method="post">
						<!-- 用户名 -->
						<div class="input-group mb-2 mt-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">手&nbsp;&nbsp;机&nbsp;&nbsp;号</span>
							</div>
							<input type="text" name="tel" id="username" class="form-control" placeholder="username" aria-label="username" aria-describedby="basic-addon1">
						</div>
						<p></p>
						<!-- 密码 -->
						<div class="input-group mb-3 mt-1">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon2">&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;</span>
							</div>
							<input id="password" name="password" type="password" class="form-control" placeholder="password" aria-label="password" aria-describedby="basic-addon1">
						</div>	
						<div class="input-group mb-2 mt-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon3">真实姓名</span>
							</div>
							<input type="text" id="name" name="name" class="form-control" placeholder="name" aria-label="name" aria-describedby="basic-addon1"  data-placement="right" title="请输入真实姓名">
						</div>
						<p></p>
						<!-- 头像 -->
						<!-- 按钮 -->
						<div class="row justify-content-between mt-4 no-gutters" id="botton-class">
						    <div class="col-5  text-danger" id="mess">
      							${msg}
    						</div>
							<div class="col-2.5">
								<button type="submit" class="btn btn-primary">注册</button>
							</div>
						</div>
					</form>
					<!-- 底部两个超链接 -->
					<div id="sp-useradmin">
						<div class="row justify-content-end no-gutters"><a href="${pageContext.request.contextPath}/login.jsp">返回登陆界面</a></div>
					</div>
				</div>
			</div>
		</div>
	</body>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>   
    <script>
    	$('#name').tooltip();
  	</script> 
</html>

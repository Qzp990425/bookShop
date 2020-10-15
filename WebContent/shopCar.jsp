<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html  lang="zh-cn">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myCart.css">
	<title>购物车</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
	<!-- 头部 -->					
		<div id="sp-header-top">
			<!-- 最上部分 -->
			<div class="container">
				<div class="top-bar clearfix">
					<ul>
						<li class="active">
							<a href="${pageContext.request.contextPath}/user/welcome.jsp">  <!-- 这里显示个人信息  同时超链接到个人信息界面-->
								${user.name}
							</a>
						</li>   
					</ul>
				</div>
			</div>	
		</div>
		<!-- 中间部分横线 -->
		<div id="sp-herder-mid"></div>
		<!-- 下半部分 -->
		<div id="sp-header-foot">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="navbar-brand" href="${pageContext.request.contextPath}/book/getBookOnSale">   <!--连接到主页-->
						<img src="${pageContext.request.contextPath}/img/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">
							<span class="text-primary">那么多书</span>
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sp-list" aria-controls="sp-list" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="sp-list">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active">
								<a class="nav-link mr-1" href="${pageContext.request.contextPath}/book/getBookOnSale">主页<span class="sr-only">(current)</span></a>   <!--连接到主页-->
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath}/book/getBookOnSaleByType?type=0">育儿书</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath}/book/getBookOnSaleByType?type=1">散文书</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath}/book/getBookOnSaleByType?type=2">工具书</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath}/book/getBookOnSaleByType?type=3">专业书</a>
							</li>
						</ul>	
					</div>
					<form action="${pageContext.request.contextPath}/book/getBookByName" method="post" class="form-inline my-2 my-lg-0 d-none d-sm-none d-md-none d-lg-flex">
						<div class="input-group">
							<input name="name" type="text" class="form-control" placeholder="输入你想查找的书籍" aria-label="输入你想查找的书籍" aria-describedby="basic-addon2">
							<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit">查找</button>
							</div>
						</div>
						<a class="active-icon c1" href="${pageContext.request.contextPath}/shopCar/getShopCar"></a> <!--连接到购物车-->
					</form>
				</nav>
			</div>
		</div>
		
		<!-- 购物清单 -->
		<div class="container">
			 <div class="table-responsive m-t">
			 	<form id="cartform" action="${pageContext.request.contextPath}/orderRecord/insertOrder" method="post">
					<table class="table invoice-table">
						<thead>
							<tr>
								<th>商品</th>
								<th>类型</th>
								<th>购买数量</th>
								<th>单价</th>
								<th>总价</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="shopCar" items="${shopCars}">
							<tr>
								<td>
									<div>
										<img src="${pageContext.request.contextPath}/bookImg/${shopCar.book.uuid}.jpg" style="width:100px"><strong>${shopCar.book.name}</strong>
									</div>
								</td>
								<td style="padding-top:45px;">
									<strong>
										<c:if test="${shopCar.book.type==0}">育儿书</c:if>
										<c:if test="${shopCar.book.type==1}">散文书</c:if>
										<c:if test="${shopCar.book.type==2}">工具书</c:if>
										<c:if test="${shopCar.book.type==3}">专业书</c:if>
									</strong>
								</td>
									
								<td style="padding-top:45px;">
									<input type="number" name="number" class="form-control buynum"  aria-label="buynumber" aria-describedby="basic-addon1" style="width:100px;" value="${shopCar.number}">
								</td>
								
								<td style="padding-top:45px;">${shopCar.book.price}</td>
								<td style="padding-top:45px;">${shopCar.book.price*shopCar.number}</td>								
								<td style="padding-top:45px;"><a class="btn btn-primary" href='${pageContext.request.contextPath}/shopCar/deleteById?sid=${shopCar.sid}'>删除商品</a></td>
							</tr>
							<input type="hidden" value="${shopCar.bid}" name="bid">
							<input type="hidden" value="${shopCar.sid}" name="sid">
							</c:forEach>
							<tr>
								<td></td><td></td><td></td><td></td>
								<td>
									
								</td>
								<td><button class="btn btn-primary pay" name="operator" type="submit" value="submit">付款</button></td>
							</tr>										
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<!-- 底部 -->
		<footer id="sp-footer" style="position:absolute;bottom:0px;">
			<div class="text text-center p-4 text-primary">
				<p>制作于2020/9/10的一个神奇网页</p>
				<p>Copyright © 2015.Company name All rights reserved.</p>
			</div>
		</footer>
        <input type="hidden" id="msg" value="${msg}">
</body>
	<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/myCart.js" ></script> 
    <script>
    	$(".buynum").change(function(){
    		var number = $(this).val();
    		var price = $(this).parent().next().text();
    		$(this).parent().next().next().text(number*1*price*1);
    	})
    </script>
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
</html>
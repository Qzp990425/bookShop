<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- 具体书籍 -->
<html  lang="zh-cn">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/book.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<title>书</title>
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
		
		<!-- 书的详情 -->
		<div class="book">
			<!-- 得到刚才查询的书籍 -->
			<form action="${pageContext.request.contextPath}/shopCar/addBook" method="post">
			<div class="container">
				<div class="media">
					
					<img class="mr-3" src="${pageContext.request.contextPath}/bookImg/${book.uuid}.jpg" alt="Generic placeholder image" style="width:200px;height:200px;">
					<div class="media-body">
						<h5 class="mt-0 mr-1">书名：${book.name}</h5>
						<h5 class="mt-0 mr-1">单价：${book.price}元</h5>
						<h5 class="mt-0 mr-1">类型：
							<c:if test="${book.type==0}">育儿书</c:if>
							<c:if test="${book.type==1}">散文书</c:if>
							<c:if test="${book.type==2}">工具书</c:if>
							<c:if test="${book.type==3}">专业书</c:if>
						</h5>
						<h6 class="mt-0 mr-1">简介：
							${book.introduction}
						</h6>
						<div class="input-group mb-2 mt-4" style="width:200px;">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">购买数量</span>
							</div>
							<input type="number" name="number"  class="form-control" style="width:100px;">
						</div>
						<input type="hidden" value="${book.bid}" name="bid">
						<input type="submit" class="btn btn-primary mb-2" value="加入购物车">
					</div>
					
				</div>
			</div>
			</form>
		</div>
		
		<!-- 交流专区 -->
		<section id="sp-saleBook">
			<!-- 标题 -->
			<div class="container">
			书籍评论:
				<c:forEach var="talk" items="${talks}">
				<div class="card">
			  		<div class="card-header">
			    		用户名:${talk.user.name}
			 	 	</div>
				  	<div class="card-body">
					    <blockquote class="blockquote mb-0">
					      <p>${talk.content}</p>
					      <footer class="blockquote-footer"><cite title="Source Title">发表时间:${talk.sendTime}</cite>
					      	<c:if test="${talk.uid==user.uid}">
					      		<a href="${pageContext.request.contextPath}/talk/deleteTalk?tid=${talk.tid}&bid=${book.bid}">删除</a>
					      	</c:if>
					      </footer>
					    </blockquote>
				 	 </div>
				</div>
				</c:forEach>
				<c:if test="${empty talks}">
				<div class="card">
			  		<div class="card-header">
			    	暂无评论
			 	 	</div>
				</div>
				</c:if>
				<div class="card text-center">
				  <div class="card-header">
				    发表评论
				  </div>
				  <form action="${pageContext.request.contextPath}/talk/insertTalk" method="post">
				  <div class="card-body">
				  	<input type="hidden" value="${user.uid}" name="uid">
				  	<input type="hidden" value="${book.bid}" name="bid">
				   <textarea rows="5" cols="130" name="content"></textarea>
				   
				  </div>
				  <div class="card-footer text-muted">
				    <input type="submit" class="btn btn-primary" value="发布评论">
				  </div>
				  </form>
				</div>
			</div>
		</section>
		
		<!-- 底部 -->
		<footer id="sp-footer">
			<div class="text text-center p-4 text-primary">
				<p>制作于2020/9/10的一个神奇网页</p>
				<p>Copyright © 2015.Company name All rights reserved.</p>
			</div>
		</footer>
		 <input type="hidden" id="msg" value="${msg}">
	</body>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src=".${pageContext.request.contextPath}/js/bootstrap.min.js" ></script> 
               
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
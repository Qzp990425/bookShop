<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html  lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Hall.css">
	<title>商城</title>   
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
		<!-- 轮播图 显示热门商品 -->
		<section id="sp_carousel" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
				<li data-target="#sp_carousel" data-slide-to="0" class="active"></li>
				<li data-target="#sp_carousel" data-slide-to="1"></li>
				<li data-target="#sp_carousel" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner">
				<div class="carousel-item active" data-sm-img="${pageContext.request.contextPath}/img/sm-1.jpg" data-lg-img="${pageContext.request.contextPath}/img/bg-1.jpg"></div>
				<div class="carousel-item" data-sm-img="${pageContext.request.contextPath}/img/sm-2.jpg" data-lg-img="${pageContext.request.contextPath}/img/bg-2.jpg"></div>
				<div class="carousel-item" data-sm-img="${pageContext.request.contextPath}/img/sm-3.jpg" data-lg-img="${pageContext.request.contextPath}/img/bg-3.jpg"></div>
			  </div>
			  <a class="carousel-control-prev" href="#sp_carousel" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#sp_carousel" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			  </a>
		</section>
		
		<!-- 正常书籍专区 -->
		<section id="sp-normalBook">
			<!-- 标题 -->
			<div class="text-center mt-3 mb-3">
				<h2><strong>售卖专区</strong></h2>
				<img src="${pageContext.request.contextPath}/img/star.png" />
			</div>
			<div class="container">
				<div class="row">
					<c:forEach items="${pageInfo.list}" var="book">
					<div class="col-xs-12 col-sm-6 col-lg-3">
						<div class="card align-items-center  bg-light p-2" >
							<div class="mb-1">
								<img src="${pageContext.request.contextPath}/bookImg/${book.uuid}.jpg" alt="" class="card-img-top media-boject rounded img-thumbnail" />		
							</div>
							<div class="card-body" style="padding:10px;">
								<h5 class="card-title text-center">${book.name}</h5>
								<p class="card-text text-center">${book.price}元</p>
								<a href="${pageContext.request.contextPath}/shopCar/addBookIndex?bid=${book.bid}&number=1" class="btn btn-primary">加入购物车</a>
								<a href="${pageContext.request.contextPath}/book/getBookByBId?bid=${book.bid}" class="btn btn-primary">查看详情</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<div class="row" style="text-align:center;">
					<div class="col-lg-12" >
						<c:if test="${type!=null}">
							<a href="${pageContext.request.contextPath}/book/getBookOnSaleByType?pageNum=${pageInfo.prePage}&type=${type}">上一页</a>
							<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
								<a href="${pageContext.request.contextPath}/book/getBookOnSaleByType?pageNum=${pageNum.index}&type=${type}">${pageNum.index}</a>
							</c:forEach>
							<a href="${pageContext.request.contextPath}/book/getBookOnSaleByType?pageNum=${pageInfo.nextPage}&type=${type}">下一页</a>
						</c:if>
						<c:if test="${type==null&&name==null}">
							<a href="${pageContext.request.contextPath}/book/getBookOnSale?pageNum=${pageInfo.prePage}">上一页</a>
							<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
								<a href="${pageContext.request.contextPath}/book/getBookOnSale?pageNum=${pageNum.index}">${pageNum.index}</a>
							</c:forEach>
							<a href="${pageContext.request.contextPath}/book/getBookOnSale?pageNum=${pageInfo.nextPage}">下一页</a>
						</c:if>
						<c:if test="${type==null&&name!=null}">
							<a href="${pageContext.request.contextPath}/book/getBookByName?pageNum=${pageInfo.prePage}&name=${name}">上一页</a>
							<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
								<a href="${pageContext.request.contextPath}/book/getBookByName?pageNum=${pageNum.index}&name=${name}">${pageNum.index}</a>
							</c:forEach>
							<a href="${pageContext.request.contextPath}/book/getBookByName?pageNum=${pageInfo.nextPage}&name=${name}">下一页</a>
						</c:if>
					</div>
				</div>
			</div>
		</section>
		<!-- 其他购物网站 -->
	</body>
	
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
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/Hall.js"></script>

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
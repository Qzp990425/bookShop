<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<% String path = request.getContextPath();%>
	<meta charset="UTF-8">
	<title>管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/swiper.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>


</head>
<body>
    
    <!-- 中部开始 -->
    <div class="wrapper">
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
          <div id="side-nav">
            <ul id="nav">
                <li class="list" current>
                    <a href="main_right.jsp" target="right">
                        <i class="iconfont">&#xe761;</i>
                        欢迎页面
                        <i class="iconfont nav_right">></i>
                    </a>
                </li>
                <li class="list" >
                    <a href="javascript:;">
                        <i class="iconfont">&#xe6a3;</i>
                        订单管理
                        <i class="iconfont nav_right">></i>
                    </a>
                    <ul class="sub-menu" style="display:none">
						<li>
                            <a href="${pageContext.request.contextPath}/orderRecord/getOrderByType?status=0" target="right">
                                <i class="iconfont">&#xe6a7;</i>
                 				 待发货订单
                            </a>
                        </li>

						<li>
                            <a href="${pageContext.request.contextPath}/orderRecord/getOrderByType?status=1" target="right">
                                <i class="iconfont">&#xe6a7;</i>
                              	 等待签收订单
                            </a>
                        </li>

						<li>
                            <a href="${pageContext.request.contextPath}/orderRecord/getOrderByType?status=2" target="right">
                                <i class="iconfont">&#xe6a7;</i>
                                                               已完成订单
                            </a>
                        </li>						
                    </ul>
                </li>                
                <li class="list" >
                    <a href="javascript:;">
                        <i class="iconfont">&#xe6a3;</i>
                        商品管理
                        <i class="iconfont nav_right">></i>
                    </a>
                    <ul class="sub-menu" style="display:none">	
						<li>
                            <a href="${pageContext.request.contextPath}/admin/book_add.jsp" target="right">
                                <i class="iconfont">&#xe6a7;</i>
                                添加书籍
                            </a>
                        </li>
						
                    </ul>
                </li>

                
                <li class="list" >
                    <a href="javascript:;">
                        <i class="iconfont">&#xe6a3;</i>
                       书籍类型
                        <i class="iconfont nav_right">></i>
                    </a>
                    <ul class="sub-menu" style="display:none">
                        <li>
                            <a target="right" href="${pageContext.request.contextPath}/book/getAllBookByType?type=0">
                                <i class="iconfont">&#xe6a7;</i>
                              育儿书
                            </a>
                        </li>
						<li>
                            <a target="right" href="${pageContext.request.contextPath}/book/getAllBookByType?type=1">
                                <i class="iconfont">&#xe6a7;</i>
                 散文书
                            </a>
                        </li>
						<li>
                            <a target="right"  href="${pageContext.request.contextPath}/book/getAllBookByType?type=2">
                                <i class="iconfont">&#xe6a7;</i>
                              工具书
                            </a>
                        </li>
                        						<li>
                            <a target="right"  href="${pageContext.request.contextPath}/book/getAllBookByType?type=3">
                                <i class="iconfont">&#xe6a7;</i>
                           专业书
                            </a>
                        </li>
                   </ul>			
                </li>
				               <li class="list" >
                    <a href="javascript:;">
                        <i class="iconfont">&#xe6a3;</i>
                        日志查询
                        <i class="iconfont nav_right">></i>
                    </a>
                    <ul class="sub-menu" style="display:none">
                        <li>
                            <a href="${pageContext.request.contextPath}/logRecord/getAllLog" target="right">
                                <i class="iconfont">&#xe6a7;</i>
                                查看日志
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
          </div>
        </div>
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
			<iframe src="${pageContext.request.contextPath}/admin/main_right.jsp" scrolling="no" width="100%" height="800px" name="right" border="none" frameborder="no"></iframe>
        </div>  
        <!-- 右侧主体结束 -->
    </div>
    <!-- 中部结束 -->

   
</body>
</html>
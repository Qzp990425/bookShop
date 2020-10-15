<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
	<% String path = request.getContextPath();%>
    <meta charset="UTF-8">
    <title>日志查询</title>
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
    <div class="wrapper" style="width:1250px;height:800px;margin-left:-10px;margin-top:-20px">
        
        <!-- 右侧主体开始 -->
        <div class="page-content">
          <div class="content">
            
            <xblock><button class="layui-btn layui-btn-danger" onclick="recoverAll()">日志信息</button></xblock>
            <table class="layui-table" style="text-align:center">
                 <thead>
                    <tr>
                      <th style="text-align:center">日志id</th>
                      <th style="text-align:center">日志内容</th>
                      <th style="text-align:center">创建时间</th>
                    </tr>
                </thead>
                         
                <tbody>
                	<c:forEach var="log" items="${pageInfo.list}">
                      <tr>
	           			  <td>${log.id}</td>
	                      <td>${log.content}</td>
	                      <td>${log.createTime}</td>
                      </tr>
                    </c:forEach>
                      <tr>
                      	<td colspan="3" style="text-align:center">
                      		<a href="${pageContext.request.contextPath}/logRecord/getAllLog?pageNum=${pageInfo.prePage}&type=${type}">上一页</a>
							<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
								<a href="${pageContext.request.contextPath}/logRecord/getAllLog?pageNum=${pageNum.index}&type=${type}">${pageNum.index}</a>
							</c:forEach>
							<a href="${pageContext.request.contextPath}/logRecord/getAllLog?pageNum=${pageInfo.nextPage}&type=${type}">下一页</a>                    		
                      	</td>
                      </tr>
                      
                  </tbody>
            </table>
            <!-- 右侧内容框架，更改从这里结束 -->
          </div>
        </div>
        <!-- 右侧主体结束 -->
    </div>
    <!-- 中部结束 -->
    
    <!-- 页面动态效果 -->

        
        
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
	<% String path = request.getContextPath();%>
    <meta charset="UTF-8">
    <title>订单列表</title>
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
    <div class="wrapper" style="width:1250px;height:800px;margin-left:-10px;margin-top:-20px">
        
        <!-- 右侧主体开始 -->
        <div class="page-content">
          <div class="content">
            
            <xblock><button class="layui-btn layui-btn-danger" onclick="recoverAll()">订单列表</button></xblock>
            <table class="layui-table" style="text-align:center">
                <thead>
                    <tr>
                      <th style="text-align:center">订单uuid</th>
                      <th style="text-align:center">商品图片</th>
                      <th style="text-align:center">商品名称</th>
					  <th style="text-align:center">购买数量</th>
					  <th style="text-align:center">商品单价</th>
					  <th style="text-align:center">订单创建时间</th>
					  <th style="text-align:center">订单发送时间</th>
					  <th style="text-align:center">订单完成时间</th>
					  <th style="text-align:center">收货人Id</th>
                      <th style="text-align:center;">操作</th>
                    </tr>
                </thead>
                         
                <tbody>
                 	<c:forEach items="${pageInfo.list}" var="orderRecord">
                    <tr style = "height : 120px">
                      	  <td>${orderRecord.uuid}</td>
	                      <td><img src="${pageContext.request.contextPath}/bookImg/${orderRecord.book.uuid}.jpg" style="width:100px;"></img></td>
	                      <td>${orderRecord.book.name}</td>
	                      <td>${orderRecord.number}</td>
	                      <td>${orderRecord.book.price}</td>
						  <td>${orderRecord.createTime}</td>
						  <td>${orderRecord.sendTime}</td>
						  <td>${orderRecord.doneTime}</td>
						  <td>${orderRecord.buyId}</td>
	                      <td class="text-center">
	                        <div class="layui-btn-group">
	                          <c:if test="${orderRecord.status==0}">
	                          <a href="${pageContext.request.contextPath}/orderRecord/sendOrder?oid=${orderRecord.oid}" class="layui-btn layui-btn-xs layui-btn-danger">
	                            	发送订单
	                          </a>
	                          </c:if>
	                        </div>
	                      </td>          
                    </tr>
                    </c:forEach>
                    <tr><td colspan="9">
                   		<a href="${pageContext.request.contextPath}/orderRecord/getOrderByType?pageNum=${pageInfo.prePage}&status=${status}">上一页</a>
						<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
							<a href="${pageContext.request.contextPath}/orderRecord/getOrderByType?pageNum=${pageNum.index}&status=${status}">${pageNum.index}</a>
						</c:forEach>
						<a href="${pageContext.request.contextPath}/orderRecord/getOrderByType?pageNum=${pageInfo.nextPage}&status=${status}">下一页</a>
					</td></tr>
                </tbody>
            </table>
            <!-- 右侧内容框架，更改从这里结束 -->
          </div>
        </div>
        <!-- 右侧主体结束 -->
    </div>
    <!-- 中部结束 -->
    
    <!-- 页面动态效果 -->
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
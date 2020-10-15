<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
	<% String path = request.getContextPath();%>
    <meta charset="UTF-8">
    <title>商品查看</title>
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
            
            <xblock><button class="layui-btn layui-btn-danger" onclick="recoverAll()">书籍类型查询</button></xblock>
            <table class="layui-table" style="text-align:center">
                <thead >
                	<tr>
                      <th style="text-align:center;">uuid</th>
                      <th style="text-align:center;">书籍名称</th>
                      <th style="text-align:center;">书籍图片</th>
					  <th style="text-align:center;">书籍单价</th>
					  <th style="text-align:center;">书籍类型</th>
					  <th style="text-align:center;">在售情况</th>
                      <th style="text-align:center;">操作</th>
                 	</tr>
                </thead>
                         
                <tbody>
                	<c:forEach var="book" items="${pageInfo.list}">
                      <tr style="height:120px;">
	           			  <td>${book.uuid}</td>
	           			  <td>${book.name}</td>
	                      <td><img src="${pageContext.request.contextPath}/bookImg/${book.uuid}.jpg" style="width:100px;"></td>                      
	                      <td>${book.price}</td>
						  <td>
						  	<c:if test="${book.type==0}">育儿书</c:if>		
						  	<c:if test="${book.type==1}">散文书</c:if>
						  	<c:if test="${book.type==2}">工具书</c:if>
						  	<c:if test="${book.type==3}">专业书</c:if>		  
						  </td>		
						  <td class="text-center">
	                        <div class="layui-btn-group">
	                        	<c:if test="${book.status==0}">
	                         		在售
	                          </c:if>
	                        	<c:if test="${book.status==1}">
	                          售空
	                          </c:if>
	                        </div>
	                      </td>			
	                      <td class="text-center">
	                        <div class="layui-btn-group">
	                        	<c:if test="${book.status==0}">
	                          <a href="${pageContext.request.contextPath}/book/putBook?bid=${book.bid}" class="layui-btn layui-btn-xs layui-btn-danger">下架</a>
	                          </c:if>
	                        	<c:if test="${book.status==1}">
	                          <a href="${pageContext.request.contextPath}/book/pushBook?bid=${book.bid}" class="layui-btn layui-btn-xs layui-btn-danger">上架</a>
	                          </c:if>
	                        </div>
	                      </td>
                      </tr>
                      </c:forEach>
                      <tr>
                      	<td colspan="7" style="text-align:center">
							<a href="${pageContext.request.contextPath}/book/getAllBookByType?pageNum=${pageInfo.prePage}&type=${type}">上一页</a>
							<c:forEach begin="1" end="${pageInfo.pages}" varStatus="pageNum">
								<a href="${pageContext.request.contextPath}/book/getAllBookByType?pageNum=${pageNum.index}&type=${type}">${pageNum.index}</a>
							</c:forEach>
							<a href="${pageContext.request.contextPath}/book/getAllBookByType?pageNum=${pageInfo.nextPage}&type=${type}">下一页</a>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<div class="leftpanel">
	<%@include file="/templates/public/inc/left_bar.jsp" %>  
</div>
<div class="rightpanel">
	<div class="rightbody">
		<h1 class="title">LỖI RỒI BẠN ƠI!</h1>
		<div>
			<a href="<%=request.getContextPath()%>/admin/" class="submit-green">Quay về trang chủ admin</a>
			<a href="<%=request.getContextPath()%>/" class="submit-green">Quay về trang chủ người dùng</a>
		</div>
	</div>
</div>
<%@include file="/templates/public/inc/footer.jsp" %>  		
			

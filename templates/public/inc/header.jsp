<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>VinaEnter EDU-public</title>
		<meta name="description" content="Thiet ke website, dao tap lap trinh">
		<meta name="keywords" content="hiet ke website, dao tap lap trinh">
		<link href="<%=request.getContextPath()%>/templates/public/css/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/jquery-3.2.1.min.js"></script>
	</head>
	<body>
		<div class="main">
			<div class="page">
				<div class="header">
					<div class="header-img">
						<img src="<%=request.getContextPath()%>/templates/public/images/header.jpg" alt="" width="800">
					</div>
					<div id='cssmenu'>
						<ul>
						   <li><a href='<%=request.getContextPath()%>/'><span>Trang chủ</span></a></li>
						   <li class='active has-sub'><a href='<%=request.getContextPath()%>/tin-tuc'><span>Tin tức</span></a>
						      <ul>
						         <li><a href='<%=request.getContextPath()%>/tin-tuc?type=1'><span>Tin hot nhất</span></a>
						            
						         </li>
						         <li><a href='<%=request.getContextPath()%>/tin-tuc?type=2'><span>Tin mới nhất</span></a>
						            
						         </li>
								  <li><a href='<%=request.getContextPath()%>/tin-tuc?type=3'><span>Tin cũ nhất</span></a>
						            
						         </li>
						      </ul>
						   </li>
						   <li class='active has-sub'><a href='<%=request.getContextPath()%>/public/news'><span>Tài khoản</span></a>
						      <ul>
						      	<%
						      		User objUser = (User)session.getAttribute("objUser");
						      		if(session.getAttribute("objUser") == null){
						      			
						      	%>
							         <li><a href='<%=request.getContextPath()%>/public/login'><span>Đăng nhập</span></a>
							            
							         </li>
							         <li><a href='<%=request.getContextPath()%>/public/news?type=2'><span>Đăng kí</span></a>
							            
							         </li>
						         <%}else{%>
						         	<li><a href='<%=request.getContextPath()%>/public/login'><span><%=objUser.getUfullname()%></span></a>
							         </li>
							         <li><a href='<%=request.getContextPath()%>/public/logout'><span>Log out</span></a>
							         </li>
						         <%}%>
						      </ul>
						   </li>
						    <li>
					         	<form action="<%=request.getContextPath()%>/tin-tuc" class="frm-search">
					         		<input class="btn-search" name="ten" type="text" value="" required="required" />
					         		<input class="btn-search" type="submit" name="timkiem" value="Tìm kiếm" />
					         	</form>
					         </li>
						</ul>
						</div>
				</div>
				<div class="content">
			
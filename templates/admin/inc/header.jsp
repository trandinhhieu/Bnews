<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>VinaEnter EDU - Admin template</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/admin/css/styles.css" media="screen" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/templates/admin/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/libraries/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/libraries/ckfinder/ckfinder.js"></script>
		<script type="text/javascript">
			$().ready(function() {
				// validate signup form on keyup and submit
				$(".form").validate({
					ignore: [],
					debug: false,
					rules: {
						tendanhmuc: {
							required: true,
							maxlength: 32
						},
						taikhoan: {
							required: true,
							minlength: 8,
							maxlength: 32
						},
						matkhau: {
							required: true,
							minlength: 6
						},
						tennguoidung: {
							required: true,
							maxlength: 32
						},
						tentin: {
							required: true,
							maxlength: 100
						},
						danhmuc: {
							required: true
						},
						mota: {
	                         required: function() 
	                        {
	                         CKEDITOR.instances.textarea1.updateElement();
	                        },
								required: true
						},
						chitiet: {
	                         required: function() 
	                        {
	                         CKEDITOR.instances.textarea1.updateElement();
	                        },
								required: true
						}
					},
					messages: {
						tendanhmuc: {
							required: "Vui lòng nhập tên danh mục",
							maxlength: "Bạn chỉ được nhập tối đa 32 kí tự"
						},
						taikhoan: {
							required: "Vui lòng nhập tài khoản",
							minlength: "Bạn phải nhập tối thiểu 8 kí tự",
							maxlength: "Bạn chỉ được nhập tối đa 32 kí tự"
						},
						matkhau: {
							required: "Vui lòng nhập mật khẩu",
							minlength: "Bạn phải nhập tối thiểu 6 kí tự"
						},
						tennguoidung: {
							required: "Vui lòng nhập tên người dùng",
							maxlength: "Bạn chỉ được nhập tối đa 32 kí tự"
						},
						tentin: {
							required: "Vui lòng nhập tên tin tức",
							maxlength: "Bạn chỉ được nhập tối đa 100 kí tự"
						},
						danhmuc: {
							required: "Vui lòng chọn danh mục"
						},
						mota: {
							required: "Vui lòng nhập mô tả"
						},
						chitiet: {
							required: "Vui lòng nhập chi tiết"
						}
					}
				});
			});
		</script>
	</head>
	<body>
    	<!-- Header -->
        <div id="header">
            <!-- Header. Status part -->
            <div id="header-status">
                <div class="container_12">
                    <div class="grid_4">
                    	<ul class="user-pro">
							
							<%
					    		if(session.getAttribute("obj") != null){
					    			User obj = (User)session.getAttribute("obj");
					    	%>
					    		<li><a href="<%=request.getContextPath()%>/auth/logout/">Logout</a></li>
								<li>Chào, <a href="<%=request.getContextPath()%>/auth/profile/"><%=obj.getUfullname()%></a></li>
							<%}%>
                    	</ul>
                    </div>
                </div>
                <div style="clear:both;"></div>
            </div> <!-- End #header-status -->
            
            <!-- Header. Main part -->
            <div id="header-main">
                <div class="container_12">
                    <div class="grid_12">
                        <div id="logo">
                            <ul id="nav">
                                <li id="current"><a href="<%=request.getContextPath()%>/admin/">Quản trị</a></li>
                                <li><a href="<%=request.getContextPath()%>/auth/profile/">Tài khoản</a></li>
                            </ul>
                        </div><!-- End. #Logo -->
                    </div><!-- End. .grid_12-->
                    <div style="clear: both;"></div>
                </div><!-- End. .container_12 -->
            </div> <!-- End #header-main -->
            <div style="clear: both;"></div>
            <!-- Sub navigation -->
            <div id="subnav">
                <div class="container_12">
                    <div class="grid_12">
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/admin/news/">Tin tức</a></li>
                            <li><a href="<%=request.getContextPath()%>/admin/cat/">Danh mục</a></li>
                            <li><a href="<%=request.getContextPath()%>/admin/user/">Người dùng</a></li>
                        </ul>
                        
                    </div><!-- End. .grid_12-->
                </div><!-- End. .container_12 -->
                <div style="clear: both;"></div>
            </div> <!-- End #subnav -->
        </div> <!-- End #header -->
        
		<div class="container_12">
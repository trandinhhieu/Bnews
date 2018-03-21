<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Sửa người dùng</span></h2>
		 
			
		 <div class="module-body">
		 	<%
		 		if(request.getAttribute("objUser") != null){
		 			User objUser = (User)request.getAttribute("objUser");
		 			User obj = (User)session.getAttribute("obj");
		 	%>
				<form action="<%=request.getContextPath()%>/admin/user/edit?uid=<%=objUser.getUid()%>" enctype="multipart/form-data" method="post">
					<p>
						<label>Tài khoản: </label>
						<input type="text" name="taikhoan" value="<%=objUser.getUname()%>" class="input-medium" readonly="readonly" />
					</p>
					<p>
						<label>Mật khẩu: </label>
						<input type="password" name="matkhau" value="" class="input-medium" />
					</p>
					<p>
						<label>Tên người dùng: </label>
						<input type="text" name="tennguoidung" value="<%=objUser.getUfullname()%>" class="input-medium" />
					</p>
					<p>
						<label>Hình ảnh</label>
						<input type="file"  name="hinhanh" value="" /><br />
						<%
							if(!"".equals(objUser.getAvatar())){
						%>
							<img style="width: 200px; height: 200px" alt="<%=objUser.getAvatar()%>" src="<%=request.getContextPath()%>/files/objUser.getAvatar()">
						<%}%>
					</p>
					<fieldset>
						
							<input class="submit-green" name="sua" type="submit" value="Sửa" onclick="return confirm('Bạn có muốn sửa hay không?')" />
							<input class="submit-gray" name="reset" type="reset" value="Nhập lại" /> 
						
						
					</fieldset>
				</form>
			<%}%>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 
<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Tài khoản</span></h2>
		 
			
		 <div class="module-body">
		 	<%
		 		if(request.getAttribute("objUser") != null){
		 			User objUser = (User)request.getAttribute("objUser");
		 	%>
				<form>
					<p>
						<label>Tài khoản: </label>
						<input type="text" name="taikhoan" value="<%=objUser.getUname()%>" class="input-medium" readonly="readonly" />
					</p>
					<p>
						<label>Mật khẩu: </label>
						<input type="password" name="matkhau" value="<%=objUser.getUpass()%>" class="input-medium" readonly="readonly" />
					</p>
					<p>
						<label>Tên người dùng: </label>
						<input type="text" name="tennguoidung" value="<%=objUser.getUfullname()%>" class="input-medium" readonly="readonly" />
					</p>
					<fieldset>
						<a style="font-weight: bold;text-decoration: none;" href="<%=request.getContextPath()%>/admin/user/edit?uid=<%=objUser.getUid()%>" onclick="return confirm('Bạn có muốn sửa hay không?')">Sửa thông tin</a>
					</fieldset>
				</form>
			<%}%>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 
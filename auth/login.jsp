<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Đăng nhập</span></h2>
			
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/auth/login/" method="post">
				<p>
					<label>Tài khoản: </label>
					<input type="text" name="taikhoan" value="" class="input-medium" />
				</p>
				<p>
					<label>Mật khẩu: </label>
					<input type="password" name="matkhau" value="" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" name="dangnhap" type="submit" value="Đăng nhập" /> 
					<input class="submit-gray" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
			<%
				if(request.getParameter("msg") != null){
					int msg = Integer.parseInt(request.getParameter("msg"));
					if(msg == 0){%>
					<p class="error">Đăng nhập không thành công</p>
			<%}}%>
			
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 
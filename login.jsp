<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<div class="leftpanel">
	<%@include file="/templates/public/inc/left_bar.jsp" %>  
</div>
<div class="rightpanel">
	<div class="rightbody">
		<div class="module">
		 <h2><span>Đăng nhập</span></h2>
			
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/public/login" method="post">
				<p>
					<label>Tài khoản: </label>
					<input type="text" name="taikhoan" value="" class="input-medium" />
				</p>
				<p>
					<label>Mật khẩu: </label>
					<input type="password" name="matkhau" value="" class="input-medium" />
				</p>
				<br />
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
	</div>
</div>
<%@include file="/templates/public/inc/footer.jsp" %>  		
			

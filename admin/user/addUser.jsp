<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Thêm người dùng</span></h2>
		 
		 <%
			if(request.getParameter("msg") != null){
				int msg = Integer.parseInt(request.getParameter("msg"));
				switch(msg){
					case 0: out.print("Username đã tồn tại, vui lòng nhập tên khác !");
						break;
					default: out.print("Có lỗi trong quá trình xử lý");
						break;
				}
			}
		%>
			
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/user/add" enctype="multipart/form-data" method="post" class="form">
				<p>
					<label>Tài khoản: </label>
					<input type="text" name="taikhoan" value="" class="input-medium" />
					<label class="error" for="taikhoan"></label>
				</p>
				<p>
					<label>Mật khẩu: </label>
					<input type="password" name="matkhau" value="" class="input-medium" />
					<label class="error" for="matkhau"></label>
				</p>
				<p>
					<label>Tên người dùng: </label>
					<input type="text" name="tennguoidung" value="" class="input-medium" />
					<label class="error" for="tennguoidung"></label>
				</p>
				<p>
					<label>Ảnh đại diện</label>
					<input type="file"  name="avatar" value="" />
				</p>
				<fieldset>
					<input class="submit-green" name="them" type="submit" value="Thêm" /> 
					<input class="submit-gray" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 
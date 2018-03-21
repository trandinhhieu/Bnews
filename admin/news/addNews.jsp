<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Thêm tin tức</span></h2>
			
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/news/add" enctype="multipart/form-data" method="post" class="form">
				<p>
					<label>Tên tin</label>
					<input type="text" name="tentin" value="" class="input-medium" />
					<label class="error" for="tentin"></label>
				</p>
				<p>
					<label>Danh mục tin</label>
					<select  name="danhmuc" class="input-short">
						<%
							if(request.getAttribute("alCat") != null){
								@SuppressWarnings("unchecked")
								ArrayList<Category> alCat = (ArrayList<Category>)request.getAttribute("alCat");
								for(Category itemCat:alCat){
						%>
							<option value="<%=itemCat.getId_cat()%>"><%=itemCat.getName()%></option>
						<%}}%>
					</select>
					<label class="error" for="danhmuc"></label>
				</p>
				<p>
					<label>Hình ảnh</label>
					<input type="file"  name="hinhanh" value="" />
				</p>
				<p>
					<label>Mô tả</label>
					<textarea name="mota" class="editor" rows="7" cols="90" class="input-medium"></textarea>
					<label class="error" for="mota"></label>
				</p>
				<p>
					<label>Chi tiết</label>
					<textarea  name="chitiet" class="editor" rows="7" cols="90" class="input-long"></textarea>
					<label class="error" for="chitiet"></label>
				</p>
				<fieldset>
					<input class="submit-green" name="them" type="submit" value="Thêm" /> 
					<input class="submit-gray" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
			<script type="text/javascript">
				var mota = CKEDITOR.replace('mota');
				var chitiet = CKEDITOR.replace('chitiet');
				CKFinder.setupCKEditor(mota, '<%=request.getContextPath()%>/libraries/ckfinder/');
				CKFinder.setupCKEditor(chitiet, '<%=request.getContextPath()%>/libraries/ckfinder/');
			</script>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 
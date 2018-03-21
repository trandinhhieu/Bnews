<%@page import="model.bean.News"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Sửa tin tức</span></h2>
			<%
				if(request.getAttribute("objNews") != null){
					News objNews = (News)request.getAttribute("objNews");
			%>
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/news/edit?nid=<%=objNews.getId_news()%>" enctype="multipart/form-data" method="post" class="form">
				<p>
					<label>Tên tin</label>
					<input type="text" name="tentin" value="<%=objNews.getName()%>" class="input-medium" />
					<label class="error" for="tentin"></label>
				</p>
				<p>
					<label>Danh mục tin</label>
					<select  name="danhmuc" class="input-short">
						<%
							if(request.getAttribute("alCat") != null){
								@SuppressWarnings("unchecked")
								ArrayList<Category> listCat = (ArrayList<Category>)request.getAttribute("alCat");
								String selected = "";
								if(listCat.size() > 0){
									for(Category objCat: listCat){
										if(objCat.getId_cat() == objNews.getId_cat()){
											selected = "selected = 'selected'";
										}else{
											selected = "";
										}
						%>
							<option <%=selected %> value="<%=objCat.getId_cat()%>"><%=objCat.getName()%></option>
						<%}}}%>
					</select>
					<label class="error" for="danhmuc"></label>
				</p>
				<p>
					<label>Hình ảnh</label>
					<input type="file"  name="hinhanh" value="" /><br />
					<%
						if(!"".equals(objNews.getPicture())){
					%>
						<img style="width: 200px; height: 200px" alt="<%=objNews.getPicture()%>" src="<%=request.getContextPath()%>/files/<%=objNews.getPicture()%>">
					<%}%>
				</p>
				<p>
					<label>Mô tả</label>
					<textarea name="mota" class="editor" rows="7" cols="90" class="input-medium"><%=objNews.getPreview_text()%></textarea>
					<label class="error" for="mota"></label>
				</p>
				<p>
					<label>Chi tiết</label>
					<textarea  name="chitiet" class="editor" rows="7" cols="90" class="input-long"><%=objNews.getDetail_text()%></textarea>
					<label class="error" for="chitiet"></label>
				</p>
				<fieldset>
					<input class="submit-green" name="sua" type="submit" value="Sửa" /> 
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
		<%}%>
	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
	<div class="bottom-spacing">
		  <!-- Button -->
		  <div class="float-left">
			  <a href="<%=request.getContextPath()%>/admin/cat/add" class="button">
				<span>Thêm danh mục<img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="Thêm danh mục"></span>
			  </a>
		  </div>
		  <div class="clear"></div>
	</div>
	
	<%
		if(request.getParameter("msg") != null){
			int msg = Integer.parseInt(request.getParameter("msg"));
			switch(msg){
				case 1: out.print("<span class='error'>Thêm thành công</span><br />");
					break;
				case 2: out.print("<span class='error'>Sửa thành công</span><br />");
					break;
				case 3: out.print("<span class='error'>Xóa thành công</span><br />");
					break;
				default: out.print("<span class='error'>Có lỗi trong quá trình xử lý</span><br />");
					break;
			}
		}
	%>

	<div class="grid_12">
		<!-- Example table -->
		<div class="module">
			<h2><span>Danh sách danh mục</span></h2>
			
			<div class="module-table-body">
				<form action="">
				<table id="myTable" class="tablesorter">
					<thead>
						<tr>
							<th style="width:4%; text-align: center;">ID</th>
							<th>Tên danh mục</th>
							<th style="width:11%; text-align: center;">Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<%
							if(request.getAttribute("alCat") != null){
								@SuppressWarnings("unchecked")
								ArrayList<Category> alCat = (ArrayList<Category>)request.getAttribute("alCat");
								if(alCat.size() > 0){
									for(Category itemCat: alCat){
						%>
							<tr>
								<td class="align-center"><%=itemCat.getId_cat()%></td>
								<td><a href=""><%=itemCat.getName()%></a></td>
								<td align="center">
									<a href="<%=request.getContextPath()%>/admin/cat/edit?cid=<%=itemCat.getId_cat()%>">Sửa<img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
									<a href="<%=request.getContextPath()%>/admin/cat/del?cid=<%=itemCat.getId_cat()%>" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Xóa <img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
								</td>
							</tr>
						<%}}}%>
					</tbody>
				</table>
				</form>
			 </div> <!-- End .module-table-body -->
		</div> <!-- End .module -->
			 <div class="pagination">           
				<div class="numbers">
					<span>Trang:</span> 
					<%
						int numPage = (Integer) request.getAttribute("numPage");
						int currentPage = (Integer) request.getAttribute("currentPage");
						String active = "";
						for(int i = 1; i <= numPage; i++){
							if(currentPage == i){
								active = "class='current'";
							}else{
								active = "";
							}
					%>
					<a <%=active %> href="<%=request.getContextPath()%>/admin/cat/?page=<%=i%>"><%=i %></a>
					<%
						if(i != numPage){
					%> 
						<b>|</b>
					<%} %>
				<%}%>
				</div> 
				<div style="clear: both;"></div> 
			 </div>
		
	</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 
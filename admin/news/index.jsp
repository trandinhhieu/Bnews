<%@page import="model.bean.News"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
	<div class="bottom-spacing">
		  <!-- Button -->
		  <div class="float-left">
			  <a href="<%=request.getContextPath()%>/admin/news/add" class="button">
				<span>Thêm tin <img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="Thêm tin"></span>
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
			<h2><span>Danh sách tin</span></h2>
			
			<div class="module-table-body">
				<form action="">
				<table id="myTable" class="tablesorter">
					<thead>
						<tr>
							<th style="width:4%; text-align: center;">ID</th>
							<th>Tên</th>
							<th style="width:20%">Danh mục</th>
							<th style="width:16%; text-align: center;">Hình ảnh</th>
							<th style="width:11%; text-align: center;">Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<%
							if(request.getAttribute("alNews") != null){
								@SuppressWarnings("unchecked")
								ArrayList<News> alNews = (ArrayList<News>)request.getAttribute("alNews");
								if(alNews.size() > 0){
									for(News itemNews: alNews){
						%>
							<tr>
								<td class="align-center"><%=itemNews.getId_news()%></td>
								<td><a href=""><%=itemNews.getName()%></a></td>
								<td><%=itemNews.getCname()%></td>
								<td align="center"><img src="<%=request.getContextPath()%>/files/<%=itemNews.getPicture()%>" class="hoa" /></td>
								<td align="center">
									<a href="<%=request.getContextPath()%>/admin/news/edit?nid=<%=itemNews.getId_news()%>">Sửa <img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
									<a href="<%=request.getContextPath()%>/admin/news/del?nid=<%=itemNews.getId_news()%>" onclick="return confirm('Bạn có muốn xóa không?')">Xóa <img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
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
					<a <%=active %> href="<%=request.getContextPath()%>/admin/news/?page=<%=i%>"><%=i %></a>
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
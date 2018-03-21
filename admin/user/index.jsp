<%@page import="model.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
	<div class="bottom-spacing">
		  <!-- Button -->
		  <div class="float-left">
			  <a href="<%=request.getContextPath()%>/admin/user/add" class="button">
				<span>Thêm người dùng<img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="Thêm người dùng"></span>
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
					case 4: out.print("<span class='error'>Bạn không có quyền xóa admin</span><br />");
					break;
					case 5: out.print("<span class='error'>Bạn không có quyền sửa(xóa)</span><br />");
					break;
					default: out.print("<span class='error'>Có lỗi trong quá trình xử lý</span><br />");
						break;
				}
			}
		%>

	<div class="grid_12">
		<!-- Example table -->
		<div class="module">
			<h2><span>Danh sách người dùng</span></h2>
			
			<div class="module-table-body">
				<form action="">
				<table id="myTable" class="tablesorter">
					<thead>
						<tr>
							<th style="width:4%; text-align: center;">ID</th>
							<th style="width: 20%; text-align: center;">Tài khoản</th>
							<th style="width:20%">Tên người dùng</th>
							<th style="width:20%">Ảnh đại diện</th>
							<th style="width:11%; text-align: center;">Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<%
							User obj = new User();
							if(session.getAttribute("obj") != null){
								obj = (User)session.getAttribute("obj");
							}
							if(request.getAttribute("alUser") != null){
								@SuppressWarnings("unchecked")
								ArrayList<User> alUser = (ArrayList<User>)request.getAttribute("alUser");
								if(alUser.size() > 0){
									for(User objUser: alUser){
										// ^/nguoi-dung-([0-9]+).html
										String userSlug = request.getContextPath() + "/nguoi-dung-" + objUser.getUid() + ".html";
								
						%>
							<tr>
								<td class="align-center"><%=objUser.getUid()%></td>
								<td class="align-center"><a href=""><%=objUser.getUname()%></a></td>
								<td class="align-center"><%=objUser.getUfullname()%></td>
								<td align="center"><img src="<%=request.getContextPath()%>/files/<%=objUser.getAvatar()%>" class="ava-user" /></td>
								<td align="center">
									<%
										if(obj.getRole() > 0){
									%>
										<a href="<%=request.getContextPath()%>/admin/show-user/edit?uid=<%=objUser.getUid()%>">Sửa <img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
										<a href="<%=request.getContextPath()%>/admin/user/del?uid=<%=objUser.getUid()%>" onclick="return confirm('Bạn có muốn xóa hay không?')">Xóa <img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
									<%}else if(obj.getUid() == objUser.getUid()){%>
										<a href="<%=request.getContextPath()%>/admin/show-user/edit?uid=<%=objUser.getUid()%>">Sửa <img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
									<%}%>
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
					<a <%=active %> href="<%=request.getContextPath()%>/admin/user/?page=<%=i%>"><%=i %></a>
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
<%@page import="model.bean.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<div class="leftpanel">
	<%@include file="/templates/public/inc/left_bar.jsp" %>  
</div>
<div class="rightpanel">
	<div class="rightbody">
		<h1 class="title">Tin tức</h1>
		<div class="items-new">
			<ul>
				<%
					if(request.getAttribute("alNews") != null){
						@SuppressWarnings("unchecked")
						ArrayList<News> alNews = (ArrayList<News>)request.getAttribute("alNews");
						if(alNews.size() > 0){
							for(News objNews: alNews){
								// ^/(.+)-([0-9]+).html
								String url = request.getContextPath() + "/" + StringLibrary.makeSlug(objNews.getName()) + "-" + objNews.getId_news() + ".html";
				%>
					<li>
						<h2>
							<a href="<%=url%>" title="<%=objNews.getName()%>"><%=objNews.getName()%></a>
						</h2>
						<div class="item">
							<a href="<%=url%>" title="<%=objNews.getName()%>">
								<img src="<%=request.getContextPath()%>/files/<%=objNews.getPicture()%>" alt="<%=objNews.getPicture()%>" />
							</a>
							<p><%=objNews.getPreview_text()%></p>
							<span style="padding-top: 8px; color: blue;"><%=objNews.getView() %> lượt xem</span>
							<div class="clr"></div>
						</div>
					</li>
				<%}}} %>
			</ul>
			
			<div class="paginator">
				<%
					int numPage = (Integer) request.getAttribute("numPage");
					int currentPage = (Integer) request.getAttribute("currentPage");
					String active = "";
					for(int i = 1; i <= numPage; i++){
						String urlSlug = request.getContextPath() + "/news/page-" + i + ".html";
						if(currentPage == i){
							active = "class='active'";
						}else{
							active = "";
						}
				%>
					<a <%=active %> href="<%=request.getContextPath()%>/public/news?page=<%=i%>">Trang <%=i %></a>
					<%
						if(i != numPage){
					%> 
						||
					<%} %>
				<%}%>
			</div>
		</div>
	</div>
</div>
<div class="clr"></div>
<%@include file="/templates/public/inc/footer.jsp" %>  		
			

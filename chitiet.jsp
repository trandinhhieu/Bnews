<%@page import="model.bean.Reply"%>
<%@page import="model.dao.ReplyDao"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="model.bean.Comment"%>
<%@page import="model.bean.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/public/inc/header.jsp" %>
<div class="leftpanel">
	<%@include file="/templates/public/inc/left_bar.jsp" %>  
</div>

<div class="rightpanel">
	<div class="rightbody">
		<%
			News objNews = (News)request.getAttribute("objNews");
		%>
		<h1 class="title"><%=objNews.getName()%></h1>
		<div class="items-new">
			<div class="new-detail">
				<%=objNews.getDetail_text()%>
			</div>
		</div>
		
		<h2 class="title" style="margin-top:30px;color:#BBB">Tin tức liên quan</h2>
		<div class="items-new">
			<ul>
				<%
					if(request.getAttribute("alNews") != null){
						@SuppressWarnings("unchecked")
						ArrayList<News> alNews = (ArrayList<News>)request.getAttribute("alNews");
						if(alNews.size() > 0){
							for(News objN: alNews){
								if(objN.getId_news() != objNews.getId_news()){
				%>
					<li>
						<h2>
							<a href="<%=request.getContextPath()%>/public/detail?did=<%=objN.getId_news()%>" title="<%=objN.getName()%>"><%=objN.getName()%></a>
						</h2>
						<div class="item">
							<a href="<%=request.getContextPath()%>/public/detail?did=<%=objN.getId_news()%>" title="<%=objN.getName()%>"><img src="<%=request.getContextPath()%>/files/<%=objN.getPicture()%>" alt="<%=objN.getName()%>"></a>
							<p><%=objN.getPreview_text() %></p>
							<span style="padding-top: 8px; color: blue;"><%=objN.getView() %> lượt xem</span>
							<div class="clr"></div>
						</div>
					</li>
				<%}}}}%>
			</ul>
		</div>
		<form class="frm-cmt">
			<h2>Nhận xét</h2>
			<div class="cont-com">
				<%
					if(session.getAttribute("objUser") != null){
						User obj = (User)session.getAttribute("objUser");
				%>
					<img class="com-img" src="<%=request.getContextPath()%>/files/<%=objUser.getAvatar()%>" width="52" />
				<%}else{%>
					<img class="com-img" src="<%=request.getContextPath()%>/templates/public/images/avatar.png" width="52" />
				<%}%>
				<input class="com-mess" type="text" placeholder=" Viết bình luận ..." />
				<input class="submit-green" type="submit" value="Comment" />
			</div>
		</form>
		
		<fieldset style="width: 428px; margin-left: 10px; padding: 0 0 8px 2px;">
			<ul class="com-list">
				<%
					if(request.getAttribute("listCmt") != null){
						@SuppressWarnings("unchecked")
						ArrayList<Comment> alCmt = (ArrayList<Comment>)request.getAttribute("listCmt");
						if(alCmt.size() > 0){
								for(Comment itemCmt : alCmt){
				%>
					<li class="item-com">
						<div class="item">
							<img class="com-img" src="<%=request.getContextPath()%>/files/<%=itemCmt.getAvatar()%>" width="52" />
							<div class="cmt">
								<b><%=itemCmt.getCom_name()%></b><small>&nbsp<%=itemCmt.getCom_date()%>&nbsp<a href="javascript:void(0)" class="rep-a" data-a="<%=itemCmt.getId_com()%>">Reply</a></small>
								<p><%=itemCmt.getCom_mess()%></p>
							</div>
							<div class="clr"></div>
						</div>
						<ul class="rep-list<%=itemCmt.getId_com()%>">
							<%
								ReplyDao repDao = new ReplyDao();
								ArrayList<Reply> alRep = repDao.getItems(itemCmt.getId_com());
								if(alRep.size() > 0){
									for(Reply itemRep: alRep){
							%>
									<li class="item-rep">
										<div class="item">
											<img class="com-img" src="<%=request.getContextPath()%>/files/<%=itemRep.getAvatar()%>" width="30" />
											<div class="rep">
												<b><%=itemRep.getRep_name()%></b><small>&nbsp<%=itemRep.getRep_date()%></small>
												<p><%=itemRep.getRep_mess()%></p>
											</div>
											<div class="clr"></div>
										</div>
									</li>
							<%}}%>
						</ul>
						
						<fieldset class="f-rep<%=itemCmt.getId_com()%>" id="f-rep">
							<form class="frm-rep">
								<div class="cont-rep">
									<%
										if(session.getAttribute("objUser") != null){
											User obj = (User)session.getAttribute("objUser");
									%>
										<img class="com-img" src="<%=request.getContextPath()%>/files/<%=objUser.getAvatar()%>" width="30" />
									<%}else{%>
										<img class="com-img" src="<%=request.getContextPath()%>/templates/public/images/avatar.png" width="30" />
									<%}%>
									<input class="rep-mess<%=itemCmt.getId_com()%>" id="rep-mess" placeholder=" Viết trả lời ..." />
									<input class="submit-gray" type="submit" data-comid="<%=itemCmt.getId_com()%>" value="Reply" />
								</div>
							</form>
						</fieldset>
					</li>
				<%}}else{%>
					<span class="msg-com">Chưa có bình luận nào</span>
				<%}}%>
			</ul>
		</fieldset>
	</div>
</div>
		<script type="text/javascript">
			$().ready(function() {
				$(".submit-green").click(function() {
					var m = $(".com-mess").val();
					$(".com-mess").val("");
					var i = <%=objNews.getId_news()%>;
					$.ajax({
						url : "<%=request.getContextPath()%>/public/comment",
						type : "POST",
						data : "mess=" + m + "&id=" + i,
						async : true,
						success : function(data) {
							if ($(".com-list li").length == 0) {
								$(".com-list").html(data);
							} else {
								$(".com-list .item-com:eq(0)").before(data);
							}
	
						}
					})
					return false;
				});
				
				$(".submit-gray").click(function(){
					var id = $(this).attr("data-comid");
					var r = $(".rep-mess"+id).val();
					$(".rep-mess"+id).val("");
					
					$.ajax({
						url : "<%=request.getContextPath()%>/public/reply",
						type : "POST",
						data : "mess=" + r + "&id=" + id,
						async : true,
						success : function(data) {
								$(".rep-list" + id).append(data);
						}
					})
					return false;
				});
				
				$(".rep-a").click(function(){
					var id = $(this).attr("data-a");
					$(".f-rep" + id).slideToggle();
				});
			});
		</script>
<div class="clr"></div>
<%@include file="/templates/public/inc/footer.jsp" %>  
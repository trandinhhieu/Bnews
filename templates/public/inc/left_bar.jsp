<%@page import="library.StringLibrary"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<h2>Danh mục tin</h2>
	<ul>
		<%
			CatDao catDao = new CatDao();
			ArrayList<Category> alCat = catDao.getItems();
			if(alCat != null){
				if(alCat.size() > 0){
					for(Category objCat: alCat){
						///(.*)-([0-9]+).html
						String urlSlug = request.getContextPath() + "/" +StringLibrary.makeSlug(objCat.getName()) + "-" + objCat.getId_cat() + ".html";
		%>
			<li><a href="<%=urlSlug%>"><%=objCat.getName()%></a></li>
		<%}}}%>
	</ul>
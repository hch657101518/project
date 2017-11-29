<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@page import="dao.ArticleDao"%>
<%@page import="entity.Article"%>
<% 
	ArticleDao articleDao = new ArticleDao();
	ArrayList<Article> list = new ArrayList<Article>();
	list= articleDao.queryArticleClickrate();
%>

<%for(int i = 0 ;i<list.size();i++){ %>
<li><a href="memberArticleServlet?aid=<%=list.get(i).getArticleId()%>" title="<%=list.get(i).getArticleTitle()%>" target="_self"><%=list.get(i).getArticleTitle()%></a></li> 
<%} %>   
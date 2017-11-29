<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@page import="dao.ArticleDao"%>
<%@page import="entity.Article"%>
<% 
	ArticleDao articleDao1 = new ArticleDao();
	ArrayList<Article> list1 = new ArrayList<Article>();
	list1= articleDao1.queryArticleClickrate();
%>

<%for(int i = 0 ;i<list1.size();i++){ %>
<li><a href="MemberArticleNameSevlet?aname=<%=list1.get(i).getArticleName()%>" title="<%=list1.get(i).getArticleName()%>" target="_self"><%=list1.get(i).getArticleName()%></a></li> 
<%}%>   
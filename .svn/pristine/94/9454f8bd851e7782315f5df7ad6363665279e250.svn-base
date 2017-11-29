<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@page import="dao.CommodityTypeDao"%>

<%
	String pid = request.getParameter("id");
	CommodityTypeDao commodityTypeDao = new CommodityTypeDao();
	ArrayList<CommodityType> list = new ArrayList<CommodityType>();
	list = commodityTypeDao.queryByPid(Integer.valueOf(pid));
 %>
<%
	for(CommodityType commodityType:list){
 %>	
 	<span> <a href='MemberFlowerCateGory?use=<%=commodityType.getTypeId()%>&page=1'><b> <%=commodityType.getTypeName()%></b></a></span>
  <%} %>


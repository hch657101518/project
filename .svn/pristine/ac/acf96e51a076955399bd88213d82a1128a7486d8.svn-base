<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	request.setCharacterEncoding("utf-8");
	CommodityDao comDao = new CommodityDao();
	ArrayList<Commodity> comList1 = comDao.querySalesRanking("1");
%>


<c:forEach items="<%=comList1 %>" var="commodity" varStatus="sta">
<div class="xxphboxlist4">
<div class="phnumico${sta.index+1 }"></div>
<div class="inimgboxleft"><a href="MemberDetailServlet?comId=${commodity.commodityId }" title="鲜花排行" target="_blank"><img src="../admin/upload/thumb/${commodity.commodityPicture }" alt="${commodity.commodityName }" /></a></div>
<span><a href="MemberDetailServlet?comId=${commodity.commodityId }" title="鲜花排行" target="_blank">鲜花/${commodity.commodityName }</a></span><br />
<span class="prejg">￥ ${commodity.commodityPresentPrice }</span>
</div>
</c:forEach>



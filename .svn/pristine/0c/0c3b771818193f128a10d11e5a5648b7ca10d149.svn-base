<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	request.setCharacterEncoding("utf-8");
	CommodityDao comDao3 = new CommodityDao();
	ArrayList<Commodity> comList3 = comDao3.querySalesRanking("7");
%>

<c:forEach items="<%=comList3 %>" var="commodity" varStatus="sta">
<div class="xxphboxlist4">
<div class="phnumico${sta.index+1 }"></div>
<div class="inimgboxleft"><a href="MemberDetailServlet?comId=${commodity.commodityId }" title="公仔销售排行" target="_blank"><img src="../admin/upload/thumb/${commodity.commodityPicture }" alt="${commodity.commodityName }" /></a></div>
<span><a href="MemberDetailServlet?comId=${commodity.commodityId }" title="公仔销售排行" target="_blank">${commodity.commodityName }</a></span><br />
<span class="prejg">￥  ${commodity.commodityPresentPrice }</span>
</div>
</c:forEach>

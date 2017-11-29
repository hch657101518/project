<%@ page language="java" import="java.util.*,entity.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="dao.CommodityTypeDao"%>
<%@page import="util.ConfigUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
//蛋糕礼品导购模块
%>

<%
//特色礼品
request.setAttribute("tslpList",ConfigUtil.getConfig("特色礼品"));
%>

<div class="basebox_x_org margin_B_10px">
<h3>蛋糕礼品导购</h3>
<div class="content sp_list">


<dl>
<h3>蛋糕分类</h3>
<%
	CommodityTypeDao commodityTypeDao = new CommodityTypeDao();
	ArrayList<CommodityType> cakeList = new ArrayList<CommodityType>();
	cakeList = commodityTypeDao.queryByPid(Integer.valueOf(2));
	request.setAttribute("cakeList",cakeList);
 %>
<p>
<c:forEach var="item" items="${cakeList}" varStatus="status" >

<span><a href="MemberCakeCateGory?cake=${item.typeId }&page=1" title="${item.typeName }">${item.typeName }</a></span>

</c:forEach>

<br class="clear" />
</p>
</dl>

<dl>
<h3>礼品中心</h3>
<%
	ArrayList<CommodityType> tslpList = new ArrayList<CommodityType>();
	tslpList = commodityTypeDao.queryByPid(Integer.valueOf(5));
	request.setAttribute("tslpList",tslpList);
 %>
<p>
<c:forEach var="item" items="${tslpList}" varStatus="status" >
<span><a href="MemberGiftServlet?gift=${item.typeId }&page=1" title="${item.typeName }">${item.typeName }</a></span>
</c:forEach>


<br class="clear" />
</p> 



</dl>



</div>

<div class="bottombgbox"></div>
</div>
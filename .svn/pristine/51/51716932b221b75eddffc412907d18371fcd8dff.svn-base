<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
//最新订单评价
%>

<div class="basebox_x_yellow2 margin_B_10px">
<h3>最新订单评价</h3>
<div class="content">

<div class="leftpjlist">
	<%//显示8条 %>
	
	
	<c:forEach var="item" items="${requestScope.commentList}">
	<div class="plbox">
	<div class="inimgboxleft">
	<a href="MemberDetailServlet?comId=${item.commodityId }" target="_blank">
	<img src="../admin/upload/thumb/${item.commodityPicture }" alt="与你一见倾心" width="40" height="42" />
	</a>
	</div>
	<span>会员号：
	<span style="color:#214DA6">${item.member.memberEmail }</span>
	</span>
	<br />
	<span>${item.commentsContent }</span>
	</div>
	
	
	
	</c:forEach>
	
	

	<div class="tjtext">
	（最近已有<a href="#" target="_blank">${requestScope.commentCount}</a>条评论）</div>

</div>

</div>

<div class="bottombgbox"></div>
</div>

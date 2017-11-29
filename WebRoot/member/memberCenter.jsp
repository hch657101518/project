<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if(session.getAttribute("loginMember")==null){
		out.print("<script>location='login.jsp?from=memberCenter.jsp'</script>");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><%=ConfigUtil.getConfig("网站标题").get(0).getConfigValue()%></title>
<meta name="description"
	content="<%=ConfigUtil.getConfig("网站描述").get(0).getConfigValue()%>">
<meta name="keywords"
	content="<%=ConfigUtil.getConfig("网站关键字").get(0).getConfigValue()%>">
<link href="CSS/base.css" rel="stylesheet" type="text/css" />
<link href="CSS/member.css" rel="stylesheet" type="text/css" />
<link href="CSS/skins/ZCMS/asyncbox.css" type="text/css"
	rel="stylesheet" />
<script type="text/javascript" src="JS/jQuery.v1.4.2.js"></script>
<script type="text/javascript" src="JS/AsyncBox.v1.4.5.js"></script>

<!--[if lt IE 7.]>
<script type="text/javascript">
document.execCommand("BackgroundImageCache",false,true);
</script>
<![endif]-->
<script defer src="JS/comm.js" type="text/javascript"></script>

<script type="text/javascript">

function  detail(ordersId){
	asyncbox.open({
		url : 'member_record_detailServlet',
			data : 'oid='+ordersId,
			title:"订单详情",
		width : 860,
		height : 800,
			id : 84831253
		});
}

function showJSP(JspName){
	$("#member_rightbox").load(JspName);
}

function  confirmReceive(ordersid){
	asyncbox.warning('确认操作?确认收到完好货物否则人财两空!','确认收货',function(action){
		//alert 返回四个 action 值，分别是 'yes'、'no'、'cancel' 和 'close'。
if(action == 'yes'){
		$.post("Menber_record_success",{ordersid:ordersid},
		function(rs){
		if(rs>0){	
		$("#orderstatus"+ordersid).html("交易成功");		
		}
else{
alert("操作失败！");
}
});
}
	});
}
</script>
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000
}
-->
</style>
</head>
<body>
	<div id="header">
		<%@include file="head1.jsp"%>
		<%@include file="head2.jsp"%>



	</div>

	<!-- TOP部分结束End -->

	<!-- TOP当前位置start -->
	<div class="topdqwz_box">
		<div class="intopdqwz_box">
			<h4>
				<a href="IndexPage" title="首页">首页</a>
			</h4>
			<h4>
				<a href="#" title="会员中心">会员中心</a>
			</h4>
			<span>会员首页</span>
		</div>

	</div>
	<!-- TOP当前位置End -->


	<div class="body_content">
		<!-- 显示左侧菜单栏 -->
		<%@include file="memberCenterLeft.jsp"%>

		<div class="inbasebox_R">
			<div class="topht"></div>
			<div class="member_rightbox" id="member_rightbox">
				<!-- 显示中间内容 -->

				<%@include file="memberCenterContent.jsp"%>

				<%--<iframe src="memberCenterContent.jsp" frameborder="0" name="memberCenter" width="100%" height="500" scrolling="no">--%>
				<%--</iframe>--%>

			</div>
			<br class="clear" />
			<div class="bottomht"></div>
		</div>
		<div class="clear"></div>
	</div>




	<!-- 版权开始 -->
	<%@include file="foot.jsp"%>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	if(session.getAttribute("loginMember")==null){
		out.print("<script>alert('请先登录！');location='login.jsp?from=memberCenter.jsp'</script>");
	}
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>中国鲜花礼品网-会员中心</title>
<meta name="description" content="中国鲜花礼品网,专业提供鲜花礼品网上购物,全国连锁网上花店,北京花店,上海花店,广州花店,深圳花店,武汉花店，西安花店,重庆花店,沈阳花店......3-12小时送达北京上海广州深圳成都等全国各城市">
<meta name="keywords" content="鲜花 礼品 会员中心">
<link href="CSS/base.css" rel="stylesheet" type="text/css" />
<link href="CSS/member.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
<script type="text/javascript">
document.execCommand("BackgroundImageCache",false,true);
</script>
<![endif]-->
	<script defer src="JS/jquery-1.3.2.min.js" type="text/javascript"></script>
<script defer src="JS/comm.js" type="text/javascript"></script>


<script type="text/javascript">
function showJSP(JspName){
	$("#member_rightbox").load(JspName);
}

</script>


<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<body>
<div id="header">
<%@include file="head1.jsp" %>
<%@include file="head2.jsp" %>



</div>

<!-- TOP部分结束End -->

<!-- TOP当前位置start -->
<div class="topdqwz_box">
<div class="intopdqwz_box">
<h4><a href="IndexPage" title="首页">首页</a></h4><h4><a href="#" title="会员中心">会员中心</a></h4><span>会员首页</span>
</div>

</div>
<!-- TOP当前位置End -->


<div class="body_content">
<!-- 显示左侧菜单栏 -->
<%@include file="memberCenterLeft.jsp" %>

<div class="inbasebox_R">
<div class="topht"></div>
<div class="member_rightbox" id="member_rightbox">
<!-- 显示中间内容 -->
<script language="JavaScript">
function FormCheck()
{
	var realname= document.form1.to_name.value.toLowerCase();
	var mobile= document.form1.to_mobile.value.toLowerCase();
	var address= document.form1.to_address.value.toLowerCase();
	
	if (realname.length<=0){
		window.alert("姓名不可为空。");
		return false;
	}
	if ((mobile.length<=6)||mobile.isNan()){
		window.alert("手机未填写或填写不正确。");
		return false;
	}   

    if (address.length<=3){
		window.alert("收货地址不可为空或太短，请重新填写。");
		return false;
	}  
	return true;
}
</script>


<div class="content">

		<form method="post" onSubmit="return FormCheck();" action="MemberCenterManageReceiveAddr?type=update&consigneeID=${requestScope.consignee2.consigneeId }" name="form1">
        
          <table width="550" border="1" cellpadding="2" cellspacing="0" bordercolor="#D4D4D4" style="border-collapse:collapse">
            <tr bgcolor="#E6E6E6"> 
              <td colspan="2">请添加收件人地址：</td>
            </tr>
            <tr> 
              <td align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
              <td>
               <input type="text" name="to_name" size="20" value="${requestScope.consignee2.consigneeName }"> <font color="red">*</font>
              </td>
            </tr>
            
        
			<tr> 
              <td align="right">手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
              <td> <input type="text" name="to_mobile" size="20" value="${requestScope.consignee2.consigneePhone }"> <font color="red">*</font>
              </td>
            </tr>
   
            <tr> 
              <td align="right">详细地址：</td>
              <td> <input type="text" name="to_address" size="55" value="${requestScope.consignee2.consigneeAdress }"> <font color="red">*</font>
              </td>
            </tr>
          </table>
          <input type="submit" name="Submit111" value="提交地址">
        </FORM>
<SCRIPT language=javascript>
first("selectp","selectc","form1",0,0); 
</SCRIPT>
 </div>


</div>
<br class="clear" />
<div class="bottomht"></div>
</div>
<div class="clear"></div>
</div>




<!-- 版权开始 -->
<%@include file="foot.jsp" %>
</body>
</html>


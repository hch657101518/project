<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<div class="inbasebox_L">
<div class="leftmenubox">
<div class="toptitlemenu">
</div>

<div class="menustart">
<dl>
<dt><a href="#">会员首页</a></dt>
</dl>


<h3>订单信息</h3>
<dl>
<dt><a href="#" onclick="showJSP('member_record_recordServlet?oid=0&uid=${sessionScope.loginMember.memberEmail}')">查看最近15天订单</a></dt>
<dt><a href="#" onclick="showJSP('member_record_recordServlet?oid=1&uid=${sessionScope.loginMember.memberEmail}')">查看已取消订单</a></dt>
<dt class="border_bnone"><a href="#" onclick="showJSP('member_record_recordServlet?oid=2&uid=${sessionScope.loginMember.memberEmail}&ran='+Math.random());">查看所有历史订单</a></dt>
<dt class="border_bnone"><a href="#" onclick="showJSP('member_record_comments?uid=${sessionScope.loginMember.memberEmail}&ran='+Math.random());">查看已发货订单</a></dt>
<dt class="border_bnone"><a href="#" onclick="showJSP('member_comments_servlet?uid=${sessionScope.loginMember.memberEmail}&ran='+Math.random());">查看未评论订单</a></dt>
<dt class="border_bnone"><a href="#" onclick="showJSP('OrderReview_List_Servlet?uid=${sessionScope.loginMember.memberEmail}&ran='+Math.random());">我的评价 <span class="STYLE1">new!</span></a></dt>
</dl>
<h3>账户设置</h3>
<dl>
<dt>
<a href="#" onclick="showJSP('memberCenterContent_ModifyEmail.jsp?ran='+Math.random())">修改E-mail/用户名</a></dt>
<dt>
<a href="#" onclick="showJSP('memberCenterContent_ModifyInfomation.jsp?ran='+Math.random())">管理我的个人资料</a></dt>
<dt>
<a href="#" onclick="showJSP('MemberCenterManageReceiveAddr?ran='+Math.random())">管理收货人地址簿</a></dt>
<dt class="border_bnone">
<a href="#" onclick="showJSP('memberCenterContent_ModifyPWD.jsp?ran='+Math.random())">修改密码</a></dt>
</dl>

<h3>客户服务</h3>
<dl>

<dt class="andtdiv"><a href="/chat/" target="_blank"> 
        <img src="Images/kf2on.gif" border="0" align="absmiddle"> </a></dt>
<dt class="andtdiv"><a href="loginOut.jsp" class="loginout"><img src="Images/mb_ico11.jpg" alt="退出登录" /></a></dt>
</dl>

</div>

</div>
<div class="leftbottom"></div>
</div>
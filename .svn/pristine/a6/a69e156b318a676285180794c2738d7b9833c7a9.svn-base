<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("loginMember");//仅仅清除登录时保存的用户数据
	//session.invalidate();//取消当前会话
	//需要保存数据到cookie
	Cookie cookEmail=new Cookie("Email","");
	Cookie cookPwd=new Cookie("PassWord","");
	//设置有效期为过期
	cookEmail.setMaxAge(-1);
	cookPwd.setMaxAge(-1);
	//保存到写到客户端
	response.addCookie(cookEmail);
	response.addCookie(cookPwd);
	//重定向到首页
	response.sendRedirect("IndexPage");
	
%>

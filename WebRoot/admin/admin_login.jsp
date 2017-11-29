<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>  
<script>
  function ChangeImg1(){ 
document.getElementById('yzmIMG').src = "../RandomCodeServlet?dd="+new Date();
} 

</script>  
    <title>鲜花网后台登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <LINK href="css/login.css" type=text/css rel=stylesheet>
  </head>  
  <body>
    <DIV id="div1">
	<form action="AdminLoginServlet" method="post">
  <TABLE id="login" height="100%" cellSpacing=0 cellPadding=0 width=800 align="center" style="margin-top:200px;">
    <TBODY>
      <TR id="main">
        <TD>
          <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
            <TBODY>
              <TR height="200px">
                <TD colSpan="4">&nbsp;</TD>
              </TR>
              <TR height=30>
                <TD width=380>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD rowSpan=4>&nbsp;</TD>
                <TD>用户名：</TD>
                <TD>
                  <INPUT class="textbox" id="txtUserName" name="txtUserName"/>
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>密　码：</TD>
                <TD>
                  <INPUT class="textbox" id="txtUserPassword" type="password" 
            name="txtUserPassword">
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=40>
                <TD>验证码：</TD>
                <TD colSpan="2" valign="middle">
                  <INPUT id="txtSN" size=4 name="txtSN" style="margin-bottom:7px">
                  &nbsp; <IMG id="yzmIMG" src="../RandomCodeServlet" border=0> 
                  <A id=LinkButton1 href="javascript:ChangeImg1()">不清楚，再来一张</A></TD>
              </TR>
              <TR height=40>
                <TD><a href="updatePwd.jsp">修改密码</a></TD>
                <TD align=right>
                  <INPUT id="btnLogin" type="submit" value=" 登 录 " name="btnLogin">
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=110>
                <TD colSpan=4>&nbsp;</TD>
              </TR>
            </TBODY>
          </TABLE>
        </TD>
      </TR>
      <TR id=root height=104>
        <TD>&nbsp;</TD>
      </TR>
    </TBODY>
  </TABLE>
  </form>
</DIV>
<DIV id=div2 style="DISPLAY: none"></DIV>
</CONTENTTEMPLATE>
  </body>
</html>

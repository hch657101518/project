<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>  
<script>
function Check_newpwd1(){	
	var pwd1 = document.getElementById("txtNewUserPassword1");
    if(pwd1.value.length<4){
        alert("新密码为必填项，并且长度应大于4位！");
        return false;
    }
	return true;
}
function Check_newpwd2(){	
	var pwd2 = document.getElementById("txtNewUserPassword2");
    if(pwd2.value.length<4){
        alert("新密码为必填项，并且长度应大于4位！");
        return false;
    }
	return true;
}
function Check_submit(){	
	var user = document.getElementById("txtUserName");
	if(user.value==""){
		alert("请输入用户名！");
        return false;
    }
	var oldPwd = document.getElementById("txtUserPassword");
	if(oldPwd.value==""){
		alert("请输入旧密码！");
        return false;
    }
	var pwd1 = document.getElementById("txtNewUserPassword1");
	var pwd2 = document.getElementById("txtNewUserPassword2");
	if(pwd1.value.length<4){
	      alert("新密码为必填项，并且长度应大于4位！");
	      return false;
	}
	if(pwd2.value.length<4){
	      alert("新密码为必填项，并且长度应大于4位！");
	      return false;
	}
    if(!(pwd1.value==pwd2.value)){
        alert("两次输入的密码不一样！");
        return false;
    }
	return true;
}
</script>  
    <title>鲜花网后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <LINK href="css/login.css" type=text/css rel=stylesheet>
  </head>  
  <body>
    <DIV id="div1">
	<form action="AdminUpdatePwdServlet" target="_top" onsubmit="return Check_submit();" method="post">
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
              <TR height=30>
                <TD rowSpan=4>&nbsp;</TD>
                <TD>用户名：</TD>
                <TD>
                  <INPUT class="textbox" id="txtUserName" name="txtUserName"/>
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=30>
                <TD>旧密码：</TD>
                <TD>
                  <INPUT class="textbox" id="txtUserPassword" type="password" 
            name="txtUserPassword">
                </TD>
                <TD width=120>&nbsp;</TD>
              </TR>
              <TR height=30>
                <TD>新密码：</TD>
                <TD colSpan="2" valign="middle"><INPUT class="textbox" onblur="Check_newpwd1()" id="txtNewUserPassword1" type="password" name="txtNewUserPassword1"></TD>
              </TR> 
              <TR height=30>
                <TD>确认新密码：</TD>
                <TD colSpan="2" valign="middle"><INPUT class="textbox" onblur="Check_newpwd2()" id="txtNewUserPassword2" type="password" name="txtNewUserPassword2"></TD>
              </TR>
              
              <TR height=40>
                <TD></TD>
                <TD>
                <a href="admin_login.jsp">返回登陆页面</a>
                </TD>
                <TD align=right>
                 	    <INPUT id="PwdbtnLogin" type="submit" value="修改密码 " name="PwdbtnLogin">
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

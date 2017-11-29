<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- 会员中心——修改密码 -->
<script>
function Check_newpwd1(){	
	var pwd1 = document.getElementById("new_pass1");
    if(pwd1.value.length<4){
        alert("新密码为必填项，并且长度应大于4位！");
        return false;
    }
	return true;
}
function Check_newpwd2(){	
	var pwd2 = document.getElementById("new_pass2");
    if(pwd2.value.length<4){
        alert("新密码为必填项，并且长度应大于4位！");
        return false;
    }
	return true;
}
function Check_submit(){	
	var oldPwd = document.getElementById("old_pass");
	if(oldPwd.value==""){
		alert("请输入旧密码！");
        return false;
    }
	var pwd1 = document.getElementById("new_pass1");
	var pwd2 = document.getElementById("new_pass2");
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



<div class="content">
  <h4>修改密码</h4>
  <div>
        <form action="MemberCenterModifyPWD" onsubmit="return Check_submit();" method="post">
          
          <table width="90%" border="1" style="border-collapse:collapse" cellpadding="5" cellspacing="0" bordercolor="77aa33">
            <tr> 
              <td width="82%" align="center" bgcolor="#CFE7AF"><strong>修改密码</strong></td>
            </tr>
            <tr> 
              <td width="82%" align="center"><table width="95%" border="0" cellspacing="4" cellpadding="0">
                  <tr> 
                    <td colspan="2" align="left"><font color="#CC0000">${sessionScope.loginMember.memberEmail}</font>，您好，您可以修改密码 ：
                    </td>
                  </tr>
                  <tr> 
                    <td width="30%" height="30" align="right">您的旧密码：</td>
                    <td align="left">
                    <input name="old_pass" type="password" id="old_pass" value="" size="20" Maxlength="40">
                      <font color="#CC0000">*</font></td>
                  </tr>
                  <tr> 
                    <td height="30" align="right">新密码：</td>
                    <td align="left"><input name="new_pass1" type="password" id="new_pass1" onblur="Check_newpwd1()" value="" size="20" Maxlength="40">
                      <font color="#CC0000">*</font></td>
                  </tr>
                  <tr> 
                    <td height="30" align="right">再次输入新密码：</td>
                    <td align="left"><input name="new_pass2" type="password" id="new_pass2" onblur="Check_newpwd2()" value="" size="20" Maxlength="40">                      <font color="#CC0000">*</font></td>
                  </tr>
                </table>
                <input name="imageField" type="image" src="Images/01-changepw.gif" width="64" height="22" border="0">
                <br>
                <br>
                
                <table width="95%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="1" background="/Images/dot2.gif"><img src="/Images/spacer.gif" width="1" height="1"></td>
                  </tr>
                </table>
                <br>
                <font color="#CC0000">新密码要求由英文字母 (a-z大小写均可)、阿拉伯数字 (0-9) 组成且长度为6-16位字符。</font> 
                <br>
              </td>
            </tr>
          </table>
          <br>
        </form>
        
        <br></div>
</div>
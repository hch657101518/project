<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- 会员中心——修改登陆Email -->
<script>


function Check_EmailSubmit(){	
	var newEmail1 = document.getElementById("new_email1");
	var newEmail2 = document.getElementById("new_email2");
	var pwd = document.getElementById("check_password");

	if(newEmail1.value=="" || newEmail1.value=="" || pwd.value==""){
		alert("请填把信息填写完整！");
        return false;
    }

    if(!(newEmail1.value==newEmail2.value)){
        alert("两次输入的新邮箱不一样！");
        return false;
    }
	if (!isEmail(newEmail1.value)){
		alert("邮箱格式不正确！");
		return false;
	}
    
	return true;
}
function check_isExist(strEmail){
	var newEmail1 = document.getElementById("new_email1");
	if (!isEmail(newEmail1.value)){
		$("#alertMessage").html("邮箱格式不正确！");
		return false;
	}
	$.post("MemberCenterModifyEmail",{type:'CheckIsExist',email:strEmail},
			function(rs){
			if(rs=="1"){
				$("#alertMessage").html("该用户名已被人使用！");
			}
			if(rs=="0"){
				$("#alertMessage").html("该用户名可以使用！");
			}
		});
}
function isEmail(strEmail) {
	if (strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
		return true;
	else
		return false;
}
</script>



<div class="content">
  <h4>修改E-mail/用户名</h4>
  <div>
        <form action="MemberCenterModifyEmail" onsubmit="return Check_EmailSubmit();" method="post">
          
          <table width="90%" border="1" style="border-collapse:collapse" cellpadding="5" cellspacing="0" bordercolor="77aa33">

            <tr> 
              <td width="82%" align="center"><table width="95%" border="0" cellspacing="4" cellpadding="0">
                  <tr> 
                    <td height="40" colspan="2"><font color="#CC0000">${sessionScope.loginMember.memberEmail}</font>，您好，您可以修改邮箱（即用户名）： 
                       
                     </td>
                  </tr>
              
				  
                  <tr> 
                    <td height="30" align="right">新E-mail：</td>
                    <td align="left"><input name="new_email1" type="type" id="new_email1" onblur="check_isExist(this.value)" value="" size="20" Maxlength="40">
                      <font color="#CC0000" id="alertMessage" name="alertMessage" >* 邮箱格式：abc@163.com</font></td>
                  </tr>
                  <tr> 
                    <td height="30" align="right">再次输入新E-mail：</td>
                    <td align="left"><input name="new_email2" type="type" id="new_email2" value="" size="20" Maxlength="40">
                      <font color="#CC0000">*</font></td>
                  </tr>
				  <tr> 
                    <td width="30%" height="30" align="right">登录密码：</td>
                    <td align="left"><input name="check_password" type="password" id="check_password" value="" size="20" Maxlength="40">
                      <font color="#CC0000">*</font> </td>
                  </tr>
                </table>
                <input name="imageField" type="image" src="Images/01-changepw.gif" width="64" height="22" border="0">
                <input name="emailupdate" type="hidden" value=""><br>
                <br>
                
                <table width="95%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="1" background="/Images/dot2.gif"><img src="/Images/spacer.gif" width="1" height="1"></td>
                  </tr>
                </table>
                <br>
                <font color="#CC0000">E-mail地址即登录用户名，请务必填写真实有效的E-mail地址<br>
                <br>
                </font>用途：作为登录用户名、接收订单信息，付款成功信息、送达通知和优惠促销信息等。 <br>
              </td>
            </tr>
          </table>
          <br>
        </form>
        
        <br></div>
</div>
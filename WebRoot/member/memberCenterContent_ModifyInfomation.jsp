<%@ page language="java" import="java.util.*,entity.Member" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="dao.MemberDao"%>
<!-- 会员中心——修改个人资料 -->
<%
MemberDao memberDao = new MemberDao();
int memberId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
Member member = memberDao.queryByMemberId(String.valueOf(memberId));
session.setAttribute("loginMember",member);
%>
<script>
/*
 * 在网页载入时把与数据库中性别对应的单选按钮设置为选中
 */
$(document).ready(function(){
	var str='${sessionScope.loginMember.gender}';
	$("#sexNV").each(function(){
		if($(this).val()==str){
			$(this).attr("checked",true);
		}
	});
});
$(document).ready(function(){
	var str='${sessionScope.loginMember.gender}';

	$("#sexNAN").each(function(){
		if($(this).val()==str){
			$(this).attr("checked",true);
		}
	});
});
function Check_InfomationSubmit(){	
	
	var realname = document.getElementById("realname");
	var tel = document.getElementById("tel");
	var address = document.getElementById("address");

	if(realname.value=="" || tel.value=="" || address==""){
		alert("请填把信息填写完整！");
        return false;
    }
    
    return true;
}
</script>

<div class="content">
  <h4>会员资料修改</h4>
  <div align="center">
        <form action="MemberCenterModifyInfomation" onsubmit="return Check_InfomationSubmit();" method="post">
          
          <table width="90%" border="1" style="border-collapse:collapse" cellpadding="5" cellspacing="0" bordercolor="77aa33">
            <tr style="display:none"> 
              <td width="18%"><div align="right"> 
                  <p>会员号：:</div></td>
              <td width="82%" align="left">
                <font color="#FF0000">1167287 </font></td>
            </tr>
            <tr> 
              <td width="18%"><div align="right"> 
                  <p>您的邮箱：:</div></td>
              <td width="82%" align="left">${sessionScope.loginMember.memberEmail} 
                &nbsp;<font color="#ff0000">*</font></td>
            </tr>
            <tr> 
              <td width="18%"><div align="right"> 
                  <p>您的昵称：:</div></td>
              <td width="82%" align="left"><input type="text" name="realname" id="realname" size="25" Maxlength="40" value="${sessionScope.loginMember.nickName}"> 
                &nbsp;<font color="#ff0000">*</font></td>
            </tr>
            <tr> 
              <td width="18%"><div align="right"> 
                  <p>您的性别：:</div></td>
              <td width="82%" align="left"><input name="sex" id="sexNAN" type="radio" value="男">
                男 
                <input type="radio" name="sex" id="sexNV" value="女">
                女 </td>
            </tr>
            <tr> 
              <td width="18%"><div align="right"> 
                  <p>您的联系电话：:</div></td>
              <td width="82%" align="left"><input type="text" name="tel" id="tel" size="25" Maxlength="30" value="${sessionScope.loginMember.phone}"> 
                &nbsp;<font color="#ff0000">*</font></td>
            </tr>
          
            <tr> 
              <td><div align="right"> 
                  <p>您的地址：:</div></td>
              <td align="left" ><input type="text" name="address" id="address" size="43" value="${sessionScope.loginMember.address}"> 
                &nbsp;<font color="#ff0000">*</font></td>
            </tr>
          </table><br>
          <input type="submit" value=" &gt;&gt; 马上修改 " name="B1">
        </form>
        
        <br></div>
</div>
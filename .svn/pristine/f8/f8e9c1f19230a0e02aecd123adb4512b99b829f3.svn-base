<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!-- 会员中心——管理收货地址-->
<SCRIPT language=javascript src="JS/prov_city_a.js"></SCRIPT>

<script language="JavaScript">
function FormCheck()
{
	var realname= document.form1.to_name.value.toLowerCase();
	var mobile= document.form1.to_mobile.value.toLowerCase();
	var selectp= document.form1.selectp.value.toLowerCase();
	var selectc= document.form1.selectc.value.toLowerCase();
	var address= document.form1.to_address.value.toLowerCase();
	
	if (realname.length<=0){
		window.alert("姓名不可为空。");
		return false;
	}
	if ((mobile.length<=6)||mobile.isNan()){
		window.alert("手机未填写或填写不正确。");
		return false;
	}   
	if (selectp.length<=0){
		window.alert("请选择订购人所在省份。"); 
		return false;
	}
	if (selectc.length<=0){
		window.alert("请选择订购人所在城市。"); 
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

		<form method="POST" onSubmit="return FormCheck();" action="MemberCenterManageReceiveAddr?type=add" name="form1">
        
          <table width="550" border="1" cellpadding="2" cellspacing="0" bordercolor="#D4D4D4" style="border-collapse:collapse">
            <tr bgcolor="#E6E6E6"> 
              <td colspan="2">请添加收件人地址：</td>
            </tr>
            <tr> 
              <td align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
              <td><input type="hidden" name="Member_email" value="84831253@qq.com"> 
                <input type="text" name="to_name" size="20"> <font color="red">*</font>
              </td>
            </tr>
            
        
			<tr> 
              <td align="right">手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
              <td> <input type="text" name="to_mobile" size="20"> <font color="red">*</font>
              </td>
            </tr>
            <tr> 
              <td align="right">所在省份：</td>
              <td> <SELECT name="selectp" onChange="selectcityarea('selectp','selectc','form1');">
            <OPTION selected value="">选择省份</OPTION>
          </SELECT> <font color="red">*</font>
              </td>
            </tr>
            <tr> 
              <td align="right">所在城市：</td>
              <td> <SELECT name="selectc">
            <OPTION selected value="">选择城市</OPTION>
          </SELECT> <font color="red">*</font>
              </td>
            </tr>
            <tr> 
              <td align="right">详细地址：</td>
              <td> <input type="text" name="to_address" size="55"> <font color="red">*</font>
              </td>
            </tr>
          </table>
          <input type="submit" name="Submit111" value="提交地址">
        </FORM>
<SCRIPT language=javascript>
first("selectp","selectc","form1",0,0); 
</SCRIPT>
 </div>

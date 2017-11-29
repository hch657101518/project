<%@ page language="java" import="java.util.*,entity.*,util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if(session.getAttribute("loginMember")==null){
		out.print("<script>alert('请先登录！');location='login.jsp?from=send_info.jsp'</script>");
	}
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="zh-cn" http-equiv="Content-Language" />
<title>填写订单资料-中国鲜花礼品网_中国鲜花网</title>
<meta name="description" content="填写订单资料-中国鲜花礼品网,国内领先鲜花速递服务商">
<meta name="keywords" content="填写订单资料-中国鲜花礼品网">
<link href="CSS/base.css" rel="stylesheet" type="text/css" />
<link href="CSS/carbodybox.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
<script type="text/javascript">
document.execCommand("BackgroundImageCache",false,true);
</script>
<![endif]-->

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 16px；font—color: #BC1717;}
.STYLE3 {font-size: 16px; font-weight: bold; }
.txt{
	border:solid 1px black;
	}
-->
</style>

<script type="text/javascript">
var serveiceNow = [2012,10,9,15,52,18];
</script>
<SCRIPT language=javascript src="JS/prov_city_a.js"></SCRIPT>
<SCRIPT language=javascript src="JS/prov_city_b.js"></SCRIPT>
<SCRIPT language=javascript src="JS/jquery-1.3.2.min.js"></SCRIPT>
<SCRIPT language=javascript src="JS/send_info.js"></SCRIPT>
<script language="JavaScript">
<!--

var i=0;
function showInfo(id){
	document.getElementById(id).style.display="";
}
function hideInfo(id){
	document.getElementById(id).style.display="none";
}

function testMesLen(mes){
 var mess=document.getElementById("words");
 alert(wwww);
 if (mess.value<=0){
	alert("你留言为空");


	 }
if (mess.value.length>200){
 alert("您输入的留言过长，卡片写不下啦！");
 
}
}

function testQuestLen(quest){
document.form1.questLen.value=120-quest.value.length;
if (document.form1.questLen.value<0){
 alert("您输入的留言过长，已经写不下啦！\nThe message that you wrote is so long that the card can't hold!");
 quest.value=quest.value.substring(0,120);
}
}



function changeDay() {
	var nian=document.getElementById("send_yy");
	var yue=document.getElementById("send_mm");
	var ri=document.getElementById("dd");
	
	if(yue==1&&yue==3&&yue==5&&yue==7&&yue==8&&yue==10&&yue==12){
		i=31;
	}else if(yue==4&&yue==6&&yue==9&&yue==11){
		i=30;
	}else{
		if((nian%400==0)||(nian%4==0&&nian%100!=0)){
			i=29;
		}else{
			i=28;
		}
	}

}



function FormCheck(){

	var tele=document.getElementById("tel");
	var to_tele=document.getElementById("to_tel");
	
	if(document.getElementById("realname").value==""){
		alert("订购人姓名不能为空！");
		return false;
	}
	if(isNaN(tele.value)){
		alert("你输入的订购人电话号码中含有非数字字符");
		return false;
	}
	if (tele.value.length<=6){
		alert("你输入的订购人电话号码格式不正确，请重新输入");
		return false;
	}
	if (document.getElementById("address").value==""){
		alert("订购人地址不能为空，请输入详细地址！");
		return false;
	
	}
	if(document.getElementById("to_name").value==""){
		alert("收货人姓名不能为空！");
		return false;
	}
	if(isNaN(to_tele.value)){
		alert("你输入的收货人电话号码中含有非数字字符！");
		return false;
	}
	if (to_tele.value.length<=6){
		alert("你输入的收货人电话号码格式不正确，请重新输入！");
		return false;
	
	}
	if (document.getElementById("to_address").value==""){
		alert("收货人地址不能为空，请输入详细地址！");
		return false;
	
	}
	var myDate = new Date();
	var currentNian=myDate.getFullYear();    //获取完整的年份(4位,1970-????)	
	var currentYue=myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var currentRi=myDate.getDate();        //获取当前日(1-31)
	//获取用户输入的年月份
	var nian=document.getElementById("send_yy");
	var yue=document.getElementById("send_mm");
	var ri=document.getElementById("dd");

/* 	if(currentNian>nian.value ){
		alert("请选择之后的时间！");
		return false;
	}
	if(currentYue>yue.value ){
		alert("请选择当前月份之后的月份！");
		return false;
	} 
	if(currentYue==yue.value){
	if(currentRi>ri.value){
			 alert("请选择当前日期之后的日期！");
			return false;
		 }
		
	 } */
	 if(currentNian>nian.value ){
		alert("请选择之后的时间！");
		return false;
	}else if(currentNian==nian.value){
		if(currentYue>yue.value ){
		alert("请选择之后的时间！");
		return false;
		}else if(currentYue==yue.value){
			if(currentRi>=ri.value){
				alert("请选择之后的时间！");
				return false;
		 	}
		}
		
	}else{
	} 
	
	return true;

}
//-->
</script>

</head>

<body>
<div id="header2">
<%@include file="head1.jsp" %>
</div>

<!-- TOP部分结束End -->


<!-- TOP当前位置start -->
<div class="topdqwz_box">
<div class="intopdqwz_box">
<h4><a href="IndexPage" title="首页">首页</a></h4><span>填写订单资料</span>
</div>

</div>
<!-- TOP当前位置End -->
<form method="post" action="MemberSend_infoServlet" id="form1" name="form1">
<div class="carbodybox">

<div class="content">
<div class="carttbox3"></div>


<!-- 填写订购人信息 -->
<div class="eebasebox">
<div class="eecontent">


<table width="100%" border="0" cellpadding="8" cellspacing="0" bgcolor="e2e2e2">
  <tr>
									<th class="th1">
										请填写订购人信息
									</th>
								</tr>
								<tr><td bgcolor="#FFFFFF">
										<font color="#FF6600">&nbsp;</font>订购人姓名：&nbsp;
										<input type="text" id="realname" name="realname" style="width:100px;" value="${sessionScope.loginMember.memberName }" onfocus="showInfo('divInfo1')" onblur="hideInfo('divInfo1')"/></span>
										<span class="color_hongnw"  id="divInfo1"  style="display:none;">* 必填</span>  
									</td>
									
								</tr>
								
								<td bgcolor="#FFFFFF">
										<font color="#FF6600">&nbsp;</font>订购人电话：&nbsp;
										<span class="STYLE1"><input type="text" id="tel" name="tel" style="width:150px;" value="${sessionScope.loginMember.phone }"  onfocus="showInfo('divInfo2')" onblur="hideInfo('divInfo2')"/></span>
										<span class="color_hongnw" id="divInfo2"  style="display:none;">* 请输入不少于7个数字。</span>  
									</td>
									
								</tr>
                        
                        
                        
                          
								
                          <tr> 
                          <td bgcolor="#FFFFFF">
										<font color="#FF6600">&nbsp;</font>订购人地址：&nbsp;
										<span class="STYLE1"><input type="text" id="address" name="address" style="width:300px;"  value="${sessionScope.loginMember.address }" onfocus="showInfo('divInfo3')" onblur="hideInfo('divInfo3')"/></span>
										<span  class="color_hongnw" id="divInfo3"  style="display:none;">* 请输入详细地址。</span>  
									</td>
                         
                        </tr>

                        
</table>

</div>
</div>
<!-- 填写订购人信息END -->


<script type="text/javascript">
var addressList = eval([])
function ChangeInfo_rev(per_id){
	var i;
	if(per_id== "-2"){ 					// 自己
		document.getElementById("to_name").value=document.form1.realname.value;
		//document.form1.to_name.value=document.form1.realname.value;
		document.getElementById("to_tel").value=document.form1.tel.value;
		document.getElementById("to_address").value=document.getElementById("address").value;
	}
	else if(per_id=="-1"){				//清空
		document.form1.to_name.value="";
		document.form1.to_tel.value="";
		document.form1.to_address.value="";
	}
	else if(per_id== ""){} // 请选择
	else {
		try{
			i = parseInt(per_id,10)
			if(i>= 0  && addressList.length > 0){
				document.form1.to_name.value=addressList[i][0];
				document.form1.to_tel.value=addressList[i][1];
				document.form1.to_address.value=addressList[i][2];
			}
		}catch(e){}
	}
}

</script>
<!-- 填写收货人信息 -->
<div class="eebasebox">
<div class="eecontent">
<table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="e2e2e2">
  <tr>
									<th class="th1">
										请填写收货人信息
									</th>
								</tr>
								<tr>
									<td bgcolor="#FFFFFF">
										<span class="STYLE1">收货人姓名：&nbsp;</span>
										<span class="STYLE1"><input type="text" id="to_name" name="to_name" style="width:100px;" value="${requestScope.consignee.consigneeName }" onfocus="showInfo('divInfo4')" onblur="hideInfo('divInfo4')"/></span>
										 
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                            <select id="rev_list" name="rev_list" onChange="ChangeInfo_rev(this.value);">
			                              <option  value="" selected>--选择收货人--</option>
			                              <option value="-2">自己</option>
			                              
			                              <option value="-1">清空</option>
			                            </select>
			                            &nbsp;&nbsp;&nbsp;&nbsp;
										<span class="color_hongnw" class="color_hongnw" id="divInfo4"  style="display:none;">* 必填</span> 
									</td>
								</tr>
								<tr>
								
								<td bgcolor="#FFFFFF">
										<span class="STYLE1">收货人电话：&nbsp;</span>
										<span class="STYLE1"><input type="text" id="to_tel" name="to_tel" style="width:150px;" " value="${requestScope.consignee.consigneePhone }" onfocus="showInfo('divInfo5')" onblur="hideInfo('divInfo5')"/></span>
										<span class="color_hongnw" id="divInfo5"  style="display:none;">* 请输入不少于7个数字。</span>  
									</td>
									
								</tr>
                        
                        
                         <tr> 
                         <td bgcolor="#FFFFFF">
										<span class="STYLE1">收货人地址：&nbsp;</span>
										<span class="STYLE1"><input type="text" id="to_address" name="to_address" style="width:300px;" value="${requestScope.consignee.consigneeAdress }"  onfocus="showInfo('divInfo6')" onblur="hideInfo('divInfo6')"/></span>
										<span  class="color_hongnw" id="divInfo6"  style="display:none;">* 请输入详细地址。</span>  
									</td>
                          
                        </tr>
</table>

</div>
</div>
<!-- 填写收货人信息END -->

<!-- 配送费用 -->

<div class="eebasebox">
<div class="eecontent">
<table width="100%" border="0" cellpadding="8" cellspacing="0" bgcolor="e2e2e2">
  <tr>
    <th class="th1">配送费用</th>
  </tr>
  <p>
  <tr>
    <td bgcolor="#FFFFFF" > <input id=radio3 type="radio" name="ways" value="0" checked>
                            市区送货（<font color="#FF0000">免费送货</font>） &nbsp;&nbsp;&nbsp; 
                            <input id=radio3 type="radio" name="ways" value="30">
                            郊区配送（<font color="#FF0000">+30元</font>） &nbsp;&nbsp;&nbsp; 
                            <input id=radio3 type="radio" name="ways" value="50">
                            远郊配送（<font color="#FF0000">+50元</font>）
</td>
  </tr>
 
  </p>

</table>

</div>
</div>

<!-- 配送费用END -->

<!-- 配送日期 -->
<div class="eebasebox">
<div class="eecontent">
<style text="text/css"> 
optgroup { background-color:#eee; color:444; } 
</style>

<table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="e2e2e2" id="send_datatime_config">
  <tr>
    <th class="th1">配送日期</th>
  </tr>
 
                        <tr> 
                          <td bgcolor="#FFFFFF"><font color="#FF6600">【配送日期】</font><br><br><p>
                            送货日期： 
                            <select size="1" name="yy" id="send_yy" >
                              <option value="2017">2017</option>
                              <option value="2018">2018</option>
							  <option value="2019">2019</option>
							  <option value="2020">2020</option>
                            </select> <font color="545454"><strong>年</strong></font> 
                            <strong><font color="545454"> </font></strong>
                             <select size="1" name="mm" id="send_mm" onchange="changeDay()">
                              <option value="01">01</option>
                              <option value="02">02</option>
                              <option value="03">03</option>
                              <option value="04">04</option>
                              <option value="05">05</option>
                              <option value="06">06</option>
                              <option value="07">07</option>
                              <option value="08">08</option>
                              <option value="09">09</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                            </select> <strong><font color="545454">月</font></strong> 
                            <select size="1" name="dd" id="dd" >
							
			<!--<select size="1" name="dd" onChange="ShowJrInfo()">-->
			
                              <option value="01">01</option>
                              <option value="02">02</option>
                              <option value="03">03</option>
                              <option value="04">04</option>
                              <option value="05">05</option>
                              <option value="06">06</option>
                              <option value="07">07</option>
							  <option value="08">08</option>
							  <option value="09">09</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
			                  <option value="14">14</option>
                              <option value="15">15</option>
                              <option value="16">16</option>
                              <option value="17">17</option>
                              <option value="18">18</option>
                              <option value="19">19</option>
                              <option value="20">20</option>
							  <option value="21">21</option>
                              <option value="22">22</option>
                              <option value="23">23</option>
                              <option value="24">24</option>
                              <option value="25">25</option>
                              <option value="26">26</option>
                              <option value="27">27</option>
                              <option value="28">28</option>
                              <option value="29">29</option>
                              <option value="30">30</option>
                              <option value="31">31</option>
                            </select> <strong><font color="545454">日</font></strong>&nbsp;<font color="#FF0000"><font color="#006600">&nbsp;</font></font>
                            </p>
                            <br>
                            
                            <p>
                            时段：<font color="545454">&nbsp; </font>
                            <input name="send_timezone" type="radio" value="0:00:00" checked onClick="ShowVInfo(0)">
                            不限 
                            <input type="radio" name="send_timezone" value="8:30:00"  onClick="ShowVInfo(0)">
                            上午（8:30-12:00） 
                            <input type="radio" name="send_timezone" value="12:00:00"  onClick="ShowVInfo(0)">
                            下午（12:00-18:00） 
                            <input type="radio" name="send_timezone" value="18:00:00"  onClick="ShowVInfo(0)">
                            晚上（18:00-20:30）
           </p>
                            
                            
                           
							
							
							
                          </td>
                        </tr>
                      </table >

</div>
</div>
<!-- 配送日期END -->

<!-- 特殊要求 -->
<div class="eebasebox">
<div class="eecontent">
          <table width="100%" border="0" cellpadding="8" cellspacing="0" bgcolor="e2e2e2">
            <tr> 
              <th colspan="3" class="th1">特殊要求</th>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" style="text-align:center;line-height:22px;" >特殊要求</td>
              <td width="52%" bgcolor="#FFFFFF"><textarea class="order_textarea" onKeyPress="testQuestLen(this)" onKeyUp="testQuestLen(this)" style="background-repeat: repeat-x; OVERFLOW-Y: hidden; OVERFLOW-X: hidden" rows="2" name="quest" cols="50" onChange="testQuestLen(this)">无</textarea> 
                <input type=hidden name=questLen value=120> </td>
                <td width="29%" bgcolor="#FFFFFF"><div style="padding-top:8px;color:red;">如果您对配送服务有特殊要求,请在此说明,我们尽量满足.</div></td>
            </tr>
          </table>

</div>
</div>
<!-- 特殊要求END -->

<!-- 填写订购人信息 -->
<div class="eebasebox">
<div class="eecontent">

<table width="100%" border="0" cellpadding="8" cellspacing="0" bgcolor="e2e2e2">
  <tr>
    <th colspan="3" class="th2">卡片资料<span style="font-weight:normal">（随货赠送精美留言卡一张，请写下您的留言）</span></th>
  </tr>
  <tr>
              <td width="19%" style="text-align:center;line-height:22px;" bgcolor="#FFFFFF"> 
                给收货人留言 <br /> 
               </td>
    <td width="52%" valign="top" bgcolor="#FFFFFF">
	<textarea class="order_textarea" onKeyPress="testMesLen(this)" onKeyUp="testMesLen(this)" style="background-repeat: repeat-x; OVERFLOW-Y: hidden; OVERFLOW-X: hidden" name="words" id="words" rows="4" cols="50" onChange="testMesLen(this)"></textarea>
                          </td>
                            
        <td width="29%" bgcolor="#FFFFFF"><div style="padding-top:8px;color:red;"><font color="red">最多支持200汉字或字符，您还可以输入</font></div></td>                     
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" style="text-align:center;line-height:22px;">购买人署名</td>
    <td bgcolor="#FFFFFF" style="line-height:22px;"><input name="sign1" type="radio" onClick="javascript:if(this.checked){document.form1.signname.value=''};" value="or" checked>
                            无需另外署名,卡片按留言栏填写就好了<br>
                            <input name="sign1" id="sign1_2" onClick="javascript:if(this.checked){document.form1.signname.value=document.form1.realname.value};" type="radio" value="yes">
                            需要署名，我的署名是： 
                            <input name="signname" onClick="document.getElementById('sign1_2').checked = true" type="text" id="signname" size="20" maxlength="30">
                            <br>
                            <input type="radio" name="sign1" value="no" onClick="javascript:if(this.checked){document.form1.signname.value=''};">
                            <font color="#CC0000"> 不需要署名，我想保密！ </font><br>
                            
                          
	</td>
	<td bgcolor="#FFFFFF" style="padding-top:8px;color:red;">是否需要署名</td>
  </tr>
</table>

</div>
</div>
<!-- 填写订购人信息END -->

<!-- 填写订购人信息 -->
<div class="eebasebox margin_B_10px">
<div class="eecontent">
<table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="e2e2e2">
  <tr>
    <th class="th3"><span class="color_hongw">付款方式</span><span style="font-weight:normal">(请选择,确认提交订单后,页面将显示您所选付款方式的操作指引)</span></th>
  </tr>

  <tr>
    <td bgcolor="#FFFFFF">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr> 
                                <td valign="bottom" bgcolor="#FFFFFF" style="line-height:26px;"> 
                                  <input name="pays" type="radio" id=pays value="网上支付" checked onClick="ShowsmInfo(0)">
                      网上支付<font color="545454">（支持支付宝、财付通、易宝、快钱、EPOS-信用卡支付、PayPal/Visa/Master卡，支持招/工/建/农/中等数十家银行在线支付 
                      </font> <a href="#" target="_blank"><font color="#77aa33"><u>说明</u></font></a>)<font color="#FF0000"> 
                      推荐！</font><br> 
                                  <input id=pays type="radio" name="pays" value="银行汇款" onClick="ShowsmInfo(0)">
                                  银行转帐/汇款（<a href="#" target="_blank"><font color="#77aa33"><u>银行汇款说明</u></font></a>）<br> 
                                  <input id=pays type="radio" name="pays" value="邮局汇款" onClick="ShowsmInfo(0)">
                                  邮局汇款（<a href="#" target="_blank"><font color="#77aa33"><u>邮局汇款说明</u></font></a>）<br> 
                                  <input id=pays type="radio" name="pays" value="上门收款" onClick="ShowsmInfo(1)">
                                  上门收款（<a href="#" target="_blank"><font color="#77aa33"><u>服务说明</u></font></a>）
                                  <div id="sm_info" style="display:none"> 
                                    <table width="100%" border=0 cellspacing=1 cellpadding=4>
                                      <tr> 
                                        <td style="line-height:150%" bgcolor=#FEFFF4>请填写上门收款地址：
 
                                          <input type="text" name="address" size="55" maxlength="100"> 
                            <br /><font color="#545454">注：我们默认联系订购人收款，如果收款人姓名/电话与本页顶部填写的订购人资料不同，请在收款地址栏注明。</font>
</td>
                                </tr>
                              </table>
                            </div></td>
                              </tr>
                              <tr>
                                <td height="4" valign="bottom" style="line-height:130%"><img src="images/spacer.gif" width="1" height="1"></td>
                              </tr>
                              
              </table>
	
	</td>
  </tr>
</table>

</div>
</div>
<!-- 填写订购人信息END -->

<table width="100%">
                        
    </table>
		<div id="ShowFInfo" style="display:none">
                        <table width="100%" border=1 cellpadding="5" cellspacing="0" bordercolor="#99CC00" bgcolor="#FEFFF4"  style="border-collapse:collapse">
                          <tr> 
                            <td align="left" colspan="3" bgcolor="#FAFFE8"><strong><font color="#333333">发票相关说明：</font></strong><font color="#333333"><br>
                              1.发票由深圳总部寄出：默认使用“邮政平邮”，在订单送达后方开具寄出发票，递达通常需10-15个工作日；如您急需发票，可联系我司客服特殊安排处理。<br>
                              2.发票内容视客户订购的商品类别不同，填写为：鲜花配送服务费、蛋糕配送服务费、礼品配送服务费。<br>
                              3.以下4项须全部填写完整准确，方开具和寄出发票。<br>
                              4.万里通积分、关爱积分、V币、礼品卡四种支付方式已开具过发票给合作方，不再开具发票给使用者，如有疑问请联系积分/礼品卡提供方。 
                              </font> </td>
                        </tr>
                        <tr> 
                          <td align="left">发票抬头：</td> <td align="left">
                            <input onFocus="this.value=''" name="fp_info01" type="text" value="个人或单位全称" size="30" maxlength="25">
                              <span class="color_hongnw">* </span> &nbsp;&nbsp;<input name="fp_posttype" type="radio" value="邮政平邮" checked="checked" /> 邮政平邮（本公司承担邮寄费）</td>
                        </tr>
                                                  <tr> 
                            <td align="left">详细地址： </td>
                            <td align="left">
                              <input name="fp_info02" type="text" size="55" maxlength="50"><span class="color_hongnw">* </span>
                              &nbsp;&nbsp;邮政编码：<input name="fp_info02a" type="text" size="6" maxlength="6"><span class="color_hongnw">* </span></td>
                        </tr>
                        <tr> 
                          <td align="left">收 信 人： </td><td align="left">
                            <input name="fp_info03" type="text" size="30" maxlength="10">
                              <span class="color_hongnw">* </span> </td>
                        </tr>
                      </table></div>			  
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td align="left" height="10" style="line-height:150%;padding-top:0px"><img src="../Images/spacer.gif" width="1" height="1"></td>
                        </tr>
                        <tr> 
                          <td align=center style="line-height:30px;padding-top:0px">注明： 
                            中国鲜花礼品网将按照“服务声明”为您提供服务，请在确认订单前阅读“<a href="/help/" target="_blank"><font color="#FF0000">服务声明</font></a>”。<br> 
                            <input type=radio name=nocheck value=0 checked>
                            是的，我愿意按照此声明接受服务&nbsp; <input type=radio name=nocheck value=1 onClick='window.open("/help/default.htm","","")'>
                            否，我还没有仔细阅读“服务声明” </td>
                        </tr>
 
    </table>

<div class="car3btnbox"><input name="ispublish" type="hidden" value="no"> 
                            <input name="partnerinfo" type="hidden" id="partnerinfo" value="空"> 
                            <input type="hidden" name="qrj_fee" value=30> <input type="hidden" name="otherFee" value=""><br />
<input type="button" name="Submit2" value="&lt;&lt; 上一步" class="s_btn2" onClick="javascript:window.history.back();" />　
<input type="submit" name="Submit" onClick="return FormCheck()" value="填写完毕，下一步 &gt;&gt;" class="x_btn3" /><br /><br />
</div>

</div>

</div>
                      </form>

<!-- 版权开始 -->
<%@include file="foot.jsp" %>



</body></html>

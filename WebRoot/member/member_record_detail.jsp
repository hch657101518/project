<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

 <Script language="javaScript">



 function  ordersDetDetail(ordersId){
 	asyncbox.open({
 		url : '../admin/ordersDetail.jsp',
 			data : 'typeid='+ordersId,
 			title:"订单明细表",
 		width : 900,
 		height : 400
 		});
 }
  
function OrdersDetail(ordersId){
		window.showModalDialog("../admin/ordersDetail.jsp?typeid="+ordersId,"模态对话框","dialogWidth=1024px;dialogHeight=400px");		
}
</script>
<div class="body_content">



<Div class="inbasebox_R">
<div class="topht"></div>
<div class="member_rightbox">
<div class="content">
  <table align="center"><tr><td><h4>订单详情</h4></td></tr></table>
  <div>
        <table width="98%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><table width="98%" border="0" bordercolor="#FffffF" cellspacing="0">
                <tr> 
                  <td align="center" style="line-height:130%"> <table width="88%" border="1" cellpadding="2" cellspacing="0" bordercolor="77aa33" style="border-collapse:collapse">
                      <tr> 
                        <td align="center" bgcolor="#EEF7E1"><span class="STYLE2">订单处理信息</span></td>
                      </tr>
                      <tr> 
                        <td align="left"><p>订单号：<b><font color="#ff0000">${orderslist.ordersId}</font></b></td>
                      </tr>
                      <tr> 
                        <td align="left">订单处理状态： ${orderslist.ordersStatus}<font color=red>
                         
                          </font></td>
                      </tr>         
                      <tr> 
                      <td><a href="#" onclick="ordersDetDetail('${orderslist.ordersId}')">查看订单商品详情</a></td>
                      </tr>
                    </table><br/>
                    <form method="POST" onSubmit="return FormCheck()" action="member_AddressList_Save.asp?action=add4&add_code=4" name="form1">
                      <table width="88%" border="1" cellpadding="2" cellspacing="0" bordercolor="77aa33" style="border-collapse:collapse">
                        <tr> 
                          <td align="center" bgcolor="#EEF7E1"><span class="STYLE2">订单基本信息</span></td>
                        </tr>
                        <tr> 
                          <td align="left"><strong><font color="#FF6600">订货人信息：</font></strong><br>
                            姓名:${orderslist.ordersName}<br>
                            省市/区：${orderslist.ordersAdress}<br>
                           手机：${orderslist.ordersPhone}<br>
                            地址：${orderslist.ordersAdress}</td>
                        </tr>
                        <tr> 
                          <td align="left"><strong><font color="#FF6600">收货人信息：</font></strong> 
                           <br>
                            姓名:${requestScope.orderslist.orders_To_name}<input type="hidden" name="to_name" value="${requestScope.orderslist.orders_To_name}"> 
                            <br>
                            省市/区： ${requestScope.orderslist.orders_To_adress}<input type="hidden" name="to_city" value=" ${requestScope.orderslist.orders_To_adress}"> 
                            <input type="hidden" name="to_state" value="回家"> 
                            &nbsp;&nbsp;&nbsp;<br/> 手机: ${requestScope.orderslist.orders_To_tel} <input type="hidden" name="to_mobile" value="1232121321321"> 
                            <br>
                            地址： &nbsp; ${requestScope.orderslist.orders_To_adress} <input type="hidden" name="to_address" value="&nbsp;示范带是是否"> 
                          </td>
                        </tr>
                        <tr> 
                          <td align="left"><font color="#FF6600"><strong>其他信息：</strong></font><br>
                            	配送时间：${requestScope.orderslist.orders_Del_datetime} <br>
                            	订购时间：${requestScope.orderslist.orders_Ord_datetime}&nbsp;&nbsp;&nbsp; <br>
                            	您所选配送区域：市区送货<br>
                            	给收货人留言：&nbsp;${requestScope.orderslist.ordersMessage} <br>
                           </td>
                        </tr>
                      </table>
                    </form>
 					
           </td>
                </tr>
              </table>
              <br> <table width="90%" border="1" cellpadding="2" cellspacing="0" bordercolor="666666">
                <tr> 
                  <td align="left" style="line-height:130%"><font color="#FF3300"><strong>关于订单处理状态的说明：</strong></font><br> 
                    <font color="#0000FF">取消订单：</font>订单无效、订单重复、客户要求取消订单等等；<br> 
                    <font color="#0000FF">已确认，待付款：</font>订单信息已确认，待付款；<br> 
                    <font color="#0000FF">已 
                    付 款：</font>客户已成功支付货款；<br> <font color="#0000FF">已处理，安排中：</font>已付款（或特别处理订单，先安排），资料齐全，正在安排到当地配送店；<br> 
                    <font color="#0000FF">送货完毕：</font>配送店送货完毕，本人签收或他人代收。</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
          </tr>
        </table>
        <br></div>
</div>
</div>
<br class="clear" />
<div class="bottomht"></div>
</div>
<div class="clear"></div>
</div>

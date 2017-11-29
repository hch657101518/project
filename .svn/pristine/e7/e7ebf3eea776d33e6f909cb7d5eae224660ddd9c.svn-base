<%@ page language="java" import="java.util.*,entity.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
<title>订单详情查看</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>



</head>

<body>
<%
	String str = request.getParameter("typeid");
OrdersDelDao name = new OrdersDelDao();
ArrayList<ChangeOrders> ordersDellist = name.changeOrdersId(str);

	
 %>
 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="tab/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="tab/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="tab/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[订单详情查看]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
           				
                    </div></td>
                    <td class="STYLE1"><div align="center"></div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"></div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"></div></td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"></div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="tab/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="tab/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="25%" height="30" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">收货人姓名</span></div></td>
            <td width="25%" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">收货人电话</span></div></td>
            <td width="25%" height="30" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">收货人地址</span></div></td>
             <td width="25%" height="30" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">操作</span></div></td>
          </tr>
          <form action="/Flower/changeorder" method="post">
          <input type="hidden" value="<%=str %>" name="orderId" id="orderid"/>
         <% for(int i = 0 ;i<ordersDellist.size();i++){ %>
          <tr>
            
            
            <td height="25" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><input type="text" name="name" value="<%=ordersDellist.get(i).getOrders_To_name()%>"/></span></div></td>
            <td height="25" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><input type="text" name="phone" value="<%=ordersDellist.get(i).getorders_To_phone()%>"/></span></div></td>
            <td height="25" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><input type="text" name="adress" value="<%=ordersDellist.get(i).getOrders_To_adress()%>"/></span></div></td>
            <td height="25" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><input type="submit" /></span></div></td>
          </tr>
    		<%} %>
    		</form>
        </table></td>
        <td width="8" background="tab/images/tab_15.gif"></td>
      </tr>
    </table></td>
  </tr>
  
</table>

</body>
</html>

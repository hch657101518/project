<%@ page language="java" import="java.util.*,entity.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="dao.OrdersDelDao"%>
<%@page import="dao.CommodityDao"%>
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

<script>
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>
<%
	String str = request.getParameter("typeid");
	OrdersDelDao ordersDelDao = new OrdersDelDao();
	ArrayList<OrdersDet> ordersDellist = ordersDelDao.querybyOrdersid(str);
	CommodityDao commodityDao = new CommodityDao();
	double j,num=0, k;
	System.out.print("ordersDellist.size"+ordersDellist.size());
	System.out.print(ordersDellist.get(0).getCommodityId());
	
	for(int s=0;s<ordersDellist.size();s++){
		k=ordersDellist.get(s).getOrdersDetPic();
		j=ordersDellist.get(s).getOrdersDetNum();
		num=num+j*k;
	}
 %>
</head>

<body>
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
            <td width="3%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">编号</span></div></td>
            <td width="12%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">订单编号</span></div></td>
            <td width="14%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品编号</span></div></td>
            <td width="18%" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品名称</span></div></td>
            <td width="23%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品数量</span></div></td>
            <td width="15%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">单价(元)</div></td>
          </tr>
         <% for(int i = 0 ;i<ordersDellist.size();i++){ %>
          <tr>
            
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="center"><%=ordersDellist.get(i).getOrdersDetId()%></div>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=ordersDellist.get(i).getOrdersID()%></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=ordersDellist.get(i).getCommodityId()%></span></div></td>
            <% String s=commodityDao.queryByCommodityId(String.valueOf(ordersDellist.get(i).getCommodityId())).getCommodityName();%>
             <% String s1=commodityDao.queryByCommodityId(String.valueOf(ordersDellist.get(i).getCommodityId())).getCommodityPicture();%>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><img src="upload/thumb/<%=s1%>" width="50" height="50"/><br/><a target="_blank" href="../member/MemberDetailServlet?comId=<%=ordersDellist.get(i).getCommodityId()%>"><%=s%></a></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><%=ordersDellist.get(i).getOrdersDetNum()%></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><%=ordersDellist.get(i).getOrdersDetPic()%></span></div></td>
          </tr>
    		<%} %>
        </table></td>
        <td width="8" background="tab/images/tab_15.gif"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="tab/images/tab_19.gif" align="right"><table width="100%" border="0" cellspacing="0" cellpadding="0">
   总额：<%=num %>元&nbsp; </table></td>
  </tr>
</table>
</body>
</html>

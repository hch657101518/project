<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<div class="inbasebox_R">
<div class="topht"></div>
<div class="member_rightbox">

<div class="content">
  <div>
        
        <table width="95%" border="1" align=center cellpadding="5" cellspacing="0" bordercolor="#77aa33" style="border-collapse:collapse">
          <tr align="center" bgcolor="#EEF7E1"> 
            <td height="22"><font size="2">&#35746;&#21333;&#21495;</font></td>
			<td><font size="2">收货人</font></td>
            <td><font size="2">&#19979;&#21333;&#26102;&#38388;</font></td>
            <td><font size="2">&#35746;&#21333;&#29366;&#24577;</font></td>
            <td><font size="2">&#22788;&#29702;&#26102;&#38388;</font></td>
            <td><font size="2">功 能</font></td>
          </tr>
        <c:forEach items="${memberlist}" var="olist" varStatus="status">
          <tr> 
            <td height="23" align="center"><font size="2">${olist.ordersId}</font></td>
            <td align="center"><font size="2">${olist.orders_To_name}<br></font></td>
			<td align="center"><font size="2">${olist.orders_Ord_datetime}</font></td>
            <td align="center" ><font size="2" id ="orderstatus${olist.ordersId}"><a href="#" onclick="confirmReceive(${olist.ordersId});">${olist.ordersStatus}</a></font></td>
            <td align="center"><font size="2">${olist.ordersOperationTime}</font></td>
            <td>&nbsp;<a href="#" onclick="detail(${olist.ordersId});" ><font size="2"><u>详情</u></font></a>
            </td>
          </tr>
          </c:forEach>
        </table>
        
        <table width="95%" border="0" align="center" cellpadding="2" cellspacing="0">
                            <tr> 
                              <td height="25" align="center" bgcolor="#A9D370">&nbsp;&nbsp;
                                
                                </td>
                            </tr>
                          </table>
        
        <br></div>
</div>
</div>
<br class="clear" />
<div class="bottomht"></div>
</div>
<div class="clear"></div>
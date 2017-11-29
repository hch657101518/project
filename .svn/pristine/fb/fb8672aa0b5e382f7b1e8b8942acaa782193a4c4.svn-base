<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<div class="inbasebox_R">
<div class="topht"></div>
<div class="member_rightbox">

<div class="content">
  <div>    
        <table width="95%" border="1" align=center cellpadding="5" cellspacing="0" bordercolor="#77aa33" style="border-collapse:collapse">
          <tr align="center" bgcolor="#EEF7E1"> 
            <td height="22"><font size="2">订单编号</font></td>
			<td><font size="2">商品编号</font></td>
            <td><font size="2">商品名称</font></td>
            <td><font size="2">商品图片</font></td>
            <td><font size="2">商品评论</font></td>
            <td><font size="2">评价时间</font></td>
          </tr>
        <c:forEach items="${commentslist}" var="olist" varStatus="status">
          <tr> 
            <td height="23" align="center"><font size="2">${olist.ordersId}</font></td>
            <td align="center"><font size="2">${olist.commodityId}<br></font></td>
			<td align="center"><font size="2">${olist.commentsTitle}</font></td>
			
            <td align="center" ><font size="2" ><a href="MemberDetailServlet?comId=${olist.commodityId}"><img src="../admin/upload/thumb/${olist.commentsIP}" height="60" width="60"/></a></font></td>
           
            <td align="center"><font size="2">${olist.commentsContent}</font></td>
            <td>&nbsp;<font size="2">${olist.commentsTime}</font>
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
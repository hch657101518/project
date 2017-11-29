<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/MyPage.tld" prefix="pt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="CSS/base.css" rel="stylesheet" type="text/css" />
<link href="CSS/body.css" rel="stylesheet" type="text/css" />
<link href="CSS/page6.css" rel="stylesheet" type="text/css" />
<link href="CSS/OrderReview.css" rel="stylesheet" type="text/css" />
<style type="text/css">.helloinfo img{ margin-left:120px;}</style>
  </head>  
  <body>
    <c:forEach items="${requestScope.result}" var="comments">

		<div class="about_plbox">
<div class="pltopbox"></div>
<div class="plcontent">
            <div class="jticobox"></div>
            <div><img height="6" src="../admin/upload/thumb/${comments.commodityPicture }" /></div>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
      <td width="18%" rowspan="2" valign="top">
	  <div class="leftmemberxx"><a href="#" target="_blank"><img src="Images/9010753_s.jpg" height="51"  /></a><br />
	    <span style="color:#214DA6">${comments.member.nickName }</span><br />订单号：${comments.ordersId }<br />
        	${comments.member.address }
        	</div>	  </td>
      <td width="1" rowspan="2" class="plcbg" valign="top"><img src="Images/plcxbg2.jpg" /></td>
      </tr>
    <tr>
      <td valign="top">
	  <div class="righttitle">
	  <span class="rdate">评价时间：${comments.commentsTime }&nbsp;
		IP：${comments.commentsIP }</span>${comments.commentsTitle }&nbsp;
		<c:forEach begin="1" end="5" step="1"  varStatus="status">
			<c:if test="${comments.commentsSatisfied>=status.index}"><img src="Images/review_star_fen.gif" align="absmiddle" /></c:if>
			<c:if test="${comments.commentsSatisfied<status.index}"><img src="Images/review_star_fen_gray.gif" align="absmiddle" /></c:if>
			</c:forEach></div>
	  
	  <div class="plneirong">
	  <span class="color_nrhui">内容：</span>${comments.commentsContent }
	  </div></td>
    </tr>
  </table>
</div>
<div class="plbottom"></div>
</div>

</c:forEach>


<table width="97%" border="0" align="center" cellpadding="2" cellspacing="0"><tr><td height="25" align="center" bgcolor="#F7F7F7">
<pt:page pageIndex="${requestScope.currentPage}" url="MemberCommentsServlet?comId=${requestScope.comId}" pageMax="${requestScope.totalPage}"/>
              &nbsp;（本商品总共有<span class="color_blue"><a target="_blank" href="/productpj/">${requestScope.totalNum }</a></span>条评论）</td>
                            </tr></table>
  </body>
</html>

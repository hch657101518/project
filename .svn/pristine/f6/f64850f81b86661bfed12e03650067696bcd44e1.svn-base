<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content="zh-cn" http-equiv="Content-Language" />
<title>中国鲜花礼品网-商品搜索</title>
<meta name="description" content="鲜花,礼品,生日蛋糕商品搜索-领先中国鲜花速递服务,中国鲜花礼品网">
<meta name="keywords" content="鲜花搜索 生日蛋糕搜索">
<link href="CSS/base.css" rel="stylesheet" type="text/css" />
<link href="CSS/body.css" rel="stylesheet" type="text/css" />
	<!--[if lt IE 7.]>
<script type="text/javascript">
document.execCommand("BackgroundImageCache",false,true);
</script>
<![endif]-->

<script defer src="JS/comm.js" type="text/javascript"></script>
<script src="JS/tabchange.js" type="text/javascript" language="javascript"></script>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body>
<div id="header">
<%@include file="head1.jsp" %>
<%@include file="head2.jsp" %>

</div>

<!-- TOP部分结束End -->



<div class="body_content">
<div class="indexleft">
<!--商品导购-->
<%@include file="GuideFlower.jsp" %>

<!-- 销售排行start -->

























<!-- 销售排行end -->


<!--最新订单评价-->
<%@include file="GuideNewOrders.jsp" %>

</div>
<div class="indexright">
<div class="intopdqwz_box">
<h4><a href="/" title="中国鲜花礼品网首页">首页</a> >&nbsp;&nbsp;<a href="/search/" title="商品搜索">商品搜索</a></h4><span></span></div>

<div class="ls_bannertext">
<div class="incontent">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
    <tr>
      <td width="10%" class="color_h_c">重新搜索：</td>
      <td width="90%" class="zs_list"><!--搜索Start-->
      <form name="i_search" method="post" action="MemberSearchServlet?type=find">
      <input name="keyword" type="text" class="search_input" value="${requestScope.keyWord }" size="20" maxlength="30" />
	
	  <input type="submit" class="search_btn" value="搜索" />

	  <span class="STYLE3">*</span> 您可以输入商品编号、名称、及其他关键词进入查找
      </form>
	<!--搜索End--></td>
    </tr>
  </table>
</div>
</div>

<!--鲜花列表STAR-->
 
<div class="xhlb_box">
<div class="title"><h2>“${requestScope.keyWord }”搜索结果列表（共找到 ${requestScope.CommodityCount } 个商品）</h2>
</div>
<div class="listcontent">
<div class="incontent">



<c:forEach items="${requestScope.CommodityList }" var="item">
<div class="pro_nbox3">
	<div class="imgtop">
		<a href="MemberDetailServlet?comId=${item.value.commodityId}" target="_blank">
			<img src="../admin/upload/thumb/${item.value.commodityPicture}" alt="${item.value.commodityName}" />
			<br />
			${item.value.typeName}/${item.value.commodityName}
		</a>
	</div>
	<div>
		<span class="old_price">市场价：￥${item.value.commodityMarketPrice}</span>
	</div>
	<div>
		<span class="now_price">现价：<span class="color_hong">￥${item.value.commodityPresentPrice}</span></span>
	</div>
	<div class="btnbox">
		<a href="MemberShopServlet?id=${item.value.commodityId}">
			<img src="Images/ljdg_bgn.gif" alt="立即订购" border="0" />
		</a>
		<a href="MemberDetailServlet?comId=${item.value.commodityId}">
			<img src="Images/view_btn.gif" alt="详细" border="0" />
		</a>
	</div>
</div>
</c:forEach>



<div class="clear"></div>

<!--分页start-->
<%
//把从servlet传过来的用户搜索关键字转为url编码
String urlCodeKey = URLEncoder.encode((String)request.getAttribute("keyWord"),"UTF-8");
request.setAttribute("urlCodeKey",urlCodeKey);

%>
<div class="page_fy">
<table align='center'>
<form name='showpages' method='post' action='MemberSearchServlet?type=find&keyword2=${requestScope.urlCodeKey }'>
<tr>
<td>共 <b>${requestScope.CommodityCount }</b> 个商品&nbsp;&nbsp;
<a href="MemberSearchServlet?type=find&keyword2=${requestScope.urlCodeKey }&page=1" >首页 </a> 
<a href="MemberSearchServlet?type=find&keyword2=${requestScope.urlCodeKey }&page=${requestScope.frontPage }">上一页</a>&nbsp;
<a href="MemberSearchServlet?type=find&keyword2=${requestScope.urlCodeKey }&page=${requestScope.nextPage }">下一页 </a>
<a href="MemberSearchServlet?type=find&keyword2=${requestScope.urlCodeKey }&page=${requestScope.pageCount }">尾页</a>&nbsp;
页次：<strong><font color=red>${requestScope.currentPage }</font>/${requestScope.pageCount }</strong>页 &nbsp;
<b>${requestScope.pageSize }</b>个商品/页&nbsp;
转到：<input type='text' name='page' size=4 maxlength=5 class=smallInput value=1> 
<input class=buttonface type='submit'  value='Go'  name='abcde' style='background-color: #ff9900'>
</td>
</tr>
</form>
</table>

<div class="clear"></div>
</div>
<!--分页end-->

</div>
</div>
</div>
<!--鲜花列表END-->

</div>

<div class="clear"></div>
</div>


<!-- 版权开始 -->
<%@include file="foot.jsp" %>


<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F6eec9bc2dc8e8762d2362afced1e0526' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- 版权结束 end -->

<script language="javascript" type="text/javascript">

var tab1=[tab$('ph_tab1'),tab$('ph_tab2'),tab$('ph_tab3')];  //标签的ID(新建标签对象)
                                var panel1=[tab$('ph_panel1'),tab$('ph_panel2'),tab$('ph_panel3')];  //对应的内容BOX的ID（新建内容框对象）
                                var tabCtrl1=document.createTabCtrl(tab1,panel1,'','nowh2','onmouseover');  //(标签对象,内容框对象,'默认的样式','当前标签样式','鼠标触发事件onclick单击onmouseover鼠标经过')
                                tabCtrl1.show(0);
								
								

</script>

</body>
</html>

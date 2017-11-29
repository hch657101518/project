<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/MyPage.tld" prefix="pt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>商品的详情</title>


<link href="CSS/base.css" rel="stylesheet" type="text/css" />
<link href="CSS/body.css" rel="stylesheet" type="text/css" />
<link href="CSS/page6.css" rel="stylesheet" type="text/css" />
<link href="CSS/OrderReview.css" rel="stylesheet" type="text/css" />

<script src="JS/jquery-1.3.2.min.js" type="text/javascript"></script>
<script  src="JS/comm.js" type="text/javascript"></script>
<script language="JavaScript" src="JS/shopcart.js" type="text/JavaScript"></script>
<script language="JavaScript" src="JS/picturezoom.js" type="text/JavaScript"></script>
<script    src="JS/tabchange.js" type="text/javascript" language="javascript"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
    window.open(theURL,winName,features);
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
    eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
    if (restore) selObj.selectedIndex=0;
}
function frameResize(){
document.getElementById("RightFrame").style.height=RightFrame.document.body.scrollHeight+"px";
}

function salsRanking(num){
	for(var i=1;i<=3;i++){
		if(i==num){
			document.getElementById("ph_tab"+num).className="nowh2";
			document.getElementById("ph_panel"+num).style.display="";
		}else{
			document.getElementById("ph_tab"+i).className="";
			document.getElementById("ph_panel"+i).style.display="none";
		}
	}
}
//-->
</script>


</head>

<body>

<div id="header">
<%@include file="head1.jsp" %>
<%@include file="head2.jsp" %>
</div>


<!-- TOP当前位置start -->
<div class="topdqwz_box">
<div class="intopdqwz_box">
<h4><a href="IndexPage" title="首页">首页</a></h4>
<span><font color="#999999">&gt;</font> <a href="/Flower/">${requestScope.type.parentTypeName }</a>
	  <font color="#B4B4B4">&gt;</font> 
        
        <font color="#999999">${requestScope.commodity.commodityName }</font></span>
</div>
</div>
<!-- TOP当前位置End -->


<div class="body_content">
<div class="showleft">

<!-- 了解我们start -->
<div class="ljus">
<div class="title">首次访问中国鲜花礼品网？请看：</div>
<div class="incoentet">
        <div class="content"> 
          <ul>
            <SCRIPT language=javascript> 
<!--

	
    function left_menu(obj){
		var pe = obj.parentNode.parentNode;
	var allp = pe.getElementsByTagName("p");
	var thisp = obj.parentNode.getElementsByTagName("p");
	
	if (thisp[0].style.display=="block"){thisp[0].style.display="none";}
	
	else{
	
	for (i=0;i<allp.length;i++){
	allp[i].style.display="none";
    }
	thisp[0].style.display="block";
	
	}
	}

-->
</SCRIPT>
            <li> 
              <div onClick="javascript:left_menu(this);" style="CURSOR: hand;height:24px;line-height:24px;"><img src="Images/dot_add.gif" align="absmiddle" /> 
                订购流程是怎么样的？</div>
              <p style="DISPLAY:none;background-color:#FFF1E7">·您在网上提交一个订单，按提示付完款后，我们将在您要求的时间送花上门。</p>
            </li>
            <li> 
              <div onClick="javascript:left_menu(this);" style="CURSOR: hand;height:24px;line-height:24px;"><img src="Images/dot_add.gif" align="absmiddle" /> 
                我订鲜花(蛋糕)多久能送到？</div>
              <p style="DISPLAY:none;background-color:#FFF1E7">·3个小时左右就能送到收货人手上.您也可放心提前订购,下单时可自行选择配送时间,我们全国连锁经营,由当地加盟店在您指定日期制作配送，确保准时送达.</p>
            </li>
            <li> 
              <div onClick="javascript:left_menu(this);" style="CURSOR: hand;height:24px;line-height:24px;"><img src="Images/dot_add.gif" align="absmiddle" /> 
                异地送花可以吗？</div>
              <p style="DISPLAY:none;background-color:#FFF1E7">·可以，中国鲜花礼品网全国连锁，全国大部分县级以上城市都可以配送，可送达全国900多个城市。<a href="/help/sendRange.htm" target="_blank"><font color=red>配送范围详情>></font></a> 
              </p>
            </li>
            <li> 
              <div onClick="javascript:left_menu(this);" style="CURSOR: hand;height:24px;line-height:24px;"><img src="Images/dot_add.gif" align="absmiddle" /> 
                可以用支付宝支付吗？</div>
              <p style="DISPLAY:none;background-color:#FFF1E7">·可以，我们是支付宝平台的商企用户，款项为即时支付成功。 
              </p>
            </li>
            <li> 
              <div onClick="javascript:left_menu(this);" style="CURSOR: hand;height:24px;line-height:24px;"><img src="Images/dot_add.gif" align="absmiddle" /> 
                我在国外，请问如何支付？</div>
              <p style="DISPLAY:none;background-color:#FFF1E7">·请参见：<a href="#" target="_blank"><font color=red>境外支付指引</font></a> 
              </p>
            </li>
          </ul>

</div>
</div>
<div class="bottomd"></div>
</div>
<!-- 了解我们END -->

<!-- 浏览记录start -->
<div class="liulanjl">
<div class="title">您最近的浏览记录</div>

<c:forEach items="${requestScope.history}" var="comHistory" begin="1" end="10" step="1" >
	<div class="xxphboxlist4 incontent" id="Latest_Record">
	<div class="inimgboxleft"><a href="MemberDetailServlet?comId=${comHistory.commodityId }" target="_blank"><img src="../admin/upload/thumb/${comHistory.commodityPicture }" alt="${comHistory.commodityName }" style="height:50px;width:50px;" /></a></div>
	<span><a href="MemberDetailServlet?comId=${comHistory.commodityId }" target="_blank">${comHistory.commodityName }</a></span><br />
	<span class="prejg">￥ ${comHistory.commodityPresentPrice }</span>
	</div>
</c:forEach>
</div>
<!-- 浏览记录end -->


<!-- 销售排行start -->
<div class="xxphbox3">
<div class="title">
<h2 class="nowh2" id="ph_tab1" onmouseover="salsRanking('1');">鲜花</h2><h2 class="" id="ph_tab2" onmouseover="salsRanking('2');">蛋糕</h2><h2 class="" id="ph_tab3" onmouseover="salsRanking('3');">公仔</h2>
<div class="clear"></div>
</div>

<div class="content" id="ph_panel1">
<%@include file="salesRanking.jsp" %>
</div>

<div class="content" id="ph_panel2" style="display:none;">
<%@include file="salesRanking2.jsp" %>
</div>

<div class="content" id="ph_panel3" style="display:none;">
<%@include file="salesRanking3.jsp" %>
</div>

<div class="bottomdivbox"></div>
</div>

<!-- 销售排行end -->


<!-- 热销商品start -->
<div class="hotstorep">
<div class="title">相关热销商品</div>
<div class="incontent">
<div class="content">

<c:forEach items="${requestScope.hotCommodity}" var="hotCommodity" varStatus="status">
	<div class="pro_nbox41">
	<div class="imgtop"><a href="MemberDetailServlet?comId=${hotCommodity.commodityId }" title="${hotCommodity.commodityName }" target="_blank"><img src="../admin/upload/thumb/${hotCommodity.commodityPicture }" alt="${hotCommodity.commodityName }" /><br />
		${hotCommodity.commodityName }</a></div>
	<div class="renqi">人气：${hotCommodity.commodityClickNum }</div>
	<div><span class="old_price">市场价：￥${hotCommodity.commodityMarketPrice }</span></div>
	<div><span class="now_price">订购价：<span class="color_hong">￥${hotCommodity.commodityPresentPrice }</span></span></div>
	</div>
   
  </c:forEach>

</div>
</div>
</div>

<!-- 热销商品END -->
</div>
<div class="showright">
<div class="articlename">${requestScope.commodity.commodityName }--${requestScope.commodity.commodityKeyword }&nbsp;<span style="color:#d91616">热卖</span></div>
<div class="proviewtopbox">

<div class="left">

<!-- 商品图片start -->

<div class="maximgbox"><img src="../admin/upload/thumb/${requestScope.commodity.commodityPicture }" onload='javascript:if(this.width>380) this.width=380' alt="鲜花图片">

</div>

<!-- 商品图片END -->

<!-- 分享到start -->
<div class="fenxiang">
<!-- Baidu Button BEGIN -->
    <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
        <span class="bds_more">分享到：</span>
        <a class="bds_qzone"></a>
        <a class="bds_tsina"></a>
        <a class="bds_tqq"></a>
        <a class="bds_renren"></a>
    </div>
<script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=759722" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
	document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>
<!-- Baidu Button END -->
</div>
<!-- 分享到END -->

</div>


<div class="right">

<!-- 商品介绍start -->
<div class="storelview">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="13%" valign="top">类  别：</td>
    <td width="87%">${requestScope.type.parentTypeName }-${requestScope.commodity.typeName }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编  号：${requestScope.commodity.commodityId }</td>
  </tr>
  <tr>
    <td valign="top">材  料：</td>
    <td>${requestScope.commodity.commodityMaterial }</td>
  </tr>
  <tr>
    <td valign="top">包  装：</td>
    <td>${requestScope.commodity.commodityPcak }</td>
  </tr>
<tr>
    <td valign="top">花  语：</td>
    <td>${requestScope.commodity.commodityLanguage }</td>
  </tr>
  
  <tr>
    <td valign="top">附  送：</td>
    <td>免费附送精美贺卡，代写您的祝福。(您下单时可填写留言栏)</td>
  </tr>
  
  <tr>
    <td valign="top">配  送：</td>
    <td>全国（可配送至全国900多城市，<span class="color_hong">市区免配送费</span>）</td>
  </tr>
 
  
  <tr>
    <td valign="top">说  明：</td>
    <td><font color="#FF0000">${requestScope.commodity.commodityDescription }</font></td>
  </tr>

</table>


</div>
<!-- 商品介绍END -->

<!-- 价格start -->

<div class="pricebox" id="ajax_pricebox">
<span id="marketPrice" style="text-decoration:line-through;color:#61645a;">市场价：￥${requestScope.commodity.commodityMarketPrice }</span><br/>
<span>现价：<span style="color:red;font-size:20;font-weight:bold;">￥${requestScope.commodity.commodityPresentPrice }</span></span></div>
				
<!-- 价格END -->
<%-- <div class="putingwc1" style="padding-top:10px; padding-bottom:5px;" id="Btn_AddToCart"><a href="MemberShopServlet?id=${requestScope.commodity.commodityId }"><img src="Images/ingwc_ico.jpg"/></a></div> --%>
<div class="putingwc1" style="padding-top:10px; padding-bottom:5px;" id="Btn_AddToCart"><a href="ShoppingCarServlet?cmd=add&commodityId=${requestScope.commodity.commodityId}&userId=${sessionScope.loginMember.memberId}&commoditynum=1"><img src="Images/ingwc_ico.jpg"/></a></div>
<br /><br />
</div>

<div class="clear"></div>
</div>

<!-- 产品详情start -->
<a name="namexq"></a>
<div class="vaboutbox">
<div class="title">
<h3 class="now">产品详情</h3><h3><a href="#namepj">用户评价</a></h3><h3><a href="#nameserver">选择理由</a></h3><h3><a href="#namegm">常见问题</a></h3>
</div>
<div class="content"> 

<div style="text-align:center;"><p align="center">${requestScope.commodity.commodityDetail }</p></div>

</div>
</div>
<!-- 产品详情end -->

<!-- 用户评价start -->
<a name="namepj"></a>
<div class="vaboutbox">
<div class="title">
<h3><a href="#namexq">产品详情</a></h3><h3 class="now">用户评价</h3><h3><a href="#nameserver">选择理由</a></h3><h3><a href="#namegm">常见问题</a></h3>
</div>
<div class="content">
<!-- 用户评价start -->
<div>
<div class="userpl">



<!-- rightbox -->
<div class="rabox">
<div class="content">
      <div class="incontent2"> <font color="#999999">最新评价（欢迎您登陆会员中心对已送达的订单进行评论）</font>

        <iframe name="fComments" width="100%" border="0" frameborder="0" src="MemberCommentsServlet?comId=${requestScope.commodity.commodityId }">
        
        </iframe>
</div>
</div>
<div class="clear"></div>
</div>


</div>
</div>
<!-- 用户评价end -->
</div>
<div style="clear:both;"></div>
</div>
<!-- 用户评价end -->


<!-- 售后服务start -->
<a name="nameserver"></a>
<div class="vaboutbox">
<div class="title">
<h3><a href="#namexq">产品详情</a></h3><h3><a href="#namepj">用户评价</a></h3><h3 class="now">选择理由</h3><h3><a href="#namegm">常见问题</a></h3>
</div>
<div class="content">
 
        <div> <a href="/profile/why_choose_us.htm" target="_blank"><img src="Images/choosereason.jpg" alt="为什么选择中国鲜花礼品网?" border="0" /></a> 
        </div>
 
</div>
</div>
<!-- 售后服务end -->


<!-- 售后服务start -->
<a name="namegm"></a>
<div class="vaboutbox" style="margin-bottom:0;">
<div class="title">
<h3><a href="#namexq">产品详情</a></h3><h3><a href="#namepj">用户评价</a></h3><h3><a href="#nameserver">选择理由</a></h3><h3 class="now">常见问题</h3>
</div>
      <div class="content"> 
        <div> 
          <p><span class="font_weight"><font color="red">常见问题：</font></span><br />
            <font color=#509207>·我怎么订购？</font><br />
            您在中国鲜花礼品网提交订单，并按提示支付完款项后，我们即按您要求的时间配送上门。<br />
            订购流程：选择商品 → 放入购物车 → 提交我的订单 → 会员购买/非会员购买通道选择 → 填写订单信息 → 支付款项 &nbsp;&nbsp;&nbsp;&nbsp;<a href="/help/demo.htm" target="_blank">订购动画演示&gt;&gt;</a></p>
          <p><br />
            <font color="#509207">·我怎么付款？</font><br />
            可以网上支付、或银行汇款、上门收款。网上支付方式，中国鲜花礼品网支持国内数十家银行卡网上支付，支持Visa、Master信用卡支付，支持Paypal付款，支持国内主要银行信用卡的无磁无密E-POS支付。如果您的银行卡无法网上支付，建议您银行汇款，温馨提醒您：银行ATM机或自助终端上操作转款方便快捷，无需柜台排队，同行均为实时到帐。上门收款指上门向订购人收取款项后安排配送，限指定城市市区。提交订单成功后，将出现您选择的付款方式的操作指引，提前了解可点击 
            <a href="/help/payment.htm" target="_blank">付款方式&gt;&gt;</a> </p>
          <p>&nbsp;</p>
          <p> <font color="#509207">·异地送鲜花/蛋糕可以吗？多久能送到？</font>[具体如：我人在北京，晚上要送花到长沙，可以吗？]<br />
            可以的，中国鲜花礼品网全国连锁经营，最快3个小时左右可送达全国900多个城市，由当地加盟店当天配送前新鲜制作送出。 当然，您也可以完全放心提前订购，提交订单时可自由选择需配送鲜花/蛋糕的时间，我们将按您的要求安排订单，确保在您指定的日期送达。</p>
          <p><br />
            <font color="#509207">·是先付款再配送吗？先付款怎么保证我的东西能按要求送到？</font><br />
            鲜花商品特殊，需先付款后配送，还请您支持和谅解。我们是经营了多年的品牌服务商，有广泛的行业影响，艾瑞排名行业第一，客户的口碑是我们生命，我们将竭尽所能为您提供最好的产品和服务，同时公司有严格的售后服务条款和承诺，确保客户利益，详见下述售后服务说明。</p>
          <p>&nbsp; </p>
          <p><font color="#509207">·送到的鲜花会和图片上的一样吗？</font><br />
            花艺师都是按图片和文字的要求来制作花束，主花材的枝数和颜色完全一致，花束效果因花艺师手法不同可能略有小的区别。</p>
          <p>&nbsp; </p>
          <p><span class="font_weight"><font color=red>关于售后服务：</font></span><br />
            · 我们一直致力于持续提升服务水平，追求零客诉，我们为客户提供完善的售后服务。如果出现误单、花材不符、贺卡有误或者其他任何您不满意的情况，欢迎您第一时间与我们联系，我们将尽快为您做出回复和处理。200%退赔承诺，即如果漏单未送，订单款项全额退还给您，原订单商品同时再免费配送一次，详见 
            <a href="/help/afterservice.htm" target="_blank">售后服务条款&gt;&gt;</a></p>
          <p>&nbsp;</p>
          </div>
 
</div>
</div>
<!-- 售后服务end -->

 
</div>

<div class="clear"></div>
</div>




<%@include file="foot.jsp" %>

<script language="javascript" type="text/javascript">

var tab1=[tab$('ph_tab1'),tab$('ph_tab2'),tab$('ph_tab3')];  //标签的ID(新建标签对象)
                                var panel1=[tab$('ph_panel1'),tab$('ph_panel2'),tab$('ph_panel3')];  //对应的内容BOX的ID（新建内容框对象）
                                var tabCtrl1=document.createTabCtrl(tab1,panel1,'','nowh2','onmouseover');  //(标签对象,内容框对象,'默认的样式','当前标签样式','鼠标触发事件onclick单击onmouseover鼠标经过')
                                tabCtrl1.show(0);
								
								
function showdiv(showid,hiddid){
document.getElementById(hiddid).style.display="none";
document.getElementById(showid).style.display="block";
}
</script>

<!-- Google Code for flowercn homepage Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1069391018;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "666666";
var google_conversion_label = "8G8eCNqr3gEQqrn2_QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1069391018/?label=8G8eCNqr3gEQqrn2_QM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F6eec9bc2dc8e8762d2362afced1e0526' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=759722" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
	document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>


  
</body>
</html>

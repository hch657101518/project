<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta content="zh-cn" http-equiv="Content-Language" />
<title><%=ConfigUtil.getConfig("网站标题").get(0).getConfigValue()%></title>
<meta name="description"
	content="<%=ConfigUtil.getConfig("网站描述").get(0).getConfigValue()%>">
	<meta name="keywords"
		content="<%=ConfigUtil.getConfig("网站关键字").get(0).getConfigValue()%>">
		<link rel="icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="Bookmark" href="/favicon.ico" type="image/x-icon" />
		<link href="CSS/base.css" rel="stylesheet" type="text/css" />
		<link href="CSS/body.css" rel="stylesheet" type="text/css" />
		<link href="http://www.hua.com/" rel="canonical" />
		<!--[if lt IE 7.]>
<script type="text/javascript">
document.execCommand("BackgroundImageCache",false,true);
</script> 
<![endif]-->
		<script src="JS/jquery-1.3.2.min.js" type="text/javascript"></script>
		<script src="JS/comm.js" type="text/javascript"></script>
		<script src="JS/tabchange.js" type="text/javascript"
			language="javascript"></script>
		<meta name="baidu-site-verification" content="psCHUz5JzmLN4s1r" />
</head>
<body>
	<div style="width:990px;margin:5px auto 0px auto;">
		<a href="http://www.hua.com/profile/news_20120319.htm"
			title="hua.com,花的拼音"><img src="Images/top_hua_s.gif"
			alt="hua.com,花的拼音" border="0" width="989" height="43" />
		</a>
	</div>
	<div id="header">
		<%@include file="head1.jsp"%>
		<%@include file="head2.jsp"%>
	</div>

	<!-- TOP部分结束End -->
	<div class="body_content">
		<div class="indexleft">
			<!--商品导购-->

			<!--鲜花导购-->
			<%@include file="GuideFlower.jsp"%>

			<!--蛋糕导购-->
			<%@include file="GuideCake.jsp"%>

			<!--快速导航-->
			<%@include file="GuideQuickNavigate.jsp"%>

			<!--最新订单评价-->
		<%-- 	<%@include file="GuideNewOrders.jsp"%> --%>


			<!--精彩问答专区-->
			<!--精彩问答相关-->
			<%@include file="GuideElse.jsp"%>

			<br>
		</div>
		<div class="indexright">
			<div class="indexrtopbox">
				<div class="hotimg_changebox">
					<!-- 图片切换开始start -->
					<!-- Advertisement -->

					<div id="bannerAdCenterTOP">
						<script type="text/javascript" src="JS/scroll.js"></script>
						<style type="text/css">
#bannerAdCenterTOP {
	width: 568px;
	height: 198px;
	overflow: hidden;
}

.pcontainer,.pcontainer * {
	margin: 0;
	padding: 0;
}

.pcontainer {
	width: 568px;
	height: 198px;
	overflow: hidden;
	position: relative;
}

.pslider {
	position: absolute;
	left: 0;
	top: 0;
}

.pslider li {
	list-style: none;
	display: inline;
}

.pslider img {
	display: block;
}

.pslider2 {
	width: 2000px;
}

.pslider2 li {
	float: left;
}

.pnum {
	position: absolute;
	right: 15px;
	bottom: 5px;
}

.pnum li {
	float: left;
	color: #c51800;
	text-align: center;
	line-height: 16px;
	width: 16px;
	height: 16px;
	font-family: Arial;
	font-size: 12px;
	cursor: pointer;
	overflow: hidden;
	border: 1px solid #c51800;
	background-color: #fff;
	margin: 3px 1px;
}

.pnum li.on {
	color: #fff;
	line-height: 21px;
	width: 21px;
	height: 21px;
	font-size: 16px;
	border: 0;
	background-color: #c51800;
	font-weight: 700;
	margin: 0 1px;
}
</style>
						<div class="pcontainer" id="idTransformView">
							<ul class="pslider" id="idSlider">
								<li><a href="MemberFlowerCateGory?holiday=94&page=1"
									target="_blank"><img src="Images/home_zhongqiu.jpg"
										alt="中秋节鲜花礼品专题" width="568" height="198" border="0" />
								</a>
								</li>
								<li><a href="MemberCakeCateGory?allcake=2" target="_blank"><img
										src="Images/home_birthday.jpg" alt="生日鲜花 生日礼物" width="568"
										height="198" border="0" />
								</a>
								</li>
								<li><a href="MemberGiftServlet?allgift=5" target="_blank"><img
										src="Images/home_mbox.jpg" alt="音乐盒礼品" width="568"
										height="198" border="0" />
								</a>
								</li>

							</ul>
							<ul class="pnum" id="idNum">
								<li>1</li>
								<li>2</li>
								<li>3</li>
							</ul>
						</div>
						<script type="text/javascript">
							window.onload = function() {
								function Each(list, fun) {
									for ( var i = 0, len = list.length; i < len; i++) {
										fun(list[i], i);
									}
								}
								;
								var objs = $$("idNum").getElementsByTagName(
										"li");
								var tv = new TransformView(
										"idTransformView",
										"idSlider",
										198,
										3,
										{
											onStart : function() {
												Each(
														objs,
														function(o, i) {
															o.className = tv.Index == i ? "on"
																	: "";
														})
											}
										});
								tv.Start();
								Each(objs, function(o, i) {
									o.onmouseover = function() {
										o.className = "on";
										tv.Auto = false;
										tv.Index = i;
										tv.Start();
									};
									o.onmouseout = function() {
										o.className = "";
										tv.Auto = true;
										tv.Start();
									};
								});
							};
						</script>
					</div>

					<!-- 图片切换结束End -->
				</div>

				<!-- 为什么选择我们start -->
				<div class="whymebox" id="whyid1">
					<div class="title">
						<h2 class="wtitle">
							<a href="#" target="_blank">为什么选择我们</a>
						</h2>
						<h2 class="ntitle" onmouseover="showdiv('whyid2','whyid1');">公司动态</h2>
					</div>
					<div class="content">
						<ul>
							<li>品牌&nbsp;&nbsp;<a href="#" target="_blank">排名居行业第一</a>
							</li>
							<li>口碑&nbsp;&nbsp;<a href="#" target="_blank">好评如潮 </a>
							</li>
							<li>花艺&nbsp;&nbsp;<a href="#" target="_blank">优秀花艺师团队</a>
							</li>
							<li>高效&nbsp;&nbsp;<a href="#" target="_blank">全国连锁</a>
							</li>
							<li>保障&nbsp;&nbsp;<a href="#" target="_blank">200%退赔承诺</a>
							</li>
						</ul>

					</div>
				</div>
				<div class="whymebox2" id="whyid2">
					<div class="title">
						<h2 class="wtitle" onmouseover="showdiv('whyid1','whyid2');">为什么选择我们</h2>
						<h2 class="ntitle">
							<a href="/profile/news.htm" target="_blank">公司动态</a>
						</h2>
					</div>
					<div class="content">
						<ul>
							<li><a href="#" target="_blank"><span
									style="color:#FF0000">启用hua.com域名</span>
							</a>
							</li>
							<li><a href="#" target="_blank">入选消费者最喜爱网站TOP</a>
							</li>
							<li><a href="#" target="_blank">电子商务大会指定鲜花</a>
							</li>
							<li><a href="#" target="_blank">入选2010中国网上诚信品牌</a>
							</li>
							<!-- <li><a href="#" target="_blank">荣获“APEC e价值榜金种子奖”</a></li> -->
							<!-- <li><a href="#" target="_blank">荣获“中国百佳购物网站”称号</a></li> -->

						</ul>

					</div>
				</div>


				<!-- 为什么选择我们end -->

				<!-- 限时特惠star -->
				<div class="xsthbox margin_T_10px">
					<div class="time">
						<div id="divdown1"></div>
					</div>
					<div class="content">
						<c:forEach items="${requestScope.pricelist}" var="plist"
							varStatus="status">
							<div class="pro_nbox">
								<a href="MemberDetailServlet?comId=${plist.commodityId}"
									target="_blank"><img
									src="../admin/upload/thumb/${plist.commodityPicture} "
									alt='${plist.commodityName}' width="155" height="165" />
								</a><br /> <a href="MemberDetailServlet?comId=${plist.commodityId}"
									title="${plist.commodityName}" target="_blank">${plist.typeName}/${plist.commodityName}</a><br />
								<span class="old_price">市场价：${plist.commodityMarketPrice}</span><br />
								<span class="now_price">订购价：<span class="color_hong">${plist.commodityPresentPrice}</span>
								</span>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- 限时特惠end -->

				<!-- 销售排行start -->
				<%@include file="MostSale.jsp"%>
				<!-- 销售排行end -->
			</div>

			<!-- 热卖鲜花start -->
			<div class="rmxhbox">

				<div class="title">
					<a href="MemberFlowerCateGory?allflower=1&page=1" target="_blank"
						title="更多中国鲜花礼品网热卖鲜花" class="rmxh_more"><span>更多热卖鲜花>></span>
					</a>
				</div>
				<div class="content">
					<c:forEach items="${requestScope.pflist}" var="ptlist"
						varStatus="status">
						<div class="pro_nbox">
							<a href="MemberDetailServlet?comId=${ptlist.commodityId}"
								target="_blank"><img
								src="../admin/upload/thumb/${ptlist.commodityPicture} "
								alt='${plist.commodityName}' width="155" height="165" />
							</a><br /> <a href="MemberDetailServlet?comId=${ptlist.commodityId}"
								title="${ptlist.commodityName}" target="_blank">${ptlist.typeName}/${ptlist.commodityName}</a><br />
							<span class="old_price">市场价：${ptlist.commodityMarketPrice}</span><br />
							<span class="now_price">订购价：<span class="color_hong">${ptlist.commodityPresentPrice}</span>
							</span>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 热卖鲜花END -->


			<!-- 生日蛋糕start -->
			<div class="srdgbox"  style="height:320px" >
				<div class="title">
					<a href="MemberCakeCateGory?allcake=2" target="_blank"
						title="更多生日蛋糕" class="srdg_more"><span>更多生日蛋糕>></span>
					</a>
				</div>
				<div class="content">
					<c:forEach items="${requestScope.cakelist}" var="cklist"
						varStatus="status">
						<div class="pro_nbox">
							<a href="MemberDetailServlet?comId=${cklist.commodityId}"
								target="_blank"><img
								src="../admin/upload/thumb/${cklist.commodityPicture} "
								alt='${cklist.commodityName}' width="155" height="165" />
							</a><br /> <a href="MemberDetailServlet?comId=${cklist.commodityId}"
								title="${cklist.commodityName}" target="_blank">${cklist.commodityName}</a><br />
							<span class="old_price">市场价：${cklist.commodityMarketPrice}</span><br />
							<span class="now_price">订购价：<span class="color_hong">${cklist.commodityPresentPrice}</span>
							</span>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- 生日蛋糕END -->


			<!-- 公仔start -->
			<div class="gzlpbox" style="height:320px">
				<div class="title">
					<a href="MemberGiftServlet?allgift=7" target="_blank"
						title="更多品牌公仔" class="gzlp_more"><span>更多品牌公仔>></span>
					</a>
				</div>
				<div class="content">


					<c:forEach items="${requestScope.dolllist}" var="dlist"
						varStatus="status">
						<div class="pro_nbox">
							<a href="MemberDetailServlet?comId=${dlist.commodityId}"
								target="_blank"><img
								src="../admin/upload/thumb/${dlist.commodityPicture} "
								alt='${dlist.commodityName}' width="155" height="165" />
							</a><br /> <a href="MemberDetailServlet?comId=${dlist.commodityId}"
								title="${dlist.commodityName}" target="_blank">${dlist.commodityName}</a><br />
							<span class="old_price">市场价：${dlist.commodityMarketPrice}</span><br />
							<span class="now_price">订购价：<span class="color_hong">${dlist.commodityPresentPrice}</span>
							</span>
						</div>
					</c:forEach>


				</div>
			</div>
			<!-- 公仔END -->

			<!-- 特色礼品start -->
			<div class="tslpbox" style="height:550px">
				<div class="title">
					<a href="MemberGiftServlet?allgift=5" target="_blank" title="特色礼品"
						class="tslp_more"><span>更多特色礼品>></span>
					</a>
				</div>
				<div class="content">

					<c:forEach items="${requestScope.giftlist}" var="glist"
						varStatus="status">
						<div class="pro_nbox">
							<a href="MemberDetailServlet?comId=${glist.commodityId}"
								target="_blank"><img
								src="../admin/upload/thumb/${glist.commodityPicture} "
								alt='${glist.commodityName}' width="155" height="165" />
							</a><br /> <a href="MemberDetailServlet?comId=${glist.commodityId}"
								target="_blank">${glist.commodityName}</a><br />
							<span class="old_price">市场价：${glist.commodityMarketPrice}</span><br />
							<span class="now_price">订购价：<span class="color_hong">${glist.commodityPresentPrice}</span>
							</span>
						</div>
					</c:forEach>



				</div>
			</div>
			<!-- 特色礼品END -->

			<!-- 花语start -->
			<div class="bottom_helpbox">
				<div class="ttitle">
					<h3>&nbsp;&nbsp;励合鲜花</h3>
					<h3>花语</h3>
					<h3>礼节</h3>
					<h3>&nbsp;&nbsp;鲜花相伴</h3>
					<h3>&nbsp;&nbsp;幸福一生</h3>
				</div>
				<div class="hy_content_right">

					<div class="ullist">
						<h3 class="color_z13 color_hong">鲜花&amp;物语</h3>
						<div class="content">
							<ul>
								<c:forEach items="${requestScope.alist}" var="article1"
									varStatus="status">
									<li><a
										href="memberArticleServlet?aid=${article1.articleId}"
										target="_blank">${article1.articleTitle}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="ullist">
						<h3 class="color_z13 color_blue">蛋糕&amp;常识</h3>
						<div class="content">
							<ul>
								<c:forEach items="${requestScope.alist2}" var="article2"
									varStatus="status">
									<li><a
										href="memberArticleServlet?aid=${article2.articleId}"
										target="_blank">${article2.articleTitle}</a>
									</li>
								</c:forEach>
							</ul>
							</ul>
						</div>
					</div>
					<div class="ullist">
						<h3 class="color_z13 color_green">送礼&amp;祝福</h3>
						<div class="content">
							<ul>
								<c:forEach items="${requestScope.alist1}" var="article3"
									varStatus="status">
									<li><a
										href="memberArticleServlet?aid=${article3.articleId}"
										target="_blank">${article3.articleTitle}</a>
									</li>
								</c:forEach>
							</ul>
							</ul>
						</div>
					</div>
				</div>

			</div>
			<!-- 花语start -->



		</div>

		<div class="clear"></div>
	</div>






	<%@include file="foot.jsp"%>

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
	<script type="text/javascript"
		src="http://www.googleadservices.com/pagead/conversion.js">
</script>
	<noscript>
		<div style="display:inline;">
			<img height="1" width="1" style="border-style:none;" alt=""
				src="http://www.googleadservices.com/pagead/conversion/1069391018/?label=8G8eCNqr3gEQqrn2_QM&amp;guid=ON&amp;script=0" />
		</div>
	</noscript>
	<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F6eec9bc2dc8e8762d2362afced1e0526' type='text/javascript'%3E%3C/script%3E"));
</script>

	<script type="text/javascript" id="bdshare_js"
		data="type=tools&amp;uid=759722"></script>
	<script type="text/javascript" id="bdshell_js"></script>
	<script type="text/javascript">
	document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>
</body>
</html>
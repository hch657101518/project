<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/MyPage.tld" prefix="pt"%>
<%
	//花材
	request.setAttribute("hcList", ConfigUtil.getConfig("花材"));
	//花类
	request.setAttribute("hlList", ConfigUtil.getConfig("花类"));
	//节日
	request.setAttribute("jrList", ConfigUtil.getConfig("节日"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>鲜花类别</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="zh-cn" http-equiv="Content-Language" />
<script language="javascript" src="JS/jquery.js"></script>
<link href="CSS/base.css" rel="stylesheet" type="text/css" />
<link href="CSS/body.css" rel="stylesheet" type="text/css" />
<script src="JS/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="JS/comm.js" type="text/javascript"></script>
<script src="JS/tabchange.js" type="text/javascript"
	language="javascript"></script>
<script language="javascript">



function check(){
	var str='<%=request.getParameter("use")%>';
	var all='<%=request.getParameter("allflower")%>';
		if(str=='null' && all=='null'){
			hotFlower.style.display = "none";//隐藏
		} else {
			hotFlower.style.display = "";//显示
		}
	}

</script>

</head>
<body onload="check()">
	<div style="width: 990px; margin: 5px auto 0px auto;">
		<a href="IndexPage" title="励合鲜花礼品网首页"><img
			src="Images/top_hua_s.gif" alt="励合鲜花礼品网首页" border="0" width="989"
			height="43" /> </a>
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
			<%@include file="GuideNewOrders.jsp"%>



		</div>
		<div class="indexright">
			<div class="intopdqwz_box">
				<h4>
					<a href="IndexPage" title="励合鲜花礼品网首页">首页</a> >&nbsp;&nbsp;鲜花
					&nbsp;> ${Message }
				</h4>

			</div>
			<!--热销推荐Start-->
			<div class="rxtj_box" id="hotFlower">
				<div class="title">热销${Message }</div>
				<c:forEach items="${requestScope.HotCateGoryList}" var="hotcategory"
					varStatus="status">
					<div class="content">
						<div class="pro_nbox5">
							<div class="imgleft">
								<a href="MemberDetailServlet?comId=${hotcategory.commodityId }"
									title="${hotcategory.commodityName }" target="_blank"><img
									src="../admin/upload/thumb/${hotcategory.commodityPicture }" />
								</a>
							</div>
							<div class="proritext">
								<a href="MemberDetailServlet?comId=${hotcategory.commodityId }"
									target="_blank">${hotcategory.commodityName }</a> <br /> <span
									class="old_price">市场价：￥${hotcategory.commodityMarketPrice
									}</span> <br /> <span class="now_price">订购价：<span
									class="color_hong">￥${hotcategory.commodityPresentPrice
										}</span> </span> <br /> <br /> <a
									href="MemberShopServlet?id=${hotcategory.commodityId }"
									title="立即订购"><img src="../member/Images/dgbtn01.gif"
									alt="立即订购" border="0" /> </a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!--热销推荐END-->

			<!--颜色选择STAR-->

			<div class="basebox_d_colorbox margin_B_10px">
				<div class="title">鲜花选购</div>
				<div class="content">

					<table width="100%" border="0" cellspacing="0" cellpadding="5">
						<tr>
							<td width="8%" class="color_h_c">按颜色：</td>
							<td width="92%">
								<div class="search_color">
									<a href="MemberFlowerCateGory?color=1" class="colorbtn_red"
										title="红色"></a> <a href="MemberFlowerCateGory?color=2"
										class="colorbtn_red2" title="粉色"></a> <a
										href="MemberFlowerCateGory?color=3" class="colorbtn_yellow2"
										title="黄色"></a> <a href="MemberFlowerCateGory?color=4"
										class="colorbtn_white" title="白色"></a> <a
										href="MemberFlowerCateGory?color=5" class="colorbtn_purple"
										title="紫色"></a> <a href="MemberFlowerCateGory?color=6"
										class="colorbtn_blue" title="蓝色"></a> <a
										href="MemberFlowerCateGory?color=7" class="colorbtn_yellow"
										title="香槟色"></a>
								</div></td>
						</tr>
						<tr>
							<td class="color_h_c">按枝数：</td>
							<td class="zs_list">
								<p>
									<span><a href="MemberFlowerCateGory?num=9" title="9枝">9枝</a>
									</span><span><a href="MemberFlowerCateGory?num=11" title="11枝">11枝</a>
									</span><span><a href="MemberFlowerCateGory?num=12" title="12枝">12枝</a>
									</span><span><a href="MemberFlowerCateGory?num=16" title="16枝">16枝</a>
									</span><span><a href="MemberFlowerCateGory?num=19" title="19枝">19枝</a>
									</span><span><a href="MemberFlowerCateGory?num=20" title="20枝">20枝</a>
									</span><span><a href="MemberFlowerCateGory?num=22" title="22枝">22枝</a>
									</span><span><a href="MemberFlowerCateGory?num=29" title="29枝">29枝</a>
									</span><span><a href="MemberFlowerCateGory?num=33" title="33枝">33枝</a>
									</span><span><a href="MemberFlowerCateGory?num=50" title="50枝">50枝</a>
									</span><span><a href="MemberFlowerCateGory?num=66" title="66枝">66枝</a>
									</span><span><a href="MemberFlowerCateGory?num=99" title="99枝">99枝</a>
									</span><span><a href="MemberFlowerCateGory?num=999"
										title="999枝">999枝</a> </span> <br class="clear" />
								</p></td>
						</tr>
					</table>


					<div class="fl_zishubox"></div>

				</div>

			</div>

			<!--颜色选择END-->


			<!--鲜花列表STAR-->

			<div class="xhlb_box">
				<div class="title">
					<span class="selectbox"> </span>
					<h2>${Message }列表</h2>
				</div>
				<div class="listcontent">
					<div class="incontent">
						<c:forEach items="${requestScope.CateGoryList}" var="category"
							varStatus="status">
							<div class="pro_nbox3">
								<div class="imgtop">
									<a href="MemberDetailServlet?comId=${category.commodityId }"
										title="${category.commodityName }" target="_blank"><img
										src="../admin/upload/thumb/${category.commodityPicture }"
										alt="${category.commodityName }" /> </a> <a
										href="MemberDetailServlet?comId=${category.commodityId }"
										title="${category.commodityName }" target="_blank">${category.commodityName
										} </a>
								</div>
								<div>
									<span class="old_price">市场价：￥${category.commodityMarketPrice
										}</span>
								</div>
								<div>
									<span class="now_price">订购价：<span class="color_hong">￥${category.commodityPresentPrice
											}</span> </span>
								</div>
								<div class="btnbox">
									<a href="MemberShopServlet?id=${category.commodityId }"><img
										src="../member/Images/ljdg_bgn.gif" alt="立即订购" border="0" />
									</a><a href="MemberDetailServlet?comId=${category.commodityId }"><img
										src="../member/Images/view_btn.gif" alt="详细" border="0" /> </a>
								</div>
							</div>
						</c:forEach>
						<div class="clear"></div>
						<!--分页start-->
						<div>
							<pt:page pageIndex="${currentPage }"
								url="MemberFlowerCateGory?allflower=${param.allflower }&use=${param.use }&floral=${param.floral }&category=${param.category }&color=${param.color }&num=${param.num }&price=${param.price }&holiday=${param.holiday }&"
								pageMax="${totalPage }" />
						</div>

						<!--分页end-->
					</div>
				</div>
				<!--分页end-->

			</div>
		</div>
	</div>

	<!--鲜花列表END-->
	</div>

	<div class="clear"></div>
	</div>

	<!-- 底部start -->
	<%@include file="foot.jsp"%>
	<!-- 底部END -->

</body>
</html>

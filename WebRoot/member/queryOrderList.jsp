<%@ page language="java" import="java.util.*,util.*,entity.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta content="zh-cn" http-equiv="Content-Language" />
		<title>查询订单</title>
		<meta name="description" content="购物车-中国鲜花礼品网,国内领先鲜花速递服务商">
			<meta name="keywords" content="购物车-中国鲜花礼品网">
				<link href="CSS/base.css" rel="stylesheet"
					type="text/css" />
				<link href="CSS/carbodybox.css" rel="stylesheet"
					type="text/css" />
					<script src="JS/jquery-1.3.2.min.js"></script>
<script language=javascript>
/* function goto1()
 { 
  window.location.href="send_info.jsp"
 }
function histo()
 { 
  window.location.href="IndexPage";
  }
function updatePrice(oval,oid){
	if(isNaN(oval)){
		alert("商品数量请输入数字！");
		return;
	}
	$.post("MemberShopServlet",{id:oid,type:"update",num:oval},function(data){
		$("#spanTotal").html("￥"+data);
	});
}
function delItem(oid){
	if(confirm("是否确定要删除该商品项？")){
		$.post("MemberShopServlet",{id:oid,type:"del"},function(data){
			$("#spanTotal").html("￥"+data);
			$("#tr"+oid).remove();
		});
		//window.location.href="http://localhost:8080/Flower/member/shopNothing.jsp";
	}
}
function clean(oid){
	if(confirm("是否确定要删除所有商品项？")){
		$.post("MemberShopServlet",{id:oid,type:"delAll"},function(data){
			$("#spanTotal").html("￥"+data);
		//删除页面的元素
			$(this).remove();
		});
	
	}
} */
				</script>
	</head>

	<body>
		<div id="header2">
			<%@include file="head1.jsp" %>
		</div>

		<!-- TOP部分结束End -->


		<!-- TOP当前位置start -->
		<div class="topdqwz_box">
			<div class="intopdqwz_box">
				<h4>
					<a href="IndexPage" title="首页">首页</a>
				</h4>
				<span>购物车</span>
			</div>

		</div>
		<!-- TOP当前位置End 
		private long ordersid;
	private long commodityId;
	private String commodityName;
	private String commoditydetail;
	private double ordersdetpic;
	private Date Orders_ord_time;
	private int ordersStatus;
	private int ordersdetnum;
		-->


		<div class="carbodybox">

			<div class="content">
			<div class="carttbox1"></div>
			<form Action="MemberSend_infoServlet" Method="POST" name="form1">
					<div class="storpboxtab">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"bgcolor="dddddd">
					<tr>
					
					<th bgcolor="#FFFFFF" style="text-align: left;">商品编号</th>					
					<th bgcolor="#FFFFFF">商品</th>	
					<th bgcolor="#FFFFFF">商品名</th>			
					<th bgcolor="#FFFFFF">价格</th>					
					<th bgcolor="#FFFFFF">数量</th>							
					<th bgcolor="#FFFFFF">购买时间</th>
					<th bgcolor="#FFFFFF">状态</th>									
					</tr>										
			<c:forEach  items="${list}"  var="item">
			     <tr ><td bgcolor="#FFFFFF" colspan="7">订单编号:${item.ordersid}</td></tr>
				<tr id="tr${item.commodityId }" class="shop">
						<td bgcolor="#FFFFFF">${item.commodityId }</td>
						<td align="left" bgcolor="#FFFFFF" style="text-align:left;"><a href="MemberDetailServlet?comId=${item.commodityId}" target="_blank"><img src="../admin/upload/thumb/${item.url }" alt="加载失败" width="48" height="51" align="absmiddle" /></u></a> </td>						<%-- <td bgcolor="#FFFFFF">${item.ordersdetpic }</td> --%>
						<td bgcolor="#FFFFFF"><font color=red>￥${item.ordersdetpic }</font></td>
						<td bgcolor="#FFFFFF">${item.ordersdetnum }</td>
						<td bgcolor="#FFFFFF">${item.ordersOrdTime }</td>
						<td bgcolor="#FFFFFF">${item.ordersdetnum }</td>
						<td bgcolor="#FFFFFF">${item.ordersStatus }</td>
						
				</tr>							
				</c:forEach>
							</table>

							<%-- <div class="spzj">
								合计：
								<span class="color_hongw" id="spanTotal">￥${total }</span>元
							</div>


							<div class="postbtnbox">
								<span class="a1"><a href="ShopClear.jsp" onClick="clean(${item.id })"><img
											src="Images/clearcart.jpg" alt="" align="absmiddle" /><font
										color="#77aa33"><u>清空购物车</u>
									</font>
								</a>
								</span>
								<input type="button" value="继续挑选商品" onClick="histo();" 
									class="goonbtn" />
								<input type="button" value="提交我的订单" 
									onClick="goto1();"
									class="postmyddbtn" />

							</div> --%>

						</div>
				</form>





<!-- 版权开始 -->
<%@include file="foot.jsp" %>





		
	</body>
</html>

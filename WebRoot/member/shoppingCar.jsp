<%@ page language="java" import="java.util.*,util.*,entity.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta content="zh-cn" http-equiv="Content-Language" />
		<title>购物车-中国鲜花礼品网</title>
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
   document.getElementById("form1").submit();
  //window.location.href="send_info.jsp";
 } */
function histo()
 { 
  window.location.href="IndexPage";
  }
function updatePrice(oval,oid,mid){
	if(isNaN(oval)){
		alert("商品数量请输入数字！");
		return;
	}
	
	$.post("ShoppingCarServlet",{commodityId:oid,cmd:"update",commoditynum:oval,userId:mid},function(data){
		if($("#rowid"+oid).is(":checked")){
		  
		  var num=parseFloat($("#spanTotal").text());
		  var num2=parseFloat(data);
		var total=num+num2;
		alert(data);
		$("#spanTotal").html(total); 
		  
		
		}
		
	});
}
function delItem(mid,cid){
	if(confirm("是否确定要删除该商品项？")){
	$.post("ShoppingCarServlet",{commodityId:cid,cmd:"del",userId:mid},function(data){
		if($("#rowid"+cid).is(":checked")){
		  
		  	var num=parseFloat($("#spanTotal").text());
		  	var num2=parseFloat(data);
			var total=num-num2;
			alert(data);
			$("#spanTotal").html(total);
			
		}
			$("#tr"+cid).remove();
		});
		
		
		
	}
	
}
function clean(){
var  mid=$("#userId").val();
	if(confirm("是否确定要删除所有商品项？")===true){
		$.post("ShoppingCarServlet",{userId:mid,cmd:"delAll"},function(data){
			$("#spanTotal").html(data);
		window.location.href="ShopClear.jsp";
			
			$(this).remove();
		});
	
	}
}
function changtotal(oid,mid){
     
     alert($("#rowid"+oid).is(":checked"));
     var num=parseFloat($("#spanTotal").text());
     if($("#rowid"+oid).is(":checked"))
    {
       $.post("ShoppingCarServlet",{commodityId:oid,cmd:"setcar",userId:mid},function(data){
		var num2=parseFloat(data);
		var total=num+num2;
		alert(data);
		$("#spanTotal").html(total);}); 
    
    }else{
        $.post("ShoppingCarServlet",{commodityId:oid,cmd:"setcar",userId:mid},function(data){
		var num2=parseFloat(data);
		var total=num-num2;
		alert(data);
		$("#spanTotal").html(total);});
       
    }

	
}


$(function(){
  $("#checkAll").click(function(){
  alert(111);
  var mid=$("#userId").val();
  alert(mid);
  var carids=   document.getElementsByName("carid");
  for(var i=0;i<carids.length;i++){
      carids[i].checked=this.checked;
  }
  if(this.checked){
     $.post("ShoppingCarServlet",{cmd:"list",userId:mid},function(data){
		alert(data);
		$("#spanTotal").html(data);});
  
  }else{
      $("#spanTotal").html(0.0);
  
  }
  // $("input[name='carid']").prop("checked",this.checked);
/*   checkAll(this.checked); */
  });


});






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
		<!-- TOP当前位置End -->


		<div class="carbodybox">

			<div class="content">
			<div class="carttbox1"></div>
			<form Action="ShoppingcarRequestServlet" Method="POST" name="form1">
					<div class="storpboxtab">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"bgcolor="dddddd">
					<tr>
					<th bgcolor="#FFFFFF">编号</th>
					<th bgcolor="#FFFFFF" style="text-align: left;">商品名称	</th>					
					<th bgcolor="#FFFFFF">市场价	</th>				
					<th bgcolor="#FFFFFF">订购价</th>					
					<th bgcolor="#FFFFFF">数量</th>							
					<th bgcolor="#FFFFFF">删除商品</th>								
					</tr>										
			<c:forEach var="item" items="${carlist}">
				<tr id="tr${item.CID}" class="shop">
				
						<td bgcolor="#FFFFFF"><input id="rowid${item.CID}" type="checkbox"  value="${item.CID}" name="carid" onchange="changtotal(${item.CID},${item.MID})" />${item.CID }</td>
						<td align="left" bgcolor="#FFFFFF" style="text-align: left;">				
						<%-- <td align="left" bgcolor="#FFFFFF" style="text-align:left;"><a href="MemberDetailServlet?comId=${item.CID}" target="_blank"><img src="../admin/upload/thumb/${item.url }" alt="${shopItem.name }" width="48" height="51" align="absmiddle" />${item.CNAME }</u></a> </td> --%>	
							<a href="MemberDetailServlet?comId=${item.CID}" target="_blank"><img src="../admin/upload/thumb/${item.url}"	alt="${item.CNAME }" width="48" height="51" align="absmiddle" /><u>${item.CNAME }</u>
										</a></td>
						<td bgcolor="#FFFFFF">￥${item.CMP }</td>
						<td bgcolor="#FFFFFF"><font color=red>￥${item.CPP }</font></td>
						<td bgcolor="#FFFFFF"><input type="text" Name="Q_1205" Value="${item.SCN }" onchange="updatePrice(this.value,${item.CID},${item.MID});" Size="2"></td>
						<td bgcolor="#FFFFFF"><a href="#" onclick="delItem(${item.MID},${item.CID});" ><img src="Images/04shop_deleteID.gif" border="0"></a></td>
						<%-- <td bgcolor="#FFFFFF"><a href="ShoppingCarServlet?cmd=del&userId=${item.MID}&commodityId=${item.CID}" onclick="delItem();" ><img src="Images/04shop_deleteID.gif" border="0"></a></td> --%>
				</tr>							
				</c:forEach>
							</table>

							<div class="spzj">
							   <span style="margin-right: 80%;"><input type="checkbox" id="checkAll" />全选/全不选</span>
								合计：
								<span class="color_hongw" id="spanTotal">${total}</span>元
							</div>


							<div class="postbtnbox">
								<span class="a1"><a href="#" onClick="clean()"><img
											src="Images/clearcart.jpg" alt="" align="absmiddle" /><font
										color="#77aa33"><u>清空购物车</u>
									</font>
								</a>
								</span>
								<input type="button" value="继续挑选商品" onClick="histo();" 
									class="goonbtn" />
								<!-- <input type="button" value="提交我的订单" 
									onClick="goto1();"
									class="postmyddbtn" /> -->
									<input type="submit" value="提交我的订单" 
									
									class="postmyddbtn" />

							</div>

						</div>
				</form>





<!-- 版权开始 -->
<%@include file="foot.jsp" %>





		
	</body>
</html>

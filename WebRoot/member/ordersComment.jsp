<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
	request.setCharacterEncoding("utf-8");
	String ordersId=request.getParameter("id");
	OrdersDao ordersDao = new OrdersDao();
	CommentsDao commenstDao = new CommentsDao();
	ArrayList<Commodity> commodityList = ordersDao.queryOrdersDetbyId(ordersId);
	for(int i=0;i<commodityList.size();i++){
		if(commenstDao.isComment(ordersId,String.valueOf(commodityList.get(i).getCommodityId()))){
			commodityList.remove(i);
			i--;
		}
	}
	
 %>
 
<html>
<head>
	<title>商品评论</title>
<script src="JS/jquery-1.3.2.min.js" type="text/javascript"></script>
<style type="text/css">
img{
cursor: pointer;
}
</style>
</head>
 <script>
 function comment(num){
	 var ordersId=document.getElementById("ordersId").value;
	 var ip=document.getElementById("hidIp").value;
	 var sco = document.getElementById("hidSco"+num).value;
	 var content=document.getElementById("ta"+num).value;
	 if(num!="0"){
		 var comId = document.getElementById("divId"+num).innerHTML;
		 $.post("MemberAddCommentServlet",{commodityId:comId,score:sco,ordersId:ordersId,content:content,ip:ip},
				function(data){
					if(data>0){
						alert("评论成功！");
						//从页面移除商品
						var index=document.getElementById("tr"+num).rowIndex;
						document.getElementById("tabComments").deleteRow(index);
					}else{
						alert("评论失败！");
					}
		 		}
		 );
	 }else{
		 var objs=document.getElementsByName("chCommodity");
		 for(var i=0;i<objs.length;i++){
			 if(objs[i].checked){
				 var n=objs[i].value;
				 var comId=document.getElementById("divId"+n).innerHTML;
				 
			 	$.post("MemberAddCommentServlet",{commodityId:comId,score:sco,ordersId:ordersId,content:content,ip:ip},
						function(data){
							if(data>0){
								//隐藏遮罩层
								
							}else{
								alert("商品评论失败！");
								return false;
							}
				 		}
				 );
			 }
		 }
		 alert("评论成功！");
	 }
	 $.close('84831253');
 }

function score(num,ind){
	var str="";
	if(ind>=0){
		for(var i=1;i<=5;i++){
			if(i<=num){
				str+="<img src =\"Images/review_star_fen.gif\" onclick=\"score("+i+","+ind+");\"/>";
			}else{
				str+="<img src =\"Images/review_star_fen_gray.gif\" onclick=\"score("+i+","+ind+");\"/>";
			}
		}
		document.getElementById("hidSco"+ind).value=num;
		var divScore1 = document.getElementById("divScore"+ind);
		divScore1.innerHTML=(str);
	}else{
		for(var i=1;i<=5;i++){
			if(i<=num){
				str+="<img src =\"Images/review_star_fen.gif\" onclick=\"score("+i+",-1);\"/>";
			}else{
				str+="<img src =\"Images/review_star_fen_gray.gif\" onclick=\"score("+i+",-1);\"/>";
			}
		}
		document.getElementById("hidSco0").value=num;
		var divScore0 = document.getElementById("divScore0");
		divScore0.innerHTML=(str);
	}
	
}

function showDetail(num){
	var hid=document.getElementById("hidDetail"+num).value;
	if(hid=='0'){
		document.getElementById("detail"+num).style.display="";
		document.getElementById("hidDetail"+num).value="1";
	}else{
		document.getElementById("detail"+num).style.display="none";
		document.getElementById("hidDetail"+num).value="0";
	}
}
	 
 </script>
 <body>
<div class="inbasebox_R">
<div class="topht"></div>
<div class="member_rightbox">

<div class="content">
  <div><form action="" method="post">
  	<input type="hidden" id="ordersId" name="ordersId" value="<%=ordersId %>"/>
  	<input type="hidden" id="hidIp" value="${pageContext.request.remoteAddr }"/>
    <table width="80%" align="center" id="tabComments">
    <tr><th align="center">评论商品</th></tr>
    <c:forEach items="<%=commodityList %>" var="commodity" varStatus="status">
    <tr id="tr${status.index+1 }"><td>
        <table width="95%" border="1px" align=center cellpadding="5" cellspacing="0" bordercolor="#77aa33" style="border-collapse:collapse;">
          <tr> 
          	<td rowspan="3" align="center" width="20%"><input type="checkBox" name="chCommodity" value="${status.index+1  }" /></td>
            <td rowspan="3" align="center" width="40%"><img alt="${commodity.commodityName }" src="../admin/upload/thumb/${commodity.commodityPicture }" height="60" width="60"/></td>
			<td><font size="2" width="40%">商品名称：<div id="divName${status.index+1 }" style="display:inline;">${commodity.commodityName }</div></font></td>
          </tr>
          <tr>
          	<td><font size="2">鲜花花语：<div id="divLanguage${status.index+1 }" style="padding-left: 20px;">${commodity.commodityLanguage }</div></font></td>
          </tr>
          <tr>
          	<td><font size="2"><a href="#" style="text-decoration:none;" onclick="showDetail(${status.index+1 });">查看详情</a></font><input type="hidden" id="hidDetail${status.index+1 }" value="0"/></td>
          </tr>
          <tr id="detail${status.index+1 }" style="display:none;">
          	<td colspan="3"><div><table width="100%" align="center" style="font-size: 14;">
          	<tr><td align="center"><div>商品编号：</div></td><td align="left"><div  id="divId${status.index+1 }">${commodity.commodityId }</div></td>
          		<td align="center"><div>商品类型：</div></td><td align="left"><div>${commodity.typeName }</div></td></tr>
          	<tr><td align="center"><div>市场价：</div></td><td align="left"><div>${commodity.commodityMarketPrice }</div></td>
          		<td align="center"><div>现价：</div></td><td align="left"><div>${commodity.commodityPresentPrice }</div></td></tr>
          	<tr><td align="center"><div>材料：</div></td><td colspan="3" align="left"><div>${commodity.commodityMaterial }</div></td></tr>
          	<tr><td align="center"><div>包装：</div></td><td colspan="3" align="left"><div>${commodity.commodityPcak }</div></td></tr>
          	<tr><td align="center"><div>说明：</div></td><td colspan="3" align="left"><div>${commodity.commodityDescription }</div></td></tr>
<%--          	<tr><td align="center"><div>详情：</div></td><td colspan="3" align="center"><div>${commodity.commodityDetail }</div></td></tr>--%>
          	</table>
          	</div></td>
          </tr>
          <tr><td colspan="3" align="left">发表评论：
          <div id="divScore${status.index+1 }" style="display:inline;">
          <img src="Images/review_star_fen.gif" onclick="score(1,'${status.index+1 }')"/><img src="Images/review_star_fen.gif" onclick="score(2,'${status.index+1 }')"/><img src="Images/review_star_fen.gif" onclick="score(3,'${status.index+1 }')"/><img src="Images/review_star_fen.gif" onclick="score(4,'${status.index+1 }')"/><img src="Images/review_star_fen.gif" onclick="score(5,'${status.index+1 }')"/>
          </div>
          <input id="hidSco${status.index+1 }" type="hidden" value="5" /></td></tr>
          <tr><td colspan="3" width="100%">
          		<textarea id="ta${status.index+1 }" rows="5" cols="60"></textarea></td></tr>
          <tr><td align="center" colspan="3"><input type="button" value="" style="background-color:#A5E2F7;background-image: url(Images/comment.jpg);border: 0px;height:25px;width:80px;" onclick="comment('${status.index+1 }')"/></td></tr>
        </table></td>
      </tr>
      
      
      </c:forEach>
      <tr><td>&nbsp;</td></tr>
      <tr><td>&nbsp;</td></tr>
      <tr><td colspan="3" align="left"style="padding-left: 20px;"><font>多项评论：</font>
      <div id="divScore0" style="display:inline;">
	      <img src="Images/review_star_fen.gif" onclick="score(1,-1)"/><img src="Images/review_star_fen.gif" onclick="score(2,-1)"/><img src="Images/review_star_fen.gif" onclick="score(3,-1)"/><img src="Images/review_star_fen.gif" onclick="score(4,-1)"/><img src="Images/review_star_fen.gif" onclick="score(5,-1)"/></div><input id="hidSco0" type="hidden" value="5" />
      </td></tr>
      <tr><td colspan="3" width="100%" style="padding-left: 20px;">
          		<textarea id="ta0" rows="5" cols="60"></textarea></td></tr>
      <tr><td align="center" colspan="3"><input type="button" value="" style="background-color:#A5E2F7;background-image: url(Images/commentAll.jpg);border: 0px;height:25px;width:80px;" onclick="comment(0);"/></td></tr>
      
      
    </table>
        
        
        
     
        </form></div>
</div>
</div>
<br class="clear" />
<div class="bottomht"></div>
</div>
<div class="clear"></div>


</body>
</html>
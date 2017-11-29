<%@ page language="java" import="java.util.*,entity.*,dao.*"
	pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//显示未发货订单
	int i=0;
	int nextPage=0;
	int lastPage=0;
	int ordersCount=0;
	int pageCount=0;
	int pageSize=8;
	int currentPage=1;
	
	String[] list=new String[1000];
	int[] listid=new int[1000];
	int j=-1;
	int l=-1;
	int k=-1;
	
	OrdersDao ordersDao = new OrdersDao();
	ordersCount = ordersDao.getCount1();//得到会员的总数量值
	String str = null;
	String string = null;
	pageCount = (ordersCount+(pageSize-1))/pageSize;//计算页数
	if(request.getParameter("page")!=null){
		currentPage = Integer.parseInt(request.getParameter("page"));
	}
	//根据当前页数和一页显示的数量查询该页要显示的会员集合
	ArrayList<OrdersStatu> orderList = ordersDao.queryByPageStatus1(currentPage,pageSize);
	for(int t=0 ;t<orderList.size();t++){
		if("0".equals(orderList.get(i).getOrdersPaymen())){
	string="未付款";
		}
		else if("1".equals(orderList.get(i).getOrdersPaymen())){
	string="已付款";
		}
	
	}
	 for(int t=0 ;t<orderList.size();t++){
		list[t]=orderList.get(t).getOrdersStatus();
	}
	//获取ordersID
	  for(int t=0 ;t<orderList.size();t++){
		  listid[t]=orderList.get(t).getOrdersId();
		
		
		}
	nextPage = currentPage==pageCount ? currentPage:currentPage+1;
	lastPage = currentPage==1?currentPage:currentPage-1;
	request.setAttribute("orderList", orderList);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>会员管理系统</title>
<style type="text/css">
<!--
把图片边框设为0，不然带超链接的图片外围有颜色边框 -->img {
	border: none
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 14px
}

.STYLE3 {
	font-size: 16px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 14px;
}
</style>
<script language="javascript" src="js/jquery.js"></script>

</head>

<body>
	<form id="form1" name="form1" method="post" action="">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="30" background="tab/images/tab_05.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="30"><img src="tab/images/tab_03.gif"
								width="12" height="30" /></td>
							<td><table width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td width="46%" valign="middle"><table width="100%"
												border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td width="5%"><div align="center">
															<img src="tab/images/tb.gif" width="16" height="16" />
														</div></td>
													<td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[订单管理]-[显示未发货订单]</td>
												</tr>
											</table></td>
										<td width="54%"><table border="0" align="right"
												cellpadding="0" cellspacing="0">
												<tr>
													<td width="60"><table width="87%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1"><div align="center">
																		<input type="checkbox" name="checkbox62"
																			value="checkbox" />
																	</div></td>
																<td class="STYLE1"><div align="center">全选</div></td>
															</tr>
														</table></td>
													<td width="60"><table width="90%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1"><div align="center">
																		<img src="tab/tab/images/22.gif" width="14"
																			height="14" />
																	</div></td>
																<td class="STYLE1"><div align="center">新增</div></td>
															</tr>
														</table></td>
													<td width="60"><table width="90%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1"><div align="center">
																		<img src="tab/images/33.gif" width="14" height="14" />
																	</div></td>
																<td class="STYLE1"><div align="center">修改</div></td>
															</tr>
														</table></td>
													<td width="52"><table width="88%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td class="STYLE1"><div align="center">
																		<img src="tab/images/11.gif" width="14" height="14" />
																	</div></td>
																<td class="STYLE1"><div align="center">删除</div></td>
															</tr>
														</table></td>
												</tr>
											</table></td>
									</tr>
								</table></td>
							<td width="16"><img src="tab/images/tab_07.gif" width="16"
								height="30" /></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td width="8" background="tab/images/tab_12.gif">&nbsp;</td>
							<td><table width="100%" border="0" cellpadding="0"
									cellspacing="1" bgcolor="#0080ff" onmouseover="changeto()"
									onmouseout="changeback()">
									<tr>
										<td width="3%" height="22" background="tab/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<input type="checkbox" name="checkbox" value="checkbox"
													onclick="selectall('checkbox2')" />
											</div></td>
										<td width="7%" height="22" background="tab/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">订单编号</span>
											</div></td>
										<td width="8%" height="22" background="tab/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">收货人</span>
											</div></td>
										<td width="14%" height="22" background="tab/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">收货地址</span>
											</div></td>
										<td width="18%" background="tab/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">收货人号码</span>
											</div></td>
										<!-- <td width="22%" height="22" background="tab/images/bg.gif"
											bgcolor="#FFFFFF"><div align="center">
												<span class="STYLE1">是否付款</span>
											</div></td> -->
										<td width="8%" height="22" background="tab/images/bg.gif"
											bgcolor="#FFFFFF" class="STYLE1"><div align="center">订单状态</div></td>
										<td width="8%" height="22" background="tab/images/bg.gif"
											bgcolor="#FFFFFF" class="STYLE1"><div align="center">订单详情</div></td>
									</tr>
									<c:forEach items="${requestScope.orderList}" var="Order" 
										varStatus="status">
										<%++j;%>
										<%++l;%>
										<%++k;%>
										
										<input type="hidden" value="${status.index}" id="s"/>
										<input type="hidden" value="<%=listid[l]%>" id="ordersid<%=k%>" />
										<input type="hidden" value="<%=list[j]%>" id="ordersstatus<%=k%>" />
									
										<tr>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
										<input type="checkbox" name="checkbox2"
											value="${member.memberId}"
											id="select" onclick="select1(${Order.ordersId});" />
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center"
													class="STYLE1">
													<div align="center">${Order.ordersId}</div>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${Order.orders_To_name}</span>
												</div></td>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${Order.orders_To_adress}</span>
												</div></td>
											<td bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1">${Order.orders_To_tel}</span>
												</div></td>
											<%-- <td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1"><%=string%></span>
												</div></td> --%>
											<%
												if ("未发货".equals(list[j]) || "申请退款".equals(list[j])) {
											%>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE4" id="memberStatus"><Input
														type="button" id="changeStates" name="changeStates"
														width="16" height="16" 
													value="<%=list[j]%>"
													onclick="ChangeStatus();" />&nbsp;
														&nbsp;</span>
												</div></td>
											<%
												} else {
											%>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE4" id="memberStatus"><%=list[j]%>&nbsp;
														&nbsp;</span>
												</div></td> 
											<%
												}
											%>
											<td height="20" bgcolor="#FFFFFF"><div align="center">
													<span class="STYLE1"><a href="#"
														onclick="OrdersDetail(${Order.ordersId})">查看订单详情</a></span>
												</div></td>
										</tr>
									</c:forEach>
								</table></td>
							<td width="8" background="tab/images/tab_15.gif">&nbsp;</td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td height="35" background="tab/images/tab_19.gif"><table
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12" height="35"><img src="tab/images/tab_18.gif"
								width="12" height="35" /></td>
							<td><table width="100%" border="0" cellspacing="0"
									cellpadding="0">
									<tr>
										<td class="STYLE4">&nbsp;&nbsp;共有&nbsp;<%=ordersCount%>&nbsp;条记录
										</td>
										<td><table border="0" align="right" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="40"><a
														href="ordersManagerstatus1.jsp?page=1"><img
															src="tab/images/first.gif" width="37" height="15" /></a></td>
													<td width="45"><a
														href="ordersManagerstatus1.jsp?page=<%=lastPage%>"><img
															src="tab/images/back.gif" width="43" height="15" /></a></td>
													<td width="45"><a
														href="ordersManagerstatus1.jsp?page=<%=nextPage%>"><img
															src="tab/images/next.gif" width="43" height="15" /></a></td>
													<td width="40"><a
														href="ordersManagerstatus1.jsp?page=<%=pageCount%>"><img
															src="tab/images/last.gif" width="37" height="15" /></a></td>
													<td width="100"><div align="center">
															<span class="STYLE1">转到第 <input id="textfield"
																name="textfield" type="text" size="4"
																style="height:12px; width:20px; border:1px solid #999999;" />
																页
															</span>
														</div></td>
													<td width="40"><a href="javascript:goByInput();"><img
															src="tab/images/go.gif" width="37" height="15" /></a></td>
												</tr>
											</table></td>
									</tr>
								</table></td>
							<td width="16"><img src="tab/images/tab_20.gif" width="16"
								height="35" /></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
	<script language="javascript">
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
function goByInput(){
	var num=document.getElementById("textfield");
	if(num.value!=""){
		location="MemberEdit.jsp?page="+num.value;
	}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
function selectall(id){ //用id区分  
	var tform=document.forms['form1'];  
	for(var i=0;i<tform.length;i++){  
	var e=tform.elements[i];  
	if(e.type=="checkbox" && e.name==id) e.checked=!e.checked;  
	}  
	} 

function ChangeStatus(){
	var id=document.getElementById("ordersid<%=k%>").value;
	var statu=document.getElementById("ordersstatus<%=k%>").value;
	alert(id);
	alert(statu);
		if(!confirm("是否发货")){
			return;
			}		
		//$("#memberStatus").html("<img src=\"tab/images/loading5.gif\"/>");
		$.post("AdminChangeOrdersStatesServlet",{memberid:id,status:statu},
			function(rs){
			if(rs>0){
				alert("发货成功");
				if(status=="1"){
					$("#memberStatus").html("<div>已发货</div>");
				}
			}else{
				alert("操作失败！");
			}
		});
		history.go(0);
		}

function OrdersDetail(ordersId){
		//window.showModalDialog("ordersDetail.jsp?typeid="+ordersId,"模态对话框","dialogWidth=1024px;dialogHeight=400px");
	 window.open("ordersDetail.jsp?typeid="+ordersId,"模态对话框","modal=yes,dialogWidth=950px;dialogHeight=400px");	
}
</script>
	
</body>
</html>

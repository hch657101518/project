<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="/WEB-INF/MyPage.tld" prefix="pt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
<title>商品管理</title>
<script language="javascript" src="js/jquery.js"></script>
<script language="javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	height: 1000px;
}
.STYLE1 {font-size: 14px}
.STYLE3 {font-size: 16px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 14px;
}
.edit{
	display:none;
	z-index:10;
	position: absolute;
	top: 100px;
	left:150px;
	width:700px;
	height:480px;
	background-color:#C1EBFF;
}
.layer{
	display:none;
	z-index:5;
	position: absolute;
	top: 0px;
	left:0px;
	width:1500px;
	height:1200px;
	filter:alpha(opacity=30);
}
-->
</style>

<script>
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

//检测非空
function check(){
	var type=document.getElementById("selType");
	var price=document.getElementById("selPrice");
	var time=document.getElementById("selTime");

	if(type.options[type.selectedIndex].value=="-1" && price.options[price.selectedIndex].value=="0"
		&& time.options[time.selectedIndex].value=="0"){
		alert("请选择查询条件！");
		return false;
	}
	return true;
}

//全选、全不选
function checkAll(selected){
	var a=document.getElementsByName("checkbox2")
	for(var i=0;i<a.length;i++){
		a[i].checked=selected;
	}
}

//反选
function opsit(){
	var a=document.getElementsByName("checkbox2");
	for(var i=0;i<a.length;i++){
		a[i].checked=a[i].checked?false:true;
		/*a[i].checked=!a[i].checked;*/
	}
}

//批量删除
function deleteMul(){
	if(!confirm("确定删除所有勾选项？"))
		return false;
	var num=0;
	var chObjs = document.getElementsByName("checkbox2");
	var str="";
	for(var i=0;i<chObjs.length;i++){
		if(chObjs[i].checked){
			str+=document.getElementById(("divTypeId"+(chObjs[i].id).substr(2))).innerHTML;
			num+=1;
		}
	}
	if(num==0){
		return false;
	}
	location="CommodityManageServlet?type=deleteMul&str="+str;
}

//显示div以编辑商品信息
function showDiv(id){
	document.getElementById(id).style.display="block";
	document.getElementById("divLayer").style.display="block";
}
function hideDiv(id){
	document.getElementById(id).style.display="none";
	document.getElementById("divLayer").style.display="none";
}
//查看详情
function showDetail(id){
	var str=id.substr(7);
	$("input[name='radTop"+str+"']").attr("disabled","disabled");
	$("table input").attr("readonly","readonly");
	$("table textarea").attr("readonly","readonly");
	document.getElementById(id).style.display="block";
	document.getElementById("divLayer").style.display="block";
}
</script>

</head>

<body>
<div id="divLayer" class="layer"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="tab/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="tab/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="tab/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[商品管理]-[商品管理]</td>
              </tr>
            </table></td>
            <td width="54%">
            <form action="CommodityManageServlet?type=query" method="post" onsubmit="return check()">
            <table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
              	<td ><select id="selType" name="selType">
              		<option value="-1">所属分类</option>
              		<c:forEach items="${requestScope.pTypeList}" var="pType">
              			<c:if test="${pType.typeId==sessionScope.typeId}"><option value="${pType.typeId }" selected="selected">${pType.typeName }</option></c:if>
              			<c:if test="${pType.typeId!=sessionScope.typeId}"><option value="${pType.typeId }">${pType.typeName }</option></c:if>
              		
              			<c:forEach items="${typeList}" var="type">
              				<c:if test="${type.parentTypeId==pType.typeId}">
              					<c:if test="${type.typeId==sessionScope.typeId}"><option value="${type.typeId }" selected="selected">${type.typeName }</option></c:if>
              			<c:if test="${type.typeId!=sessionScope.typeId}"><option value="${type.typeId }">&nbsp;&nbsp;${type.typeName }</option></c:if>
              				</c:if>
              			</c:forEach>
              		</c:forEach>
              		</select></td>
                <td><select id="selPrice" name="selPrice">
                	<c:if test="${sessionScope.price=='0'}">
                		<option value="0" selected="selected">价格区间</option></c:if>
                	<c:if test="${sessionScope.price!='0'}">
                		<option value="0">价格区间</option></c:if>
                	<c:if test="${sessionScope.price=='0-100'}">
                		<option value="0-100" selected="selected">100元以下</option></c:if>
                	<c:if test="${sessionScope.price!='0-100'}">
                		<option value="0-100">100元以下</option></c:if>
                	<c:if test="${sessionScope.price=='100-200'}">
                		<option value="100-200" selected="selected">100-200元</option></c:if>
                	<c:if test="${sessionScope.price!='100-200'}">
                		<option value="100-200">100-200元</option></c:if>
                	<c:if test="${sessionScope.price=='200-500'}">
                		<option value="200-500" selected="selected">200-500元</option></c:if>
                	<c:if test="${sessionScope.price!='200-500'}">
                		<option value="200-500">200-500元</option></c:if>
                	<c:if test="${sessionScope.price=='500-1000'}">
                		<option value="500-1000" selected="selected">500-1000元</option></c:if>
                	<c:if test="${sessionScope.price!='500-1000'}">
                		<option value="500-1000">500-1000元</option></c:if>
                	<c:if test="${sessionScope.price=='1000-0'}">
                		<option value="1000-0" selected="selected">1000元以上</option></c:if>
                	<c:if test="${sessionScope.price!='1000-0'}">
                		<option value="1000-0">1000元以上</option></c:if>
                	</select></td>
                <td>
                <c:if test="${sessionScope.time==null}"><input type="text" name="txtTime" id="txtTime" value=" 请选择上架时间" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"" readonly="readonly"></input></c:if>
                <c:if test="${sessionScope.time!=null}"><input type="text" name="txtTime" id="txtTime" value="${sessionScope.time }" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"" readonly="readonly"></input></c:if>	
                	</td>
                	
                <td><input type="submit" value="查询"></input></td>
              </tr>
            </table>
            </form></td>
          </tr>
        </table></td>
        <td width="16"><img src="tab/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="tab/images/tab_12.gif">&nbsp;</td>
        <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center">
              
            </div></td>
            <td width="3%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
            <td width="10%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品编号</span></div></td>
            <td width="12%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品名称</span></div></td>
            <td width="14%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">所属类型</span></div></td>
            <td width="14%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">商品现价</span></div></td>
            <td width="14%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">上架时间</span></div></td>
            <td width="25%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
          </tr>
          
          <c:forEach items="${sessionScope.result}" var="commodity" varStatus="status">
          
	          <tr>
	            <td height="20" bgcolor="#FFFFFF"><div align="center">
	              <input type="checkbox" id="ch${status.index }" name="checkbox2" value="checkbox" />
	            </div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
	              <div align="center">${status.index+1}</div>
	            </div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><div id="divTypeId${status.index }" align="center"> ${commodity.commodityId }</div></span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><div align="center">${commodity.commodityName } </div> </span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><div align="center"> ${commodity.typeName }</div></span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><div align="center">${commodity.commodityPresentPrice } </div></span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><div align="center"> ${commodity.commodityAddedtime }</div></span></div></td>
	            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="tab/images/edt.gif" width="16" height="16" />
		            <a href="#" onclick="showDiv('divEdit${status.index }')">编辑</a>&nbsp; &nbsp;<img src="tab/images/del.gif" width="16" height="16" />
		            <a href="CommodityManageServlet?type=delete&id=${commodity.commodityId }" onclick="return confirm('确定删除吗？')">删除</a>&nbsp; &nbsp;
		            <a href="#" onclick="showDetail('divEdit${status.index }')">查看详情</a></span></div></td>
	          </tr>
	          <%--遮罩层实现编辑 --%>
	          <tr><td><div id="divEdit${status.index }" class="edit">
	          
	          <form action="CommodityManageServlet?type=update&index=${status.index }&comId=${commodity.commodityId }" method="post">
	          	<table width="100%">
  <tr><td width="60%"><table width="100%" align="center">
  <tr><td>&nbsp;</td></tr>
	  	<tr>
	  		<td width="20%" align="center"><div>名称：</div></td>
	  		<td width="30%" align="left"><div><input type="text" name="txtName${status.index }" value="${commodity.commodityName }"/></div></td>
	    	<td width="15%" align="right"><div >类型：</div></td>
	    	<td width="20%" align="left"><div><select id="selPType${status.index }" name="selPType${status.index }" style="width:150px;">
	              		<c:forEach items="${requestScope.pTypeList}" var="pType">
	              			<optgroup label="${pType.typeName }">
		              			
		              			<c:forEach items="${typeList}" var="type">
		              			
		              				<c:if test="${type.parentTypeId==pType.typeId}">
		              					<c:if test="${type.typeId==commodity.typeId }">
		              						<option value="${type.typeId }" selected="selected">&nbsp;&nbsp;${type.typeName }</option>
		              					</c:if>
		              					<c:if test="${type.typeId!=commodity.typeId }">
		              						<option value="${type.typeId }">&nbsp;&nbsp;${type.typeName }</option>
		              					</c:if>
		              				</c:if>
		              				
		              			</c:forEach>
	              			</optgroup>
	              		</c:forEach></select></div></td></tr>
	    <tr><td width="20%" align="center"><div>市场价：</div></td>
	    	<td width="30%" align="left"><div><input id="txtMarketPrice${status.index }" name="txtMarketPrice${status.index }" type="text" value="${commodity.commodityMarketPrice }""/></div></td>
	    	<td width="15%" align="right"><div>现价：</div></td>
	    	<td width="20%" align="left"><div><input type="text" id="txtPresentPrice${status.index }" name="txtPresentPrice${status.index }" value="${commodity.commodityPresentPrice }" /></div></td>
	    </tr>
	     <tr><td width="20%" align="center"><div>关键字：</div></td>
	    	<td width="30%" align="left"><div><input type="text" id="txtKeyWord${status.index }" name="txtKeyWord${status.index }" value="${commodity.commodityKeyword }" /></div></td>
	    	<td width="15%" align="right"><div>置顶：</div></td>
	    	<td width="20%" align="left"><div>
	    		<c:if test="${commodity.isTop=='1'}">
	    			<input type="radio" id="radTop1${status.index }" name="radTop${status.index }" value="1" checked="checked" >是</input>
	    			<input type="radio" id="radTop1${status.index }" name="radTop${status.index }" value="0" >否</input></c:if>
	    		<c:if test="${commodity.isTop!='1'}">	
	    			<input type="radio" id="radTop2${status.index }" name="radTop${status.index }" value="1" >是</input>
	    			<input type="radio" id="radTop2${status.index }" name="radTop${status.index }" value="0" checked="checked" >否</input></c:if>
	    		</div></td>
	    </tr>
	    <tr>
	    	<td align="center" width="20%"><div>花语：</div></td>
	    	<td colspan="3"><div><textarea id="taMean${status.index }" name="taMean${status.index}" rows="3" cols="40">${commodity.commodityLanguage }</textarea></div></td>
	    </tr>
	    <tr>
	    	<td align="center" width="20%"><div>材料：</div></td>
	    	<td colspan="3" width="80%"><div><textarea  id="taMaterial${status.index }" name="taMaterial${status.index }" rows="3" cols="40">${commodity.commodityMaterial }</textarea></div></td>
	    </tr>
	    <tr>
	    	<td align="center" width="20%"><div>包装：</div></td>
	    	<td colspan="3" width="80%"><div><textarea id="taPack${status.index }" name="taPack${status.index }"  rows="3" cols="40">${commodity.commodityPcak }</textarea></div></td>
	    </tr>
	    <tr>
	    	<td align="center" width="20%"><div>说明：</div></td>
	    	<td colspan="3" width="80%"><div><textarea id="taDescription${status.index }" name="taDescription${status.index }" rows="4" cols="40">${commodity.commodityDescription } </textarea></div></td>
	    </tr></table></td>
   	<td width="30%"><div>
			<img src="upload/thumb/${commodity.commodityPicture }"/><br />${commodity.commodityPicture }</div></td>
   </tr>
	<tr><td colspan="2"><table width="100%"><tr>
	    	<td align="center" width="20%"><div>详情：</div></td>
	    	<td width="80%"><div><textarea id="taDetail${status.index }" name="taDetail${status.index }" rows="5" cols="76">${commodity.commodityDetail }</textarea></div></td>
		</tr></table></td></tr>
   <tr><td align="center" colspan="2"><input type="submit" value="确定" onclick="hideDiv('divEdit${status.index }')"/></td></tr>
   </table></form>
	          
	          </div></td></tr>
          
          </c:forEach>
          </table></td>
        <td width="8" background="tab/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="tab/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="tab/images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="30%" style="font-size: 12px;" align="left"><a href="#" onclick="checkAll(true)">全选</a>&nbsp;&nbsp;
            	<a href="#" onclick="checkAll(false)">全不选</a>&nbsp;&nbsp;<a href="#" onclick="opsit()">反选</a>&nbsp;&nbsp;
            	<a href="#" onclick="deleteMul()">批量删除</a>&nbsp;&nbsp;</td>
            <td class="STYLE4" width="60%" align="right">&nbsp;&nbsp;共有${sessionScope.totalNum }条记录&nbsp;&nbsp;<pt:page pageIndex="${sessionScope.currentPage}" url="CommodityManageServlet?" pageMax="${sessionScope.totalPage}"/></td>
          </tr></table></td>
        <td width="16"><img src="tab/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>  
</table>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加商品</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	height: 1300px;
}

.STYLE1 {
	font-size: 14px
}

.STYLE3 {
	font-size: 16px;
	font-weight: bold;
}

.txt {
	border: solid 1px black;
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

function showInfo(id){
	document.getElementById(id).style.display="";
}
function hideInfo(id){
	document.getElementById(id).style.display="none";
}

function check(){
	if(document.getElementById("txtName").value==""){
		alert("商品名称不能为空！");
		return false;
	}
	if(document.getElementById("selType").options[document.getElementById("selType").selectedIndex].value=="请选择类型"){
		alert("请选择商品类型！");
		return false;
	}
	if(document.getElementById("txtKeyWord").value==""){
		alert("请填写关键字！");
		return false;
	}
	if(document.getElementById("txtPrice1").value==""){
		alert("市场价格不能为空！");
		return false;
	}
	if(document.getElementById("txtPrice2").value==""){
		alert("商品现价不能为空！");
		return false;
	}
	if(document.getElementById("txtImg").value==""){
		alert("请上传商品图片！");
		return false;
	}
	if(document.getElementById("txtMaterial").value==""){
		alert("商品材料不能为空！");
		return false;
	}
	if(document.getElementById("txtPackage").value==""){
		alert("商品包装不能为空！");
		return false;
	}
	if(document.getElementById("taMean").value==""){
		alert("花语不能为空！");
		return false;
	}
	if(document.getElementById("taExplain").value==""){
		alert("商品说明不能为空！");
		return false;
	}
	if(document.getElementById("taDetail").innerhtml==""){
		alert("商品详情不能为空！");
		return false;
	}
	return true;
}
</script>

<script src="js/jquery.js"></script>
<script language="javascript" src="js/edit/xheditor-1.1.10-zh-cn.min.js"></script>
<script>

$(document).ready(function(){	
				
	$.post("ServletAjaxType",function(data){		//将ServletAjaxType输出的信息发送（get也行）到spanType（ID）对应的标签下
		$("#spanType").html(data);
	});
});
</script>
</head>

<body>
	 <form enctype="multipart/form-data" action="../admin/AdminAddCommodityServlet" method="post" onsubmit="return check();">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[商品管理]-[添加商品]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="tab/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td>
   <form enctype="multipart/form-data" action="AdminAddCommodityServlet?type=add" method="post" onsubmit="check()">
    <table width="100%" border="0" cellspacing="" cellpadding="0">
      <tr>
        <td width="8" background="tab/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="1" cellspacing="10" bgcolor="b5d6e6">
          <tr>
            <td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">商品名称：&nbsp;</span></div> </td>
            <td width="50%" height="25" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input type="text" id="txtName" name="txtName" style="width:200px;"  onfocus="showInfo('divInfo1')" onblur="hideInfo('divInfo1')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo1" align="left" style="display:none;"><span class="STYLE1">请输入商品名称！</span></div> </td>
          </tr>
          
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">所属分类：&nbsp;</span></div> </td>
           	<td width="50%" height="25" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left">
           	<span class="STYLE1" id="spanType">
           		</span></div></td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo2" align="left" style="display:none;"><span class="STYLE1">请选择商品类型！</span></div> </td>
           	</tr>
           	
           	
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">关&nbsp;键&nbsp;字&nbsp;：&nbsp;</span></div> </td>
           	<td width="50%" height="25" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input id="txtKeyWord" name="txtKeyWord" type="text" class="txt"  style="width:200px;" onfocus="showInfo('divInfo3')" onblur="hideInfo('divInfo3')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo3" align="left" style="display:none;"><span class="STYLE1">请输入关键字，多个用空格隔开！</span></div> </td>
           	</tr>
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">市&nbsp;场&nbsp;价&nbsp;：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input id="txtPrice1" name="txtPrice1" type="text" class="txt"  style="width:200px;" onfocus="showInfo('divInfo4')" onblur="hideInfo('divInfo4')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo4" align="left" style="display:none;"><span class="STYLE1">请输入商品的市场价格！</span></div> </td>
           	</tr>
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">现&nbsp;&nbsp;&nbsp;价&nbsp;&nbsp;&nbsp;&nbsp;：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input id="txtPrice2" name="txtPrice2" type="text" class="txt"  style="width:200px;" onfocus="showInfo('divInfo5')" onblur="hideInfo('divInfo5')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo5" align="left" style="display:none;"><span class="STYLE1">请输入商品的现价！</span></div> </td>
           	</tr>
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">商品图片：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input id="txtImg" name="txtImg" type="file" value="" class="txt"  onfocus="showInfo('divInfo6')" onblur="hideInfo('divInfo6')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo6" align="left" style="display:none;"><span class="STYLE1">请上传商品图片！</span></div> </td>
           	</tr>
          <tr>
            <td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">所用材料：&nbsp;</span></div> </td>
            <td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input id="txtMaterial" name="txtMaterial" type="text" class="txt"  style="width:200px;" onfocus="showInfo('divInfo7')" onblur="hideInfo('divInfo7')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo7" align="left" style="display:none;"><span class="STYLE1">请输入商品所使用的材料信息！</span></div> </td>
            </tr>
           <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">商品包装：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input id="txtPackage" name="txtPackage" class="txt"  type="text" style="width:200px;" onfocus="showInfo('divInfo8')" onblur="hideInfo('divInfo8')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo8" align="left" style="display:none;"><span class="STYLE1">请输入商品的包装信息！</span></div> </td>
           	</tr>
           <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">是否置顶：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input type="radio" name="radTop" value="1">是</input><input type="radio" name="radTop" value="0"  checked="checked">否</input></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo9" align="left" style="display:none;"><span class="STYLE1">商品是否在前端展示列表中靠前展示！</span></div> </td>
           	</tr>
           	<tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">鲜花花语：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><textArea id="taMean" name="taMean" class="txt"  rows="3" cols="30" style="overflow-y:hidden;" onfocus="showInfo('divInfo10')" onblur="hideInfo('divInfo10')"></textArea></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo10" align="left" style="display:none;"><span class="STYLE1">请输入花语！</span></div> </td>
           	</tr>
           	<tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">商品说明：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><textArea id="taExplain" name="taExplain" class="txt"  rows="4" cols="40" style="overflow-y:hidden;" onfocus="showInfo('divInfo11')" onblur="hideInfo('divInfo11')"></textArea></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo11" align="left" style="display:none;"><span class="STYLE1">请输入对商品的简要说明！</span></div> </td>
           	</tr>
           	<tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">商品详情：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><textArea id="taDetail" name="taDetail"  class="xheditor txt" rows="7" cols="70" style="overflow-y:hidden;" onfocus="showInfo('divInfo12')" onblur="hideInfo('divInfo12')" ></textArea></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo12" align="left" style="display:none;"><span class="STYLE1">请输入商品的详细信息！</span></div> </td>
           	</tr>
        </table></td>
        <td width="8" background="tab/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  
  
  <tr>
    <td height="35" background="tab/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="tab/images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <td width="100%" align="center"><input type="submit" width="10" value="添加商品"/></td>
        </table></td>
        <td width="16"><img src="tab/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td height="35" background="tab/images/tab_19.gif"></td>
  </tr>
</table>
</form> 
<!-- <span class="STYLE3">你当前的位置</span>：[商品管理]-[添加商品]<br /><br />
	<form enctype="multipart/form-data" action="/Flower/bbb" method="post" onsubmit="return check()">
		
	<span style="margin-left:35%">商品名称：</span><input type="text" id="txtName" name="txtName"  onfocus="showInfo('divInfo1')" onblur="hideInfo('divInfo1')"/>
	<span class="STYLE1" id="divInfo1" style="display:none; margin-left: 100px; position:absolute; ">请输入商品名称！</span><br /><br />
	
	<span style="margin-left: 35%">所属分类：</span><span class="STYLE1" id="spanType" name="selType">	</span><br /><br />
	
	<span style="margin-left: 35%">关 &nbsp键&nbsp字：</span><input type="text" id="txtKeyWord" name="txtKeyWord"  onfocus="showInfo('divInfo3')" onblur="hideInfo('divInfo3')"/>
	<span class="STYLE1" id="divInfo3" style="display:none; margin-left: 100px; position:absolute; ">请输入关键字，多个用空格隔开！</span><br /><br />
	
	<span style="margin-left: 35%">市 &nbsp场 &nbsp价: </span><input type="number" min="1" id="txtPrice1" name="txtPrice1"  onfocus="showInfo('divInfo4')" onblur="hideInfo('divInfo4')"/>
	<span class="STYLE1" id="divInfo4" style="display:none; margin-left: 100px; position:absolute; ">请输入商品的市场价格！</span><br /><br />
	
	<span style="margin-left: 35%">现 &nbsp&nbsp&nbsp&nbsp &nbsp&nbsp价: </span><input type="text" id="txtPrice2"" name="txtPrice2"  onfocus="showInfo('divInfo5')" onblur="hideInfo('divInfo5')"/>
	<span class="STYLE1" id="divInfo5" style="display:none; margin-left: 100px; position:absolute; ">请输入商品的现价！</span><br /><br />
	
	<span style="margin-left: 35%">商品图片: </span><input id="txtImg" name="txtImg" type="file" value="" class="txt"  onfocus="showInfo('divInfo6')" onblur="hideInfo('divInfo6')"/>
	<span class="STYLE1" id="divInfo6" style="display:none; margin-left: 100px; position:absolute; ">请上传商品图片！</span><br /><br />
	
	<span style="margin-left: 35%">所用材料: </span><input id="txtMaterial" name="txtMaterial" type="text" value="" class="txt"  onfocus="showInfo('divInfo7')" onblur="hideInfo('divInfo7')"/>
	<span class="STYLE1" id="divInfo7" style="display:none; margin-left: 100px; position:absolute; ">请输入商品所使用的材料信息！</span><br /><br />
	
	<span style="margin-left: 35%">商品包装: </span><input id="txtPackage" name="txtPackage" class="txt"  type="text" value="" onfocus="showInfo('divInfo8')" onblur="hideInfo('divInfo8')"/>
	<span class="STYLE1" id="divInfo8" style="display:none; margin-left: 100px; position:absolute; ">请输入商品包装信息！</span><br /><br />
	
	<span style="margin-left: 35%">是否置顶: </span><input type="radio" name="radTop" value="1">是</input><input type="radio" name="radTop" value="0"  checked="checked">否</input>
	<span class="STYLE1" id="divInfo8" style="display:none; margin-left: 100px; position:absolute; ">商品是否在前端展示列表中靠前展示！</span><br /><br />
	
	<span style="margin-left: 35%">鲜花花语: </span><textArea id="taMean" name="taMean" class="txt"  rows="3" cols="30" style="overflow-y:hidden;" onfocus="showInfo('divInfo10')" onblur="hideInfo('divInfo10')"></textArea>
	<span class="STYLE1" id="divInfo10" style="display:none; margin-left: 100px; position:absolute; ">请输入花语！</span><br /><br />
		
	<span style="margin-left: 35%; ">商品说明: </span><textArea id="taExplain" name="taExplain" class="txt"  rows="4" cols="40" style="overflow-y:hidden;" onfocus="showInfo('divInfo11')" onblur="hideInfo('divInfo11')"></textArea>
	<span class="STYLE1" id="divInfo11" style="display:none; margin-left: 100px; position:absolute; ">请输入商品说明！</span><br /><br />	
		
	<span style="margin-left: 35%; ">商品详情:</span> 	<textArea id="taDetail" name="taDetail"  class="xheditor" txt" rows="7" cols="50" style="overflow-y:hidden;" onfocus="showInfo('divInfo12')" onblur="hideInfo('divInfo12')" ></textArea>
	<span class="STYLE1" id="divInfo12" style="display:none; margin-left: 100px; position:absolute; ">请输入商品详情！</span><br /><br />	
	<span class="STYLE1" id="divInfo12" style="display:none; margin-left: 0px; position:absolute; ">请输入商品说明！</span><br /> 
		<span style="margin-left:50%;"><input type="submit" value="提交" /></span>
	</form>-->
</body>
</html>

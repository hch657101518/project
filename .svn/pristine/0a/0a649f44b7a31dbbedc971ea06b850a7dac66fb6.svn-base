<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	CommodityTypeDao type=new CommodityTypeDao();
	ArrayList<CommodityType> list=type.queryByPid(0);
	request.setAttribute("typeList",list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
<title>添加商品类型</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 14px}
.STYLE3 {font-size: 16px; font-weight: bold; }
.txt{
	border:solid 1px black;
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


</script>

<script src="../JS/jquery.js"></script>
<script language="javascript" src="../JS/edit/xheditor-1.1.10-zh-cn.min.js"></script>
<script>
$(document).ready(function(){						
	$.post("ServletAjaxType",function(data){		//将ServletAjaxType输出的信息发送（get也行）到spanType（ID）对应的标签下
		$("#spanType").html(data);
	});
});
</script>


<script type="text/javascript">
	function showInfo(id){
		document.getElementById(id).style.display="";
	}
	function hideInfo(id){
		document.getElementById(id).style.display="none";
	}
	function check(){
		if(document.getElementById("selType").options[document.getElementById("selType").selectedIndex].value==""){
			alert("请选择商品所属的类型！");
			return false;
		}
		if(document.getElementById("txtId").value==""){
			alert("添加类型不能为空！");
			return false;
		}
		return true;
	}
	</script>
    
	
  </head>
</head>

<body>
<form  action="../admin/AddTypeServlet" method="post" onsubmit="return check();">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[商品管理]-[添加商品类型]</td>
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
<!--    <form enctype="multipart/form-data" action="AdminAddCommodityServlet?type=add" method="post" onsubmit="check()">-->
    <table width="100%" border="0" cellspacing="" cellpadding="0">
      <tr>
        <td width="8" background="tab/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="1" cellspacing="10" bgcolor="b5d6e6">
          <tr>
            <td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">所属类型：&nbsp;</span></div> </td>
            <td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"> <select name="selType"  id="selType" style="width:200px;" onfocus="showInfo('divInfo1')" onblur="hideInfo('divInfo1')"><option value="">无</option><c:forEach items="${typeList}" var="type"><option value="${type.typeId }">
 		       ${type.typeName }</option> </c:forEach> </select>	
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo1" align="left" style="display:none;"><span class="STYLE1">请选择商品的所属类型！</span></div> </td>
          </tr>
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">添加类型：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input type="text" name="txtId" id="txtId" class="opt_input" type="text" style="width:200px;" onfocus="showInfo('divInfo2')" onblur="hideInfo('divInfo2')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo2" align="left" style="display:none;"><span class="STYLE1">添加类型不能为空！</span></div> </td>
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
        <td width="50%" align="center"><input type="submit" value="提交" class="opt_sub"/></td>
        
        </table></td>
        <td width="16"><img src="tab/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
  
 
</table>
</form>
</body>
</html>

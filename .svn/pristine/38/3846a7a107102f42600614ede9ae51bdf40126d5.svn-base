<%@ page language="java" import="java.util.*,entity.*,dao.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
<title>文章管理</title>
<style type="text/css">

<!-- 把图片边框设为0，不然带超链接的图片外围有颜色边框 -->
img{border:none}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 14px}
.STYLE3 {font-size: 14px; font-weight: bold; }

a{
	color: black;
	text-decoration: none;
}
</style>
<script language="javascript" src="js/jquery.js"></script>
<script>
var  highlightcolor='#c1ebff';

/*
 * 在网页载入时把与传过来的articleName值相等的下拉框设为选中
 */
$(document).ready(function(){
	var str=${param.articleName};
	$("#articleType option").each(function(){
		if($(this).val()==str){
			$(this).attr("selected","selected");
		}
	});
});
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

function checkAll(isCheck){
	var chs=document.getElementsByName("checkbox2");//获取所名称为checkbox2的元素数组
	for(var i=0;i<chs.length;i++){
		chs[i].checked=isCheck;//遍历每个元素设置checked属性
	}
}
function checkRever(){
	var chs=document.getElementsByName("checkbox2");//获取所名称为checkbox2的元素数组
	for(var i=0;i<chs.length;i++){
		chs[i].checked=chs[i].checked?false:true;;//遍历每个元素设置checked属性
	}
}




function selectByType(obj){
	location="ArticleManagerServlet?articleName="+obj.value;

}

//单个删除
function DeleteArticle(articleId){
	<%--
		$.post("转发的地址", { 变量名: "变量值", 变量名: "变量值" },function(data){
		alert("Data Loaded: " + data);
		});
		$("#divInfo").css("color","black");
		$("#divInfo").html("<img src='Images/loading5.gif'/>正在提交数据，请稍候...");
	  	--%> 
	  	<%--
		点击删除文章按钮的处理方法
		--%> 
	  	var str=${param.articleName};
		$.post("ArticleManagerServlet",{id:articleId,type:1},function(ISOK){
	 		if(ISOK=="SUCCESS"){
				location="ArticleManagerServlet?articleName="+str;
			}else{
				alert("删除失败");
			}
			});
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
	location="AdminCommodityTypeManageServlet?type=deleteMul&str="+str;
}


</script>

</head>

<body>
<form id="form1" name="form1" method="post" action="">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[文章管理]-[文章管理]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="7" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
                <select id="articleType"  onchange="selectByType(this)" style="width:100px;" /><option value="0"selected="selected">请选择</option>
    			<option value="1">选择全部</option>
    			<option value="2">鲜花物语</option>
    			<option value="3">蛋糕常识</option>
    			<option value="4">送礼</option>
    			<option value="5">祝福语</option>
    			<option value="6">幻灯片</option>	
    		</select></span></div> </td>
              </tr>
            </table></td>
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
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#0080ff" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
         	<td width="5%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF" class="STYLE1">
         	<div align="center">选择
         	</div>
         	</td>
         	<td width="12%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">文章ID</span></div></td>
            <td width="29%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">标题</span></div></td>
            <td width="10%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">作者</span></div></td>
            <td width="10%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">类型</span></div></td>
            <td width="16%" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">发表时间</span></div></td>
            <td width="18%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF" class="STYLE1" colspan="2"><div align="center">基本操作</div></td>
         </tr>
          <c:forEach  items="${requestScope.articleList}" var="article" varStatus="status">
          <tr>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkbox2" value="${article.articleId}" />
            </div></td>
            	<td width="12%" height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${article.articleId}</span></div></td>
            <td width="20%" height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${article.articleTitle}</span></div></td>
            <td width="10%" height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${article.articlePublisher}</span></div></td>
            <td width="10%" height="22" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${article.articleName}</span></div></td>
            <td width="16%" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${article.articlePublishtime}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="tab/images/edt.gif" width="16" height="16" />
		            <a href="ArticleManagerServlet?type=2&id=${article.articleId}" target="I2">修改</a>&nbsp; &nbsp;<img src="tab/images/del.gif" width="16" height="16" />
		            <a href="javascript:void(0);" onclick="DeleteArticle(${article.articleId});"  >删除</a></span></div></td>

          </tr>
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
            <td class="STYLE4">
            
            <input type="button" onclick="checkAll(true)" value="全选" />
            <input type="button" onclick="checkRever()" value="反选" />
            <input type="button" onclick="checkAll(false)" value="全不选" />
            <input type="button" onclick="deleteMul()" value="批量删除" />
            </td>
           
          </tr>
        </table></td>
        <td width="16"><img src="tab/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>

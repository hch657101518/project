<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
<title>添加文章</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	height: 1100px;
}
.STYLE1 {font-size: 14px}
.STYLE3 {font-size: 16px; font-weight: bold; }
.txt{
	border:solid 1px black;
	}
.txt{
	border:solid 1px black;
}
-->
</style>

<script>
<script type="text/javascript">
	function showInfo(id){
		document.getElementById(id).style.display="";
	}
	function hideInfo(id){
		document.getElementById(id).style.display="none";
	}
	function check(){
		if(document.getElementById("selType").options[document.getElementById("selType").selectedIndex].value=="请选择文章的类型"){
			alert("请选择文章的类型！");
			return false;
		}
		if(document.getElementById("txtTitle").value==""){
			alert("文章的标题不能为空！");
			return false;
		}
		if(document.getElementById("txtAuthor").value==""){
			alert("请输入发布者！");
			return false;
		}
		if(document.getElementById("txtPublishtime").value==""){
			alert("请读取发布时间！");
			return false;
		}
		if(document.getElementById("txtBody").value==""){
			alert("文章内容不能为空！");
			return false;
		}
		return true;
	
	}
	</script>

	<script language="javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	<script language="javascript" src="js/jquery.js"></script>
	<script language="javascript" src="js/edit/xheditor-1.1.10-zh-cn.min.js"></script>
  </head>
  

<body>
<form action="../admin/ArticleServlet" method="post" onsubmit="return check();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="tab/images/tab_05.gif">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="tab/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="tab/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[文章管理]-[添加文章]</td>
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

    <table width="100%" border="0" cellspacing="" cellpadding="0">
      <tr>
        <td width="8" background="tab/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="1" cellspacing="10" bgcolor="b5d6e6">
          <tr>
            <td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">文章类型：&nbsp;</span></div> </td>
            <td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><select name="selType" id="selType" style="width:200px;"  onfocus="showInfo('divInfo1')" onblur="hideInfo('divInfo1')"/><option value="鲜花物语" selected="selected">鲜花物语</option>	<option value="蛋糕常识">蛋糕常识</option>	<option value="送礼">送礼</option>	
	 		 <option value="祝福语">祝福语</option>	<option value="幻灯片">幻灯片</option></select></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo1" align="left" style="display:none;"><span class="STYLE1">请选择文章类型！</span></div> </td>
          </tr>
          
          
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">文章标题：&nbsp;</span></div> </td>
           	<td width="50%" height="24" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input name="txtTitle" id="txtTitle" type="text" class="opt_input txt" type="text" style="width:200px;"   onfocus="showInfo('divInfo2')" onblur="hideInfo('divInfo2')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo2" align="left" style="display:none;"><span class="STYLE1">请输入文章标题！</span></div> </td>
          </tr>
           <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">发&nbsp;&nbsp;布&nbsp;&nbsp;者：&nbsp;</span></div> </td>
           	<td width="50%" height="24" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input id="txtAuthor" name="txtAuthor" type="text" class="opt_input txt"  style="width:200px;" onfocus="showInfo('divInfo3')" onblur="hideInfo('divInfo3')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo3" align="left" style="display:none;"><span class="STYLE1">请输入发布者！</span></div> </td>
          </tr>
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">发布时间：&nbsp;</span></div> </td>
           	<td width="50%" height="24" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" type="text" name="txtPublishtime" id="txtPublishtime" readonly="readonly" class="opt_input Wdate " style="width:200px;"  onfocus="showInfo('divInfo4')" onblur="hideInfo('divInfo4')"/></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo4" align="left" style="display:none;"><span class="STYLE1">请读取发布时间！</span></div> </td>
          </tr>
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">文章内容：&nbsp;</span></div> </td>
           	<td width="50%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><textarea class="xheditor " name="txtBody" id="txtBody" rows="26" cols="70" style="overflow-y:hidden;" onfocus="showInfo('divInfo5')" onblur="hideInfo('divInfo5')" ></textArea></span></div> </td>
            <td width="30%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div id="divInfo5" align="left" style="display:none;"><span class="STYLE1">请输入文章内容！</span></div> </td>
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
        <td width="50%" align="center"><input type="submit" value="提交" class="opt_sub"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置" class="opt_sub" /></td>
        </table></td>
        <td width="16"><img src="tab/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
  
</table>
</form>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="entity.Article"%>
<%@page import="dao.ArticleDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>文章修改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <style type="text/css">

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 14px}
.STYLE3 {font-size: 16px;font-weight: bold; }
.txt{
	border:solid 1px black;
	}

a{
	color:black;
	text-decoration: none;
}
</style>
<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
<script language="javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" src="js/edit/xheditor-1.1.10-zh-cn.min.js"></script>
<script type="text/javascript" language="javascript">
/*
 * 在网页载入时把与传过来的articleType值相等的下拉框设为选中
 */
$(document).ready(function(){
	var str='${requestScope.article.articleName}';
	$("#selType option").each(function(){
		if($(this).val()==str){
			$(this).attr("selected","selected");
		}
	});
});

</script>

</head>  
<body>



<form  action="AtricleEditServlet?id=${requestScope.article.articleId }" method="post" onsubmit="return check();">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[文章管理]-[文章管理]-[文章修改]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="tab/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table>
    </td>
  </tr>
  
  
  <tr>
    <td>
		<table width="100%" border="0" cellspacing="" cellpadding="0">
      <tr>
        <td width="8" background="tab/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6">
          <tr>
            <td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">文章类型：&nbsp;</span></div> </td>
            <td width="80%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1">
            <select id="selType" name="selType" style="width:200px;" class="txt" onfocus="showInfo('divInfo1')" onblur="hideInfo('divInfo1')"/>
    								<option value="鲜花物语">鲜花物语</option>
    								<option value="蛋糕常识">蛋糕常识</option>
    								<option value="送礼">送礼</option>
    								<option value="祝福语">祝福语</option>
    								<option value="幻灯片">幻灯片</option>	
    							</select></span></div> </td>
            
          </tr>
		<tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">文章标题：&nbsp;</span></div> </td>
           	<td width="80%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input name="txtTitle" id="txtTitle" type="text" class="txt"  value="${requestScope.article.articleTitle }" class="opt_input" type="text" style="width:200px;"/></span></div> </td>
            
          </tr>
           <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">发&nbsp;&nbsp;布&nbsp;&nbsp;者：&nbsp;</span></div> </td>
           	<td width="80%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input id="txtAuthor" name="txtAuthor" type="text" class="txt"  value="${requestScope.article.articlePublisher }" class="opt_input"  style="width:200px;" /></span></div> </td>
            
          </tr>
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">发布时间：&nbsp;</span></div> </td>
           	<td width="80%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><input onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" type="text" value="${requestScope.article.articlePublishtime }" name="txtPublishtime" id="txtPublishtime" readonly="readonly" class="opt_input Wdate txt" style="width:200px;" /></span></div> </td>
            
          </tr>
          <tr>
           	<td width="20%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="right"><span class="STYLE1">文章内容：&nbsp;</span></div> </td>
           	<td width="80%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="left"><span class="STYLE1"><textarea class="xheditor" name="txtBody" id="txtBody" rows="26" cols="70" style="overflow-y:hidden;" >${requestScope.article.articleContent }</textArea></span></div> </td>
            
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
      </table></td>
  </tr>
</table>
</form>
</body>
</html>


   
              			
              	
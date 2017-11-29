<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content">
  <h4>常用收货人资料修改</h4><div>
  <script>
  function confirmDel(consigneeId){
	  if(confirm("确认删除该商品？")){
		  location=" MemberCenterManageReceiveAddr?type=del&id="+consigneeId;

	  }
  }
  
  
  </script>
  <c:forEach var="item" items="${requestScope.ConsigneeList}" varStatus="status">
          <table width="550" border="1" cellpadding="2" cellspacing="0" bordercolor="#D4D4D4" style="border-collapse:collapse">
            <tr bgcolor="#E6E6E6"> 
              <td colspan="2">地址${status.index+1 }：</td>
            </tr><input type="hidden" name="add_id" value=484926>
			<input type="hidden" name="Member_email" value=84831253@qq.com><input type="hidden" name="selectc" value="空"><input type="hidden" name="selectp" value="空">
            <tr> 
              <td width="15%" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
              <td>${item.consigneeName }
              </td>
            </tr>
         
			<tr> 
              <td align="right">手&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
              <td>${item.consigneePhone }
              </td>
            </tr>
            <tr> 
              <td align="right">详细地址：</td>
              <td>${item.consigneeAdress }
              </td>
            </tr>
			<tr> 
              <td colspan=2 align=center><input type="hidden" name="e_id" size="55" value="484926">
              <a href="MemberCenterManageReceiveAddr?type=modify&id=${item.consigneeId }" ><font color="red">修改</font></a>&nbsp;&nbsp;&nbsp;
              <a href="#" onclick="javScript:confirmDel(${item.consigneeId })"><font color="red">删除</font></a>&nbsp;
              </td>
            </tr>
          </table>
        
  </c:forEach>
       
       
       
		<table width="550" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td>如果您有新地址，请<a href="#" onclick="showJSP('MemberCenterManageReceiveAddr?type=showAddView')"><font color=red><u>添加新地址</u></font></a></td>
          </tr>
          <tr>
            <td height="50">&nbsp;</td>
          </tr>
        </table></div>
</div>
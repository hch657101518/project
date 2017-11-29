<%@ page language="java" import="java.util.*,dao.*,entity.*;" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String typeId=request.getParameter("typeId");
	CommodityTypeDao typeDao = new CommodityTypeDao();
	CommodityType type = typeDao.queryById(Integer.parseInt(typeId));//获取要修改的类型
	ArrayList<CommodityType> typeList = typeDao.queryByPid(0);//获取所有父类型
	request.setAttribute("type",type);
	request.setAttribute("typeList",typeList);

%>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>    
    <title>商品类型编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
    <script language="javascript" type="text/javascript">
    function update(){
		var selObj=document.getElementById("selPType");
		var pType=selObj.options[selObj.selectedIndex].value;
		var type=document.getElementById("txtName").value;
		var str = pType+"/"+type;
    	window.returnValue=str;
		window.close();
    }
    </script>
    
    
  </head>  
  <body>
    <div>父类名称：<select id="selPType" name="selPType" style="width:150px;">
    	<c:forEach items="${requestScope.typeList}" var="pType">
    		<option value="0">无</option>
    		<c:if test="${pType.typeId==requestScope.type.parentTypeId}">
    			<option value="${pType.typeId }" selected="selected">${pType.typeName }</option>
    		</c:if>
    		
    		<c:if test="${pType.typeId!=requestScope.type.parentTypeId}">
    			<option value="${pType.typeId }">${pType.typeName }</option>
    		</c:if>
    	</c:forEach>
    
    	</select>
<%--    	<input type="text" value="<%=typeDao.queryById(type.getParentTypeId()).getTypeName() %>" />--%>
    </div>
    <div>类型名称：<input id="txtName" name="txtName" type="text" value="${requestScope.type.typeName }"/></div>
    <div><input type="button" value="确定修改" onclick="update()"/></div>
  </body>
</html>

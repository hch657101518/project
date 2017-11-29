<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="util.ConfigUtil"%>

<%
//鲜花导购模块
%>
<%
//花材
request.setAttribute("hcList",ConfigUtil.getConfig("花材"));
//花类
request.setAttribute("hlList",ConfigUtil.getConfig("花类"));
//节日
request.setAttribute("jrList",ConfigUtil.getConfig("节日"));
%>
<div class="basebox_x_red margin_B_10px">
<h3><a href="MemberFlowerCateGory?allflower=1&page=1" title="鲜花导购">鲜花导购</a></h3>
<div class="content sp_list">
<dl>
<h3>按用途选花</h3>
<p>
<jsp:include page="parentTypeItem1.jsp">
      <jsp:param value="1" name="id"/>
      </jsp:include>
<br class="clear" />
</p>
</dl>

<dl>
<h3>按花材选花</h3>
<p>
<c:forEach var="item" items="${hcList}" varStatus="status" >
<span>
<a href="MemberFlowerCateGory?floral=${item.configId}&page=1" title="${item.configValue}">${item.configValue}</a>
</span>
</c:forEach>

<br class="clear" />
</p>
</dl>

<dl>
<h3>按类别选花</h3>
<p>
<c:forEach var="item" items="${hlList}" varStatus="status" >
<span>
<a href="MemberFlowerCateGory?category=${item.configId}&page=1" title="${item.configValue}">${item.configValue}</a>
</span>
</c:forEach>
<br class="clear" />
</p>
</dl>

<dl>
<h3>按价格选花</h3>
<p>
<span>
<a href="MemberFlowerCateGory?price=0&page=1" title="特价鲜花" class="color_tj">特价鲜花</a>
</span>
<span>
<a href="MemberFlowerCateGory?price=1&page=1" title="100元以下鲜花">100元以下鲜花</a>
</span>
<span>
<a href="MemberFlowerCateGory?price=2&page=1" title="100-200元">100-200元</a>
</span>
<span>
<a href="MemberFlowerCateGory?price=3&page=1" title="200-300元">200-300元</a>
</span>
<span>
<a href="MemberFlowerCateGory?price=4&page=1" title="300-500元">300-500元</a>
</span>
<span>
<a href="MemberFlowerCateGory?price=5&page=1" title="500-800元">500-800元</a>
</span>
<span>
<a href="MemberFlowerCateGory?price=6&page=1" title="800元以上">800元以上</a></span>
<br class="clear" />
</p>
</dl>

<dl>
<h3>节日专题</h3>
<p>
<c:forEach var="item" items="${jrList}" varStatus="status" >
<span>
<a href="MemberFlowerCateGory?holiday=${item.configId}&page=1" title="${item.configValue}">${item.configValue}</a>
</span>
</c:forEach>


<br class="clear" />
</p>
</dl>

</div>

<div class="bottombgbox"></div>
</div>
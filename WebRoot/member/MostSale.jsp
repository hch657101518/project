<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script>
function salsRanking(num){
	for(var i=1;i<=3;i++){
		if(i==num){
			document.getElementById("ph_tab"+num).className="nowh2";
			document.getElementById("ph_panel"+num).style.display="";
		}else{
			document.getElementById("ph_tab"+i).className="";
			document.getElementById("ph_panel"+i).style.display="none";
		}
	}
}
</script>
<div class="xxphbox margin_L_10px margin_T_10px">
<div class="title">
<h2 class="nowh2" id="ph_tab1" onmouseover="salsRanking('1');">鲜花</h2><h2 class="" id="ph_tab2" onmouseover="salsRanking('2');">蛋糕</h2><h2 class="" id="ph_tab3" onmouseover="salsRanking('3');">公仔</h2>
<div class="clear"></div>
</div>

<div class="content" id="ph_panel1">
<%@include file="salesRanking.jsp" %>
</div>

<div class="content" id="ph_panel2" style="display:none;">
<%@include file="salesRanking2.jsp" %>
</div>

<div class="content" id="ph_panel3" style="display:none;">
<%@include file="salesRanking3.jsp" %>
</div>

<div class="bottomdivbox"></div>
</div>

<%@ page language="java" import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%	
	int i=0;
	int nextPage=0;
	int lastPage=0;
	int memberCount=0;
	int pageCount=0;
	int pageSize=4;
	int currentPage=1;
	MemberDao memberDao = new MemberDao();
	memberCount = memberDao.getEnableCount();//得到被禁用会员的总数量值
	pageCount = (memberCount+(pageSize-1))/pageSize;//计算页数
	if(request.getParameter("page")!=null){
		currentPage = Integer.parseInt(request.getParameter("page"));
	}
	//根据当前页数和一页显示的数量查询该页要显示的会员集合
	ArrayList<Member> memberList = memberDao.queryEnableByPage(currentPage,pageSize);
	nextPage = currentPage==pageCount ? currentPage:currentPage+1;
	lastPage = currentPage==1?currentPage:currentPage-1;
	
	request.setAttribute("memberList", memberList);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
<title>已启用会员</title>
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

</style>
<script language="javascript" src="js/jquery.js"></script>
<script>


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
//跳转
function goByInput(){
	var num=document.getElementById("textfield");
	if(num.value!=""){
		location="EnableMemberEdit.jsp?page="+num.value;
	}
}
//批量启用和禁用的方法
function batchChangeStatus(status){
	//得到所有名称为checkbox2复选框的集合
	var nowStatus;
	var chs=document.getElementsByName("checkbox2");
	//计算选中复选框数量
	var n=0;
	for(var i=0;i<chs.length;i++){
		if(chs[i].checked){
			 n=n+1;
		}
	}
	if(n==0){
		alert("请先勾选要操作的会员");
		return false; 
	}
	//弹出确认对话框
	if (status==true)
		{var ms="启用";nowStatus="已禁用";}
	else
		{var ms="禁用";nowStatus="已启用";}
	if(!confirm("确认批量"+ms+"所有勾选项？")){
		return false;
	}
	//执行操作,chs[i].value取出的值为会员id
	for(var i=0;i<chs.length;i++){
		if(chs[i].checked==true){
			var changeButton=document.getElementById("changeStates"+chs[i].value);
			//如果当前状态和即将修改的状态相同的话就不用更改状态
			if(changeButton.value==nowStatus){
				ChangeStatus(chs[i].value,nowStatus);
			}
		}
	}
}
//改变状态的无刷新方法
function ChangeStatus(memberid,status){
		if(status=="已启用") {
			status=0;
		}
		if(status=="已禁用") {
			status=1;
		}
		$("#memberStatus"+memberid).html("<img src=\"tab/images/loading5.gif\"/>");
		$.get("AdminMemberEditServelt",{memberid:memberid,status:status,action:'changestatus'},
			function(rs){
			if(rs>0){
				if(status=="0"){
					$("#memberItem"+memberid).hide();
					$("#memberStatus"+memberid).html("<Input type='button' id='changeStates"+memberid+"' name='changeStates"+memberid+"' width='16' height='16' value='已禁用' onclick=\"ChangeStatus('"+memberid+"','已禁用')\" />");
				}
				if(status=="1"){
					$("#memberItem"+memberid).hide();
					$("#memberStatus"+memberid).html("<Input type='button' id='changeStates"+memberid+"' name='changeStates"+memberid+"' width='16' height='16' value='已启用' onclick=\"ChangeStatus('"+memberid+"','已启用')\" />");
				}
			}else{
				alert("操作失败！");
			}
		});
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[用户管理]-[已启用会员]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
<!--                       <input type="checkbox" name="checkbox62" value="checkbox" />
 -->                    </div></td>
<!--                     <td class="STYLE1"><div align="center">全选</div></td>
 -->                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
               <!--     <td class="STYLE1"><div align="center"><img src="tab/tab/images/22.gif" width="14" height="14" /></div></td>
                     <td class="STYLE1"><div align="center">新增</div></td>
 -->                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
               <!--      <td class="STYLE1"><div align="center"><img src="tab/images/33.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">修改</div></td> -->
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
             <!--        <td class="STYLE1"><div align="center"><img src="tab/images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">删除</div></td> -->
                  </tr>
                </table></td>
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
            <td width="3%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center">
            </div></td>
            <td width="12%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">会员编号</span></div></td>
            <td width="3%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">邮箱</span></div></td>
            <td width="14%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">真实姓名</span></div></td>
            <td width="18%" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">用户地址</span></div></td>
            <td width="23%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">注册时间</span></div></td>
            <td width="15%" height="22" background="tab/images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">用户状态</div></td>
          </tr>
          <c:forEach items="${memberList }" var="member" varStatus="status">
          <tr id="memberItem${member.memberId}">
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkbox2" value="${member.memberId}" />
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="center">${member.memberId}</div>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${member.memberEmail}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${member.memberName}</span></div></td>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${member.address}</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${member.joNumberime}</span></div></td>
          	<td height="20" bgcolor="#FFFFFF"><div align="center"><span id="memberStatus${member.memberId}" class="STYLE4">
          	<Input type="button" id="changeStates${member.memberId}" name="changeStates${member.memberId}" width="16" height="16" value="${member.memberStatus}" onclick="ChangeStatus('${member.memberId}','${member.memberStatus}')" /></span></div></td>   
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
            <input type="button" onclick="batchChangeStatus(false);" value="批量禁用" />
            
            
            &nbsp;&nbsp;共有&nbsp;<%=memberCount %>&nbsp;条记录
           
            
            
            </td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><%=currentPage %>/<%=pageCount%></td>
                  <td width="40"><a href="EnableMemberEdit.jsp?page=1" ><img src="tab/images/first.gif" width="37" height="15" /></a></td>
                  <td width="45"><a href="EnableMemberEdit.jsp?page=<%=lastPage %>"><img src="tab/images/back.gif" width="43" height="15" /></a></td>
                  <td width="45"><a href="EnableMemberEdit.jsp?page=<%=nextPage %>"><img src="tab/images/next.gif" width="43" height="15" /></a></td>
                  <td width="40"><a href="EnableMemberEdit.jsp?page=<%=pageCount %>"><img src="tab/images/last.gif" width="37" height="15" /></a></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                  <input id="textfield" name="textfield" type="text" size="4" style="height:12px; width:20px; border:1px solid #999999;" /> 
            			        页 </span></div></td>
                  <td width="40"><a href="javascript:goByInput();" ><img src="tab/images/go.gif" width="37" height="15" /></a></td>
                </tr>
            </table></td>
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

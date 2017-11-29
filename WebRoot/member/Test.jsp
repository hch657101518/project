<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>AsyncBox Test Page - wuxinxi007</title>
<link href="CSS/skins/ZCMS/asyncbox.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="JS/jQuery.v1.4.2.js"></script>
<script type="text/javascript" src="JS/AsyncBox.v1.4.5.js"></script>

<script type="text/javascript">


function  discuss(id){
	asyncbox.open({
	url : 'Test2.jsp',
		data : 'id='+id,
		title:"订单评论",
	width : 400,
	height : 300
	});
}
</script>

</head>
<body>
<input id="btn_a00lert" type="button" onclick="discuss(84831253);" value="alert" />
</body>
</html>

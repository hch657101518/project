function Check_Reg(){
    var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-";
	var checkStr = myform.UserName.value;
	var allValid = true;
	var validGroups = true;
	for (i = 0;  i < checkStr.length;  i++){
		ch = checkStr.charAt(i);
		for (j = 0;  j < checkOK.length;  j++)
		if (ch == checkOK.charAt(j))
			break;
		if (j == checkOK.length){
			allValid = false;
			break;
		}
	}
    return allValid;
}

//检查EMAIL
function Check_Email(){
    var span_CheckUsername = document.getElementById("span_CheckUsername");
    var str=$("#Email").val();
    var reg=/^[\w-]+(\.[\w-]+)*@[\w-]+(\.(\w)+)*(\.(\w){2,3})$/;
    //alert(reg.test(str));
    if(str.length<1){
		 $("#span_CheckUsername").addClass("Error").removeClass("rihtReg");
		 span_CheckUsername.innerHTML = '<font color=#A10000>此项为必填项，请输入你的Email地址</font>';
		 return false;
	}else if (!reg.test(str)){
		 $("#span_CheckUsername").addClass("Error").removeClass("rihtReg");
		 span_CheckUsername.innerHTML = '<font color=#A10000>请输入有效的Email地址</font>';
		 return false;
	}
    else{
    	$.post("RegisterServlet",{Email:str,type:"checkemail"},function(data){
    		if(data=="1"){
    			$("#span_CheckUsername").removeClass("Error").addClass("rihtReg");
                $("#span_CheckUsername").html("该用户名可以使用");
    		}else{
    			$("#span_CheckUsername").addClass("Error").removeClass("rihtReg");
                $("#span_CheckUsername").html("<font color=#A10000>对不起，该用户名已经被人占用!</font>");                
                bool=false;
    		}
    	});
	}
    return true;
}


//检查密码
function ChangePassword(){
    var Password = document.getElementById("PassWord");
    if(Password.value.length<6){
        $("#CheckRePassWord").addClass("Error");
        $("#CheckRePassWord").html("<font color=#A10000>此项为必填项，密码不能小于6位</font>");
        return false;
    }else{
        $("#CheckRePassWord").removeClass("Error");
        $("#CheckRePassWord").html("");
    }
    return true;
}
//检查重新输出密码
function Check_RePassWord(){
    var PassWord = document.getElementById("PassWord");
    var RexPassWord = document.getElementById("RexPassWord");
	if((RexPassWord.value=="") || (PassWord.value!=RexPassWord.value)){
		$("#ReCheckRePassWord").addClass("Error");
        $("#ReCheckRePassWord").html('<font color=#A10000>两次输入密码不一致，请重新输入！</font>');
        return false;
	}else{
	    $("#ReCheckRePassWord").removeClass("Error");
		$("#ReCheckRePassWord").html('');
	}
	return true;
}
//检查昵称
function CheckNewUserName() {
	var NewUserName = document.getElementById("NewUserName");
	if (NewUserName.value != "" && !/^[a-zA-Z0-9_\u4e00-\u9fa5]+$/.test(NewUserName.value)) {
		$("#CheckNewUserName").addClass("Error");
		$("#CheckNewUserName").html("<font color=#A10000>昵称只能含有中英文、数字和下划线</font>");
		return false;
	} else {
		$("#CheckNewUserName").removeClass("Error");
		$("#CheckNewUserName").html("");
	}
	return true;
}		
//检查验证码
function CheckValidateCode(){
    var Validate_Code = document.getElementById("Validate_Code");
	if((Validate_Code.value=="") || (Validate_Code.value.length<4)){
	    $("#CheckValidateCode").addClass("Error");
	    $("#CheckValidateCode").html('<font color=#A10000>请输入正确的验证码</font>');
        return false;
	}else{
	    $("#CheckValidateCode").removeClass("Error");
	    $("#CheckValidateCode").html('');
	    return xmlcheckeVCode00(Validate_Code.value);
	}
	return true;
}

function xmlcheckeVCode00(CheckCode){
var bool=true;
var xmlhttp;
try{
xmlhttp = new ActiveXObject('Msxml2.XMLHTTP')
} catch(e){
try{
xmlhttp=new ActiveXObject('Microsoft.XMLHTTP');
} catch(e){
try{
xmlhttp=new XMLHttpRequest();
}catch(e){}
}
  }
 //var userName = document.form.userName.value;
 xmlhttp.open("post","XmlCheckCode.asp?CheckCode="+CheckCode,true); //checkUserName.jsp是你判断名字重复代码,也可 以提交到servlet!out.println();输出你的提示信息。xmlhttp.responseText用来获取你的信息。
 xmlhttp.onreadystatechange=function(){   
 if (xmlhttp.readyState==4){
if (xmlhttp.status==200){   
//document.getElementById("span_CheckUsername").innerHTML="<font color='red'>"+xmlhttp.responseText+"</font>";
            if (xmlhttp.responseText==0){  
			    //$("#CheckValidateCode").addClass("Error");
                //$("#CheckValidateCode").html("<font color=#A10000>"+error+"</font>");
				$("#CheckValidateCode").addClass("Error");
                $("#CheckValidateCode").html("<font color=#A10000>请输入正确的验证码</font>");                
                bool=false;
			}else{
                //$("#CheckValidateCode").removeClass("Error").addClass("rihtReg");
                //$("#span_CheckUsername").html("该用户名可以使用");
				$("#CheckValidateCode").removeClass("Error");
		        $("#CheckValidateCode").html("");
				}

}
  }
 }  
 xmlhttp.send(null);
 //return false;
 return bool;
}
//提交再次验证
function Check_User_Login(){
	if (!Check_Email()) return false;
	if (!ChangePassword()) return false;
	if (!Check_RePassWord()) return false;
	if (!CheckNewUserName()) return false;
	if (!CheckValidateCode()) return false;
	return true;;
}


function ChangeImg1(){
    $("#Img1").attr("src","/system/checkcode.asp");
}
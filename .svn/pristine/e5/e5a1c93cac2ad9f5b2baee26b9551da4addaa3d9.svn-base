/// <reference path="jquery-1.4.1-vsdoc.js" />
$(function(){
    // 圣诞配送时间选择时提示
    $("#send_datatime_config input[name='send_timezone']").click(
        function(){
			checkSendDate();
			if( $("#send_dd").val() != ""){
				var preTimeSpan,nowTimeSpan, selDay;
				
				if($("#send_dd").val().substr(0,1) == "0"){
					selDay = parseInt($("#send_dd").val().replace("0",""),10);
				}else{
					selDay = parseInt($("#send_dd").val(),10);
				}
				
				nowTimeSpan = serveiceNow[0] *365*12 + serveiceNow[1]*31*12 + serveiceNow[2]*12 +  serveiceNow[3];
				preTimeSpan = parseInt($("#send_yy").val()) *365*12 + parseInt($("#send_mm").val(),10)*31*12 + selDay*12
	             
				if($("#send_mm").val() == "12" && ($("#send_dd").val() == "24" || $("#send_dd").val() == "25")){
				//if($("#send_mm").val() == "08" && ($("#send_dd").val() == "23")){
					switch($(this).val()){
						case "随时都可":
							$("#ChristmasReminderInfo").css("display","none");
						break;
						case "上午":
							$("#ChristmasReminderInfo").css("display","block");
						break;
						case "下午":
							$("#ChristmasReminderInfo").css("display","block");
						break;
						case "晚上":
							$("#ChristmasReminderInfo").css("display","block");
						break;
						case "定点服务":
							$("#ChristmasReminderInfo").css("display","none");
						break;
						}
					}
				else{
					$("#ChristmasReminderInfo").css("display","none");
				}
				
				switch($(this).val()){
						case "随时都可":
						preTimeSpan = preTimeSpan + 24;
						break;
						case "上午":
							 if($("#send_dd").val() != ""){
								preTimeSpan = preTimeSpan + 12;
							 }
						break;
						case "下午":
							 if($("#send_dd").val() != ""){
								preTimeSpan = preTimeSpan + 18;
							 }
						break;
						case "晚上":
							 if($("#send_dd").val() != ""){
								preTimeSpan = preTimeSpan + 20;
							 }
						break;
						case "定点服务":
							preTimeSpan = preTimeSpan + 24;
						break;
				}

				if(preTimeSpan <= nowTimeSpan){
				   	 $("#SendDate_ErrorInfo span").html("时段");
					 $("#SendDate_ErrorInfo").css("display","block");
				}else{
					 $("#SendDate_ErrorInfo").css("display","none");
				}
			}
			}
    );
    
   $("#send_yy").change(function(){
		checkSendDate();
   });
   
   $("#send_mm").change(function(){
		checkSendDate();
   }); 
   
   $("#send_dd").change(function(){
		checkSendDate();
   });    
});

function checkSendDate(){
	var selDay;
	
	try
	{
		if($("#send_mm").val() != "12" || $("#send_dd").val() != "24" || $("#send_dd").val() != "23"|| $("#send_dd").val() != "25" ){
			$("#ChristmasReminderInfo").css("display","none");
		}
	}catch(e){}
	
	if($("#send_dd").val().substr(0,1) == "0"){
		selDay = parseInt($("#send_dd").val().replace("0",""),10);
	}else{
		selDay = parseInt($("#send_dd").val(),10);
	}

	if($("#send_dd").val() != ""){
		var year = parseInt($("#send_yy").val());
		
		if($("#send_mm").val().substr(0,1) == "0"){
			var month = parseInt($("#send_mm").val().replace("0",""),10);
		}else{
			var month = parseInt($("#send_mm").val(),10);
		}
		
		if((serveiceNow[0] == year && month < serveiceNow[1])){
			 $("#SendDate_ErrorInfo span").html("日期");
			$("#SendDate_ErrorInfo").css("display","block");
		}else if(serveiceNow[0] == year && month == serveiceNow[1] && selDay < serveiceNow[2]){
			 $("#SendDate_ErrorInfo span").html("日期");
			$("#SendDate_ErrorInfo").css("display","block");
		}else{
			$("#SendDate_ErrorInfo").css("display","none");
		}
		
		if(selDay > 28){
		 checkDate($("#send_yy").val() + "-" + $("#send_mm").val() + "-" + $("#send_dd").val());
		}
	}
}

function checkDate(sDate){	$.ajax({type: "post",dataType: "text",url: "ajaxcheckdate.asp",	data: "sdate=" + sDate,success: function(data) {if(data == "0"){$("#SendDate_ErrorInfo span").html("日期");	$("#SendDate_ErrorInfo").css("display","block");} } });
}
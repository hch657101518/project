

$(document).ready(function(){
	
	
	//Remove outline from links
	$("a").click(function(){
		$(this).blur();
	});
	
	//When mouse rolls over
	$("#topmenu li").mouseover(
		function(){
			if($(this).find("dl").length>0){
		var DLheight = $(this).find("dl").height();
		var ULheight = DLheight+46;
		$(this).stop().animate({height:ULheight+'px'},{queue:false, duration:300, easing: ''})
								  }
	});
	
	//When mouse is removed 
	$("#topmenu li").mouseout(
		function(){
		$(this).stop().animate({height:'42px'},{queue:false, duration:300, easing: ''})
		
		//hideMsgBox(this,event);
	});
	

});
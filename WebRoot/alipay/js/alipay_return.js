
	var i=1;
	var j=1;
	var myTimer;
	function showImg() {
		var img=document.getElementById("outOne");
		img.src="alipay/image/outSingle"+i+".jpg";
		for(index=1;index<=5;index++){
			if(index==i){
				$("#li"+i).css("backgroundColor","red");
			}else{
				$("#li"+index).css("backgroundColor","menu");
			}
		}
		i++;
		if(i>5){
			i=1;
		}
		myTimer=setTimeout("showImg()",2000);
	}
	
	function stopImg() {
		clearTimeout(myTimer);
	}
	
	function linkTo(x) {
		i=x;
		clearTimeout(myTimer);
		showImg();
	}
	
	function stopMarquee() {
		document.getElementById("marqueeImg").stop();
	}
	
	function startMarquee() {
		document.getElementById("marqueeImg").start();
	}
	
	function showColor() {
		if(j==1){
			$("#box1").css("border-color","gray");
		}else if(j==2){
			$("#box1").css("border-color","red");
		}else if(j==3){
			$("#box1").css("border-color","green");
		}else if(j==4){
			$("#box1").css("border-color","yellow");
		}else{
			$("#box1").css("border-color","purple");
		}
		j++;
		if(j>5){
			j=1;
		}
		setTimeout("showColor()",500);
	}
	


	
	
	
	
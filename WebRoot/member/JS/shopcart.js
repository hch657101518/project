function ShopCart(product_code)
{
	//ÆÕÍ¨¹ºÂò
	var url = "/shopping/addshop.asp?product_code="+product_code+"&quantity=1";
	var popup = window.open(url,"AddToCart","menubar=yes,Resizable=yes,toolbar=yes,location=yes,directories=no,status=yes,width=700,height=550,left=10,top=10,scrollbars=yes");
	
	return;
}
function MemberShopCart(product_code)
{
	//»áÔ±¹ºÂò
	var url1 = "/shopping/AddShop_VIP.asp?product_code="+product_code+"&quantity=1";
	var popup1 = window.open(url1,"VipShop","menubar=yes,Resizable=yes,toolbar=yes,location=yes,directories=no,status=yes,width=700,height=550,left=10,top=10,scrollbars=yes");
	
	return;
}
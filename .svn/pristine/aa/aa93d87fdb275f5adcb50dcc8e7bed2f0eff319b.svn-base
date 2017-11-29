var newwin
var tempTitle
var oWidth
var oHeight
var oThisNoResize

function getVal(string, name)
{
	var arg = name
	var text = string

	var offset = text.indexOf(name)
	if (offset == -1)	return
	text = text.substr(offset + arg.length, text.length).Trim()
	var endstr = text.indexOf(",")
	if (endstr == -1)	endstr = text.length
	text = text.substr(1, endstr - 1).Trim()
	return text
}

String.prototype.Trim = function()
{
	return this.replace(/(^\s*)|(\s*$)/g, "")
}

String.prototype.LTrim = function()
{
	return this.replace(/(^\s*)/g, "")
}
String.prototype.Rtrim = function()
{
	return this.replace(/(\s*$)/g, "")
}

function isPicture(url)
{
	var type = url.substr(url.lastIndexOf(".") + 1, url.length)

	switch(type)
	{
		case("bmp")	:
		case("dib")	:
		case("jpg")	:
		case("jpe")	:
		case("jpeg")	:
		case("gif")	:
			return true
		default		:
			return false
	}
}

function onReady(page)
{
	var oWindow = newwin
	var oPage = page
	var isPic = isPicture(oPage)
	var isLoad = false
	var doc

	if (!oWindow)  return
	if ((location.host != oWindow.location.host) && (oWindow.location.href != 'about:blank')) return

	var ready = oWindow.document.readyState
	//if (	( ready == "complete" && isPic) ||
	//	((ready == "loading" || ready == "complete") && !isPic)	)
	if (ready == "complete" && oWidth)
	{
		isLoad = true
		doc = oWindow.document
	}

	if (isLoad)
	{
		if (!doc.title)		doc.title = tempTitle
		
		oWindow.resizeTo(oWidth, oHeight)
		
		if (isPic)
		{
			doc.body.style.margin = 0
			img_html =	"<a href=\'javascript:window.close();\'><img src=" + oPage + " border=0 alt=点击关闭></a>"
			doc.body.insertAdjacentHTML("AfterBegin", img_html)
			if (imgAutoResize && !oThisNoResize)
			{
				autoResizeImg()
			}
		}
		else if (docAutoResize && !oThisNoResize)
		{
			autoResizeDoc()
		}
	}
	else
	{
		setTimeout("onReady('" + oPage + "')", 500)
	}
}

function autoResizeDoc()
{
	var oDoc = newwin.document
	var isLoad = false

	if (	oDoc.readyState == "complete")
	{
		isLoad = true
	}
	
	if (isLoad)
	{
		var newBody = newwin.document.body
		
		widthRevise = defaultWidth - newBody.clientWidth
		heightRevise = defaultHeight - newBody.clientHeight
		oWidth = newBody.scrollWidth + widthRevise + parseInt(newBody.leftMargin)
		oHeight = newBody.scrollHeight + heightRevise + parseInt(newBody.topMargin)
		oWidth = Math.min(screen.availWidth, oWidth)
		oHeight = Math.min(screen.availHeight, oHeight)
		
		newwin.resizeTo(oWidth, oHeight)
	}
	else
	{
		setTimeout("autoResizeDoc()", 500)
	}
}

function autoResizeImg()
{
	var oImg = newwin.document.images[0]
	var isLoad = false

	if (	oImg.readyState == "loading" ||
		oImg.readyState == "complete")
	{
		isLoad = true
	}

	if (isLoad)
	{
		oWidth = oImg.offsetWidth
		oHeight = oImg.offsetHeight
		widthRevise = defaultWidth - newwin.document.body.clientWidth
		heightRevise = defaultHeight - newwin.document.body.clientHeight

		if ((oWidth + widthRevise) > screen.availWidth)
		{
			oWidth = screen.availWidth
			oImg.width = oWidth
			oImg.removeAttribute("height")
			oHeight = oImg.offsetHeight
		}
		else
		{
			oWidth += widthRevise
		}

		if ((oHeight + heightRevise)  > screen.availHeight)
		{
			oHeight = screen.availHeight
			oImg.height = oHeight - heightRevise
			oImg.removeAttribute("width")
			oWidth = oImg.offsetWidth + widthRevise
		}
		else
		{
			oHeight += heightRevise
		}

		newwin.resizeTo(oWidth, oHeight)
	}
	else
	{
		setTimeout("autoResizeImg()", 500)
	}
}

function valSetting(par, defaultValue)
{
	try
	{
		var returnPar = eval(par)
	}
	catch(errorid)
	{
		var returnPar = defaultValue
	}
	
	return returnPar
}

function openwin(page,windowname,windowmode)
{
	if	(!page) return
	if	(newwin) newwin.close()

	defaultTitle = valSetting("defaultTitle", "<!--title-->")
	defaultWidth = valSetting("defaultWidth", 0)
	defaultHeight = valSetting("defaultHeight", 0)
	imgAutoResize = valSetting("imgAutoResize", true)
	docAutoResize = valSetting("docAutoResize", true)
	
	if	(!windowmode)	var windowmode = "toolbar = yes,scrollbars = no"
	windowmode = windowmode.toLowerCase()
	var isPic = isPicture(page)
	var title = getVal(windowmode, "title")
	var width = getVal(windowmode, "width")
	var height = getVal(windowmode, "height")
	
	defaultWidth = Math.max(100, defaultWidth)
	defaultHeight = Math.max(100, defaultHeight)
	
	if (width || height)	var thisNoResize = true
	else			var thisNoResize = false
	width = (width) ? width : defaultWidth
	height = (height) ? height : defaultHeight
	
	//////////////////////////////设置新窗口标题////////////////////////////////

	var topic = (event.srcElement.tagName == "IMG") ? event.srcElement.alt : event.srcElement.innerText
	title = (title == null) ? topic : title
	tempTitle = defaultTitle.replace("<!--title-->", title)

	////////////////////////////////////////////////////////////////////////////

	oWidth = width
	oHeight = height
	oThisNoResize = thisNoResize

	if (isPic)
		newwin = window.open("",windowname,windowmode)
	else
		newwin = window.open(page,windowname,windowmode)

	onReady(page)
}
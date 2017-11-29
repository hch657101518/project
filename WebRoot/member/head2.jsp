<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
#jSuggestContainer {
	position: absolute;
	font: 12px Tahoma;
	border: 1px solid #d91516;
	border-top: 0;
	background: #FFF;
}

.jSuggestLoading {
	font-style: italic;
	padding: 10px;
}

#jSuggestContainer ul,#jSuggestContainer ul li {
	margin: 0;
	padding: 0;
	list-style: none;
}

#jSuggestContainer ul li {
	padding: 2px 4px;
	border-bottom: 1px dotted #ffe594;
	color: #666;
	background: #fff9e7;
	cursor: pointer
}

#jSuggestContainer ul li.last {
	border-bottom: 0;
}

#jSuggestContainer ul li.jSuggestHover {
	background: #ffeaaa;
	color: #333;
}
</style>
<script language="javascript" type="text/javascript" src="JS/jquery.js"></script>
<script language="javascript" type="text/javascript"
	src="JS/jSuggest.js"></script>
<script language="javascript">
	$(document).ready(function() {
		$("#keyword").jSuggest({
			url : "MemberSearchServlet",
			type : "POST",
			data : "keyword",
			autoChange : true
		});

	});
</script>
<div class="tgmenu">
	<ul>
		<li><a href='MemberFlowerCateGory?use=153&page=1'>生日鲜花</a>
		</li>
		<li><a href="MemberCakeCateGory?cake=149&page=1" title="生日蛋糕">生日蛋糕</a>
		</li>
		<li><a href="MemberFlowerCateGory?holiday=96&page=1" title="圣诞节">圣诞节专题</a>
		</li>
		<li><a href="MemberFlowerCateGory?holiday=84&page=1" title="元旦节">元旦节专题</a>
		</li>
	</ul>
</div>
<div class="hd2_box">
	<div class="hd2_main clearfix">
		<div class="menuenglish">
			<a href="/FlowerOnline/" rel="nofollow" target="_blank"><img
				src="Images/english.jpg" alt="flowers" border="0" />
			</a>
		</div>
		<ul id="hd2_nav" class="fl f14">
			<li><a href="IndexPage"><span>首页</span>
			</a>
			</li>
			<li><a href="MemberFlowerCateGory?allflower=1&page=1" title="鲜花"><span>鲜花</span>
			</a>
				<div class="navp">
					<h3>送花对象</h3>
					<div class="lsitspannr">
						<p>
							<span><a href='MemberFlowerCateGory?use=25&page=1'>恋人</a>
							</span><span><a href='MemberFlowerCateGory?use=148&page=1'>朋友</a>
							</span><span><a href="MemberFlowerCateGory?holiday=91&page=1"
								title="父亲节">父亲</a>
							</span><span><a href="MemberFlowerCateGory?holiday=89&page=1"
								title="母亲节">母亲</a>
							</span><span><a href="MemberFlowerCateGory?holiday=92&page=1"
								title="教师">老师</a>
							</span><span><a href='MemberFlowerCateGory?use=148&page=1'>同事</a>
							</span><span><a href='MemberFlowerCateGory?use=148&page=1'>客户</a>
							</span> <br class="clear" />
						</p>
					</div>
					<h3>其它</h3>
					<div class="lsitspannr">
						<p>
							<span><a href="MemberFlowerCateGory?allflower=9">商务鲜花</a>
							</span> <span><a href="MemberFlowerCateGory?price=0&page=1"
								title="特价鲜花" class="color_tj">特价鲜花</a> </span>
						</p>
						<p>
							<span> <a href='MemberFlowerCateGory?use=23&page=1'>
									婚庆鲜花</a>
							</span> <span> <a href='MemberFlowerCateGory?use=24&page=1'>
									家居鲜花</a>
							</span>
						</p>
						<P>
							<span><a href='MemberFlowerCateGory?use=153&page=1'>生日鲜花</a>
							</span> <span> <a href='MemberFlowerCateGory?use=151&page=1'>节日鲜花</a>
							</span>
						</p>
						<br class="clear" />

					</div>

					<h4>
						<a href="MemberFlowerCateGory?allflower=1&page=1" target="_blank"
							title="更多中国鲜花礼品网热卖鲜花" class="rmxh_more">更多热卖鲜花>></a>
					</h4>
				</div></li>
			<li><a href="MemberCakeCateGory?allcake=2"><span>蛋糕</span>
			</a>
				<div class="navp">

					<h3>蛋糕品牌</h3>
					<div class="lsitspannr">
						<p>
							<span><a href="MemberCakeCateGory?cake=17&page=1"
								title="鲜奶蛋糕">鲜奶蛋糕</a>
							</span> <span><a href="MemberCakeCateGory?cake=18&page=1"
								title="水果蛋糕">水果蛋糕</a>
							</span>
						</p>
						<p>
							<span><a href="MemberCakeCateGory?cake=19&page=1"
								title="巧克力蛋糕">巧克力蛋糕</a>
							</span> <span><a href="MemberCakeCateGory?cake=20&page=1"
								title="婚庆蛋糕">婚庆蛋糕</a>
							</span>
						</P>
						<p>
							<span><a href="MemberCakeCateGory?cake=21&page=1"
								title="儿童蛋糕">儿童蛋糕</a>
							</span> <span><a href="MemberCakeCateGory?cake=149&page=1"
								title="生日蛋糕">生日蛋糕</a>
							</span> <br class="clear" />
						</p>
					</div>
					<h4>
						<a href="MemberCakeCateGory?allcake=2" target="_blank"
							title="更多热卖生日蛋糕" class="srdg_more">更多生日蛋糕</a>
					</h4>
				</div></li>


			<li><a href="MemberGiftServlet?allgift=8" title="礼篮"><span>礼篮</span>
			</a>
				<div class="navp">
					<div class="lsitspannr">
						<p class="inpadding">
							<span><a href="MemberFlowerCateGory?use=261&page=1"
								title="精致花篮">精致礼篮</a> </span><span><a
								href="MemberFlowerCateGory?use=262&page=1" title="鲜花礼篮">鲜花礼篮</a>
							</span> <br class="clear" />
						</p>
					</div>
					<br />
				</div></li>
			<li><a href="MemberFlowerCateGory?allflower=9"><span>商务鲜花</span>
			</a></li>
			<li><a href="MemberFlowerCateGory?allflower=4" title="绿植花卉"><span>绿植花卉</span>
			</a>
			</li>
			<li><a href="MemberGiftServlet?allgift=7"><span>品牌公仔</span>
			</a>
			</li>
			<li><a href="MemberGiftServlet?allgift=6"><span>卡通花束</span>
			</a>
			</li>
			<li class="gatli1"><a href="MemberGiftServlet?allgift=5"><span>特色礼品</span>
			</a></li>

		</ul>
	</div>
</div>

<!--搜索栏BOX开始Start-->
<!--配送Start-->
<div class="search">
	<div class="peisongbox">
		<a href="#" title="配送范围" target="_blank">配送范围</a> | <a href="#"
			rel="nofollow" target="_blank">付款方式</a> | <a href="#" rel="nofollow"
			target="_blank">在线补款</a> | <a href="#" title="鲜花图片" target="_blank">鲜花图片</a>
		| <a href="#" title="送花祝福语大全" target="_blank">送花祝福语</a>
	</div>
	<!--配送End-->

	<!--搜索Start-->
	<form name="i_search" method="post"
		action="MemberSearchServlet?type=find">
		<div class="search_inbox">
			<div class="input_box">
				<div class="search_inputbox">
					<input name="keyword" id="keyword" type="text" value="" size=""
						class="search_input" />
				</div>
				<input type="submit" class="search_btn" value="搜索" />
			</div>

			<div class="hotkey">
				热门搜索： <a href="MemberFlowerCateGory?holiday=94&page=1" title="中秋节">中秋节</a>
				<a href="MemberCakeCateGory?allcake=2">生日</a> <a
					href="MemberFlowerCateGory?floral=18&page=1" title="玫瑰">玫瑰</a> <a
					href="MemberGiftServlet?allgift=7" target="_blank" title="更多品牌公仔"
					class="gzlp_more">公仔</a>
			</div>
		</div>
	</form>
	<!--搜索End-->
</div>

<!--搜索栏BOX结束End-->
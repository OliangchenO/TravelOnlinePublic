<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FreeTourBanner.ascx.cs" Inherits="TravelOnline.NewPage.FreeTourBanner" %>
			<div class="hotplace-wrap">
				<h2>自由行热门目的地</h2>
				<div class="place-con">
					<p><a href="search.html?key=港澳台" target="_blank">港澳台</a></p>
					<a href="search.html?key=台湾" target="_blank">台湾</a>
					<a href="search.html?key=香港" target="_blank">香港</a>
					<a href="search.html?key=澳门" target="_blank">澳门</a>
				</div>
				<div class="place-con">
					<p><a href="search.html?key=日韩" target="_blank">日韩</a></p>
					<a href="search.html?key=日本" target="_blank">日本</a>
				</div>
				<div class="place-con">
					<p><a href="search.html?key=东南亚" target="_blank">东南亚</a></p>
					<a href="search.html?key=新加坡" target="_blank">新加坡</a>
					<a href="search.html?key=马来西亚" target="_blank">马来西亚</a>
					<a href="search.html?key=泰国" target="_blank">泰国</a>
					<a href="search.html?key=马尔代夫" target="_blank">马尔代夫</a>
					<a href="search.html?key=巴厘岛" target="_blank">巴厘岛</a>
					<a href="search.html?key=斯里兰卡" target="_blank">斯里兰卡</a>
					<a href="search.html?key=塞班岛" target="_blank">塞班岛</a>
				</div>
				<div class="place-con">
					<p><a href="search.html?key=国内" target="_blank">国内</a></p>
					<a href="search.html?key=上海" target="_blank">上海</a>
					<a href="search.html?key=浙江" target="_blank">浙江</a>
					<a href="search.html?key=青岛" target="_blank">青岛</a>
					<a href="search.html?key=三亚" target="_blank">三亚</a>
					<a href="search.html?key=福建" target="_blank">福建</a>
					<a href="search.html?key=广西" target="_blank">广西</a>
					<a href="search.html?key=广东" target="_blank">广东</a>
					<a href="search.html?key=云南" target="_blank">云南</a>
					
				</div>
			</div>
			<div class="ranking">
				<h3>热销排行</h3>
			    <%=TravelOnline.NewPage.Class.CacheClass.Second_Hot("FreeTour_Hot")%>
            </div>
			<div class="month-hot">
				<h3>年度热门推荐</h3>
				<div class="month-con">
					<p>出境</p>
					<div class="place">
						<a href="search.html?key=东京" target="_blank">东京</a>
						<a href="search.html?key=冲绳" target="_blank">冲绳</a>
						<a href="search.html?key=香港" target="_blank">香港</a>
						<a href="search.html?key=巴厘岛" target="_blank">巴厘岛</a>
						<a href="search.html?key=普吉岛" target="_blank">普吉岛</a>
						<a href="search.html?key=塞班" target="_blank">塞班</a>
						<a href="search.html?key=塞班" target="_blank">塞班</a>
						<a href="search.html?key=清迈" target="_blank">清迈</a>
						<a href="search.html?key=马尔代夫" target="_blank">马尔代夫</a>
						<a href="search.html?key=悉尼" target="_blank">悉尼</a>
						<a href="search.html?key=墨尔本" target="_blank">墨尔本</a>
						<a href="search.html?key=斐济" target="_blank">斐济</a>
						<a href="search.html?key=黄金海岸" target="_blank">黄金海岸</a>
						<a href="search.html?key=斯里兰卡" target="_blank">斯里兰卡</a>
					</div>
				</div>
				<div class="month-con">
					<p>国内</p>
					<div class="place">
						<a href="search.html?key=桂林" target="_blank">桂林</a>
						<a href="search.html?key=北海" target="_blank">北海</a>
						<a href="search.html?key=阳朔" target="_blank">阳朔</a>
						<a href="search.html?key=成都" target="_blank">成都</a>
						<a href="search.html?key=庐山" target="_blank">庐山</a>
						<a href="search.html?key=西塘" target="_blank">西塘</a>
					</div>
				</div>
			</div>
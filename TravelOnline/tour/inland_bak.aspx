﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inland.aspx.cs" Inherits="TravelOnline.tour.inland" %>
<%@ Register src="../NewMaster/header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="../NewMaster/footer.ascx" tagname="Footer" tagprefix="uc2" %>
<%@ Register src="../NewMaster/index_destination.ascx" tagname="index_destination" tagprefix="uc3" %>
<%@ Register src="../NewMaster/inland_destination.ascx" tagname="inland_destination" tagprefix="uc4" %>
<%@ Register src="../NewMaster/menu.ascx" tagname="menu" tagprefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>国内旅游 - <% =TravelOnline.Class.Common.PublicPageKeyWords.InLandTitle%></title>
    <meta name="description" content="<% =TravelOnline.Class.Common.PublicPageKeyWords.PublicDescription %>" />
    <meta name="Keywords" content="<% =TravelOnline.Class.Common.PublicPageKeyWords.InLandKeywords %>" />
    <link href="/css/bootstrap.css" rel="stylesheet" media="screen" />
    <link href="/css/index.css" rel="stylesheet" />
    <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.js"></script>
    <script type="text/javascript" src="/js/jquery.lazyload.min.js"></script>
    <script type="text/javascript" src="/js/superslide.2.1.js"></script>
    <%--<script type="text/javascript" src="/js/jquery.idTabs.js"></script>--%>
    <script type="text/javascript" src="/js/jquery.nav.js"></script>
    <script type="text/javascript" src="/js/boot.page.js"></script>
    <style type="text/css">
        .destination_box{height:473px;padding-top:0px;}
        .hot_destination{background-color:#F6FFF3;width:176px;border:2px solid #01AA07;border-width:2px 2px 2px 2px;position:relative;z-index:20;}
        .destination_small {overflow:hidden;}
        .destination_small dd{padding-left:66px;line-height:0px;position:relative;_position:static;font-size:0;overflow:hidden;_zoom:1;}
        .destination_small dd{width:176px;padding-left:8px;position:relative;font-size:0;overflow:hidden;_zoom:1;}
        .destination_small dd a,.destination_detail .local_type a {min-width:48px;max-width:150px;display:inline-block;font-size:12px;line-height:25px;height:25px;margin-right:6px;}
        .destination_small dt{padding-left:8px;font-weight:bold;width:176px;z-index:2;margin-top:8px;padding-top:0px;text-align:left;}
        .destination_small dt a{color: #038307;}
        
        .fullSlide {z-index:1;width:940px;}
        .fullSlide .hd {z-index:5;}
        .fullSlide .prev,.fullSlide .next {left:5%;}
        .fullSlide .next {left:auto;right:5%;}
        
        .nav{z-index:20;width:940px; height:45px; position:absolute;border:0px solid #d3d3d3; background:#fff;-moz-border-radius:2px; -webkit-border-radius:2px; border-radius:2px; overflow: hidden;} 
        .nav li{cursor: pointer;text-align: center;width:90px;float:left; height:40px; line-height:40px; padding:0 5px; border-bottom:4px solid #DDDDDD;border-right: 0px solid #d3d3d3; font-size:20px; font-weight:normal} 
        .nav li.current{color:#468847;background:#ffffff; height:40px; border-bottom:4px solid #01AA07} 
        .nav li.current a{color:#468847} 
        .nav li.last{width:330px;}
        .shadow{-moz-box-shadow:1px 1px 2px rgba(0,0,0,.2); -webkit-box-shadow:1px 1px 2px rgba(0,0,0,.2); box-shadow:1px 1px 2px rgba(0,0,0,.2);}
    </style>
    <script type="text/javascript">
        //990
        if (screen.width >= 1280) {
            document.write("<style type='text/css'>.nav{width:1170px;}.nav li.last{width:560px;}.fullSlide{width:1170px;}.product_tj{width:976px;}</style>");
        }
        else {
            document.write("<style type='text/css'>.product_tj{width:742px;}.right_part{width:750px;}.product_list{width:936px;}.usual{width:940px;}.usual .content{width:940px;}</style>");
        }

        //pin
        $.fn.smartFloat = function () {
            var position = function (element) {
                var top = element.position().top;
                var pos = element.css("position");
                $(window).scroll(function () {
                    var scrolls = $(this).scrollTop();
                    if (scrolls > top) {
                        if (window.XMLHttpRequest) {
                            element.css({
                                position: "fixed",
                                top: 0
                            }).addClass("shadow");
                        } else {
                            element.css({
                                top: scrolls
                            });
                        }
                    } else {
                        $("#nav_order").hide();
                        element.css({
                            position: pos,
                            top: top
                        }).removeClass("shadow");
                    }
                });
            };
            return $(this).each(function () {
                position($(this));
            });
        };
    </script>
</head>
<body>
<uc1:Header ID="Header1" runat="server" />
<div id="menu">
    <div class="container" >
        <div class="row">
            <div class="span12" style="background:#01AA07;">
                <uc5:menu ID="menu1" runat="server" />
                <uc3:index_destination ID="index_destination1" runat="server" />
            </div>
        </div>
    </div>
</div>

<%--<div class="fullSlide">
    <div class="bd"><ul><%=SlidePicHtml%></ul></div>
    <div class="hd"><ul></ul></div>
    <span class="prev"></span> <span class="next"></span>
</div>--%>
<div class="topadback" style="padding-bottom:0px;">
    <div class="container">
	    <div class="row">
		    <div class="span12">
                <div class="fullSlide">
                    <div class="bd"><ul><%=SlidePicHtml%></ul></div>
                    <div class="hd"><ul></ul></div>
                    <span class="prev"></span> <span class="next"></span>
                </div>
            </div>
	    </div>
    </div>
</div>
<%--<div class="topadback" style="padding-bottom:10px;">
    <div class="container" >
	    <div class="row">
		    <div class="span12">
		        <div class="left_part" style="margin-top: -290px;">
                    <uc4:inland_destination ID="inland_destination1" runat="server" />
		        </div>
                <div class="right_part">
                    <div class="onsale_product product_tj" style="height:193px;background-color:#fff;border:2px solid #01AA07;border-width:2px 2px 2px 2px;position:relative;overflow:hidden;" >
                        <div class="product_zoomfix" style="color:#FFF;background:#01AA07;height:192px;width:40px;border:1px solid #01AA07; border-width: 0px 0px 1px 0px;"> 
                            <div class="product_zoomfix" style="padding-left:9px;padding-top:10px;line-height:30px;font-weight:bold;FONT-SIZE: 16px;color:#FFF;height:192px;text-align:center;width:20px;"> 
                                <i class="icon-tags icon-white"></i>特价促销
                            </div>
                        </div>
                        <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Preferences", "NewRecom", "2", "SmallPic", "InLand", "", "", "", 4)%>
                    </div>
	            </div>
            </div>
        </div>
    </div>
</div>--%>
<%--<div class="container" style="margin-top: 10px;">
	<div class="row">
        <div class="span12">
            <div class="sy_mod_f_tit">
                <h3><i class="icon-tags" style="margin-top: 6px;"></i> 特价促销</h3>
            </div>
            <div class="onsale_product"  style="height:193px;">
                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Preferences", "NewRecom", "2", "SmallPic", "InLand", "", "", "", 5)%>
            </div>
        </div>
	</div>
</div>--%>
<div class="container" style="margin-top: 10px;">
	<div class="row">
        <div class="span12">
            <div class="sy_mod_f_tit">
                <h3><i class="icon-tags" style="margin-top: 6px;"></i> 特价促销</h3>
            </div>
            <div class="onsale_product"  style="height:193px;">
                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Preferences", "NewRecom", "2", "SmallPic", "InLand", "", "", "", 5)%>
            </div>
        </div>
        <div class="span12" style="margin-top: 20px;"><ul class="ulike_r2"><%=InLand_3%></ul></div>
	</div>
</div>

<div class="container" style="margin-top: 0px;">
	<div class="row">
        <div class="span12" style="margin-top: 40px;">
		    <div class="x_mod_tab_hd" id="info_tit">
                <div id="topnav" class="nav"> 
                    <ul id="nav">
                        <li class="current"><a href="#nav223">华东</a></li>
                        <li><a href="#nav281">北方</a></li>
                        <li><a href="#nav466">西南</a></li>
                        <li><a href="#nav469">西北</a></li>
                        <li><a href="#nav224">华南</a></li>
                        <li><a href="#nav280">华中</a></li>
                        <li class="last"></li>
                    </ul>
                </div> 
            </div>
        </div>
        <div class="span12" style="margin-top: 60px;">
		    <div class="sy_mod_f_tit" id="nav223">
                <h3><i class="icon-tags"></i> <% =TravelOnline.tour.LineRecommend.IndexPageCountryCache("IndexPageCountry", "inland", "223", 15)%><a class="more" target="_blank" href="/inland/223-0-0-0-0-0-0-0-0-1.html">更多华东线路</a></h3>
            </div>
            <div class="onsale_product product_list" style="">
                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_223", "NewRecom", "3", "BigPic", "InLand", "223", "", "", 7)%>
            </div>
        </div>

        <div class="span12" style="margin-top: 20px;">
		    <div class="sy_mod_f_tit" id="nav281">
                <h3><i class="icon-tags"></i> <% =TravelOnline.tour.LineRecommend.IndexPageCountryCache("IndexPageCountry", "inland", "281", 15)%><a class="more" target="_blank" href="/inland/281-0-0-0-0-0-0-0-0-1.html">更多北方线路</a></h3>
            </div>
            <div class="onsale_product product_list" style="">
                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_281", "NewRecom", "3", "BigPic", "InLand", "281", "", "", 7)%>
            </div>
        </div>

        <div class="span12" style="margin-top: 20px;">
		    <div class="sy_mod_f_tit" id="nav466">
                <h3><i class="icon-tags"></i> <% =TravelOnline.tour.LineRecommend.IndexPageCountryCache("IndexPageCountry", "inland", "466", 15)%><a class="more" target="_blank" href="/inland/466-0-0-0-0-0-0-0-0-1.html">更多西南线路</a></h3>
                
            </div>
            <div class="onsale_product product_list" style="">
                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_466", "NewRecom", "3", "BigPic", "InLand", "466", "", "", 7)%>
            </div>
        </div>

        <div class="span12" style="margin-top: 20px;">
		    <div class="sy_mod_f_tit" id="nav469">
                <h3><i class="icon-tags"></i> <% =TravelOnline.tour.LineRecommend.IndexPageCountryCache("IndexPageCountry", "inland", "469", 15)%><a class="more" target="_blank" href="/inland/469-0-0-0-0-0-0-0-0-1.html">更多西北线路</a></h3>
                
            </div>
            <div class="onsale_product product_list" style="">
                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_469", "NewRecom", "3", "BigPic", "InLand", "469", "", "", 7)%>
            </div>
        </div>

        <div class="span12" style="margin-top: 20px;">
		    <div class="sy_mod_f_tit" id="nav224">
                <h3><i class="icon-tags"></i> <% =TravelOnline.tour.LineRecommend.IndexPageCountryCache("IndexPageCountry", "inland", "224", 15)%><a class="more" target="_blank" href="/inland/224-0-0-0-0-0-0-0-0-1.html">更多华南线路</a></h3>
                
            </div>
            <div class="onsale_product product_list" style="">
                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_224", "NewRecom", "3", "BigPic", "InLand", "224", "", "", 7)%>
            </div>
        </div>

        <div class="span12" style="margin-top: 20px;">
		    <div class="sy_mod_f_tit" id="nav280">
                <h3><i class="icon-tags"></i> <% =TravelOnline.tour.LineRecommend.IndexPageCountryCache("IndexPageCountry", "inland", "280", 15)%><a class="more" target="_blank" href="/inland/280-0-0-0-0-0-0-0-0-1.html">更多华中线路</a></h3>
                
            </div>
            <div class="onsale_product product_list" style="">
                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_280", "NewRecom", "3", "BigPic", "InLand", "280", "", "", 7)%>
            </div>
        </div>

	</div>
</div>

<div class="container" style="margin-top: 20px;margin-bottom: 20px;">
	<div class="row">
		<div class="span12"><%=InLand_T%></div>
	</div>
</div>

<%--<div class="container" style="margin-top: 25px;margin-bottom: 20px;">
	<div class="row">
		<div class="span12">
            <div class="right_ad1">
                <div id="div_tabs" class="usual">
                    <ul> 
                        <li><a class="selected" href="#div002">西南</a></li>
                        <li><a href="#div003">西北</a></li>
                        <li><a href="#div005">华南</a></li>
                        <li><a href="#div006">华中</a></li>
                    </ul>
                    <div class="content">
                        <div id="div002">                   
                            <div class="onsale_product" style="height:193px;">
                                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_466", "NewRecom", "3", "SmallPic", "InLand", "466", "", "", 5)%>
                            </div>
                            <div><a class="more" target="_blank" href="/inland/466-0-0.html">更多西南线路</a></div>
                        </div>
                        <div id="div003">
                            <div class="onsale_product" style="height:193px;">
                                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_469", "NewRecom", "3", "SmallPic", "InLand", "469", "", "", 5)%>
                            </div>
                            <div><a class="more" target="_blank" href="/inland/469-0-0.html">更多西北线路</a></div>
                        </div>
                        <div id="div005">
                            <div class="onsale_product" style="height:193px;">
                                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_224", "NewRecom", "3", "SmallPic", "InLand", "224", "", "", 5)%>
                            </div>
                            <div><a class="more" target="_blank" href="/inland/224-0-0.html">更多华南线路</a></div>
                        </div>
                        <div id="div006">
                            <div class="onsale_product" style="height:193px;">
                                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Recommend_280", "NewRecom", "3", "SmallPic", "InLand", "280", "", "", 5)%>
                            </div>
                            <div><a class="more" target="_blank" href="/inland/280-0-0.html">更多华中线路</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>--%>

<div class="container" style="margin-top: 15px;">
	<div class="row">
        <div class="span12">
	        <div class="sy_mod_f_tit">
                <h3><i class="icon-tags" style="margin-top: 6px;"></i> 国内线路热卖排行</h3>
            </div>
            <div class="onsale_product product_list" style="height:193px;">
                <% =TravelOnline.tour.LineRecommend.LineRecommendCache("InLand_Hot", "NewRecom", "4", "SmallPic", "InLand", "", "", "", 5)%>
            </div>
        </div>
	</div>
</div>
        

<uc2:Footer ID="Footer1" runat="server" />
<script type="text/javascript">
    //$("#div_tabs ul").idTabs();
    
    jQuery(".fullSlide").hover(function () {
        jQuery(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.5)
    },
    function () {
        jQuery(this).find(".prev,.next").fadeOut()
    });
    jQuery(".fullSlide").slide({
        titCell: ".hd ul",
        mainCell: ".bd ul",
        effect: "fold",
        autoPlay: true,
        autoPage: true,
        trigger: "click",
        startFun: function (i) {
            var curLi = jQuery(".fullSlide .bd li").eq(i);
            if (!!curLi.attr("_src")) {
                curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
            }
        }
    });
    $(document).ready(function () {
        $("#topnav").smartFloat();
        $('#nav').onePageNav({ scrollOffset: 50, scrollThreshold: 0.1 });
    })
</script>
</body>
</html>
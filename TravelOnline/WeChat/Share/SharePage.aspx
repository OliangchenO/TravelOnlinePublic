<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SharePage.aspx.cs" Inherits="TravelOnline.WeChat.Share.SharePage" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--><html lang="zh" class="no-js"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
<meta name="MobileOptimized" content="320">
</head> 
  <body id="mainbody" style="margin:0px;"> 
  <div id="main_view"> 
      <a href="javascript:;" id="goBook"><img src="../../Images/shareTicket2018.jpg" style="vertical-align:middle; width:100%;"/></a>
  </div> 
 </body>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="/assets/plugins/jquery-1.10.2.min.js"></script>
<script src="/assets/plugins/jquery-migrate-1.2.1.min.js"></script>
<script src="/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<script src="/assets/plugins/jquery.blockui.min.js"></script>
<script src="/assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<script src="/assets/scripts/app.js"></script>
<script type="text/javascript">
    <%=config%>
    var isShare = false;
    wx.ready(function () {
            var title =  '青春旅途联票';
            var imgUrl = 'http://www.scyts.com/images/shareImg.jpg';
            var desc = '青春旅途联票分享每张立減99元';
            var link = window.location.href;
            //在此输入各种API
            //分享到朋友圈
            wx.onMenuShareTimeline({
                title: title, // 分享标题
                desc: desc, // 分享描述
                link: link, // 分享链接
                imgUrl: imgUrl, // 分享图标
                success: function () {
                    isShare = true;
                    // 用户确认分享后执行的回调函数
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });
            //分享给朋友
            wx.onMenuShareAppMessage({
                title: title, // 分享标题
                desc: desc, // 分享描述
                link: link, // 分享链接
                imgUrl: imgUrl, // 分享图标
                success: function () {
                    // 用户确认分享后执行的回调函数
                    isShare = true;
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });
            //分享到QQ
            wx.onMenuShareQQ({
                title: title, // 分享标题
                desc: desc, // 分享描述
                link: link, // 分享链接
                imgUrl: imgUrl, // 分享图标
                success: function () {
                    // 用户确认分享后执行的回调函数
                    isShare = true;
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });
            //分享到腾讯微博
            wx.onMenuShareWeibo({
                title: title, // 分享标题
                desc: desc, // 分享描述
                link: link, // 分享链接
                imgUrl: imgUrl, // 分享图标
                success: function () {
                    // 用户确认分享后执行的回调函数
                    isShare = true;
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });
            //分享到QQ空间
            wx.onMenuShareQZone({
                title: title, // 分享标题
                desc: desc, // 分享描述
                link: link, // 分享链接
                imgUrl: imgUrl, // 分享图标
                success: function () {
                    // 用户确认分享后执行的回调函数
                    isShare = true;
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                }
            });
    })   

    $('#goBook').live("click", function () {
        if (isShare == true) {
            url = "../../WeChat/AjaxService.aspx?action=CheckOnline&r=" + Math.random();
            $.get(url, function (obj) {
                if (obj.success) {
                    window.location.href = "/WeChat/Share/OrderShare.aspx?LineId=1481";
                    scroll(0, 0);
                } else {
                    window.location.href = "/WeChat/Share/OrderShare.aspx#login?1481";
                }
            }, 'json');
        } else {
            alert("请先分享，才可预定享优惠！");
        }
    })

    function showmessage(msg) {
        alert("请先分享，才可预定享优惠！");
        $.blockUI({
            message: msg,
            boxed: true,
            textOnly: true,
            css: { width: '30%', textAlign: 'center' }
        });
        window.setTimeout(function () {
            $.unblockUI();
        }, 200000);
    }

    $(document).bind("click", function () {
        $.unblockUI();
    });

    $(document).live('touchstart', function () {
        $.unblockUI();
    });
</script>

</html>
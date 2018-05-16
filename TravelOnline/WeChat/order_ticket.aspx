<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order_ticket.aspx.cs" Inherits="TravelOnline.WeChat.order_ticket" %>
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
<!-- Global styles START -->          
<link href="/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<!-- Global styles END -->
<!-- Theme styles START -->

<link href="/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/> 
<link href="/assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" rel="stylesheet" type="text/css"/>
<link href="/assets/plugins/iCheck/skins/square/grey.css" rel="stylesheet" type="text/css"/>
<link href="/newcss/loginreg.css" rel="stylesheet" type="text/css" />
<!-- Theme styles END -->
<link href="/app_css/custom.css" rel="stylesheet"/>
<link rel="shortcut icon" href="~/favicon.ico"/>
</head> 
   <body id="mainbody"> 
  <!-- BEGIN HEADER --> 
  <div id="header" class="pre-header" style="position: fixed; top: 0px; left: 0px;width:101%"> 
   <div class="container"> 
    <div class="row"> 
     <div class="tit" id="titlename" style="line-height:25px;position: relative;">
       订单详情 
     </div> 
     <a class="icon_home" href="/app/main" style="display: none;"><i class="fa fa-home"></i></a> 
    </div> 
   </div> 
  </div> 
  <!-- END HEADER --> 
  <div id="main_view" style="margin-top: 45px;margin-bottom: 50px;"> 
   <div class="sub_view" id="first_view"> 
    <div class="product_wrap"> 
     <h3><%= LineName %></h3> 
     <p class="xdesc"></p> 
     <div class="price_box" style="font-size: 16px;"> 
      <i class="fa fa-cny"></i> 
      <span class="allprice price"><%= LinePrice %></span><%if (LineId != null && ConfigurationManager.AppSettings["prebook"].IndexOf(LineId) > -1) { %>（本次支付定金<span id="prePay">3</span>元）<%}; %>
     </div>
    </div> 
    <form id="form_data" onsubmit="return false;" method="post">
    <input id="PriceStrings" name="PriceStrings" type="hidden" value=""/>
    <input id="allprice" name="allprice" type="hidden" value=""/>
    <input id="LineId" name="LineId" type="hidden" value="<%=LineId %>"/>
    <input id="adults" name="adults" type="hidden" value=""/>
        
    <div class="recommend_wrap">  
    <%= PriceInfo %>
    <%if (LineId!=null&&ConfigurationManager.AppSettings["YouchuLineId"].IndexOf(LineId) > -1)
        {%>
    <div class="recommend_detail">
      <div class="recommend_txt">
        <h3>优惠券抵扣</h3>
        <div class="row">
          <div class="col-xs-4">
            <div><span class="pricename">使用优惠券</span></div>
          </div>
          <div class="col-xs-8">
             <input id="preferCode" name="preferCode" onblur="checkPrefer()" style="border-style:solid;margin-right:2px;" type="text" placeholder="优惠券码" value=""/>
          </div>
        </div>
        <span id="preferText" style="color:red;">未使用优惠券</span>
      </div>
    </div>
    <%} %>
     <div class="recommend_detail">
        <div class="recommend_txt">
         <h3>联系人信息</h3>
          <input maxlength="30" id="ordername" type="text" name="ordername" class="form-control ordertext" placeholder="联系人姓名" value="" />
          <input maxlength="11" id="orderphone" type="text" name="orderphone" class="form-control ordertext" placeholder="手机号码" value="" />
          <input maxlength="100" id="ordermemo" type="text" name="ordermemo" class="form-control ordertext" placeholder="邮寄地址" />
        </div>
     </div>
     
     <div class="recommend_detail">
         <div class="recommend_txt">
         <h3 class="pay">
          <div class="iradio_square-grey checked" style="position: relative;">
           <input value="1" type="radio" id="radio-1" name="iCheck" checked="" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);" />
           <ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
          </div><label for="radio-1" class="hovers">在线支付</label>&nbsp;&nbsp;&nbsp;&nbsp;</h3>
         <div id="Pre1">
          <div>
           请于订单确认后24小时之内，通过网上支付方式付清全部费用！
          </div>
         </div>
         <select id="Pre2" class="form-control Branch" style="display:none"><option value="45">营业总部 衡山路2号</option><option value="58">卢湾营业部 成都南路124号</option><option value="88">张杨路营业部 张杨路1363号(国际华城楼下)</option><option value="61">普陀营业部 武宁路225号西宫内（河边大道4号）</option><option value="62">徐汇营业部 虹桥路808号</option><option value="63">虹口营业部 四川北路1755号</option><option value="64">莘庄营业部 莘建东路216号</option><option value="81">五角场营业部 四平路2500号东方商厦底楼103（近黄兴路口）</option><option value="86">天山营业部 天山路762号泓鑫时尚广场2楼20室（肯德基旁）</option><option value="60">人民广场营业部 黄陂北路228号</option></select>
        </div>
     </div>
     <div class="pre-footer order-footer" style="position: fixed; bottom: -1px; left: 0px;width:101%"> 
      <div class="container"> 
       <div class="row"> 
        <div class="col-xs-7" style="text-align:left;"> 
         <i class="fa fa-cny"></i> 
         <span class="payprice">3899</span> 
        </div> 
        <div class="col-xs-5" style="text-align:center"> 
         <a class="yd cur" href="javascript:;" id="goPay"><i class="fa fa-chevron-circle-right"></i> 去支付</a> 
        </div> 
       </div> 
      </div> 
     </div> 
    </div> 
    </form>
   </div> 

   <div class="sub_view" style="display:none;" id="login_view">
        <div class="recommend_wrap">
            <div class="recommend_detail">
                <div class="recommend_txt">
                    <h3>登录</h3>
                    <form id="loginform" onsubmit="return false;" method="post">
                    <input id="LineIdForR" type="hidden" value="" />
                    <input required id="loginname" type="text" name="loginname" class="form-control ordertext" placeholder="手机号码或邮件地址" maxlength="50">
                    <input required id="loginpwd" type="password" name="loginpwd" class="form-control ordertext" placeholder="登录密码（6-20位字符）" maxlength="20">
                    <input type="text" id="authcode" name="authcode" class="form-control1 ordertext" placeholder="验证码" maxlength="6" style="width:100px;"> 
					<img id="Verification" style="WIDTH: 80px; HEIGHT: 30px; CURSOR: pointer" onclick="this.src='/login/VerifyCode.aspx?&uid=<%=ucode %>&yys='+new Date().getTime()" src="../../login/VerifyCode.aspx?&uid=<%=ucode %>" alt="" style="cursor:pointer;width:100px;height:26px;"> 
					<label class="ftx23">&nbsp;<a href="javascript:;" onclick="verc()">看不清？换一张</a></label>
                    </form>
                </div>
                <div class="recommend_txt" style="margin:20px 20px;text-align:center">
                    
                </div>
                <div class="row" style="margin:20px 20px;text-align:center">
                    <div class="col-xs-5"><a class="btn yellow" href="javascript:;" id="login">登录</a></div>
                    <div class="col-xs-7"><a class="btn yellow" href="javascript:;" id="regnew">注册新用户</a></div>
                </div>
                <%if (null != Session["UserFrom"] && Session["UserFrom"].ToString().Equals("APP")) {%>
                <%}else{ %>
                <dl class="other-login">
                <dt>使用合作网站账号登录</dt>
                <dd>
                    <a href="#" class="sina" id="weixinLogin" target="_blank">微信</a>
                </dd>
                </dl>
                <%} %>
            </div>
        </div>
    </div>
    <div class="sub_view" style="display:none;" id="reg_view">
        <div class="recommend_wrap">
            <div class="recommend_detail">
                <div class="recommend_txt">
                    <h3>注册新用户</h3>
                    <form id="regform" onsubmit="return false;" method="post">
                    <input id="regname" type="text" name="regname" class="form-control ordertext" placeholder="您的姓名" maxlength="10">
                    <input id="regphone" type="text" name="regphone" class="form-control ordertext" placeholder="手机号码" maxlength="11">
                    <input id="regemail" type="text" name="regemail" class="form-control ordertext" placeholder="电子邮件" maxlength="50">
                    <input id="regpwd" type="password" name="regpwd" class="form-control ordertext" placeholder="登录密码（6-20位字符）" maxlength="20">
                    </form>
                </div>
                <div class="recommend_txt" style="margin:20px 20px;text-align:center">
                    <a class="btn yellow" href="javascript:;" id="regnow">提交注册</a>
                </div>
            </div>
        </div>
    </div>
  </div> 
<!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
<!--[if lt IE 9]>
<script src="/assets/plugins/respond.min.js"></script>
<![endif]-->  
<script src="/assets/plugins/jquery-1.10.2.min.js"></script>
<script src="/assets/plugins/jquery-migrate-1.2.1.min.js"></script>
<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>      
<script src="/assets/plugins/back-to-top.js"></script>
<script src="/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<script src="/assets/plugins/jquery.blockui.min.js"></script>
<script src="/assets/plugins/jquery.cookie.min.js"></script>
<script src="/assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
<script src="/assets/plugins/iCheck/icheck.js"></script>
<!-- END CORE PLUGINS -->
<script src="/assets/scripts/app.js"></script>
<script src="/app_js/order-ticket.js"></script>
 </body>

</html>

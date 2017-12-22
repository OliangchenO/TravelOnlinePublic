<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wenda.aspx.cs" Inherits="TravelOnline.WeChat.Share.Wenda" %>

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
<link href="../../app_css/custom.css" rel="stylesheet"/>
<link href="/assets/plugins/iCheck/skins/square/grey.css" rel="stylesheet" type="text/css">
<style type="text/css">
  .hide{
      visibility: hidden;
  }
</style>
</head> 
 <body id="mainbody" style="margin:0px;"> 
  <div id="code" class="<%=codehide %>">
      <h3>回答正确，您的抽奖码为：<%=choujiangCode %></h3>
  </div>
  <form id="form_data" onsubmit="return false;" method="post">
    <div id="main_view" class ="<%=formhide %>"> 
      <div class="recommend_detail">
        <div class="recommend_txt">
            <h3>1、全球唯一的四位一体国家是------</h3>
            <input name="First" type="radio" value="A"/>A 英国
            <input name="First" type="radio" value="B"/>B 瑞士
            <input name="First" type="radio" value="C"/>C 马耳他
            <input name="First" type="radio" value="D"/>D 马其顿
        </div>
              
        <div class="recommend_txt">
            <h3>2、被誉为地中海心脏的是欧洲哪个地方----</h3>
            <input name="Second" type="radio" value="A" />A 西西里岛 
            <input name="Second" type="radio" value="B" />B 圣托里尼岛
            <input name="Second" type="radio" value="C" />C 马耳他
            <input name="Second" type="radio" value="D" />D 摩纳哥
        </div>
          
        <div class="recommend_txt">
            <h3>3、具备骑行条件旅行的地区是----</h3>
            <input name="Third" type="radio" value="A" />A 香港
            <input name="Third" type="radio" value="B" />B 澳门
            <input name="Third" type="radio" value="C" />C 台湾
            <input name="Third" type="radio" value="D" />D 珠海
        </div>
          
        <div class="recommend_txt">
            <h3>4、欧洲英语的培训圣地是----</h3>
            <input name="Fourth" type="radio" value="A" />A 英国
            <input name="Fourth" type="radio" value="B" />B 爱尔兰
            <input name="Fourth" type="radio" value="C" />C 马耳他
            <input name="Fourth" type="radio" value="D" />D 瑞士
        </div>
          
        <div class="recommend_txt">
            <h3>5、有机会与鲸鲨近距离接触的海岛是-----</h3>
            <input name="Fifth" type="radio" value="A" />A 泰国普吉岛
            <input name="Fifth" type="radio" value="B" />B 马尔代夫
            <input name="Fifth" type="radio" value="C" />C 菲律宾宿务
            <input name="Fifth" type="radio" value="D" />D 印尼巴厘岛
        </div>
     </div>
     <input type="button" id="goSubmit" value="提交" style="margin:5px auto; color: white; background-color:red; width: 100%; height: 40px; border-radius: 15px; border: 0px; line-height:14px;" />
  </div> 
  </form>
 </body>
 <script src="/assets/plugins/jquery-1.10.2.min.js"></script>
 <script src="/assets/plugins/iCheck/icheck.js"></script>
 <script type="text/javascript">
     $(document).ready(function () {
         $("input:radio").on("click", function () {
             $(this).siblings().removeAttr("checked");
             $(this).attr("checked", "checked");
         });
     })

     $('#goSubmit').on("click", function () {
         var first = $("input[name='First'][checked]").val();
         var second = $("input[name='Second'][checked]").val();
         var third = $("input[name='Third'][checked]").val();
         var fourth = $("input[name='Fourth'][checked]").val();
         var fifth = $("input[name='Fifth'][checked]").val();
         if (typeof($("input[name='First'][checked]").val())=="undefined"|| typeof($("input[name='Second'][checked]").val())=="undefined"|| typeof($("input[name='Third'][checked]").val())=="undefined"|| typeof($("input[name='Fourth'][checked]").val())=="undefined"|| typeof($("input[name='Fifth'][checked]").val())=="undefined") {
             alert("您有未回答的问题，请继续回答！");
             return false;
         } else if (first != "C" || second != "C" || third != "C" || fourth != "C" || fifth != "C") {
             alert("您有问题回答错误，请重新作答！");
             return false;
         }else {
             url = "../../WeChat/AjaxService.aspx?action=qa";
             $.post(url, $("#form_data").serialize(), function (obj) {
                 if (obj.success) {
                     if (obj.success == "OK") {
                         window.location.href = window.location.href + "?r=" + Math.random();
                     }
                 }
                 else {
                     alert(obj.error);
                 }
             }, 'json');
         }
     });

 </script>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePrefer.aspx.cs" Inherits="TravelOnline.Management.CreatePrefer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="/Styles/MySite.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/Styles/icon.css" />
    <link href="/Styles/user.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/jNotify.jquery.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Scripts/jquery-1.6.min.js"></script> <%if (false) { %> <script type="text/javascript" src="scripts/jquery-1.6-vsdoc.js"></script> <%} %>
    <script type="text/javascript" src="/Scripts/EasyUI/easyloader.js"></script>
    <script type="text/javascript" src="/Scripts/jNotify.jquery.js"></script>
    <script type="text/javascript" src="/Scripts/jquery.form.js"></script> 
    <script type="text/javascript" src="/Scripts/lhgcalendar/lhgcalendar.min.js"></script>
</head>
<body>
    <span class="clr"></span>
    <div id="select" class="m select">
    <div class="mt"><h1></h1><strong>新增优惠信息</strong></div>
        <form id="form_data" action="" onsubmit="return false;" method="post">
            <div id="inputs" style="DISPLAY:none">
            </div>
            <dl><dt>旅游线路编号：</dt>
            <dd>
                <input id="LineId" name="LineId" type="text" style="width: 240px;" maxlength="500" value=""/>
            </dd>
            </dl>
            <dl><dt>优惠金额：</dt>
            <dd>
                <input id="preferAmount" name="preferAmount" type="text" class="easyui-numberbox" precision="0" max="999999" size="10" maxlength="10" style="text-align:center;" value=""/>&nbsp;&nbsp;
            </dd>
            </dl>
        </form>
        <a id="A1" onclick="check_null()" class="easyui-linkbutton" plain="true" iconCls="icon-reload" style="margin-left: 120px;margin-top: 10px;">新增</a>
    </div>
    <script type="text/javascript">

        function check_null() {
            if ($("#preferAmount").val() == "") {
                jNotify('<strong>优惠金额不能为空!</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                return false;
            }

            var url = "AjaxService.aspx?action=createPrefer&r=" + Math.random();
            alert(url);
            $.post(url, $("#form_data").serialize(),function (data) {
                var obj = eval(data);
                if (obj.success) {
                    jSuccess('<strong>保存成功!</strong>', { ShowOverlay: false, HorizontalPosition: 'center', VerticalPosition: 'center' });
                }
                if (obj.error) {
                    jError('<strong>' + obj.error + '!</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                }
            });
        }

        function savenums() {
            var url = "AjaxService.aspx?action=SavePreferNums&r=" + Math.random();
            $.post(url, $("#form_data").serialize(), function (data) {
                var obj = eval(data);
                if (obj.success) {
                    jSuccess('<strong>保存成功!</strong>', { ShowOverlay: false, HorizontalPosition: 'center', VerticalPosition: 'center' });
                }
                if (obj.error) {
                    jError('<strong>' + obj.error + '!</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                }
            });
        }
    </script> 
</body>
</html>

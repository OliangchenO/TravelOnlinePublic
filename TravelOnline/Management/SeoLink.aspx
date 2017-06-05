﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeoLink.aspx.cs" Inherits="TravelOnline.Management.SeoLink" %>
<%@ Register src="~/Master/ManagerHeader.ascx" tagname="ManagerHeader" tagprefix="uc1" %>
<%@ Register src="~/Master/SortListNew.ascx" tagname="SortList" tagprefix="uc2" %>
<%@ Register src="~/Master/ManagerFooter.ascx" tagname="ManagerFooter" tagprefix="uc3" %>
<%@ Register src="~/Master/ManageMenu.ascx" tagname="ManageMenu" tagprefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SEO内链关键字</title>
    <meta name="description" content="上海青旅商城，为您提供在线旅游服务" />
    <meta name="Keywords" content="网上旅游,青旅商城" />
    <link href="/Styles/MySite.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/user.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/Scripts/EasyUI/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/Scripts/EasyUI/themes/icon.css" />
    <link href="/Styles/jNotify.jquery.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Scripts/jquery-1.6.min.js"></script> <%if (false) { %> <script type="text/javascript" src="scripts/jquery-1.6-vsdoc.js"></script> <%} %>
    <script type="text/javascript" src="/Scripts/EasyUI/easyloader.js"></script>
    <script type="text/javascript" src="/Scripts/lhgdialog/lhgdialog.min.js?s=default,chrome,aero"></script>
    <script type="text/javascript" src="/Scripts/jNotify.jquery.js"></script>
    <script type="text/javascript">

	</script>
</head>
<body id="none">

    <uc1:ManagerHeader ID="ManagerHeader1" runat="server" />
    <uc2:SortList ID="SortListNew1" runat="server" />
    <DIV class="w main">
        <DIV class=left>
            <uc4:ManageMenu ID="ManageMenu1" runat="server" />
        </DIV>

 <div class="right-extra">

<DIV class=crumb><A href="../index.html">首页</A>&nbsp;&gt;&nbsp;<A 
href="/Management/ManageHome.aspx">管理中心首页</A>&nbsp;&gt;&nbsp;<SPAN>SEO内链关键字</SPAN></DIV>

 <DIV class="m select">
    <form id="formlogin" runat="server">
    <DIV class=mt>
        <H1></H1><STRONG>SEO内链关键字</STRONG>
    </DIV>
    <div class="serchbar">
        关键词：<asp:TextBox ID="TB_keyword" runat="server" Width="100"></asp:TextBox>&nbsp;
        着陆页：<asp:TextBox ID="TB_url" runat="server" Width="220"></asp:TextBox>&nbsp;
        优先级：<asp:TextBox ID="TB_rank" runat="server" Width="30" class="easyui-numberbox" precision="0" max="10" maxlength="2"></asp:TextBox>&nbsp;
        搜索值：<asp:TextBox ID="TB_serchnum" runat="server" Width="30" class="easyui-numberbox" precision="0" max="999999" maxlength="6"></asp:TextBox>&nbsp;
        <a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="SaveInfo();">保存</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="javascript:$('#GridView_Serch_Button').click();">查询</a>
        
    </div>
    <div class="toolbar">
        <a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-add" onclick="AddNew();">新增</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-cancel" onclick="DeleteSelect()">删除</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-reload" onclick="javascript:$('#GridView_Refresh_Button').click();">刷新</a>
		<%--<a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-print" onclick="allchks()">打印</a>--%>
        <DIV id="inputs" style="DISPLAY:none">
            <input id="TB_Id" type="hidden" value="0"/>
            <asp:Button ID="GridView_Refresh_Button" runat="server" onclick="GridView_Refresh" Text="Button" />
            <asp:Button ID="GridView_Serch_Button" runat="server" onclick="GridView_Serch" Text="Button" />
        </DIV>
	</div>
        <asp:ScriptManager ID="sm1" runat="server" />
        <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <DIV id=explain class="datagrid">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" AllowSorting="True"  OnSorting="GridView_Sorting"
                    Width="822px" AllowPaging="True" PageSize="20" onpageindexchanging="GridView_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" 
                    OnDataBound="GridView_DataBound" GridLines="Vertical" SortExpression="id" SortDirection="DESC">
	                <RowStyle BackColor="#F4FFDE" HorizontalAlign="Center" Wrap="True" />
	                <Columns>
                        <asp:TemplateField HeaderText="&lt;input type='checkbox' onclick='chkall(this)' name='chk_all' id='chk_all'&gt;">
                            <ItemTemplate>
                                <input id="CheckBox<%#Container.DataItemIndex+1 %>" type="checkbox" name="CheckBox" value="<%# DataBinder.Eval(Container.DataItem, "Id") %>" />
                            </ItemTemplate>
                            <HeaderStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <HeaderStyle Width="5%" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="keyword" HeaderText="关键词" SortExpression="keyword">
		                    <HeaderStyle Width="20%" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
		                <asp:BoundField DataField="url" HeaderText="着陆页" SortExpression="url">
		                    <HeaderStyle Width="30%" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rank" HeaderText="优先级" SortExpression="rank">
		                    <HeaderStyle Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="serchnum" HeaderText="搜索值" SortExpression="serchnum">
		                    <HeaderStyle Width="5%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                            </ItemTemplate>
                            <HeaderStyle Width="5%" />
                        </asp:TemplateField> 
	                </Columns>
                    <PagerTemplate>
                        <div class="pagination"><span class="pagecounts">
                            第<asp:Label ID="lblcurPage" ForeColor="Blue" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageIndex+1  %>'></asp:Label>页/共<asp:Label ID="lblPageCount" ForeColor="blue" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageCount %>'></asp:Label>页</span>&nbsp;<asp:label id="lblRecorCount" runat="server"></asp:label>条记录&nbsp;&nbsp;
                            <asp:LinkButton ID="cmdFirstPage" runat="server" CommandName="Page" CommandArgument="First"  Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>" ToolTip="首页"><img src="/images/icons/pagination_first.gif" alt="" /></asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="cmdPreview" runat="server" CommandArgument="Prev" CommandName="Page"  Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>" ToolTip="上一页"><img src="/images/icons/pagination_prev.gif" alt="" /></asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="cmdNext" runat="server" CommandName="Page" CommandArgument="Next"  Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 %>" ToolTip="下一页"><img src="/images/icons/pagination_next.gif" alt="" /></asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="cmdLastPage" runat="server" CommandArgument="Last" CommandName="Page"  Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 %>" ToolTip="尾页"><img src="/images/icons/pagination_last.gif" alt="" /></asp:LinkButton>&nbsp;&nbsp;
                                到<asp:TextBox ID="txtGoPage" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageIndex+1 %>'  Width="30px" CssClass="simpletextbox"></asp:TextBox>页
                            <asp:Button ID="GoToPageButton" runat="server" Width="40px"  OnClick="GridView_PageTurn" Text="跳转" CssClass="simplebutton" /></div>
                    </PagerTemplate>
	                <PagerStyle BackColor="#F7F7F7" ForeColor="#333333" HorizontalAlign="right" Font-Size="12px" />
	                <HeaderStyle BackColor="#4BA41B" Font-Bold="True" ForeColor="White" />
	                <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </DIV>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="GridView_Refresh_Button" />
            <asp:AsyncPostBackTrigger ControlID="GridView_Serch_Button" />
        </Triggers>
        </asp:UpdatePanel>
    </form>
</DIV>
<DIV class=clr></DIV></DIV>
    <SPAN class=clr></SPAN>
    <uc3:ManagerFooter ID="ManagerFooter1" runat="server" />
    <script type="text/javascript">
        function AddNew() {
            $("#TB_keyword").val("");
            $("#TB_url").val("");
            $("#TB_rank").val("");
            $("#TB_serchnum").val("");
            $("#TB_Id").val("0");
        }

        function SaveInfo() {
            if ($("#TB_keyword").val() == "" || $("#TB_url").val() == "" || $("#TB_rank").val() == "" || $("#TB_serchnum").val() == "") {
                jNotify('<strong>各项输入值都不能为空!</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                return false;
            }
            if ($("#TB_Id").val() != "0") {
                if (confirm('确认要修改吗？')) {
                }
                else
                { return false; }
            }
            var url = "AjaxService.aspx?action=SaveSeoLink&Id=" + $("#TB_Id").val() + "&keyword=" + escape($("#TB_keyword").val()) + "&url=" + $("#TB_url").val() + "&rank=" + $("#TB_rank").val() + "&serchnum=" + $("#TB_serchnum").val() + "&r=" + Math.random();
            $.getJSON(url, function (date) {
                if (date.success == 0) {
                    jSuccess('<strong>信息保存成功!</strong>', { ShowOverlay: false, HorizontalPosition: 'center', VerticalPosition: 'center' });
                    AddNew();
                    $('#GridView_Refresh_Button').click();
                } else {
                    jError('<strong>信息保存失败，请稍后再试!</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                }
            })
        }

        function EditInfo(Id, s1, s2, s3, s4) {
            $("#TB_Id").val(Id);
            $("#TB_keyword").val(s1);
            $("#TB_url").val(s2);
            $("#TB_serchnum").val(s3);
            $("#TB_rank").val(s4);
            
        }

        function chkall(obj) {
            if (obj.checked) {
                $("input[name$='CheckBox']").each(function () { this.checked = true; });
            } else {
                $("input[name$='CheckBox']").each(function () { this.checked = false; });
            }
        }

        function allchks() {
            var arrChk = "";
            var items = $("input[name='CheckBox']:checked");
            //获取name为check的一组元素,然后选取它们中选中(checked)的。
            if (items.length == 0) {
                return false;
            }
            //alert("选中的个数为：" + items.length)
            $("input[name$='CheckBox']:checked").each(function () { arrChk += this.value + ','; });
            alert(arrChk);
        }

        function DeleteSelect() {
            var arrChk = "";
            var items = $("input[name='CheckBox']:checked");
            if (items.length == 0) {
                jNotify('<strong>请选择要删除的数据!</strong>', { ShowOverlay: false, HorizontalPosition: 'center', VerticalPosition: 'center' });
                return false;
            }
            if (confirm('确认要删除吗？')) {
            }
            else
            { return false; }
            $("input[name$='CheckBox']:checked").each(function () { arrChk += this.value + ','; });
            arrChk = arrChk.substr(0, arrChk.length - 1);
            var url = "AjaxService.aspx?action=DeleteSeoLink&Id=" + arrChk + "&r=" + Math.random();
            $.getJSON(url, function (date) {
                if (date.success == 0) {
                    AddNew();
                    jSuccess('<strong>信息删除成功!</strong>', { ShowOverlay: false, HorizontalPosition: 'center', VerticalPosition: 'center' });
                    $('#GridView_Refresh_Button').click();
                } else {
                    jError('<strong>信息删除失败，请稍后再试!</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                }
            })
        }

</script> 
</body>
</html>


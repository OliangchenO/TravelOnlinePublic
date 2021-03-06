﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialLine.aspx.cs" Inherits="TravelOnline.Management.SpecialLine" %>
<%@ Register src="~/Master/ManagerHeader.ascx" tagname="ManagerHeader" tagprefix="uc1" %>
<%@ Register src="~/Master/SortListNew.ascx" tagname="SortList" tagprefix="uc2" %>
<%@ Register src="~/Master/ManagerFooter.ascx" tagname="ManagerFooter" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%=CruisesShip %> - 专题旅游线路</title>
    <meta name="description" content=<% =TravelOnline.Class.Common.PublicPageKeyWords.PublicDescription %> />
    <meta name="Keywords" content=<% =TravelOnline.Class.Common.PublicPageKeyWords.PublicKeywords %> />
    <link href="/Styles/MySite.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/user.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/Styles/jNotify.jquery.css" />
    <link rel="stylesheet" type="text/css" href="/Scripts/EasyUI/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/Scripts/EasyUI/themes/icon.css" />
    <script type="text/javascript" src="/Scripts/jquery-1.6.min.js"></script> <%if (false) { %> <script type="text/javascript" src="scripts/jquery-1.6-vsdoc.js"></script> <%} %>
    <script type="text/javascript" src="/Scripts/EasyUI/easyloader.js"></script>
    <script type="text/javascript" src="/Scripts/base.js"></script>
    <script type="text/javascript" src="/Scripts/jNotify.jquery.js"></script>
    <style type="text/css">
        #explain {WIDTH: 100%;MARGIN-TOP: 0px; }
        #explain table {table-layout:fixed;}
        #explain td {white-space:nowrap;overflow:hidden;BORDER-right: #EFEFEF 1px solid;}
        .fixColleft {Z-INDEX: 120; left:expression(this.offsetParent.scrollLeft-1); POSITION: relative; }
        .fix_hidden {Z-INDEX: 120; left:expression(this.offsetParent.scrollLeft-1); POSITION: relative; overflow:hidden; white-space:nowrap;}
        .headline { font-size:16px; background:url(/images/bg_function.png) no-repeat;padding:0 0 10px 45px; margin:20px 5px 0;}
    </style>
</head>
<body id="none">
<uc1:ManagerHeader ID="ManagerHeader1" runat="server" />
<uc2:SortList ID="SortListNew1" runat="server" />
<DIV class="w main">
<form id="form1" runat="server">
        <div class="main">
            <div id="order_title">
            <h2 class="headline"><SPAN class=headstep><%=CruisesShip%> - 专题旅游线路</SPAN></h2>
            </div>
            <DIV id="DIV1" style="DISPLAY:none">
                <input id="Cid" name="Cid" type="hidden" value="<%=Cid %>"/>
            </DIV>
            <div class="serch">
                线路id：<asp:TextBox ID="tb_Lineid" runat="server" Width="100px"></asp:TextBox>
                &nbsp;&nbsp;
                顺序号：<asp:TextBox ID="SortNum" runat="server" Width="100px"></asp:TextBox>
                &nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="false" iconCls="icon-add" onclick="SaveData()">增加</a>&nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="false" iconCls="icon-ok" onclick="GroupDo('SetTop')">置顶</a>&nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="false" iconCls="icon-no" onclick="GroupDo('Cancel')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-reload" onclick="javascript:$('#GridView_Refresh_Button').click();">刷新</a>
                
            </div>
            <DIV id="inputs" class=hide>
                <asp:Button ID="GridView_Refresh_Button" runat="server" onclick="GridView_Refresh" Text="Button" />
                <asp:Button ID="GridView_Serch_Button" runat="server" onclick="GridView_Serch" Text="Button" />
            </DIV>
            <div class="long">
                <DIV id=explain class="datagrid2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="5" CellSpacing="0" ForeColor="#333333" AllowSorting="True"  OnSorting="GridView_Sorting"
                        Width="100%" AllowPaging="True" PageSize="300"
                        onpageindexchanging="GridView_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" 
                        OnDataBound="GridView_DataBound" GridLines="None" SortExpression="SortNum" 
                        SortDirection="DESC" ShowHeaderWhenEmpty="True">
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
                            <asp:BoundField DataField="Lineid" HeaderText="ID" SortExpression="Lineid">
		                        <HeaderStyle Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LineClass" HeaderText="类型" SortExpression="LineClass">
		                        <HeaderStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LineName" HeaderText="旅游线路名称" SortExpression="LineName">
		                        <HeaderStyle Width="30%" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PlanDate" HeaderText="开班" SortExpression="PlanDate" DataFormatString="{0:yy-MM-dd}">
		                        <HeaderStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Price" HeaderText="价格" SortExpression="Price">
		                        <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SortNum" HeaderText="排序" SortExpression="SortNum">
		                        <HeaderStyle Width="5%" />
                            </asp:BoundField>
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
            </div>          
        </div>
        <SCRIPT language="javascript" src="/Scripts/NowrapSet.js"></SCRIPT>
    </form>
<DIV class=clr></DIV></DIV>
<uc3:ManagerFooter ID="ManagerFooter1" runat="server" />
    <script type="text/javascript">
        function SaveData() {
            if ($("#tb_Lineid").val() == "") {
                jNotify('<strong>请输入线路id!</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                return false;
            }
            var url = "AjaxService.aspx?action=SaveSpecialLine&lined=" + $("#tb_Lineid").val() + "&Stid=" + $("#Cid").val() + "&SortNum=" + $("#SortNum").val() + "&r=" + Math.random();
            $.getJSON(url, function (date) {
                if (date.success == "0") {
                    jSuccess('<strong>信息保存成功!</strong>', { ShowOverlay: false, HorizontalPosition: 'center', VerticalPosition: 'center' });
                    $("#tb_Lineid").val("");
                    $('#GridView_Refresh_Button').click();
                }
                else {
                    jError("<strong>" + date.success + "!</strong>", { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                }
            })
        }

        function chkall(obj) {
            if (obj.checked) {
                $("input[name$='CheckBox']").each(function () { this.checked = true; });
            } else {
                $("input[name$='CheckBox']").each(function () { this.checked = false; });
            }
        }

        function GroupDo(flag) {
            var doname = "删除"
            var action = "DelSpecialLine"
            if (flag == "SetTop") {
                doname = "置顶";
                action = "SpecialLineSetTop"
            } 

            var arrChk = "";
            var items = $("input[name='CheckBox']:checked");
            if (items.length == 0) {
                jNotify('<strong>请选择要批量操作的数据!</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                return false;
            }
            if (confirm("确认要批量 " + doname + " 吗？")) {
            }
            else
            { return false; }
            $("input[name$='CheckBox']:checked").each(function () { arrChk += this.value + ","; });
            arrChk = arrChk.substr(0, arrChk.length - 1);
            var url = "AjaxService.aspx?action=" + action + "&Id=" + arrChk + "&r=" + Math.random();
            $.getJSON(url, function (date) {
                if (date.success == 0) {
                    jSuccess('<strong>批量操作成功!</strong>', { ShowOverlay: false, HorizontalPosition: 'center', VerticalPosition: 'center' });
                    $('#GridView_Refresh_Button').click();
                } else {
                    jError('<strong>' + date.success + '</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                }
            })
        }

    </script>
</body>
</html>
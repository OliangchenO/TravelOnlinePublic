﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CruisesSetPlanNo.aspx.cs" Inherits="TravelOnline.CruisesOrder.CruisesSetPlanNo" %>
<%@ Register src="~/Master/ManagerHeader.ascx" tagname="ManagerHeader" tagprefix="uc1" %>
<%@ Register src="~/Master/SortListNew.ascx" tagname="SortList" tagprefix="uc2" %>
<%@ Register src="~/Master/ManagerFooter.ascx" tagname="ManagerFooter" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%=CruisesShip %> - 团号安排</title>
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
    <script type="text/javascript" src="/Scripts/MyAuto.js"></script>
    <script type="text/javascript" src="/Scripts/lhgdialog/lhgdialog.min.js?s=default,chrome,aero"></script>
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
            <h2 class="headline"><SPAN class=headstep><%=CruisesShip%> - 团号安排</SPAN></h2>
            </div>
            <DIV id="DIV1" style="DISPLAY:none">
                <input id="Cid" name="Cid" type="hidden" />
                <input id="LineId" name="LineId" type="hidden" value="<%=LineId %>"/>
                <input id="AutoId" name="AutoId" type="hidden" value="<%=AutoId %>"/>
                <input id="GuestId" name="GuestId" type="hidden" value=""/>
                <input id="PlanAllotid" name="PlanAllotid" type="hidden" value=""/>
            </DIV>
            <div class="serch">
                分配: <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Value="0">未分配</asp:ListItem>
                    <asp:ListItem Value="1">已分配</asp:ListItem>
                    <asp:ListItem Value="all">全部</asp:ListItem>
                 </asp:DropDownList> &nbsp; &nbsp;&nbsp;
                 签证: <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="all">全部</asp:ListItem>
                    <asp:ListItem Value="1">团签</asp:ListItem>
                    <asp:ListItem Value="2">个签</asp:ListItem>
                    <asp:ListItem Value="3">未设置</asp:ListItem>
                 </asp:DropDownList> &nbsp; &nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="javascript:$('#GridView_Serch_Button').click();">查询</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="false" iconCls="icon-add" onclick="GroupDo('Allot')">自动分配</a>&nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="false" iconCls="icon-ok" onclick="GroupDo('Group')">批量分配</a>&nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="false" iconCls="icon-no" onclick="GroupDo('Cancel')">删除分配</a>&nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="false" iconCls="icon-ok" onclick="GroupDo('Visa_Tuan')">团签</a>&nbsp;&nbsp;
                <a href="javascript:void(0);" class="easyui-linkbutton" plain="false" iconCls="icon-ok" onclick="GroupDo('Visa_Ger')">个签</a>
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
                        OnDataBound="GridView_DataBound" GridLines="None" SortExpression="AutoId" 
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
                            <asp:BoundField DataField="OrderName" HeaderText="联系人" SortExpression="OrderName">
		                        <HeaderStyle Width="10%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OrderNums" HeaderText="订单人数" SortExpression="OrderNums">
		                        <HeaderStyle Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GuestName" HeaderText="客人姓名" SortExpression="GuestName">
		                        <HeaderStyle Width="10%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="签证">
                                <ItemTemplate></ItemTemplate>
                                <HeaderStyle Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="分团号" SortExpression="PlanNo">
                                <ItemTemplate>
                                    <input value="<%# DataBinder.Eval(Container.DataItem, "PlanNo") %>" class="sel RoomNoInput" type="text" name="RoomInput" id="<%# DataBinder.Eval(Container.DataItem, "Id") %>"  maxlength="10" style="width: 160px"  readonly="readonly"/>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
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
            </div>          
        </div>
        <SCRIPT language="javascript" src="/Scripts/NowrapSet.js"></SCRIPT>
    </form>
<DIV class=clr></DIV></DIV>
<uc3:ManagerFooter ID="ManagerFooter1" runat="server" />
    <script type="text/javascript">
        $('.RoomNoInput').bind('click', function () {
            if ($(this).val() != "") {
                if (confirm('确认要变更团号吗？')) {
                }
                else
                { return false; }
            }
            $("#GuestId").val($(this).attr("id"));
            var url = "../Common/GetAutoDropList.aspx?action=ShowCruisesPlanNo&SerchName=" + $("#LineId").val();
            show(this, "PlanAllotid", url, "yes");
        });

        function afterselet(callback) {
            var TabelNo = $("#" + $("#GuestId").val()).val();
            if (TabelNo == "") return;
            var url = "AjaxService.aspx?action=SetCruisesPlanNo&LineId=" + $("#LineId").val() + "&GuestId=" + $("#GuestId").val() + "&PlanAllotid=" + $("#PlanAllotid").val() + "&r=" + Math.random();
            $.getJSON(url, function (date) {
                if (date.success == 0) {
                    jSuccess('<strong>分配成功!</strong>', { ShowOverlay: false, HorizontalPosition: 'center', VerticalPosition: 'center' });
                } else {
                    $("#" + $("#GuestId").val()).val("");
                    jError('<strong>' + date.success + '</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
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
            if (flag == "Allot") {
                alert("暂未开通");
                return;
            }
            var arrChk = "";
            var doname = "自动分配团号"
            var action = "CruisesAutoPlanNo"
            if (flag == "Cancel") {
                doname = "取消已分配团号";
                action = "CruisesPlanNoCancel"
            }
            if (flag == "Visa_Tuan") doname = "团签"
            if (flag == "Visa_Ger") doname = "个签"
            var items = $("input[name='CheckBox']:checked");
            if (items.length == 0) {
                jNotify('<strong>请选择要批量操作的数据!</strong>', { ShowOverlay: false, HorizontalPosition: 'center', VerticalPosition: 'center' });
                return false;
            }

            $("input[name$='CheckBox']:checked").each(function () { arrChk += this.value + ","; });
            arrChk = arrChk.substr(0, arrChk.length - 1);

            if (flag == "Group") {
                //var array = arrChk.split(',');
                var url = "SelectDinnerPlan.aspx?flag=Plan&LineId=" + $("#LineId").val() + "&Id=" + arrChk + "&r=" + Math.random();
                var dg = new $.dialog({ id: 'No1', page: url, title: '团号分配', width: 650, height: 470, skin: 'aero', btnBar: false, iconTitle: false, cover: true });
                dg.ShowDialog();
            }
            if (flag == "Cancel") {
                if (confirm("确认要批量 " + doname + " 吗？")) {
                }
                else
                { return false; }
                var url = "AjaxService.aspx?action=" + action + "&LineId=" + $("#LineId").val() + "&Id=" + arrChk + "&r=" + Math.random();
                $.getJSON(url, function (date) {
                    if (date.success == 0) {
                        alert("批量操作成功！");
                        $('#GridView_Refresh_Button').click();
                    } else {
                        jError('<strong>' + date.success + '</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                    }
                })
            }

            if (flag == "Visa_Tuan" || flag == "Visa_Ger") {
                if (confirm("确认要批量 " + doname + " 吗？")) {
                }
                else
                { return false; }
                var url = "AjaxService.aspx?action=VisaFlag&flag=" + flag + "&LineId=" + $("#LineId").val() + "&Id=" + arrChk + "&r=" + Math.random();
                $.getJSON(url, function (date) {
                    if (date.success == 0) {
                        alert("批量操作成功！");
                        $('#GridView_Refresh_Button').click();
                    } else {
                        jError('<strong>' + date.success + '</strong>', { autoHide: false, clickOverlay: true, HorizontalPosition: 'center', VerticalPosition: 'center' });
                    }
                })
            }

        }

    </script>
</body>
</html>
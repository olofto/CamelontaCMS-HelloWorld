<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopNav.ascx.cs" Inherits="HelloWorld.Controls.TopNav" %>
<div id="top_menu">
    <ul>
        <li><a href="<%#CMS.Context.StartPage.Url %>"<%#CMS.Context.StartPage.NodeID == CMS.Context.PageData.NodeID ? " class=\"active\"" : "" %>><%=CMS.Context.StartPage.NavTitle %></a></li>
        <asp:Repeater ID="rpTopNav" DataSource="<%# CMS.GetChildren(CMS.Context.StartPage.NodeID).Where(p => p.Visible).ToList() %>" runat="server">
            <ItemTemplate>
                <li>
                    <a href="<%#Eval("Url") %>"<%#CMS.Utility.PageIsActive(Container.DataItem) ? " class=\"active\" " : "" %>><%#Eval("NavTitle") %></a>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
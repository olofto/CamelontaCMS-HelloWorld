<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DocumentList.ascx.cs" Inherits="HelloWorld.Controls.DocumentList" %>

<asp:GridView ID="gvFileList"
        AllowSorting="true"
        CssClass="DocumentList"
        AutoGenerateColumns="false"
        AllowPaging="true"
        PageSize="20"
        AlternatingRowStyle-BackColor="#eeeeee"
        OnSorting="gvFileList_Sorting"
        OnPageIndexChanging="gvFileList_PageIndexChanging"
        runat="server" >
    <Columns>
        <asp:TemplateField HeaderText="Filnamn" HeaderStyle-CssClass="TableHeader" SortExpression="Name">
            <ItemTemplate>
                <img src="<%=Globals.SystemUrl %>images/fileicons/<%#GetFileIcon(Eval("VirtualPath")) %>" alt="" />
                <a href="<%#Eval("VirtualPath") %>" title="<%#Eval("VirtualPath") %>" target="_blank"><%#Eval("Name") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Senast ändrad" HeaderStyle-CssClass="TableHeader" SortExpression="LastModified">
            <ItemTemplate>
                <span class="date"><%#Eval("MetaProperties.LastModified")%></span>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings Mode="NumericFirstLast" />
</asp:GridView>
                
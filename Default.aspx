<%@ Page Title="" Language="C#" MasterPageFile="MasterPages/HelloWorld.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="HelloWorld.Default" %>

<asp:Content ContentPlaceHolderID="content" runat="server">
    <%= CMS.Context.GetPageProperty("bodyText") %>
</asp:Content>
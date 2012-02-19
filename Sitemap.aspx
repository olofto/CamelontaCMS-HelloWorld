<%@ Page Title="" Language="C#" MasterPageFile="MasterPages/HelloWorld.Master" AutoEventWireup="true" CodeFile="Sitemap.aspx.cs" Inherits="HelloWorld.Sitemap" %>

<asp:Content ContentPlaceHolderID="content" runat="server">
    
    <h1>SiteMap</h1>
    <CMS:XslPageTreeControl ID="XslSiteMap" XslFile="theme/xslt/SiteMap.xslt" runat="server" />

    <div id="sitemapText">
    </div>

</asp:Content>

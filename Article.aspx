<%@ Page Language="C#" MasterPageFile="MasterPages/HelloWorld.Master" AutoEventWireup="true" CodeFile="Article.aspx.cs" Inherits="HelloWorld.Article" %>
<%@ Register Src="Controls/ImageGallery.ascx" TagName="ImageGallery" TagPrefix="Controls" %>
<%@ Register Src="Controls/DocumentList.ascx" TagName="DocumentList" TagPrefix="Controls" %>

<asp:Content ContentPlaceHolderID="content" runat="server">
    
    <!-- Left navigation -->
    <div id="left_nav">
        <CMS:XslPageTreeControl ID="XslLeftNav" XslFile="theme/xslt/LeftNav.xslt" runat="server" />
    </div>

    <!-- Breadcrumbs -->
    <div id="breadcrumbs">
        <CMS:XslPageTreeControl ID="XslBreadCrumbs" XslFile="theme/xslt/BreadCrumbs.xslt" runat="server" />
    </div>

    <!-- Large middle column -->
    <div id="center">
        <CMS:Property PropertyName="bodyText" AllowOnPageEditing="true" runat="server" />
        
        <CMS:Foreach Property="ImageGallery|DocumentList" runat="server">
            <ItemTemplate>
                
                <CMS:If CurrentElementName="ImageGallery" runat="server">
                    <!-- Image gallery -->
                    <p><Controls:ImageGallery GalleryFolder='<%# Eval("this") %>' runat="server" /></p>
                </CMS:If>
                
                <CMS:If CurrentElementName="DocumentList" runat="server">
                    <!-- DocumentList -->
                    <p><Controls:DocumentList runat="server" Header='<%#Eval("Header") %>' ListFolder='<%#Eval("ListFolder") %>' /></p>
                </CMS:If>

            </ItemTemplate>
        </CMS:Foreach>

    </div>
    
    <!-- Right column -->
    <div id="right">

        <CMS:ForEach Property="panel|image|script" runat="server">
            <ItemTemplate>
		        <CMS:If CurrentElementName="script" runat="server">
                    <%#Eval("this") %>
		        </CMS:If>
                <CMS:If CurrentElementName="image" runat="server">
                    <a href='<%#Eval("imgSrc")%>'><img src="<%# CMS.Utility.ResizeImage(Eval("imgSrc").ToString(), "?maxwidth=200") %>" alt="<%#Eval("caption")%>"/></a>
                    <strong><em><%#Eval("caption") %></em></strong>
                </CMS:If>
                <CMS:If CurrentElementName="panel" runat="server">
                    <h3><%#Eval("header") %></h3>
                    <div style="">
                        <%#Eval("text") %>
                    </div>
                </CMS:If>
            
                <div class="divider"></div>
            </ItemTemplate>
        </CMS:ForEach>

    </div>

</asp:Content>

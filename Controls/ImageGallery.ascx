<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageGallery.ascx.cs" Inherits="HelloWorld.Controls.ImageGallery" %>

<asp:Repeater ID="rpImages" runat="server">
    <ItemTemplate>
        <a rel="gallery" data-download="<%#Eval("VirtualPath") %>" href="<%#Eval("VirtualPath") %>" title="<%# Eval("Name") %>"><img src="<%#Eval("VirtualPath") %>?width=83&amp;height=85&amp;crop=auto" alt="<%# Eval("Name") %>" title="<%# Eval("Name") %>" /></a>
    </ItemTemplate>
</asp:Repeater>
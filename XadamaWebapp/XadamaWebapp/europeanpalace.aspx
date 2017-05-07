<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="europeanpalace.aspx.cs" Inherits="XadamaWebapp.europeanpalace" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>European Palace</title>
    <link rel="stylesheet" type="text/css" href="Style/hotel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><div class="content container padding-64">
        <p class="center xxlarge text-orange margin-bottom-large bold uppercase padding-large">European Palace</p>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Image runat="server" ID="Image1" CssClass="slideshow" ImageUrl="~/Media/Hotels/europeanpalace.jpg"/>
        <ajaxToolkit:SlideShowExtender ID="SlideShowExtender1" runat="server" 
            TargetControlID="Image1"
            SlideShowServiceMethod="GetSlides"
            AutoPlay="true"
            Loop="true" SlideShowAnimationType="SlideDown" />
    </div>
</asp:Content>

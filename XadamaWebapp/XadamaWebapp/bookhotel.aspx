<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="bookhotel.aspx.cs" Inherits="XadamaWebapp.bookhotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Xadama Booking</title>
    <link rel="stylesheet" type="text/css" href="Style/bookhotel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="display-container">
        <asp:Image ID="Image5" runat="server" CssClass="imgbeg" ImageUrl="~/Media/Hotels/oceanicparadise2.jpg" />
        <div class="display-middle no-opacity">
            <asp:label runat="server" CssClass="center padding-medium black xxlarge wide" text="BOOK HOTEL"></asp:label>
        </div>
    </div>

    <div class="content container padding-64">
        <asp:ListView ID="ListView1" runat="server"></asp:ListView>
    </div>

    <div class="backimgh2 display-container">
        <div class="display-middle no-opacity">
            <asp:LinkButton ID="tickets" runat="server" CssClass="center button padding-medium xxlarge wide button-slice" Text="BUY TICKETS" PostBackUrl="tickets.aspx"></asp:LinkButton>
        </div>
    </div>
</asp:Content>
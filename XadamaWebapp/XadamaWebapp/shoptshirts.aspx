﻿<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="shoptshirts.aspx.cs" Inherits="XadamaWebapp.shoptshirts" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Tshirts</title>
    <link rel="stylesheet" type="text/css" href="Style/shop.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="backimg3 display-container">
        <div class="display-middle front">
            <div class="center wide xxlarge black padding-large appear"> T-SHIRTS </div>
        </div>
    </div>

   <div class="content container padding-32 center">
        <div class="center large text-orange margin-bottom-large margin-top bold">
            Have a look at our collection of t-shirts! 
        </div>
    </div>

    <div class="items-info">
        <div class="items-show">
            <div class="item-picture center"> Picture of an item </div>
            <div class="center bold text-blue"> Name of item </div>
        </div>
        <div class="items-show">
            <div class="item-picture center"> Picture of an item </div>
            <div class="center bold text-blue"> Name of item </div>
        </div>
        <div class="items-show">
            <div class="item-picture center"> Picture of an item </div>
            <div class="center bold text-blue"> Name of item </div>
        </div>
        <div class="items-show">
            <div class="item-picture center"> Picture of an item </div>
            <div class="center bold text-blue"> Name of item </div>
        </div>
    </div>
        <div class="items-info">
        <div class="items-show">
            <div class="item-picture center"> Picture of an item </div>
            <div class="center bold text-blue"> Name of item </div>
        </div>
        <div class="items-show">
            <div class="item-picture center"> Picture of an item </div>
            <div class="center bold text-blue"> Name of item </div>
        </div>
        <div class="items-show">
            <div class="item-picture center"> Picture of an item </div>
            <div class="center bold text-blue"> Name of item </div>
        </div>
        <div class="items-show">
            <div class="item-picture center"> Picture of an item </div>
            <div class="center bold text-blue"> Name of item </div>
        </div>
    </div>

    <div class="content container padding-32 center"> 
        <a class="darkblue center button padding-medium large bold" style="cursor: pointer;" href="shop.aspx"> GO BACK TO THE SHOP </a>
    </div>

    <div class="slider-container margin-top">
        <div class="swiper">
            <div class="slide hide">
                <asp:Image ID="Image9" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Africa/AfricanPyramid.jpg" />
                <div class="show-text show-text-africa">
                    <asp:Label ID="Label3" runat="server" CssClass="text-white" Text="AFRICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Enjoy the wild animals and beautiful sabannahs</p>
                        <asp:Button runat="server" text="GO!" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image10" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/America/AmericanHollywood.jpg" />
                <div class="show-text show-text-america">
                    <asp:Label ID="Label12" runat="server" CssClass="text-white" Text="AMERICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Live an authentic american expirience</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-america button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image11" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Europe/EuropeanLondonEye.jpg" />
                <div class="show-text show-text-europe">
                    <asp:Label ID="Label13" runat="server" CssClass="text-white" Text="EUROPE"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Immerse yourself in the different cultures Europe has to offer</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-europe button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image12" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Asia/AsianChina.jpg" />
                <div class="show-text show-text-asia">
                    <asp:Label ID="Label10" runat="server" CssClass="text-white" Text="ASIA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Travel to the amazing China and explore the oriental culture</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-asia button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide hide">
                <asp:Image ID="Image13" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Oceania/OceanianTurtleaux.jpg" />
                <div class="show-text show-text-oceania">
                    <asp:Label ID="Label14" runat="server" CssClass="text-white" Text="OCEANIA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Love the long beaches and the paradisiac landscapes</p>
                        <asp:Button runat="server" text="GO!" />
                    </div>
                </div>
            </div>
        </div>
        <div class=" arrow arrow-prev left front text-white xlarge">
            <p style="margin: 13px">❮</p>
        </div>
        <div class="arrow arrow-next right front text-white xlarge">
            <p style="margin: 15px">❯</p>
        </div>
    </div>
</asp:Content>
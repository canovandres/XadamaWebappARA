<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="XadamaWebapp.shop" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Shop</title>
    <link rel="stylesheet" type="text/css" href="Style/shop.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="backimg3 display-container">
        <div class="display-middle front">
            <div class="center wide xxlarge black padding-large appear"> SHOP </div>
        </div>
    </div>

    <div class="content container padding-32 center">
        <div class="center large text-black margin-bottom-large margin-top bold">
            Welcome to our shop. There are many items you can buy online or in our physical shop when you come to our park. 
        </div>
    </div>

    <div class="slider-container margin-top">
        <div class="picture-container">
            <div class="show-pictures">
                <div class="backTshirt">
                    <a class="display-middle darkblue center button padding-medium large wide bold" style="cursor: pointer;" href="shoptshirts.aspx">T-SHIRTS</a>
                </div>
            </div>
            <div class="show-pictures">
                <div class="backJumper">
                     <a class="display-middle darkblue center button padding-medium large wide bold" style="cursor: pointer;" href="shoptshirts.aspx">JUMPERS</a>
                </div>            
            </div>
            <div class="show-pictures">
                <div class="backCap">
                     <a class="display-middle darkblue center button padding-medium large wide bold" style="cursor: pointer;" href="shoptshirts.aspx">CAPS</a>
                </div>
            </div>
            <div class="show-pictures">
                <div class="backBag">
                     <a class="display-middle darkblue center button padding-medium large wide bold" style="cursor: pointer;" href="shoptshirts.aspx">BAGS</a>
                </div>
            </div>
        </div>
    </div>

    <div class="content container padding-32 center">
        <div class="center large text-orange uppercase wide margin-bottom-large margin-top bold ">
        Feel free to have a look in any of our categories
        </div>
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

    <div>
        <asp:ListView ID="ListView1" runat="server">
            <ItemTemplate>
                <div>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="<%#Eval("name") %>"></asp:Label>
                    </div>
                    <div>
                        <asp:Image ID="Image1" runat="server" ImageUrl="<%#Eval("image") %>" />
                    </div>
                    <div>
                        <asp:TextBox ID="TextBox1" runat="server" Text="<%#Eval("description") %>"></asp:TextBox>
                    </div>
                    <div>
                        <asp:LinkButton ID="LinkButton1" Text="See more!" runat="server"></asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>

            <GroupTemplate>
                <div id="itemPlaceholder">
                </div>
            </GroupTemplate>
        </asp:ListView>
    </div>
</asp:Content>
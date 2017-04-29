﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="XadamaWebapp.client" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Xadama</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
</head>

<body>
<form id="form1" runat="server">
    <!--To Top Button-->
    <div class="to-top front blue">
        <a href="#nav-menu">TOP ↑</a>
    </div>

    <!--Top menu-->
    <div class="top menu front" id="nav-menu">
        <div class="bar front">
            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="logo-small margin-large" ImageUrl="~/Media/Logo/xadamaLogoSmall.png" />
            
            <div class="right" style="width: 70%;">
                <asp:Button runat="server" Text="Log In" CssClass="button-sign text-white right margin-16" />

                <asp:menu runat="server" Orientation="Horizontal" CssClass="margin-large right">
                    <StaticMenuItemStyle CssClass="bar-item button text-white margin-medium large" /> 
                    <DynamicMenuStyle CssClass="dynamic-menu text-white" /> 
                    <DynamicMenuItemStyle CssClass="bar-item button text-white margin-medium" /> 
                    <items>
                        <asp:menuitem text="Home"></asp:menuitem>
                        <asp:menuitem text="About"></asp:menuitem>
                        <asp:menuitem text="Hotels">
                            <asp:MenuItem text="European Palace"></asp:MenuItem>
                            <asp:MenuItem text="Oceanic Paradise"></asp:MenuItem>
                            <asp:MenuItem text="American Luxury"></asp:MenuItem>
                            <asp:MenuItem text="Asian Gardens"></asp:MenuItem>
                            <asp:MenuItem text="African Savannah"></asp:MenuItem>
                        </asp:menuitem>
                        <asp:menuitem text="Zones">
                            <asp:MenuItem text="Europe"></asp:MenuItem>
                            <asp:MenuItem text="Oceania"></asp:MenuItem>
                            <asp:MenuItem text="America"></asp:MenuItem>
                            <asp:MenuItem text="Asia"></asp:MenuItem>
                            <asp:MenuItem text="Africa"></asp:MenuItem>
                        </asp:menuitem>
                        <asp:menuitem text="Shop"></asp:menuitem>
                    </items>
                </asp:menu>

            </div>
        </div>
    </div>


    <div class="CreateAccLog padding-64 margin-32">
        <div class="CreateAc front">
           <asp:Label ID="Label7" runat="server" CssClass="left padding-large black xxlarge wide appear" Text="Create a New Account"></asp:Label>
        </div>

        <div class="LogIn display-container front">
            <asp:Label ID="Label8" runat="server" CssClass="right padding-large black xxlarge wide appear" Text="Log In"></asp:Label>
        </div>
    </div>

    <div class="content container padding-64">
        <p class="center xxlarge text-orange margin-bottom-large bold uppercase">Our park is distributed in 5 zones, one for each continent. Find them out!</p>
        <p class="center large text-orange margin-bottom-large bold">Discover the six continents of one of Europe&#39;s most iconic theme parks. An ideal destination for 
            a family getaway in the Costa Blanca, one of Spain&#39;s most popular tourist areas; 
            and just half an hour from Alicante!</p>
    </div>

    <div class="backimg2 display-container">
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="ZONES"></asp:label>
        </div>
    </div>

    <div class="slider-container padding-64 margin-32">
        <p class="center xlarge text-orange margin-bottom-large bold uppercase">Our park is distributed in 5 zones, one for each continent. Find them out!</p>
        <div class="swiper">
            <div class="slide hide">
                <asp:Image ID="Image9" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Africa/AfricanPyramid.jpg" />
                <div class="show-text show-text-africa">
                    <asp:Label ID="Label3" runat="server" CssClass="text-white" Text="AFRICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Bla bla blaaa ffdd fssdpkhfda sdvojsg gsfaos sdvdlf</p>
                        <asp:Button runat="server" text="GO!" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image10" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/America/AmericanHollywood.jpg" />
                <div class="show-text show-text-america">
                    <asp:Label ID="Label12" runat="server" CssClass="text-white" Text="AMERICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Bla bla blaaa ffdd fssdpkhfda sdvojsg gsfaos sdvdlf</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-america button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image11" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Europe/EuropeanLondonEye.jpg" />
                <div class="show-text show-text-europe">
                    <asp:Label ID="Label13" runat="server" CssClass="text-white" Text="EUROPE"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Bla bla blaaa ffdd fssdpkhfda sdvojsg gsfaos sdvdlf</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-europe button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image12" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Asia/AsianChina.jpg" />
                <div class="show-text show-text-asia">
                    <asp:Label ID="Label10" runat="server" CssClass="text-white" Text="ASIA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Bla bla blaaa ffdd fssdpkhfda sdvojsg gsfaos sdvdlf</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-asia button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide hide">
                <asp:Image ID="Image13" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Oceania/OceanianTurtleaux.jpg" />
                <div class="show-text show-text-oceania">
                    <asp:Label ID="Label14" runat="server" CssClass="text-white" Text="OCEANIA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Bla bla blaaa ffdd fssdpkhfda sdvojsg gsfaos sdvdlf</p>
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

    <div class="backimg1 display-container">
        <div class="display-middle front">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="HOTELS"></asp:label>
        </div>
    </div>

    <div class="content container padding-64 margin-32">
        <p class="center xlarge text-orange margin-bottom-large bold uppercase">Here are some of our hotels:</p>
        <div class="row-padding center">
            <div class="col quarter">
                <div class="shadow" style="transform: rotate(10deg); z-index: -1;">
                    <asp:Image ID="Image1" runat="server" CssClass="image-menu" ImageUrl="~/Media/Hotels/americanluxury.jpg" />
                    <div class="center padding-16 white">
                        <p>Hola hola hola</p>
                    </div>
                </div>
            </div>
            <div class="col quarter" style="transform: rotate(-3deg)">
                <div class="shadow">
                    <asp:Image ID="Image2" runat="server" CssClass="image-menu" ImageUrl="~/Media/Hotels/africansavannah.jpg" />
                    <div class="center padding-16 white">
                        <p>Hola hola hola</p>
                    </div>
                </div>
            </div>
            <div class="col quarter" style="transform: rotate(9deg)">
                <div class="shadow">
                    <asp:Image ID="Image3" runat="server" CssClass="image-menu" ImageUrl="~/Media/Hotels/europeanpalace2.jpg" />
                    <div class="center padding-16 white">
                        <p>Hola hola hola</p>
                    </div>
                </div>
            </div>
            <div class="col quarter" style="transform: rotate(1deg)">
                <div class="shadow">
                    <asp:Image ID="Image7" runat="server" CssClass="image-menu" ImageUrl="~/Media/Hotels/europeanpalace.jpg" />
                    <div class="center padding-16 white">
                        <p>Hola hola hola</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-padding center">
            <div class="col quarter">
                <div class="shadow" style="transform: rotate(-5deg);">
                    <asp:Image ID="Image4" runat="server" CssClass="image-menu" ImageUrl="~/Media/Hotels/asiangardens3.jpg" />
                    <div class="center padding-16 white">
                        <p>Hola hola hola</p>
                    </div>
                </div>
            </div>
            <div class="col quarter">
                <div class="shadow" style="transform: rotate(2deg);">
                    <asp:Image ID="Image5" runat="server" CssClass="image-menu" ImageUrl="~/Media/Hotels/oceanicparadise.jpg" />
                    <div class="center padding-16 white">
                        <p>Hola hola hola</p>
                    </div>
                </div>
            </div>
            <div class="col quarter">
                <div class="shadow" style="transform: rotate(-1deg);">
                    <asp:Image ID="Image6" runat="server" CssClass="image-menu" ImageUrl="~/Media/Hotels/europeanpalace3.jpg" />
                    <div class="center padding-16 white">
                        <p>Hola hola hola</p>
                    </div>
                </div>
            </div>
            <div class="col quarter">
                <div class="shadow" style="transform: rotate(6deg);">
                    <asp:Image ID="Image8" runat="server" CssClass="image-menu" ImageUrl="~/Media/Hotels/asiangardens.jpg" />
                    <div class="center padding-16 white">
                        <p>Hola hola hola</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="backimg3 display-container">
        <div class="display-middle">
            <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="SHOP"></asp:label>
        </div>
    </div>

    <div class="content container padding-64 margin-32">
        <p class="center"><em>You can find us here:</em></p>

        <div class="center">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29068.54208097489!2d-0.5360552693342719!3d38.32360685377032!2m3!1f0!2f0!3f
                0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzjCsDE5JzI2LjEiTiAwwrAzMScxNy43Ilc!5e1!3m2!1ses!2ses!4v1492372950166"></iframe>
        </div>

        <div>
            <p>Send a suggestion:</p>
        </div>

        <asp:Label ID="Label4" runat="server" Text="Name:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <div>
            <asp:Label ID="Label5" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label6" runat="server" Text="Message:"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Send Message" />
        </div>
    </div>

    <div class="center footer padding-64">
        <div class="xlarge text-white">
            <p>Follow us!</p>
            <div>
                <p class="large">
                    Alicante, ES<br>
                    Phone: +34 123 456 789<br>
                    E-mail: <a class="text-white" href="mailto:xadama@xadama.com">xadama@xadama.com</a></p>
            </div>
             <asp:ImageButton ID="Image14" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/facebook.png" />
             <asp:ImageButton ID="Image15" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/twitter.png" />
             <asp:ImageButton ID="Image16" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/instagram.png" />
             <asp:ImageButton ID="Image17" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/snapchat.png" />
             <asp:ImageButton ID="Image18" runat="server" CssClass="logo-small hover-opacity" ImageUrl="~/Media/Social/youtube.png" />
        </div>
    </div>
</form>
</body>
</html>
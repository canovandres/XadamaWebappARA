<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zoneeurope.aspx.cs" Inherits="XadamaWebapp.zoneeurope" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Europe</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/stylezoneeurope.css" />
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
                <asp:Button runat="server" Text="Sign In" CssClass="button-sign text-white right margin-16" />
                <asp:Button runat="server" Text="Sign Up" CssClass="button-sign text-white right margin-16" />

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

    <div class="display-container">
         <asp:Image ID="Imageeur" runat="server" CssClass="imgbeg" ImageUrl="~/Media/Zones/europe.jpg" />
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="EUROPE"></asp:label>
        </div>
    </div>

    <div class="content container padding-32">
        <p class="center large text-darkblue margin-bottom-large bold">Inspired by the most enchanting locations on the old continent,
             this charming fishing village warmly welcomes you to the park. Here you will find
             heart-stopping rides as well as quieter areas to relax in and enjoy together as a family.</p>
        <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image10" runat="server" CssClass="zone-image" ImageUrl="~/Media/Zones/restaurantim.jpg" />
                <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Restaurants" CssClass="button-aux botonimagen" />
                </div>
            </div>

            <div class="zone">
                <asp:Image ID="Image11" runat="server" CssClass="zone-image" ImageUrl="~/Media/Zones/showim.jpeg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Shows" CssClass="button-aux botonimagen" />
                </div>
            </div>
    
        </div>

       <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image1" runat="server" CssClass="zone-image" ImageUrl="~/Media/Rides/America/AmericanMayasaux.jpg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Rides" CssClass="button-aux botonimagen" />
                </div>
            </div>

            <div class="zone">
                <asp:Image ID="Image2" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/americanluxury3.jpg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Hotels" CssClass="button-aux botonimagen" />
                </div>
            </div>
    
        </div>
          
    </div>

     <div class="slider-container padding-bottom-32">
        <p class="center xxlarge text-orange margin-bottom-large bold"> Discover other zones! </p>
         <div class="swiper">
            <div class="slide">
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
                <asp:Image ID="Image3" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/America/AmericanHollywood.jpg" />
                <div class="show-text show-text-america">
                    <asp:Label ID="Label12" runat="server" CssClass="text-white" Text="AMERICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Bla bla blaaa ffdd fssdpkhfda sdvojsg gsfaos sdvdlf</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-america button-sign" />
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

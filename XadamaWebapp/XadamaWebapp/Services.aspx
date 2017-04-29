<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="XadamaWebapp.Services" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Xadama Services</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/services.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
        $( function() {
            $( ".draggable" ).draggable();
        } );
    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            window.onscroll = function() {
                if (window.pageYOffset >= 100){
                    $('.bar').css({ transition: 'height 1s', height: 'auto' });
                    $('.logo-small').css({ transition: 'height 1s', height: '25px' });
                    $('#nav-menu .menu').css({ transition: 'margin 1s', margin: '6px 12px' });
                    $('.bar-item').css({ transition: 'font-size 1s', 'font-size': '14px' });
                    $('.button-sign').css({ transition: 'font-size 1s, padding 1s', 'font-size': '12px', padding: '6px 12px' });
                    $('.to-top').css({ display: 'inherit' });
                }
                else {
                    $('.bar').css({ transition: 'height 1s', height: 'auto' });
                    $('.logo-small').css({ transition: 'height 1s', height: '40px' });
                    $('#nav-menu .menu').css({ transition: 'margin 1s', margin: '12px 24px' });
                    $('.bar-item').css({ transition: 'font-size 1s', 'font-size': '18px' });
                    $('.button-sign').css({ transition: 'font-size 1s, padding 1s', 'font-size': '18px', padding: '12px 24px' });
                    $('.to-top').css({ display: 'none' });
                }
            }
        });
    </script>
</head>
<body>
<form id="form1" runat="server">
    <!--To Top Button-->
    <div class="to-top front blue" id="toTop">
        <a href="#nav-menu">TOP ↑</a>
    </div>

    <!--Top menu-->
    <div class="top menu front">
        <div class="bar front" id="nav-menu">
            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="logo-small margin-large" ImageUrl="~/Media/Logo/xadamaLogoSmall.png" />
            
            <div class="right" style="width: 75%;">
                <asp:Button runat="server" Text="Sign In" CssClass="button-sign text-white right margin-16 margin-right" />

                <asp:menu runat="server" Orientation="Horizontal" CssClass="right menu">
                    <StaticMenuItemStyle CssClass="bar-item button text-white margin-medium center" />
                    <DynamicMenuStyle CssClass="dynamic-menu text-white center" /> 
                    <DynamicMenuItemStyle CssClass="bar-item button text-white center padding-large" />
                    <items>
                        <asp:menuitem text="Home" NavigateUrl="main.aspx"></asp:menuitem>
                        <asp:menuitem text="About" NavigateUrl="about.aspx"></asp:menuitem>
                        <asp:menuitem text="Zones" NavigateUrl="zones.aspx">
                            <asp:MenuItem text="Europe" NavigateUrl="europe.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Oceania" NavigateUrl="africa.aspx"></asp:MenuItem>
                            <asp:MenuItem text="America" NavigateUrl="america.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Asia" NavigateUrl="asia.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Africa" NavigateUrl="africa.aspx"></asp:MenuItem>
                        </asp:menuitem>
                        <asp:menuitem text="Hotels" NavigateUrl="hotels.aspx">
                            <asp:MenuItem text="European Palace" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Oceanic Paradise" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="American Luxury" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Asian Gardens" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="African Savannah" NavigateUrl="hotels.aspx"></asp:MenuItem>
                        </asp:menuitem>
                        <asp:MenuItem Text="Tickets" NavigateUrl="tickets.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Services" NavigateUrl="services.aspx">
                            <asp:MenuItem Text="Rides" NavigateUrl="services.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Shows" NavigateUrl="services.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Restaurants" NavigateUrl="services.aspx"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:menuitem text="Shop"  NavigateUrl="shop.aspx"></asp:menuitem>
                        <asp:MenuItem Text="Promotions"  NavigateUrl="promotions.aspx"></asp:MenuItem>
                    </items>
                </asp:menu>
            </div>
        </div>
    </div>

    <!--Drop-down-lists-->
    <div class="drop-container center padding-64 content text-orange bold xxlarge uppercase"> <!--class="container padding-64 center"-->
        <p>explore the rides, restaurants and shows of each zone</p>
        <div class="padding-32">
            <asp:DropDownList ID="ListZones" runat="server" CssClass="dropdown-border text-orange bold large backimgdrop dropdown-border" Width ="300px" Height="30px" >
                <asp:ListItem Text="--" Value="0"></asp:ListItem>
                <asp:ListItem Text="Africa" Value="1"></asp:ListItem>
                <asp:ListItem Text="America" Value="2"></asp:ListItem>
                <asp:ListItem Text="Asia" Value="3"></asp:ListItem>
                <asp:ListItem Text="Europe" Value="4"></asp:ListItem>
                <asp:ListItem Text="Oceania" Value="5"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <asp:DropDownList ID="ListServices" runat="server" CssClass="margin-bottom-large text-orange bold large backimgdrop2 dropdown-border" Width="200px" Height="30px">
                <asp:ListItem Text="--" Value="0"></asp:ListItem>
                <asp:ListItem Text="Rides" Value="1"></asp:ListItem>
                <asp:ListItem Text="Restaurants" Value="2"></asp:ListItem>
                <asp:ListItem Text="Shows" Value="3"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <!--List View-->
    <div id="ListViewContainer" class="display-border padding-64">
        THIS BOX WILL CONTAIN A LIST VIEW DEPENDING ON WHAT OPTIONS HAS THE USER SELECTED IN THE PREVIOUS DROPDOWN LISTS, FOR EXAMPLE IF -- IS SELECTED IN BOTH, THE RESTAURANTS, RIDES AND SHOWS OF EVERY ZONE WILL BE SHOWN, IF ASIA AND RIDES WERE SELECTED THEN THE PAGE WILL SHOW THE RIDES WHICH BELONG TO THE ASIAN ZONE.
        EACH ITEM OF THE LIST VIEW WILL REPRESENT A SERVICE (RESTAURANT,RIDE OR SHOW) OF A ZONE CONTAIN INFORMATION ABOUT IT AND THE ITEMS REPRESENTING A RESTAURANT WILL HAVE A LINK TO THE PAGE OF THE RESTAURANT.
        <asp:ListView ID="ListView1" runat="server"></asp:ListView>
    </div>

    <!-- Data Base Access
    <div>
        <asp:SqlDataSource ID="XXXXX" runat="server" ConnectionString="Data Source |DataDirectory|\DB.sdf" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
    </div>-->

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

    <div class="container center footer padding-64" id="footer-bar">
        <div class="row-padding center">
            <div class="col half">
                <div class="left">
                    <asp:Label runat="server" Text="Xadama" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:menuitem text="Home" NavigateUrl="main.aspx"></asp:menuitem>
                            <asp:menuitem text="About" NavigateUrl="about.aspx"></asp:menuitem>
                        </items>
                    </asp:menu>

                    <asp:Label runat="server" Text="Services" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:MenuItem Text="Rides" NavigateUrl="services.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Shows" NavigateUrl="services.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Restaurants" NavigateUrl="services.aspx"></asp:MenuItem>
                        </items>
                    </asp:menu>
                </div>

                <div class="left">
                    <asp:Label runat="server" Text="Hotels" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:MenuItem text="European Palace" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Oceanic Paradise" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="American Luxury" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Asian Gardens" NavigateUrl="hotels.aspx"></asp:MenuItem>
                            <asp:MenuItem text="African Savannah" NavigateUrl="hotels.aspx"></asp:MenuItem>
                        </items>
                    </asp:menu>
                </div>
                <div class="left">
                    <asp:Label runat="server" Text="Zones" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:MenuItem text="Europe" NavigateUrl="europe.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Oceania" NavigateUrl="africa.aspx"></asp:MenuItem>
                            <asp:MenuItem text="America" NavigateUrl="america.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Asia" NavigateUrl="asia.aspx"></asp:MenuItem>
                            <asp:MenuItem text="Africa" NavigateUrl="africa.aspx"></asp:MenuItem>
                        </items>
                    </asp:menu>
                </div>

                <div class="left">
                    <asp:Label runat="server" Text="Shop" CssClass="label text-white large bold container"></asp:Label>
                    <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                        <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                        <items>
                            <asp:menuitem text="Shop"  NavigateUrl="shop.aspx"></asp:menuitem>
                            <asp:MenuItem Text="Tickets" NavigateUrl="tickets.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Promotions"  NavigateUrl="promotions.aspx"></asp:MenuItem>
                        </items>
                    </asp:menu>
                </div>
            </div>

            <div class="xlarge text-white col half">
                <p>Follow us!</p>
                <div>
                    <p class="large">
                        Alicante, ES<br>
                        Phone: +34 123 456 789<br>
                        E-mail: <a class="text-white" href="mailto:xadama@xadama.com">xadama@xadama.com</a></p>
                </div>
                 <asp:ImageButton ID="Image14" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/facebook.png" />
                 <asp:ImageButton ID="Image15" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/twitter.png" />
                 <asp:ImageButton ID="Image16" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/instagram.png" />
                 <asp:ImageButton ID="Image17" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/snapchat.png" />
                 <asp:ImageButton ID="Image18" runat="server" CssClass="icon-small hover-opacity" ImageUrl="~/Media/Social/youtube.png" />
            </div>
        </div>
    </div>
    <div class="sub-footer">
        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="logo-small margin-large left" ImageUrl="~/Media/Logo/xadamaLogoSmall.png" />
        <p style="float: left; top: 10px">© Información legal 2017. Xadama. Todos los derechos reservados.</p>
    </div>
</form>
</body>
</html>
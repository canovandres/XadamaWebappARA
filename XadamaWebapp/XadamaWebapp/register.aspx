<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="XadamaWebapp.client" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Xadama Register</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/register.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
                
                if (window.pageYOffset >= 1850) {
                    $('.image-appear1').css({ transition: 'transform 2s', transform: 'translateX(0px)' });
                    $('.image-appear2').css({ transition: 'transform 1.8s', transform: 'translateX(0px)' });
                    $('.image-appear3').css({ transition: 'transform 1.6s', transform: 'translateX(0px)' });
                    $('.image-appear4').css({ transition: 'transform 1.4s', transform: 'translateX(0px)' });
                }
                else {
                    $('.image-appear3').css({ transition: 'transform 2s', transform: 'translateX(2000px)' });
                    $('.image-appear2').css({ transition: 'transform 1.8s', transform: 'translateX(2000px)' });
                    $('.image-appear4').css({ transition: 'transform 1.6s', transform: 'translateX(2000px)' });
                    $('.image-appear1').css({ transition: 'transform 1.4s', transform: 'translateX(2000px)' });
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
                        <asp:menuitem text="About"></asp:menuitem>
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

    <!--Register/Login-->
    <div class="content container padding-64">  <!--1-->
        <div class="padding-64">    <!--2-->
            <div class="col half">      <!--3-->
                <asp:Label runat="server" Text="Create a New Account " CssClass="form-label margin-large xxlarge"></asp:Label>
                <div class="register form-content padding-large margin-medium grey shadow">    <!--4-->
                    <div class="field half">
                        <asp:Label runat="server" Text="EMAIL*: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                    </div>

                    <div class="field half">
                        <asp:Label runat="server" Text="PASSWORD*: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
                    </div>

                    <div class="field half">
                        <asp:Label runat="server" Text="CONFIRM PASSWORD*: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxRepeatPassword" runat="server"></asp:TextBox>
                    </div>

                    <div class="field">
                        <asp:Label runat="server" Text="NAME*: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                    </div>

                    <div class="field half">
                        <asp:Label runat="server" Text="FIRST SURNAME*: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBox1Surname" runat="server"></asp:TextBox>
                    </div>

                    <div class="field half">
                        <asp:Label runat="server" Text="SECOND SURNAME*: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBox2Surname" runat="server"></asp:TextBox>
                    </div>

                    <div class="field">
                        <asp:Label runat="server" Text="BIRTHDAY: " CssClass="form-label medium"></asp:Label>
                        <asp:Calendar ID="Calendario" runat="server"></asp:Calendar>
                    </div>

                    <div class="field half">
                        <asp:Label runat="server" Text="PHONE: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
                    </div>

                    <div class="field half">
                        <asp:Label runat="server" Text="ADDRESS: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
                    </div>

                    <div class="field">
                        <div class="create-button">
                            <asp:Button runat="server" CssClass="right button padding-medium large button-slice wide" text="Create Account"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        
            <div class="col half">  <!--3-->
                <asp:Label runat="server" Text="Sign In " CssClass="form-label margin-large xxlarge"></asp:Label>
                <div class="register form-content padding-large margin-medium grey shadow">    <!--4-->
                    <div class="field half">
                        <asp:Label runat="server" Text="EMAIL: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </div>

                    <div class="field half">
                        <asp:Label runat="server" Text="PASSWORD: " CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </div>

                    <div class="field">
                        <div class="signin-button">
                            <asp:Button runat="server" CssClass="right button padding-medium large button-slice wide" text="Sign In"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
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
                            <asp:menuitem text="About"></asp:menuitem>
                            <asp:menuitem text="Contact"></asp:menuitem>
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
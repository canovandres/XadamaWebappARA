<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="XadamaWebapp.product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Xadama</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/shop.css" />
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
                    $('#buyButton').removeClass('buy-button');
                    $('#buyButton').addClass('buy-button-small');
                    $('.to-top').css({ display: 'inherit' });
                }
                else {
                    $('.bar').css({ transition: 'height 1s', height: 'auto' });
                    $('.logo-small').css({ transition: 'height 1s', height: '40px' });
                    $('#nav-menu .menu').css({ transition: 'margin 1s', margin: '12px 24px' });
                    $('.bar-item').css({ transition: 'font-size 1s', 'font-size': '18px' });
                    $('.button-sign').css({ transition: 'font-size 1s, padding 1s', 'font-size': '18px', padding: '12px 24px' });
                    $('#buyButton').removeClass('buy-button-small');
                    $('#buyButton').addClass('buy-button');
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
        <div class="page-container">
        <div class="shop-menu">
        <asp:menu runat="server" Orientation="Vertical" CssClass="margin-large left xlarge text-orange">
                <StaticMenuItemStyle />
                <items>
                    <asp:menuitem text="T-shirts" NavigateUrl="shop.aspx"></asp:menuitem>
                    <asp:menuitem text="Jumpers" NavigateUrl="shop.aspx"></asp:menuitem>
                    <asp:menuitem text="Bags" NavigateUrl="shop.aspx"></asp:menuitem>
                    <asp:menuitem text="Caps" NavigateUrl="shop.aspx"></asp:menuitem>
               </items>
            </asp:menu> 
    </div>
    <div class="shop-search">
       <div class="search-box right">
            <asp:TextBox ID="SearchBox" runat="server" Width="212px" style="margin-left: 1px; border:none"></asp:TextBox>
              
        </div>
    </div>
    
    <div class="shop-items">
        <div class="item-box">
            <div class="fictional-image center"> image from data base
                <p> the borders are just to show how the items will be distributed</p>
            </div>
            <div class="product-name center"> item name </div>
        </div>
        <div class="item-box">
            <div class="fictional-image center"> image from data base</div>
            <div class="product-name center"> item name </div>
        </div>
        <div class="item-box">
            <div class="fictional-image center"> image from data base</div>
            <div class="product-name center"> item name </div>
        </div>
        <div class="item-box">
            <div class="fictional-image center"> image from data base</div>
            <div class="product-name center"> item name </div>
        </div>
        <div class="item-box">
            <div class="fictional-image center"> image from data base</div>
            <div class="product-name center"> item name </div>
        </div>
        <div class="item-box">
            <div class="fictional-image center"> image from data base</div>
            <div class="product-name center"> item name </div>
        </div>
        <div class="item-box">
            <div class="fictional-image center"> image from data base</div>
            <div class="product-name center"> item name </div>
        </div>
        <div class="item-box">
            <div class="fictional-image center"> image from data base</div>
            <div class="product-name center"> item name </div>
        </div>
        <div class="item-box">
            <div class="fictional-image center"> image from data base</div>
            <div class="product-name center"> item name </div>
        </div>
    </div>
    </div>


    </form>
</body>
</html>

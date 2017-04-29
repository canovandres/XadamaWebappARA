<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tickets.aspx.cs" Inherits="XadamaWebapp.tickets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BUY Tickets</title>
    <meta charset="utf-8">
    <link rel="icon" type="image/ico" href="~/Media/Icons/tickets-icon.ico" />
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/styletickets.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
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
                    $('#toTop').removeClass('hide');
                    $('#toTop').addClass('show');
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
    <script type="text/javascript">
        function onTypeSelected() {
            var type = document.getElementById("rtype").value;
            if (type == "Single") {

            }

            else if (type == "Double") {

            }
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            height: 65px;
            width: 659px;
        }
    </style>
</head>

<body>
<form id="form2" runat="server">
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

    <div class="backimgt1 display-container">
        <div class="display-middle no-opacity">
            <asp:label runat="server" CssClass="center padding-medium black xxlarge wide" text="WEB TICKET OFFICE"></asp:label>
        </div>
    </div>

    <div class="content container padding-16">
        <div class="center padding-medium darkblue xlarge wide">
            <a>TICKET PRICES: </a>
        </div>
    </div>

    <div class="content container padding-16">
        
    <div class="wrapt">
    <div class="table">
    <p class="indications">CHILDREN: 3-12 years</p>
    <p class="indications">SENIOR: +60 years</p>
    <p class="indications">FREE entry to children under 3 years.</p>

    <ul id="tickets" class="ultickets">
    
    <li class="litickets">
      <div class="topt days">
        <h1>1 DAY</h1>
        <div class="circle">40€</div>
      </div>
      <div class="bottomt">
        <p>Children: 10% discount </p>
        <p>Senior:   15% discount </p>
      </div>
    </li>
  
    <li class="litickets">
      <div class="topt days">
        <h1>2 DAYS</h1>
        <div class="circle">65€</div>
      </div>
        <div class="bottomt">
        <p>Children: 15% discount </p>
        <p>Senior:   19% discount </p>
      </div>
    </li>
  
    <li class="litickets">
      <div class="topt days">
        <h1>3 DAYS</h1>
        <div class="circle">90€</div>
      </div>
        <div class="bottomt">
        <p>Children: 20% discount </p>
        <p>Senior:   23% discount </p>
      </div>
    </li>
  
    <li class="litickets">
      <div class="topt days">
        <h1>4 DAYS</h1>
        <div class="circle">140€</div>
      </div>
        <div class="bottomt">
        <p>Children: 25% discount </p>
        <p>Senior:   30% discount </p>
      </div>
    </li>
  
    </ul>
    </div>
    </div>
   </div>
   
     <div class="content container padding-32"></div>
   <div class="back1 display-container"></div>
    <div class="content container padding-32"></div>
         <table id="buytickets" class="center">
             <caption>BUY YOUR TICKETS</caption>
             <tr>
                 <th>Children</th>
                 <th>Adult</th>
                 <th>Senior</th>
             </tr>
             
             <tr>
                 <td>
                     <asp:DropDownList ID="children" runat="server">
                         <asp:ListItem>0</asp:ListItem>
                         <asp:ListItem>1</asp:ListItem>
                         <asp:ListItem>2</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                         <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>5</asp:ListItem>
                         <asp:ListItem>6</asp:ListItem>
                         <asp:ListItem>7</asp:ListItem>
                         <asp:ListItem>8</asp:ListItem>
                         <asp:ListItem>9</asp:ListItem>
                         <asp:ListItem>10</asp:ListItem>
                     </asp:DropDownList>
                 </td>
                 <td>
                     <asp:DropDownList ID="adults" runat="server">
                         <asp:ListItem>0</asp:ListItem>
                         <asp:ListItem>1</asp:ListItem>
                         <asp:ListItem>2</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                         <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>5</asp:ListItem>
                         <asp:ListItem>6</asp:ListItem>
                         <asp:ListItem>7</asp:ListItem>
                         <asp:ListItem>8</asp:ListItem>
                         <asp:ListItem>9</asp:ListItem>
                         <asp:ListItem>10</asp:ListItem>
                     </asp:DropDownList>
                 </td>
                 <td>
                     <asp:DropDownList ID="senior" runat="server" CssClass="center">
                         <asp:ListItem>0</asp:ListItem>
                         <asp:ListItem>1</asp:ListItem>
                         <asp:ListItem>2</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                         <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>5</asp:ListItem>
                         <asp:ListItem>6</asp:ListItem>
                         <asp:ListItem>7</asp:ListItem>
                         <asp:ListItem>8</asp:ListItem>
                         <asp:ListItem>9</asp:ListItem>
                         <asp:ListItem>10</asp:ListItem>
                     </asp:DropDownList>
                 </td>
             </tr>
             <tr>
                 <td></td>
                 <td></td>
                 <td><asp:ImageButton ID="buyticketsconfirm" runat="server" ImageUrl="~/Media/Others/buy-tickets-button.png" CssClass="right"/></td>
             </tr>
         </table>
    <div class="content container padding-64"></div>
    <!--comentario-->
         <div class="container center footer padding-64" id="footer-bar">
        <div class="left margin-large padding-large">
            <div class="left">
                <asp:Label runat="server" Text="Xadama" CssClass="label text-white large bold container"></asp:Label><asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                    <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                    <items>
                        <asp:menuitem text="Home" NavigateUrl="main.aspx"></asp:menuitem>
                        <asp:menuitem text="About" NavigateUrl="about.aspx"></asp:menuitem>
                    </items>
                </asp:menu>

                <asp:Label runat="server" Text="Services" CssClass="label text-white large bold container"></asp:Label><asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                    <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                    <items>
                        <asp:MenuItem Text="Rides" NavigateUrl="services.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Shows" NavigateUrl="services.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Restaurants" NavigateUrl="services.aspx"></asp:MenuItem>
                    </items>
                </asp:menu>
            </div>

            <div class="left">
                <asp:Label runat="server" Text="Hotels" CssClass="label text-white large bold container"></asp:Label><asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
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
                <asp:Label runat="server" Text="Zones" CssClass="label text-white large bold container"></asp:Label><asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
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
                <asp:Label runat="server" Text="Shop" CssClass="label text-white large bold container"></asp:Label><asp:menu runat="server" Orientation="Vertical" CssClass="margin-large">
                    <StaticMenuItemStyle CssClass="bar-item button text-blue margin-medium medium left" /> 
                    <items>
                        <asp:menuitem text="Shop"  NavigateUrl="shop.aspx"></asp:menuitem>
                        <asp:MenuItem Text="Tickets" NavigateUrl="tickets.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Promotions"  NavigateUrl="promotions.aspx"></asp:MenuItem>
                    </items>
                </asp:menu>
            </div>
        </div>

        <div class="xlarge text-white right margin-large padding-large">
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
    <div class="sub-footer">
        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="logo-small margin-large left" ImageUrl="~/Media/Logo/xadamaLogoSmall.png" />
        <p style="float: left; top: 10px">© Información legal 2017. Xadama. Todos los derechos reservados.</p>
    </div>
</form>
</body>
</html>
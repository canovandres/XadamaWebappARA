<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bookhotel.aspx.cs" Inherits="XadamaWebapp.bookhotel" %>

<!DOCTYPE HTML>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BOOKING Hotel</title>
    <meta charset="utf-8">
    <link rel="icon" type="image/ico" href="~/Media/Icons/bookhotel-icon.ico" />
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/stylebookhotel.css" />
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

    <div class="backimgh1 display-container">
        <div class="display-middle no-opacity">
            <asp:label runat="server" CssClass="center padding-medium black xxlarge wide" text="BOOK HOTEL"></asp:label>
        </div>
        <div class="display-middle-sub">
            <asp:Label runat="server" CssClass="center padding-small black large wide" Text="Select between our 5 continental inspired hotels" ></asp:Label>
        </div>
    </div>

    <div class="content container padding-64"></div>

    <div class="backimgh2 display-container">
        <div class="display-middle no-opacity">
            <asp:LinkButton ID="tickets" runat="server" CssClass="center padding-medium black-translucid hover-black-op xxlarge wide" Text="BUY TICKETS ONLY" PostBackUrl="tickets.aspx"></asp:LinkButton>
        </div>
    </div>

    <div class="content container padding-64">
        <div class="center padding-medium darkgrey xlarge wide">
            <a>OUR HOTEL SELECTION: </a>
        </div>
    </div>

    <div class="content container padding-16">
      <table id="#hotelAfrica" class="margin-64" style="height: 247px; width: 610px">
       
        <caption>
            <asp:Image ID="Image1" runat="server" CssClass="left margin-16" ImageUrl="~/Media/Hotels/africansavannah2.jpg" Width="356px" Height="231px" />
             <asp:Label ID="Label1" runat="server" CssClass="margin-medium left top asianlabel">AFRICAN SAVANNAH HOTEL<br class="left" /></asp:Label>
        </caption>
        <tr>
            <th>Room</th>
            <th>Board</th>
            <th>Price/Night</th>
            <th>Nights</th>
            <th>+TICKET</th>
        </tr>
            <tr>
                <td>Single</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">150€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList6" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton3" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">170€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList7" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton4" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Half Board</td>
                <td><span class="price">190€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList8" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton5" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Half Board</td>
                <td><span class="price">200€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList9" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton6" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Full Board</td>
                <td><span class="price">210€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList10" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton7" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Full Board</td>
                <td><span class="price">230€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList11" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton8" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
    </table>
    </div>

    <div class="back3 display-container"></div>

    <div class="content container padding-32">
    <table id="#hotelAmerica" class="margin-64" style="height: 247px; width: 610px">
       
        <caption>
            <asp:Image ID="Image2" runat="server" CssClass="left margin-16" ImageUrl="~/Media/Hotels/americanluxury2.jpg" Width="434px" Height="215px" />
             <asp:Label ID="Label2" runat="server" CssClass="margin-medium left top asianlabel">AMERICAN LUXURY HOTEL<br class="left" /></asp:Label>
        </caption>
        <tr>
            <th>Room</th>
            <th>Board</th>
            <th>Price/Night</th>
            <th>Nights</th>
            <th>+TICKET</th>
        </tr>
            <tr>
                <td>Single</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">140€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList12" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton9" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">180€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList13" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton10" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Half Board</td>
                <td><span class="price">190€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList14" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton11" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Half Board</td>
                <td><span class="price">190€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList15" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton12" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Full Board</td>
                <td><span class="price">215€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList16" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton13" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Full Board</td>
                <td><span class="price">220€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList17" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton14" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
    </table>
    </div>

    <div class="back3 display-container"></div>

    <div class="content container padding-32">
    <table id="#hotelAsia" class="margin-64" style="height: 247px; width: 610px">
       
        <caption>
            <asp:Image ID="asiangardenh" runat="server" CssClass="left margin-16" ImageUrl="~/Media/Hotels/asiangardens3.jpg" Width="419px" Height="222px" />
             <asp:Label ID="asiangard" runat="server" CssClass="margin-medium left top asianlabel">ASIAN GARDEN HOTEL<br class="left" /></asp:Label>
        </caption>
        <tr>
            <th>Room</th>
            <th>Board</th>
            <th>Price/Night</th>
            <th>Nights</th>
            <th>+TICKET</th>
        </tr>
            <tr>
                <td>Single</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">150€</span> </td>
                <td>
                    <asp:DropDownList id="nights" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton27" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">160€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList1" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton28" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Half Board</td>
                <td><span class="price">175€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList2" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton30" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Half Board</td>
                <td><span class="price">210€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList3" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton29" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Full Board</td>
                <td><span class="price">230€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList4" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton31" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Full Board</td>
                <td><span class="price">230€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList5" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton32" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
    </table>
    </div>

    <div class="back3 display-container"></div>

    <div class="content container padding-32">
    <table id="#hotelEurope" class="margin-64" style="height: 247px; width: 610px">
       
        <caption>
            <asp:Image ID="Image3" runat="server" CssClass="left margin-16" ImageUrl="~/Media/Hotels/europeanpalace.jpg" Width="422px" Height="216px" />
             <asp:Label ID="Label3" runat="server" CssClass="margin-medium left top asianlabel">EUROPEAN PALACE HOTEL<br class="left" /></asp:Label>
        </caption>
        <tr>
            <th>Room</th>
            <th>Board</th>
            <th>Price/Night</th>
            <th>Nights</th>
            <th>+TICKET</th>
        </tr>
            <tr>
                <td>Single</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">120€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList18" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton15" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">150€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList19" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                   <asp:ImageButton ID="ImageButton16" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Half Board</td>
                <td><span class="price">170€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList20" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton17" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Half Board</td>
                <td><span class="price">195€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList21" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton18" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Full Board</td>
                <td><span class="price">200€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList22" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton19" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Full Board</td>
                <td><span class="price">220€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList23" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton20" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
    </table>
    </div> 

    <div class="back3 display-container"></div>

    <div class="content container padding-32">
    <table id="#hotelOceania" class="margin-64" style="height: 247px; width: 610px">
       
        <caption>
            <asp:Image ID="Image4" runat="server" CssClass="left margin-16" ImageUrl="~/Media/Hotels/oceanicparadise.jpg" Width="351px" Height="215px" />
             <asp:Label ID="Label4" runat="server" CssClass="margin-medium left top asianlabel">OCEANIC PARADISE HOTEL<br class="left" /></asp:Label>
        </caption>
        <tr>
            <th>Room</th>
            <th>Board</th>
            <th>Price/Night</th>
            <th>Nights</th>
            <th>+TICKET</th>
        </tr>
            <tr>
                <td>Single</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">140€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList24" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                   <asp:ImageButton ID="ImageButton21" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Bed & Breakfast</td>
                <td><span class="price">170€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList25" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                   <asp:ImageButton ID="ImageButton22" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Half Board</td>
                <td><span class="price">170€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList26" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton23" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Half Board</td>
                <td><span class="price">180€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList27" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton24" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr>
                <td>Single</td>
                <td>Full Board</td>
                <td><span class="price">200€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList28" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                     <asp:ImageButton ID="ImageButton25" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
            <tr class="double">
                <td>Double</td>
                <td>Full Board</td>
                <td><span class="price">240€</span> </td>
                <td>
                    <asp:DropDownList id="DropDownList29" runat="server" BackColor="White" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" Font-Strikeout="False" Font-Underline="False" ForeColor="#1B2630" Height="16px" Width="49px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton26" runat="server" PostBackUrl="~/tickets.aspx" CssClass="button-small" ImageUrl="~/Media/Others/addticket.png"/>
                </td>
            </tr>
    </table>
    </div>
    
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
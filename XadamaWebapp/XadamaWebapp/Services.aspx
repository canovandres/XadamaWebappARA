<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="XadamaWebapp.Services" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Xadama</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/style-services.css" />
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

    <!--Drop-down-lists-->
    <div class="drop-container center padding-64 content text-orange bold xlarge uppercase"> <!--class="container padding-64 center"-->
        <p>explore the rides, restaurants and shows of each zone</p>
        <div>
            <asp:DropDownList ID="ListZones" runat="server" CssClass="dropdown-border text-orange center bold large margin-bottom backimgdrop dropdown-border" Width ="300px" Height="30px" >
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

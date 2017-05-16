<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="zoneasia.aspx.cs" Inherits="XadamaWebapp.zoneasia" %>

<%@ Register Src="~/carousel.ascx" TagPrefix="uc1" TagName="carousel" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Asia</title>
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/zoneeurope.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="display-container">
         <asp:Image ID="Imageeur" runat="server" CssClass="imgbeg" ImageUrl="~/Media/Others/asiaimg.jpg" />
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="ASIA"></asp:label>
        </div>
    </div>

    <div class="content container padding-32">
        <p class="center large text-darkblue margin-bottom-large bold">The Asian Zone, inspired in the oriental style, is the perfect option
             for a break without limits all year round, thanks to its amazing rides and luxury facilities.</p>
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
                <asp:Image ID="Image1" runat="server" CssClass="zone-image" ImageUrl="~/Media/Rides/Asia/AsianHelloKitty.jpg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Rides" CssClass="button-aux botonimagen" />
                </div>
            </div>

            <div class="zone">
                <asp:Image ID="Image2" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/asiangardens5.jpg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Hotels" CssClass="button-aux botonimagen" />
                </div>
            </div>
    
        </div>
          
    </div>

    <uc1:carousel runat="server" ID="carousel" />

</asp:Content>

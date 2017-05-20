<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="zoneamerica.aspx.cs" Inherits="XadamaWebapp.zoneamerica" %>

<%@ Register Src="~/carousel.ascx" TagPrefix="uc1" TagName="carousel" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama America</title>
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/zoneeurope.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="display-container">
         <asp:Image ID="Imageeur" runat="server" CssClass="imgbeg" ImageUrl="~/Media/Others/americaimg.jpg" />
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="AMERICA"></asp:label>
        </div>
    </div>

    <div class="content container padding-32">
        <p class="center large text-darkblue margin-bottom-large bold">Come and discover the American Zone, themed area and go on a journey to colonial America.
             The area opens with a spectacular Mayan pyramid and features rituals to surprise you, a rich array of culinary delights to entice you and rides like Niagara Falls that are sure to captivate you.</p>
        <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image10" runat="server" CssClass="zone-image" ImageUrl="~/Media/Zones/restaurantim.jpg" />
                <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Restaurants" CssClass="button-aux botonimagen" PostBackUrl="services.aspx?type=restaurants&zones=america"/>
                </div>
            </div>

            <div class="zone">
                <asp:Image ID="Image11" runat="server" CssClass="zone-image" ImageUrl="~/Media/Zones/showim.jpeg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Shows" CssClass="button-aux botonimagen" PostBackUrl="services.aspx?type=shows&zones=america"/>
                </div>
            </div>
    
        </div>

       <div class="buttons-zone">
           <div class="zone">
                <asp:Image ID="Image1" runat="server" CssClass="zone-image" ImageUrl="~/Media/Rides/America/AmericanMayasaux.jpg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Rides" CssClass="button-aux botonimagen" PostBackUrl="services.aspx?type=rides&zones=america"/>
                </div>
            </div>

            <div class="zone">
                <asp:Image ID="Image2" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/americanluxury3.jpg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Hotels" CssClass="button-aux botonimagen" PostBackUrl="americanluxury.aspx"/>
                </div>
            </div>
    
        </div>
          
    </div>

    <uc1:carousel runat="server" ID="carousel" />

</asp:Content>
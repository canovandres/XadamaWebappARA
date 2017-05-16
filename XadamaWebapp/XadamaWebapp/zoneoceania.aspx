<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="zoneoceania.aspx.cs" Inherits="XadamaWebapp.zoneoceania" %>

<%@ Register Src="~/carousel.ascx" TagPrefix="uc1" TagName="carousel" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Oceania</title>
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/zoneeurope.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="display-container">
         <asp:Image ID="Imageeur" runat="server" CssClass="imgbeg" ImageUrl="~/Media/Others/oceaniaimg.jpg" />
        <div class="display-middle no-opacity">
        <asp:label runat="server" CssClass="center padding-medium blue xxlarge wide" text="OCEANIA"></asp:label>
        </div>
    </div>

    <div class="content container padding-32">
        <p class="center large text-darkblue margin-bottom-large bold">Discover the Oceanic Zone, the themed area that will transport you to the real tropical jungle. 
            Do not miss your chance to experience this lush, indigenous vegetation and enjoy the most entertaining attractions and astounding shows.</p>
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
                <asp:Image ID="Image1" runat="server" CssClass="zone-image" ImageUrl="~/Media/Rides/Oceania/OceanianPacificCity.jpg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Rides" CssClass="button-aux botonimagen" />
                </div>
            </div>

            <div class="zone">
                <asp:Image ID="Image2" runat="server" CssClass="zone-image" ImageUrl="~/Media/Hotels/oceanicparadise3.jpg" />
                 <div class="show-text1 text-white">
                    <asp:Button runat="server" text="Hotels" CssClass="button-aux botonimagen" />
                </div>
            </div>
    
        </div>
          
    </div>

    <uc1:carousel runat="server" ID="carousel" />

</asp:Content>
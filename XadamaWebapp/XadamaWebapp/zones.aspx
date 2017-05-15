<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="zones.aspx.cs" Inherits="XadamaWebapp.zones" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Zones</title>
    <link rel="stylesheet" type="text/css" href="Style/style.css" />
    <link rel="stylesheet" type="text/css" href="Style/zones.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="display-container padding-128-z">
         <asp:Image ID="Imageeur" runat="server" CssClass="imgbeg" ImageUrl="~/Media/Others/title_zones.jpg" />
    </div>
    
    <div class="content-1 container padding-32 padding-ame">
        <div class="zone">
             <asp:ImageButton ID="Image1" runat="server" CssClass="imgeur" ImageUrl="~/Media/Others/mapamericabueno.png" />
        </div>
         <div class="zone-4">
            <div class="zone-5">
                <asp:ImageButton ID="ImageButton5" runat="server" CssClass="imgeur-1" ImageUrl="~/Media/Others/mapasiabueno1.png" />
            </div>
            <div class="zone-6">
                <asp:ImageButton ID="ImageButton6" runat="server" CssClass="imgeur" ImageUrl="~/Media/Others/mapaoceaniabueno.png" />
            </div>


         </div>
        <div class="zone-1">
            <div class="zone-2">
                <asp:ImageButton ID="ImageButton4" runat="server" CssClass="imgeur-1" ImageUrl="~/Media/Others/mapaeuropabueno1.png" />
            </div>
             <div class="zone-3">
                <asp:ImageButton ID="ImageButton3" runat="server" CssClass="imgeur" ImageUrl="~/Media/Others/mapafricabueno.png" />
            </div>
        </div>
        

    </div> 

     <div class="content container padding-32">
        <p class="center xxlarge text-darkblue margin-bottom-large bold">CLICK ON THE ZONE YOU WANT TO VISIT!</p>
     </div>

</asp:Content>
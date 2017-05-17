<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="servicesinfo.aspx.cs" Inherits="XadamaWebapp.servicesinfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Xadama Services</title>
    <link rel="stylesheet" type="text/css" href="Style/services.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div id="title container" class="padding-64 drop-container center margin-bottom-large content">
            <p><asp:Label ID="ServiceTitle" CssClass="uppercase bold xxlarge text-blue" runat="server"></asp:Label></p>
        </div>
        <div class="row-padding xlarge center bold" style="color:white; background-color:#457fc6">
        <div class="col third padding-32">
            <div id="info container">
                <div>
                    <p><asp:Label ID="zone" runat="server"></asp:Label></p>
                    <p><asp:Label ID="minheight" runat="server" Visible="false"></asp:Label></p>
                    <asp:Label ID="speed" runat="server" Visible="false"></asp:Label>
                </div>
                <!-- <div id="image-contain">
                    <ajaxToolkit:Seadragon ID="Seadragon"
	                    runat="server">
                    </ajaxToolkit:Seadragon>-->
            </div>
            <div id="description-contain">
                <p><asp:Label ID="ServiceDescription" runat="server"></asp:Label></p>
                <p><asp:Button ID="Button" CssClass="xlarge bold button-slice" OnClick="Button_Click" Text="BOOK!" runat="server" Visible="false" /></p>
            </div>
         </div>
        <div class="col two-third">
            <asp:Image ID="image" Width="100%" runat="server" />
        </div>
            </div>
     </div>
</asp:Content>

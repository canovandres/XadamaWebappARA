<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="servicesinfo.aspx.cs" Inherits="XadamaWebapp.servicesinfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Xadama Services</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div id="title container">
            <asp:Label ID="ServiceTitle" runat="server"></asp:Label>
        </div>
        <div id="info container">
            <div id="image-contain">
                <asp:Image ID="ServiceImage" runat="server"></asp:Image>
            </div>
            <div id="description-contain">
                <asp:Label ID="ServiceDescription" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

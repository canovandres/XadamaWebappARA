<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="servicesinfo.aspx.cs" Inherits="XadamaWebapp.servicesinfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Xadama Services</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="padding-128">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div id="title container">
            <asp:Label ID="ServiceTitle" runat="server"></asp:Label>
        </div>
        <div id="info container">
            <div id="image-contain">
                <ajaxToolkit:Seadragon ID="Seadragon"
	                runat="server">
                </ajaxToolkit:Seadragon>
            </div>
            <div id="description-contain">
                <asp:Label ID="ServiceDescription" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

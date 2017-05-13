<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="XadamaWebapp.client" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama About</title>
    <link rel="stylesheet" type="text/css" href="Style/client.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="padding-128">  <!--1-->
        <div class="col fifteen blue">      <!--3-->
            <asp:menu runat="server" Orientation="Vertical" CssClass="left menu full">
                <StaticMenuItemStyle CssClass="client-bar-item button text-white center border-menu"/>
                <StaticMenuStyle CssClass="full"/>
                <items>
                    <asp:menuitem text="Account"></asp:menuitem>
                    <asp:menuitem text="Password"></asp:menuitem>
                    <asp:menuitem text="Bank Account"></asp:menuitem>
                    <asp:menuitem text="Orders"></asp:menuitem>
                </items>
            </asp:menu>
        </div>

        <div class="col three-quarter">  <!--3-->
            <div class="">
                <div class="register form-content padding-large margin-medium grey shadow">    <!--4-->
                    <asp:Label runat="server" Text="INFORMATION WILL BE SHOWN HERE" CssClass="form-label medium"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
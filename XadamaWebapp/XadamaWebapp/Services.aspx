﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main.Master" CodeBehind="services.aspx.cs" Inherits="XadamaWebapp.Services" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="server">
    <title>Xadama Services</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Drop-down-lists-->
    <div class="drop-container center padding-64 content text-orange bold xxlarge uppercase"> <!--class="container padding-64 center"-->
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

</asp:Content>

  
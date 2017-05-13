<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="bookhotel.aspx.cs" Inherits="XadamaWebapp.bookhotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Xadama Booking</title>
    <link rel="stylesheet" type="text/css" href="Style/bookhotel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="display-container">
        <asp:Image ID="Image5" runat="server" CssClass="imgbeg" ImageUrl="~/Media/Hotels/oceanicparadise2.jpg" />
        <div class="display-middle no-opacity">
            <asp:label runat="server" CssClass="center padding-medium black xxlarge wide" text="BOOK HOTEL"></asp:label>
        </div>
    </div>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="form-content container padding-64">
        <div align="center" class="blue shadow" style="height: 300px">
            <div class="field half" style="margin-left: 4%;">
                <asp:DropDownList ID="DropDownHotel" runat="server">
                    <asp:ListItem Text="European Palace" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Asian Gardens" Value="2"></asp:ListItem>
                    <asp:ListItem Text="American Luxury" Value="3"></asp:ListItem>
                    <asp:ListItem Text="African Savannah" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Oceanic Paradise" Value="5"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="input-line field third">
                <div class="input-group-tag">From</div>
                <asp:TextBox runat="server" ID="From" CssClass="field" style="border-radius: 0px;"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server"
                    TargetControlID="From" FirstDayOfWeek="Monday" PopupPosition="BottomRight" />
                <div class="input-group-tag">to</div>
                <asp:TextBox runat="server" ID="To" CssClass="field"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="To" FirstDayOfWeek="Monday" PopupPosition="BottomRight" />
            </div>
            <div class="field fifth">
                <asp:DropDownList id="DropDownList1" runat="server" CssClass="field">
                    <asp:ListItem>Breakfast</asp:ListItem>
                    <asp:ListItem>Half Board</asp:ListItem>
                    <asp:ListItem>Full Board</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="field fifth">
                <asp:DropDownList id="DropDownList2" runat="server">
                    <asp:ListItem Value="0">0 single</asp:ListItem>
                    <asp:ListItem Value="1">1 single</asp:ListItem>
                    <asp:ListItem Value="2">2 single</asp:ListItem>
                    <asp:ListItem Value="3">3 single</asp:ListItem>
                    <asp:ListItem Value="4">4 single</asp:ListItem>
                    <asp:ListItem Value="5">5 single</asp:ListItem>
                    <asp:ListItem Value="6">6 single</asp:ListItem>
                    <asp:ListItem Value="7">7 single</asp:ListItem>
                    <asp:ListItem Value="8">8 single</asp:ListItem>
                    <asp:ListItem Value="9">9 single</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="field fifth">
                <asp:DropDownList id="DropDownList3" runat="server">
                    <asp:ListItem Value="0">0 double</asp:ListItem>
                    <asp:ListItem Value="1">1 double</asp:ListItem>
                    <asp:ListItem Value="2">2 double</asp:ListItem>
                    <asp:ListItem Value="3">3 double</asp:ListItem>
                    <asp:ListItem Value="4">4 double</asp:ListItem>
                    <asp:ListItem Value="5">5 double</asp:ListItem>
                    <asp:ListItem Value="6">6 double</asp:ListItem>
                    <asp:ListItem Value="7">7 double</asp:ListItem>
                    <asp:ListItem Value="8">8 double</asp:ListItem>
                    <asp:ListItem Value="9">9 double</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="fifth">
                <asp:Button Text="SEARCH" runat="server" CssClass="button-slice xlarge margin-32"></asp:Button>
            </div>
        </div>
    </div>

    <div class="content container padding-64">
        <asp:ListView ID="ListView1" runat="server"></asp:ListView>
    </div>

    <div class="backimgh2 display-container">
        <div class="display-middle no-opacity">
            <asp:LinkButton ID="tickets" runat="server" CssClass="center button padding-medium xxlarge wide button-slice" Text="BUY TICKETS" PostBackUrl="tickets.aspx"></asp:LinkButton>
        </div>
    </div>
</asp:Content>
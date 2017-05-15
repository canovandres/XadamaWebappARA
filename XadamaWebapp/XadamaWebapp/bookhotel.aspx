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
                <div class="input-tag left" style="border-bottom-right-radius: 0px; border-top-right-radius: 0px;">From</div>
                <asp:TextBox runat="server" ID="From" CssClass="left third" style="border-radius: 0px;" ReadOnly="True"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                    TargetControlID="From" FirstDayOfWeek="Monday" PopupPosition="BottomRight" Format="dd/MM/yyyy" />

                <div class="input-tag left" style="border-radius: 0px">to</div>
                <asp:TextBox runat="server" ID="To" CssClass="left third" ReadOnly="True" style="border-bottom-left-radius: 0px; border-top-left-radius: 0px;"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="To" FirstDayOfWeek="Monday" PopupPosition="BottomRight" Format="dd/MM/yyyy" />
                
                <asp:RequiredFieldValidator ID="ValidatorFrom" runat="server" ControlToValidate="From" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Date Required" ValidationGroup="booking"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="ValidatorFrom" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                
                <asp:RequiredFieldValidator ID="ValidatorTo" runat="server" ControlToValidate="To" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Date Required" ValidationGroup="booking"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="ValidatorTo" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>

                <asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="Select a valid date range" CssClass="error-text" style="display: inline-block" ControlToValidate="From" ControlToCompare="To" Type="Date" Operator="LessThan" ValidationGroup="booking"></asp:CompareValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="CompareValidator" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="" CssClass="error-text" style="display: inline-block" ControlToValidate="To" ControlToCompare="From" Type="Date" Operator="GreaterThan" ValidationGroup="booking"></asp:CompareValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="CompareValidator1" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
            </div>
            <div class="field fifth">
                <asp:DropDownList id="DropDownFood" runat="server" CssClass="field">
                    <asp:ListItem>Breakfast</asp:ListItem>
                    <asp:ListItem>Half Board</asp:ListItem>
                    <asp:ListItem>Full Board</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="field fifth">
                <asp:DropDownList id="DropDownSingle" runat="server">
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
                <asp:DropDownList id="DropDownDouble" runat="server">
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
    <asp:Panel runat="server" ID="errorBooking">
        <div class="display-container">
            <div class="display-middle">
                <asp:Label runat="server" CssClass="center padding-medium xxlarge wide text-red" text="Sorry, we have no availability for your election. Please, change your selection."></asp:Label>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="okBooking">

    </asp:Panel>
</asp:Content>
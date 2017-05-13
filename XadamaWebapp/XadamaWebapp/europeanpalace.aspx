<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="europeanpalace.aspx.cs" Inherits="XadamaWebapp.europeanpalace" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>European Palace</title>
    <link rel="stylesheet" type="text/css" href="Style/hotel.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hotel-tittle">
        <p class="center xxlarge text-white margin-bottom-large bold uppercase padding-large" style="margin-top: 200px;">European Palace</p>
    </div>
    <div class="content container" style="padding-top: 250px">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Image runat="server" ID="Image1" CssClass="slideshow" ImageUrl="~/Media/Hotels/europeanpalace.jpg"/>
        <ajaxToolkit:SlideShowExtender ID="SlideShowExtender1" runat="server" 
            TargetControlID="Image1"
            SlideShowServiceMethod="GetSlides"
            AutoPlay="true"
            Loop="true" />
    </div>
    <div class="content container three-quarter">
        <p class="text-darkblue center large">Set in the european zone, the European Palace is a hotel with free WiFi set across the road 
            from the London Eye. Its elegant rooms feature air conditioning and satellite TV. The hotel's International Cafè restaurant serves 
            typical local products combined with intense fragrances and aromas. Breakfast is an American buffet. The bar is open till late 
            at night and offers tasty snacks and excellent cocktails prepared by the skilled barman.</p>
    </div>
    <div class="content container padding-32">
        <div align="center" class="blue" style="height: 100px">
            <div class="input-line field col third" style="margin-left: 4%">
                <div class="input-group-tag">From</div>
                <asp:TextBox runat="server" ID="From" CssClass="field" style="border-radius: 0px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValidatorFrom" runat="server" ControlToValidate="From" CssClass="error-text" ErrorMessage="Date Required"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="ValidatorFrom" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                    TargetControlID="From" FirstDayOfWeek="Monday" PopupPosition="BottomRight" />
                <div class="input-group-tag">to</div>
                <asp:TextBox runat="server" ID="To" CssClass="field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValidatorTo" runat="server" ControlToValidate="To" CssClass="error-text" ErrorMessage="Date Required"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="ValidatorTo" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="To" FirstDayOfWeek="Monday" PopupPosition="BottomRight" />
                <asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="Select a valid date range" CssClass="error-text" ControlToValidate="To" ControlToCompare="From" Type="Date" Operator="GreaterThan"></asp:CompareValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="CompareValidator" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
            </div>
            <div class="field col seventh">
                <asp:DropDownList id="DropDownModality" runat="server" CssClass="field">
                    <asp:ListItem>Breakfast</asp:ListItem>
                    <asp:ListItem>Half Board</asp:ListItem>
                    <asp:ListItem>Full Board</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="field col seventh">
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
            <div class="field col seventh">
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
            <div class="col fifth">
                <asp:Button Text="BOOK NOW" runat="server" CssClass="button-slice xlarge margin-32" ValidateRequestMode="Disabled" OnClick="book"></asp:Button>
            </div>
        </div>
    </div>
    <p class="center xxlarge text-orange bold uppercase padding-large">Reviews:</p>
    <div align="center" class="content container padding-bottom">
        <div class="three-quarter">
            <div class="field col half">
                <asp:TextBox id="TextBoxName" runat="server" placeholder="Name"></asp:TextBox>
            </div>
            <div class="col quarter" style="margin-top: 30px">
                <ajaxToolkit:Rating ID="ReviewRating" runat="server"
                    CurrentRating="2"
                    MaxRating="5"
                    StarCssClass="rating-star"
                    WaitingStarCssClass="saved-rating-star"
                    FilledStarCssClass="filled-rating-star"
                    EmptyStarCssClass="empty-rating-star"></ajaxToolkit:Rating>
            </div>
            <div class="col quarter" style="margin-top: 30px">
                <asp:Button Text="SEND" runat="server" CssClass="button-slice xlarge wide" OnClick="sendReview"></asp:Button>
            </div>
            <div class="field col padding-16">
                <asp:TextBox id="TextBoxReview" runat="server" CssClass="text-review" TextMode="MultiLine" Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValidatorReview" runat="server" ControlToValidate="TextBoxReview" ErrorMessage="Review Required" CssClass="error-text"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="ValidatorReview" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>

                <asp:GridView ID="GridViewReviews" runat="server" AllowPaging="True" PageSize="6"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

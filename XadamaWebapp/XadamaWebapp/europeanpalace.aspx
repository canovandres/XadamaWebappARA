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
        <div align="center" class="blue" style="height: 60px; line-height: 60px;">
            <div class="col fifth">
                <asp:Label runat="server" Text="From: "></asp:Label>
                <asp:TextBox runat="server" ID="From" CssClass="field"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                    TargetControlID="From" FirstDayOfWeek="Monday" PopupPosition="BottomRight" />
            </div>
            <div class="col fifth">
                <asp:Label runat="server" Text="To: "></asp:Label>
                <asp:TextBox runat="server" ID="To" CssClass="field"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="To" />
            </div>
            <div class="col fifth">
                <asp:DropDownList id="DropDownList2" runat="server" CssClass="field">
                    <asp:ListItem>Breakfast</asp:ListItem>
                    <asp:ListItem>Half Board</asp:ListItem>
                    <asp:ListItem>Full Board</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col fifth">
                <asp:DropDownList id="DropDownList3" runat="server" CssClass="field">
                    <asp:ListItem>1 person</asp:ListItem>
                    <asp:ListItem>2 people</asp:ListItem>
                    <asp:ListItem>3 people</asp:ListItem>
                    <asp:ListItem>4 people</asp:ListItem>
                    <asp:ListItem>5 people</asp:ListItem>
                    <asp:ListItem>6 people</asp:ListItem>
                    <asp:ListItem>7 people</asp:ListItem>
                    <asp:ListItem>8 people</asp:ListItem>
                    <asp:ListItem>9 people</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col fifth">
                <asp:Button Text="BOOK NOW" runat="server" CssClass="button-slice large" ValidateRequestMode="Disabled"></asp:Button>
            </div>
        </div>
    </div>
    <p class="center xxlarge text-orange bold uppercase padding-large">Reviews:</p>
    <div align="center" class="content container padding-bottom">
        <div class="three-quarter">
            <div class="col half">
                <asp:Label runat="server" Text="Name: "></asp:Label>
                <asp:TextBox id="TextBoxName" runat="server"></asp:TextBox>
            </div>
            <div class="col quarter">
                <ajaxToolkit:Rating ID="ReviewRating" runat="server"
                    CurrentRating="2"
                    MaxRating="5"
                    StarCssClass="rating-star"
                    WaitingStarCssClass="saved-rating-star"
                    FilledStarCssClass="filled-rating-star"
                    EmptyStarCssClass="empty-rating-star"></ajaxToolkit:Rating>
            </div>
            <div class="col quarter">
                <asp:Button Text="SEND" runat="server" CssClass="button-slice large wide" OnClick="sendReview"></asp:Button>
            </div>
            <div class="col padding-16">
                <asp:TextBox id="TextBoxReview" runat="server" CssClass="text-review" TextMode="MultiLine" Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValidatorReview" runat="server" ControlToValidate="TextBoxReview" ErrorMessage="Review Required" CssClass="error-text"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="ValidatorReview" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>

                <asp:GridView ID="GridViewReviews" runat="server" AllowPaging="True" PageSize="6"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

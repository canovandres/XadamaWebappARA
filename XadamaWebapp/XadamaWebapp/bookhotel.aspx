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
                    <asp:ListItem Text="European Palace" Value="H1"></asp:ListItem>
                    <asp:ListItem Text="Asian Gardens" Value="H2"></asp:ListItem>
                    <asp:ListItem Text="African Savannah" Value="H3"></asp:ListItem>
                    <asp:ListItem Text="American Luxury" Value="H4"></asp:ListItem>
                    <asp:ListItem Text="Oceanic Paradise" Value="H5"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="input-line field third">
                <div class="input-tag left" style="border-bottom-right-radius: 0px; border-top-right-radius: 0px;">From</div>
                <asp:TextBox runat="server" ID="From" CssClass="left third" style="border-radius: 0px;"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                    TargetControlID="From" FirstDayOfWeek="Monday" PopupPosition="BottomRight" Format="dd/MM/yyyy" />

                <div class="input-tag left" style="border-radius: 0px">to</div>
                <asp:TextBox runat="server" ID="To" CssClass="left third" style="border-bottom-left-radius: 0px; border-top-left-radius: 0px;"></asp:TextBox>
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
                <asp:Button Text="SEARCH" runat="server" CssClass="button-slice xlarge margin-32" OnClick="searchBooking" ValidationGroup="booking"></asp:Button>
            </div>
        </div>
    </div>

    <asp:Panel runat="server" ID="errorBooking" CssClass="display-container" Height="300px" Visible="False">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center padding-medium xxlarge wide text-red" text="Sorry, we have no availability for your selection. Please, change it."></asp:Label>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="okBooking" CssClass="content container padding-32" Visible="False" style="width: 70%">
        <asp:UpdatePanel id="updatePanelBook" runat="server">
        <ContentTemplate>
            <div class="row-padding">
                <div class="col half">
                    <asp:Label runat="server" ID="hotelName" CssClass="text-darkblue xxlarge padding-large"></asp:Label>
                </div>
            </div>
            <div class="row-padding">
                <div class="col half" style="margin-left: -20px">
                    <asp:Image runat="server" ID="hotelImg" style="width: 100%; min-width: 350px; min-height: 200px;" CssClass="padding-large"></asp:Image>
                </div>
                <div class="col half margin-16" style="min-width: 320px; margin-left: 20px">
                    <div class="row-padding margin-16">
                        <div class="col third">
                            <asp:Label runat="server" Text="From :" CssClass="xlarge margin-large"></asp:Label>
                        </div>
                        <div class="col quarter" style="margin-top: 6px;">
                            <asp:Label runat="server" ID="DateFrom" CssClass="large margin-large vertical-bottom"></asp:Label>
                        </div>
                    </div>
                    <div class="row-padding margin-16">
                        <div class="col third">
                            <asp:Label runat="server" Text="To :" CssClass="xlarge margin-large"></asp:Label>
                        </div>
                        <div class="col quarter" style="margin-top: 6px;">
                            <asp:Label runat="server" ID="DateTo" CssClass="large margin-large vertical-bottom"></asp:Label>
                        </div>
                    </div>
                    <div class="row-padding margin-16">
                        <div class="col third">
                            <asp:Label runat="server" Text="Single: " CssClass="xlarge margin-large"></asp:Label>
                        </div>
                        <div class="col half" style="margin-top: 6px;">
                            <asp:Label runat="server" ID="SingleRooms" CssClass="large margin-large vertical-bottom"></asp:Label>
                        </div>
                    </div>
                    <div class="row-padding margin-16">
                        <div class="col third">
                            <asp:Label runat="server" Text="Double: " CssClass="xlarge margin-large"></asp:Label>
                        </div>
                        <div class="col half" style="margin-top: 6px;">
                            <asp:Label runat="server" ID="DoubleRooms" CssClass="large margin-large vertical-bottom"></asp:Label>
                        </div>
                    </div>
                    <div class="row-padding margin-16">
                        <div class="col third">
                            <asp:Label runat="server" Text="Modality: " CssClass="xlarge margin-large"></asp:Label>
                        </div>
                        <div class="col third" style="margin-top: 6px;">
                            <asp:Label runat="server" ID="Modality" CssClass="large margin-large vertical-bottom"></asp:Label>
                        </div>
                    </div>
                    <div class="row-padding margin-16">
                        <div class="col third">
                            <asp:Label runat="server" Text="PRICE: " CssClass="xxlarge margin-large"></asp:Label>
                        </div>
                        <div class="col quarter" style="margin-top: 12px;">
                            <asp:Label runat="server" ID="Price" CssClass="xlarge margin-large"></asp:Label>
                        </div>
                    </div>
                    <div class="row-padding margin-16">
                        <div class="col third">
                            <asp:Label runat="server" Text="Discount code: " CssClass="large margin-large"></asp:Label>
                        </div>
                        <div class="col quarter field" style="margin: 0px;">
                            <asp:TextBox runat="server" ID="PromoCode"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PromoCode" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="" ValidationGroup="promo"></asp:RequiredFieldValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator1" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                        </div>
                        <div class="col quarter field" style="margin: 0px;">
                            <asp:Button runat="server" Text="Apply" CssClass="large button-slice" Style="width: auto;" OnClick="checkPromo" ValidationGroup="promo"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Button id="bookButton" Text="BOOK" runat="server" CssClass="button-slice xxlarge margin-16 right"></asp:Button>

            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="bookButton" CancelControlID="btnCancel" PopupControlID="Panel1" 
                PopupDragHandleControlID="PopupHeader" Drag="true"></ajaxToolkit:ModalPopupExtender>
            <asp:panel id="Panel1" style="display: none" runat="server" CssClass="popUpConfirm" BackColor="White" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
	            <div class="text-darkblue large">
                    <div id="PopupHeader">Header</div>
                        <div>
                            <asp:Label runat="server" text="Confirm the booking?"></asp:Label>
                        </div>
                        <div>
                            <asp:Button runat="server" id="btnOkay" Text="OK" CssClass="field button-slice" OnClick="bookRooms"/>
                            <asp:Button runat="server" id="btnCancel" Text="CANCEL" CssClass="field button-slice"/>
		                </div>
                    </div>
            </asp:panel>
        </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
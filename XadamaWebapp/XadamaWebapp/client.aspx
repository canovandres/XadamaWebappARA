<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="XadamaWebapp.client" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama About</title>
    <link rel="stylesheet" type="text/css" href="Style/client.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container-client padding-128-client">  <!--1-->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="col fifteen blue">      <!--3-->
            <asp:menu runat="server" Orientation="Vertical" CssClass="left menu full">
                <StaticMenuItemStyle CssClass="client-bar-item button text-white center border-menu"/>
                <StaticMenuStyle CssClass="full"/>
                <items>
                    <asp:menuitem text="Account"></asp:menuitem>
                    <asp:menuitem text="Password"></asp:menuitem>
                    <asp:menuitem text="Orders"></asp:menuitem>
                </items>
            </asp:menu>
        </div>

        <div class="col three-quarter">  <!--3-->
            <div class="register form-content padding-client margin-medium grey shadow">    <!--4-->
                <asp:Label runat="server" Text="Account" CssClass="padding-16-client form-label xxlarge blue-text "></asp:Label>
                <div class="field">
                        <asp:Label runat="server" Text="EMAIL" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxEmail" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
                <div>
                    <div class="field half">
                        <asp:Label runat="server" Text="NAME" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NameValidator" ErrorMessage="Name Required" Display="Dynamic"
                                                    ForeColor="Red" ControlToValidate="TextBoxName" runat="server" ValidationGroup="SaveChanges" />
                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="NameValidator"
                                                                HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>
                    
                    <div class="field half">
                        <asp:Label runat="server" Text="FIRST SURNAME" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBox1Surname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="FirstSurnameValidator" ErrorMessage="1st Surname Required" Display="Dynamic" ForeColor="Red"
                                                    ControlToValidate="TextBox1Surname" runat="server" ValidationGroup="SaveChanges" />
                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="FirstSurnameValidator"
                                                                HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>
                </div>
                    
                <div>
                    <div class="field half">
                        <asp:Label runat="server" Text="SECOND SURNAME" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBox2Surname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="SecondSurnameValidator" ErrorMessage="2nd Surname Required" Display="Dynamic"
                                                    ForeColor="Red" ControlToValidate="TextBox2Surname" runat="server" ValidationGroup="SaveChanges" />
                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="SecondSurnameValidator"
                                                                HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>
                </div>

                <div class="field third">
                    <asp:Label runat="server" Text="BIRTHDATE" CssClass="form-label medium"></asp:Label>
                    <asp:TextBox runat="server" ID="Birthdate" CssClass="field"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" runat="server" TargetControlID="Birthdate"
                                                    FirstDayOfWeek="Monday" PopupPosition="BottomRight"/>
                </div>

                <div class="field half">
                    <asp:Label runat="server" Text="PHONE" CssClass="form-label medium"></asp:Label>
                    <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="PhoneValidator" runat="server" ForeColor="Red" Display="Dynamic"
                                                    ControlToValidate="TextBoxPhone" ErrorMessage="Introduce your 9 digit number without spaces" 
                                                    ValidationExpression="[0-9]{9}" ValidationGroup="SaveChanges"></asp:RegularExpressionValidator>
                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="PhoneValidator"
                                                                HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                </div>

                <div class="field">
                    <asp:Label runat="server" Text="ADDRESS" CssClass="form-label medium"></asp:Label>
                    <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
                </div>

                <div class="field">
                    <asp:Label runat="server" Text="CREDIT CARD" CssClass="form-label medium"></asp:Label>
                    <asp:TextBox ID="TextBoxCreditCard" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="CreditCardValidatorRequired" ErrorMessage="Credit Card Required" Display="Dynamic"
                                                        ForeColor="Red" ControlToValidate="TextBoxCreditCard" runat="server" ValidationGroup="CreateAccount" />
                        <asp:RegularExpressionValidator ID="CreditCardValidator" runat="server" ForeColor="Red" Display="Dynamic"
                                                        ControlToValidate="TextBoxCreditCard" ErrorMessage="Introduce your 16 digit card without spaces" 
                                                        ValidationExpression="[0-9]{16}" ValidationGroup="CreateAccount"></asp:RegularExpressionValidator>
                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" TargetControlID="CreditCardValidatorRequired"
                                                                  HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="CreditCardValidator"
                                                                  HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                </div>
                <div class="field">
                    <div class="save-button">
                        <asp:Button runat="server" id="SaveButton" OnClick="OnSaveChangesClick"
                                    CssClass="right button padding-medium large button-slice wide"
                                    text="Save Changes" ValidationGroup="SaveChanges"></asp:Button>
                        <asp:Label runat="server" ID="SuccessfulyLabel" Text="" CssClass="large orange right margin-medium padding-medium shadow"
                                    Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
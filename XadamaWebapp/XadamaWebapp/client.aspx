<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="XadamaWebapp.client" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Client</title>
    <link rel="stylesheet" type="text/css" href="Style/client.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-client padding-128-client">  <!--1-->
        <div class="col fifteen blue">      <!--3-->
            <asp:menu runat="server" Orientation="Vertical" CssClass="left menu full" OnMenuItemClick="MenuItemClick">
                <StaticMenuItemStyle CssClass="client-bar-item button text-white center border-menu"/>
                <StaticMenuStyle CssClass="full"/>
                <items>
                    <asp:menuitem text="Account" Value="0" Selected="True"></asp:menuitem>
                    <asp:menuitem text="Password" Value="1"></asp:menuitem>
                </items>
            </asp:menu>
        </div>


        <div class="col three-quarter">  <!--3-->
            <div class="register form-content padding-client margin-medium grey shadow">    <!--4-->
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

                    <asp:View ID="View1" runat="server">
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
                                                        ForeColor="Red" ControlToValidate="TextBoxCreditCard" runat="server" ValidationGroup="SaveChanges" />
                            <asp:RegularExpressionValidator ID="CreditCardValidator" runat="server" ForeColor="Red" Display="Dynamic"
                                                            ControlToValidate="TextBoxCreditCard" ErrorMessage="Introduce your 16 digit card without spaces" 
                                                            ValidationExpression="[0-9]{16}" ValidationGroup="SaveChanges"></asp:RegularExpressionValidator>
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
                    </asp:View>


                    <asp:View ID="View2" runat="server">
                        <asp:Label runat="server" Text="Password" CssClass="padding-16-client form-label xxlarge blue-text "></asp:Label>
                        <div>
                            <div class="field half">
                                    <asp:Label runat="server" Text="PASSWORD" CssClass="form-label medium"></asp:Label>
                                    <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordValidator" ErrorMessage="Password Required" Display="Dynamic" ForeColor="Red"
                                                                ControlToValidate="TextBoxPassword" runat="server" ValidationGroup="ChangePassword" />
                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="PasswordValidator"
                                                                          HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                            </div>
                            <div class="field half">
                                    <asp:Label runat="server" Text="REPEAT PASSWORD" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBoxRepeatPassword" TextMode="Password" runat="server"></asp:TextBox>
                            <asp:CompareValidator ID="RepeatPasswordValidator1" ErrorMessage="Passwords do not match." Display="Dynamic"
                                                  ForeColor="Red" ControlToCompare="TextBoxPassword"
                                                  ControlToValidate="TextBoxRepeatPassword" runat="server" ValidationGroup="ChangePassword" />
                            <asp:RequiredFieldValidator ID="RepeatPasswordValidator2" ErrorMessage="Confirmation Password Required" Display="Dynamic"
                                                        ForeColor="Red" ControlToValidate="TextBoxRepeatPassword" runat="server" ValidationGroup="ChangePassword" />
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RepeatPasswordValidator1"
                                                                  HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="RepeatPasswordValidator2"
                                                                  HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                            </div>
                            <div class="field half">
                                <asp:Label runat="server" Text="NEW PASSWORD" CssClass="form-label medium"></asp:Label>
                                <asp:TextBox ID="TextBoxNewPassword" TextMode="Password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NewPasswordValidator" ErrorMessage="New Password Required" Display="Dynamic" ForeColor="Red"
                                                            ControlToValidate="TextBoxNewPassword" runat="server" ValidationGroup="ChangePassword" />
                                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="NewPasswordValidator"
                                                                        HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                            
                                <div>
                                    <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" TargetControlID="TextBoxNewPassword"
                                                                DisplayPosition="RightSide"
                                                                StrengthIndicatorType="BarIndicator"
                                                                PreferredPasswordLength="8"
                                                                PrefixText="Password Strength: "          
                                                                MinimumNumericCharacters="1"
                                                                MinimumSymbolCharacters="1"
                                                                MinimumLowerCaseCharacters="1"
                                                                MinimumUpperCaseCharacters="1"
                                                                RequiresUpperAndLowerCaseCharacters="true"
                                                                TextStrengthDescriptions="Very Poor;Weak;Average;Strong;Excellent"
                                                                StrengthStyles="VeryWeekStrength;WeakStrength;AverageStrength;GoodStrength;ExcellentStrength"
                                                                BarBorderCssClass="BarBorderStyle"
                                                                CalculationWeightings="50;15;15;20" />
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <div class="save-button">
                                <asp:Button runat="server" id="Button1" OnClick="OnChangePasswordClick"
                                            CssClass="right button padding-medium large button-slice wide"
                                            text="Change" ValidationGroup="ChangePassword"></asp:Button>
                                <asp:Label runat="server" ID="ChangedLabel" Text="" CssClass="large orange right margin-medium padding-medium shadow"
                                            Visible="False"></asp:Label>
                            </div>
                        </div>
                    </asp:View>

                </asp:MultiView>
            </div>
        </div>
    </div>
</asp:Content>
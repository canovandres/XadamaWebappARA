<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="XadamaWebapp.register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama About</title>
    <link rel="stylesheet" type="text/css" href="Style/register.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!--Register/Login-->
    <div class="content container padding-64">  <!--1-->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="padding-64">    <!--2-->
            <asp:Panel runat="server" DefaultButton="Create">
            <div class="col half">      <!--3-->
                <asp:Label runat="server" Text="Create a New Account " CssClass="form-label margin-large xxlarge"></asp:Label>
                <div class="register form-content padding-large margin-medium grey shadow">    <!--4-->
                    
                    <div class="field">
                            <asp:Label runat="server" Text="EMAIL *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailValidatorRequired" ErrorMessage="Email Required" Display="Dynamic" ForeColor="Red"
                                                        ControlToValidate="TextBoxEmail" runat="server" ValidationGroup="CreateAccount" />
                            <asp:RegularExpressionValidator runat="server" ID="EmailValidator" Display="Dynamic"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            ControlToValidate="TextBoxEmail" ForeColor="Red" ErrorMessage="Invalid email address."
                                                            ValidationGroup="CreateAccount" />
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="EmailValidator"
                                                                    HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender12" runat="server" TargetControlID="EmailValidatorRequired"
                                                                    HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>

                    <div>
                        <div class="field half">
                            <asp:Label runat="server" Text="PASSWORD *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordValidator" ErrorMessage="Password Required" Display="Dynamic" ForeColor="Red"
                                                        ControlToValidate="TextBoxPassword" runat="server" ValidationGroup="CreateAccount" />
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="PasswordValidator"
                                                                  HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                            
                            <div>
                                <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" TargetControlID="TextBoxPassword"
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
                    <div class="field half">
                        <asp:Label runat="server" Text="CONFIRM PASSWORD *" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxRepeatPassword" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="RepeatPasswordValidator1" ErrorMessage="Passwords do not match." Display="Dynamic"
                                              ForeColor="Red" ControlToCompare="TextBoxPassword"
                                              ControlToValidate="TextBoxRepeatPassword" runat="server" ValidationGroup="CreateAccount" />
                        <asp:RequiredFieldValidator ID="RepeatPasswordValidator2" ErrorMessage="Confirmation Password Required" Display="Dynamic"
                                                    ForeColor="Red" ControlToValidate="TextBoxRepeatPassword" runat="server" ValidationGroup="CreateAccount" />
                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RepeatPasswordValidator1"
                                                              HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="RepeatPasswordValidator2"
                                                              HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>

                    <div>
                        <div class="field half">
                            <asp:Label runat="server" Text="NAME *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="NameValidator" ErrorMessage="Name Required" Display="Dynamic"
                                                        ForeColor="Red" ControlToValidate="TextBoxName" runat="server" ValidationGroup="CreateAccount" />
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="NameValidator"
                                                                  HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                        </div>

                    
                        <div class="field half">
                            <asp:Label runat="server" Text="FIRST SURNAME *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBox1Surname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="FirstSurnameValidator" ErrorMessage="1st Surname Required" Display="Dynamic" ForeColor="Red"
                                                        ControlToValidate="TextBox1Surname" runat="server" ValidationGroup="CreateAccount" />
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="FirstSurnameValidator"
                                                                  HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                        </div>
                    </div>
                    
                    <div>
                        <div class="field half">
                            <asp:Label runat="server" Text="SECOND SURNAME *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBox2Surname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="SecondSurnameValidator" ErrorMessage="2nd Surname Required" Display="Dynamic"
                                                        ForeColor="Red" ControlToValidate="TextBox2Surname" runat="server" ValidationGroup="CreateAccount" />
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
                                                        ValidationExpression="[0-9]{9}" ValidationGroup="CreateAccount"></asp:RegularExpressionValidator>
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
                        <div class="create-button">
                            <asp:Button runat="server" id="Create" OnClick="OnCreateClick"
                                        CssClass="right button padding-medium large button-slice wide" text="Create Account"
                                        ValidationGroup="CreateAccount"></asp:Button>
                        </div>
                    </div>
                    
                </div>
            </div>
            </asp:Panel>
        
            <asp:Panel runat="server" DefaultButton="SignIn">
            <div class="col half">  <!--3-->
                <asp:Label runat="server" Text="Sign In " CssClass="form-label margin-large xxlarge"></asp:Label>
                <div class="register form-content padding-large margin-medium grey shadow">    <!--4-->
                    <div class="field">
                        <asp:Label runat="server" Text="EMAIL" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxEmailSignIn" runat="server"></asp:TextBox>
                    </div>

                    <div class="field">
                        <asp:Label runat="server" Text="PASSWORD" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxPasswordSignIn" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Password Required" Display="Dynamic" ForeColor="Red"
                                                        ControlToValidate="TextBoxPasswordSignIn" runat="server" ValidationGroup="LogIn" />
                        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" TargetControlID="RequiredFieldValidator1"
                                                                  HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                    </div>

                    <div class="field">
                        <div class="signin-button">
                            <asp:Button runat="server" id="SignIn" OnClick="OnSingInClick"
                                        CssClass="right button padding-medium large button-slice wide" text="Sign In" ValidationGroup="LogIn"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
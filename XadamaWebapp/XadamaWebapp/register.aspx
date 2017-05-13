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
            <div class="col half">      <!--3-->
                <asp:Label runat="server" Text="Create a New Account " CssClass="form-label margin-large xxlarge"></asp:Label>
                <div class="register form-content padding-large margin-medium grey shadow">    <!--4-->
                    <div class="field">
                            <asp:Label runat="server" Text="EMAIL *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Email Required" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBoxEmail" runat="server" />
                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            ControlToValidate="TextBoxEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                    </div>

                    <div>
                        <div class="field half">
                            <asp:Label runat="server" Text="PASSWORD *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Password Required" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBoxPassword" runat="server" />
                            
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
                        <asp:CompareValidator ErrorMessage="Passwords do not match." Display="Dynamic" ForeColor="Red" ControlToCompare="TextBoxPassword"
                                              ControlToValidate="TextBoxRepeatPassword" runat="server" />
                    </div>

                    <div>
                        <div class="field half">
                            <asp:Label runat="server" Text="NAME *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Name Required" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBoxName" runat="server" />
                        </div>

                    
                        <div class="field half">
                            <asp:Label runat="server" Text="FIRST SURNAME *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBox1Surname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="1st Surname Required" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBox1Surname" runat="server" />
                        </div>
                    </div>
                    
                    <div>
                        <div class="field half">
                            <asp:Label runat="server" Text="SECOND SURNAME *" CssClass="form-label medium"></asp:Label>
                            <asp:TextBox ID="TextBox2Surname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="2nd Surname Required" Display="Dynamic" ForeColor="Red" ControlToValidate="TextBox2Surname" runat="server" />
                        </div>
                    </div>

                    <div class="field fifth">
                        <asp:Label runat="server" Text="BIRTHDATE" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox runat="server" ID="Birthdate" CssClass="field"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Birthdate" />
                    </div>

                    <div class="field half">
                        <asp:Label runat="server" Text="PHONE" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
                    </div>

                    <div class="field">
                        <asp:Label runat="server" Text="ADDRESS" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>
                    </div>

                    <div class="field">
                        <asp:Label runat="server" Text="CREDIT CARD" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBoxCreditCard" runat="server"></asp:TextBox>
                    </div>

                    <div class="field">
                        <div class="create-button">
                            <asp:Button runat="server" id="Create" OnClick="OnCreateClick" CssClass="right button padding-medium large button-slice wide" text="Create Account"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        
            <div class="col half">  <!--3-->
                <asp:Label runat="server" Text="Sign In " CssClass="form-label margin-large xxlarge"></asp:Label>
                <div class="register form-content padding-large margin-medium grey shadow">    <!--4-->
                    <div class="field half">
                        <asp:Label runat="server" Text="EMAIL" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </div>

                    <div class="field half">
                        <asp:Label runat="server" Text="PASSWORD" CssClass="form-label medium"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </div>

                    <div class="field">
                        <div class="signin-button">
                            <asp:Button runat="server" id="SignIn" OnClientClick="OnSingInClick" CssClass="right button padding-medium large button-slice wide" text="Sign In"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
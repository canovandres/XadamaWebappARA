<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="worker.aspx.cs" Inherits="XadamaWebapp.worker" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Register</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="Style/register.css" />
    <link rel="stylesheet" type="text/css" href="Style/worker.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-client padding-128-client">
        <div class="col fifteen blue">
            <asp:menu runat="server" Orientation="Vertical" CssClass="left menu full" OnMenuItemClick="MenuItemClick">
                <StaticMenuItemStyle CssClass="client-bar-item button text-white center border-menu"/>
                <StaticMenuStyle CssClass="full"/>
                <items>
                    <asp:menuitem text="Account" Value="0" Selected="True"></asp:menuitem>
                    <asp:menuitem text="Password" Value="1"></asp:menuitem>
                    <asp:menuitem text="Schedule" Value="2"></asp:menuitem>
                </items>
            </asp:menu>
        </div>


        <div class="col three-quarter">
            <div class="register form-content padding-client margin-medium grey shadow">
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
                        
                    </asp:View>


                    <asp:View ID="View3" runat="server">

                    </asp:View>

                </asp:MultiView>
            </div>
        </div>
    </div>

</asp:Content>
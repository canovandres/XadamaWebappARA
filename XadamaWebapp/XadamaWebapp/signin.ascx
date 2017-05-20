<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="signin.ascx.cs" Inherits="XadamaWebapp.signin" %>

<ajaxToolkit:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1" runat="server" TargetControlID="signInUC" VerticalSide="Middle" HorizontalSide="Center" />
<asp:Panel runat="server" ID="signInUC" style="opacity: 1; z-index: 1010;">
<div class="register padding-large margin-medium shadow" style="background-color: rgba(232, 229, 229, 1);">
    <div class="field" style="margin-right: -20px; margin-top: -5px;">
        <asp:Label runat="server" Text="EMAIL" CssClass="form-label medium"></asp:Label>
        <asp:TextBox ID="TextBoxEmailSignIn" runat="server"></asp:TextBox>
    </div>

    <div class="field" style="margin-right: -20px;">
        <asp:Label runat="server" Text="PASSWORD" CssClass="form-label medium"></asp:Label>
        <asp:TextBox ID="TextBoxPasswordSignIn" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="Password Required" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="TextBoxPasswordSignIn" runat="server" ValidationGroup="LogIn" />
        <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" TargetControlID="RequiredFieldValidator1"
                                                    HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
    </div>

    <div class="field" style="margin-right: -20px;">
        <div class="signin-button">
            <asp:Button runat="server" id="SignIn" OnClick="OnSingInClick"
                        CssClass="right button padding-medium large button-slice wide" text="Sign In" ValidationGroup="LogIn"></asp:Button>
        </div>
    </div>
</div>
</asp:Panel>
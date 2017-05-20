
<%@ Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="shoppingcart.aspx.cs" Inherits="XadamaWebapp.shoppingcart" %>
<%@ Register Src="~/signin.ascx" TagPrefix="uc1" TagName="signin" %>

    <asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
        <title>Xadama Shopping Cart</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css" />
        <link rel="stylesheet" type="text/css" href="Style/shoppingcart.css" />
        <link rel="stylesheet" type="text/css" href="Style/shop.css" />
    </asp:Content>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
        <div class="backimgcarts display-container">
            <div class="display-middle-sub">
                <asp:Label runat="server" CssClass="center padding-medium xxlarge wide darkblue" text="SHOPPING CART"></asp:Label>
            </div>
        </div>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="hgfj">
        <ContentTemplate>
        <div class="text-darkblue large bold">
            <div class="zone3">
                 <asp:Label ID="Label5" runat="server" Text="Product"></asp:Label>
            </div>
            <div class="zone4">
                 <asp:Label ID="Label6" runat="server" Text="Price"></asp:Label>
            </div>
            <div class="zone5">
                 <asp:Label ID="Label7" runat="server" Text="Quantity"></asp:Label>
            </div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
        <div>        
        <asp:ListView ID="ListView1" runat="server" OnItemCommand="DeleteProduct">
            <LayoutTemplate>
                  <div align="left" class="margin-64 border-list" runat="server">
                      <div runat="server" id="groupPlaceholder">
                      </div>
                  </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="content-1 container text-darkblue large">
                    <div class="zone">
                        <asp:Image ID="Image1" runat="server" CssClass="imgam" ImageUrl='<%#Eval("image") %>' />
                    </div>
                    <div class="zone1 left-margin-aux">
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                    </div>
                    <div class="zone2 left-margin-aux2">
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                        €
                    </div>
                     <div class="zone15 ">
                        <asp:LinkButton ID="LinkButton1" CommandName="minus" Text="-"  CssClass="button button-slice medium bold" runat="server" />

                    </div>
                    <div class="zone14">
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                        
                    </div>
                     <div class="zone12 ">
                       <asp:LinkButton ID="LinkButton2" CommandName="add"  Text="+"  CssClass="button button-slice medium bold" runat="server" />
                    </div>
                    
                    <div class="zone10">
                        <asp:LinkButton ID="Cerrar" CommandName="delete" Text="Delete" CssClass="button button-slice medium" runat="server" />                        
                    </div>
                    
                </div>
            </ItemTemplate>
             <GroupTemplate>
                    <div runat="server" id="productRow" class="margin-8" >
                        <div runat="server" id="itemPlaceholder">
                        </div>
                    </div>
            </GroupTemplate>
        </asp:ListView>


    </div>
    

    <div class="xxlarge">
            <div class="text-orange xlarge zone11">
                 <asp:Label ID="Label34" Visible="false" runat="server" Text="The shopping cart is empty"></asp:Label>
            </div>
            
            <div class="zone9 text-darkblue">
                 <asp:Label ID="Label12" runat="server" Text="Promo:"></asp:Label>
            </div>
            <div class="field field-sc">
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Insert a code here"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="" ValidationGroup="promo"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator1" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
            </div>
             <div class="zone13 text-darkblue">
                 <asp:Button ID="applypromo" runat="server" Text="Apply" CssClass="large button-slice button" Style="width: auto;" OnClick="checkPromo" ValidationGroup="promo"></asp:Button>
            </div>
                      
        </div>

    <div class="xxlarge bold padding-bottom-64">
            <div class="zone6 text-darkblue">
                 <asp:Label ID="Label8" runat="server" Text="Subtotal:"></asp:Label>
            </div>
            <div class="zone7 text-orange">
                 <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="€"></asp:Label>
            </div>
            
            
        </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    
        <ajaxToolkit:ConfirmButtonExtender ID="confirmButton" runat="server" TargetControlID="shopButton" ConfirmText="Dou you want to shop?" DisplayModalPopupID="ModalPopupExtender1" />
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="shopButton" CancelControlID="btnCancel" PopupControlID="Panel1" 
            PopupDragHandleControlID="PopupHeader1" Drag="true"></ajaxToolkit:ModalPopupExtender>
            <div class="zone8">
                 <asp:Button ID="shopButton" runat="server" text="BUY NOW" CssClass="button padding-medium xxlarge wide button-slice"/>
            </div>
            

    <asp:panel id="Panel1" style="display: none" runat="server" CssClass="popUpConfirm" BackColor="White" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
	        <div class="text-darkblue large">
                <div id="PopupHeader1">Confirm the shopping?</div>
                <div>
                    <asp:Label id="pupupLabel" runat="server" text="An email will be sent to your account"></asp:Label>
                </div>
                <div>
                    <asp:Button runat="server" id="btnOkay" Text="OK" CssClass="field-1 button-slice" OnClick="buyItems"/>
                    <asp:Button runat="server" id="btnCancel" Text="CANCEL" CssClass="field-1 button-slice"/>
		        </div>
                </div>
    </asp:panel>


    <asp:panel id="Panel2" visible="false" runat="server" CssClass="backPopup" BackColor="White" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black">
	        <div class="text-darkblue large">
                <div id="PopupHeader2"></div>
                <div>
                    <asp:Label id="Label97" runat="server" text=""></asp:Label>
                </div>
                <div>
                    <asp:Button runat="server" id="Button1" Text="OK" CssClass="field-1 button-slice left-margin-aux4" OnClick="hidestock" />
                    
		        </div>
                </div>
    </asp:panel>
    <asp:Panel runat="server" ID="shopPanel" CssClass="display-container" Height="300px" Visible="False">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center padding-medium xxlarge wide text-darkblue" text="Thanks for shopping, check your email to see more details."></asp:Label>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="registerPanel" Visible="False" HorizontalAlign="Center">
            <uc1:signin runat="server" ID="signin" align="center" />
    </asp:Panel>
    

    </asp:Content>

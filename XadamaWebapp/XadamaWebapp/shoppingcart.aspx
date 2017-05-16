<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="shoppingcart.aspx.cs" Inherits="XadamaWebapp.shoppingcart" %>


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
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="hgfj">
        <ContentTemplate>
        <div>        
        <asp:ListView ID="ListView1" runat="server" >
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
                    
                    <div class="zone2 left-margin-aux2">
                        <asp:DropDownList ID="quantity" runat="server">
                         
                         <asp:ListItem>1</asp:ListItem>
                         <asp:ListItem>2</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                         <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>5</asp:ListItem>                         
                     </asp:DropDownList>
                    </div>
                    <div class="zone10">
                        <asp:ImageButton id="quit" runat="server"  CssClass="imgbeg-btncerrar" ImageUrl="~/Media/Others/botoncerrar.jpg" />                        
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
    </ContentTemplate>
    </asp:UpdatePanel>

    <div class="xxlarge">
            <div class="zone9 text-darkblue">
                 <asp:Label ID="Label12" runat="server" Text="Promo:"></asp:Label>
            </div>
            <div class="field field-sc">
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Insert a code here"></asp:TextBox>
            </div>
                       
        </div>

    <div class="xxlarge bold padding-bottom-64">
            <div class="zone6 text-darkblue">
                 <asp:Label ID="Label8" runat="server" Text="Subtotal:"></asp:Label>
            </div>
            <div class="zone7 text-orange">
                 <asp:Label ID="Label9" runat="server" Text="60"></asp:Label>
                €
            </div>
            <div class="zone8">
                 <asp:Button runat="server" text="BUY NOW" CssClass="button padding-medium xxlarge wide button-slice" />
            </div>
            
        </div>

    </asp:Content>

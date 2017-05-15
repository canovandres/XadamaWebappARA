<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="shoppingcart.aspx.cs" Inherits="XadamaWebapp.shoppingcart" %>


    <asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
        <title>Xadama Shopping Cart</title>
        <link rel="stylesheet" type="text/css" href="Style/style.css" />
        <link rel="stylesheet" type="text/css" href="Style/shoppingcart.css" />
        <link rel="stylesheet" type="text/css" href="Style/shop.css" />
    </asp:Content>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        
        <div class="aux display-container">
            <div class="display-middle-sub">
                <asp:Label runat="server" CssClass="center padding-medium xxlarge wide darkblue" text="SHOPPING CART"></asp:Label>
            </div>
        </div>

        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="hgfj">
        <ContentTemplate>
        <div>        
        <asp:ListView ID="ListView1" runat="server" >
            <LayoutTemplate>
                  <div align="left" class="margin-32" runat="server">
                      <div runat="server" id="groupPlaceholder">
                      </div>
                  </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="large text-orange item-container uppercase bold padding-16">
                    <div>
                        <asp:Image ID="Image1" runat="server" CssClass="imgaux" ImageUrl='<%#Eval("image") %>' />
                    </div>

                    <div>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                    </div>
                    
                    <div>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                        €
                    </div>
                   
                </div>
            </ItemTemplate>
             <GroupTemplate>
                    <div runat="server" id="productRow" class="margin-bottom-large" style="height:500px">
                        <div runat="server" id="itemPlaceholder">
                        </div>
                    </div>
            </GroupTemplate>
        </asp:ListView>


    </div>
    </ContentTemplate>
    </asp:UpdatePanel>

    </asp:Content>

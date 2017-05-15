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
        <asp:ListView ID="ListView1" runat="server" GroupItemCount="3" >
            <LayoutTemplate>
                  <div align="center" class="margin-32 padding-64" runat="server">
                      <div runat="server" id="groupPlaceholder">
                      </div>
                  </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="quarter display-border-grey large text-orange item-container uppercase bold padding-16">
                    <div>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                    </div>
                    <div style="height:70%">
                        <asp:Image ID="Image1" runat="server" CssClass="image-template" ImageUrl='<%#Eval("image") %>' />
                    </div>
                    <div>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                        €
                    </div>
                    <div>
                        <asp:LinkButton ID="LinkButton1" CommandName="Select" Text="Add to cart" CssClass="button button-slice" runat="server"></asp:LinkButton>
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

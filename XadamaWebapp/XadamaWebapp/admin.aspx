<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="XadamaWebapp.admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Admin</title>
    <link rel="stylesheet" type="text/css" href="Style/admin.css" />
    <link rel="stylesheet" type="text/css" href="Style/client.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-client padding-128-client">
        <div class="col fifteen blue">
            <asp:menu runat="server" Orientation="Vertical" CssClass="left menu full" OnMenuItemClick="MenuItemClick" ID="MenuAdmin">
                <StaticMenuItemStyle CssClass="client-bar-item button text-white center border-menu"/>
                <StaticMenuStyle CssClass="full"/>
                <items>
                    <asp:menuitem text="Poducts" Value="0" Selected="True"></asp:menuitem>
                    <asp:menuitem text="Hotels" Value="1"></asp:menuitem>
                    <asp:menuitem text="Rides" Value="2"></asp:menuitem>
                    <asp:menuitem text="Restaurants" Value="3"></asp:menuitem>
                    <asp:menuitem text="Shows" Value="4"></asp:menuitem>
                    <asp:menuitem text="Reviews" Value="5"></asp:menuitem>
                    <asp:menuitem text="Tickets" Value="6"></asp:menuitem>
                    <asp:menuitem text="Clients" Value="7"></asp:menuitem>
                    <asp:menuitem text="Workers" Value="8"></asp:menuitem>
                </items>
            </asp:menu>
        </div>


        <div class="col three-quarter">
            <div class="register form-content padding-client margin-medium grey shadow">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

                    <asp:View ID="View1" runat="server">
                        <asp:GridView id="GridProducts" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                        <asp:GridView id="GridProducts2" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                        <asp:GridView id="GridProducts3" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                        <asp:GridView id="GridProducts4" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View2" runat="server">
                        <asp:GridView id="GridHotels" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                    </asp:View>
                    
                    <asp:View ID="View3" runat="server">
                        <asp:GridView id="GridRides" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View4" runat="server">
                        <asp:GridView id="GridRestaurants" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View5" runat="server">
                        <asp:GridView id="GridShows" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View6" runat="server">
                        <asp:GridView id="GridReviews" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View7" runat="server">
                        <asp:GridView id="GridTickets" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View8" runat="server">
                        <asp:GridView id="GridClients" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View9" runat="server">
                        <asp:GridView id="GridWorkers" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="mGrid margin-large">
                        </asp:GridView>
                    </asp:View>

                </asp:MultiView>
            </div>
        </div>
    </div>
</asp:Content>
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
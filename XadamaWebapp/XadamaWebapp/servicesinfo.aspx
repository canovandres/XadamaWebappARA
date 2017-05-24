<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="servicesinfo.aspx.cs" Inherits="XadamaWebapp.servicesinfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Xadama Services</title>
    <link rel="stylesheet" type="text/css" href="Style/services.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div id="title container" class="padding-64 drop-container center margin-bottom-large content">
            <p><asp:Label ID="ServiceTitle" CssClass="uppercase bold xxlarge" runat="server"></asp:Label></p>
        </div>
         <asp:Panel ID="Container" runat="server" CssClass="row2 large container-border" Visible="false">
            <asp:Panel ID="info" runat="server" CssClass="col info-container">
                    <div>
                        <asp:Panel ID="pname" runat="server" Visible="false" CssClass="info-items-white xlarge">
                            <asp:Label ID="name" runat="server"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="pzone" runat="server" Visible="false" CssClass="info-items">
                            <asp:Image runat="server" ImageAlign="Middle" CssClass="image-item margin-right" ImageUrl="~/Media/Icons/world-icon.png" />
                            <asp:Label ID="zone" runat="server"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="pheight" runat="server" Visible="false" CssClass="info-items">
                            <asp:Image runat="server" ImageAlign="Middle" CssClass="image-item margin-right" ImageUrl="~/Media/Icons/height-icon.png" />
                            <asp:Label ID="minheight" runat="server" Visible="false"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="pspeed" runat="server" Visible="false" CssClass="info-items">
                            <asp:Image runat="server" ImageAlign="Middle" CssClass="image-item margin-right" ImageUrl="~/Media/Icons/speed-icon.png" />
                            <asp:Label ID="speed" runat="server" Visible="false"></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="pdesc" runat="server" Visible="false" CssClass="info-items">
                            <asp:Label ID="ServiceDescription" runat="server"></asp:Label>
                        </asp:Panel>
                        <asp:Button ID="Button" CssClass="xlarge bold button-slice" OnClick="Button_Click" Text="BOOK!" runat="server" Visible="false" />
                    </div>
              </asp:Panel>
             <div class="col two-third">
                 <asp:Image ID="image" CssClass="image-container" Width="100%" runat="server" />
             </div>
        </asp:Panel>
</asp:Content>

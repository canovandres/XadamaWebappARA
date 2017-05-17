<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/main.Master" CodeBehind="services.aspx.cs" Inherits="XadamaWebapp.Services" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="server">
    <title>Xadama Services</title>
    <link rel="stylesheet" type="text/css" href="Style/services.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="hgfj">
        <ContentTemplate>
            <!--Drop-down-lists-->
            <div class="drop-container center padding-64 content text-orange bold xxlarge uppercase"> <!--class="container padding-64 center"-->
                <p>explore the rides, restaurants and shows of each zone</p>
                <div>
                    <asp:DropDownList ID="ListZones" runat="server" CssClass="dropdown-border text-orange center bold large margin-bottom backimgdrop dropdown-border" Width ="300px" Height="30px" AutoPostBack="true" OnSelectedIndexChanged="OnListZoneChanged">
                        <asp:ListItem Text="--" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Africa" Value="1"></asp:ListItem>
                        <asp:ListItem Text="America" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Asia" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Europe" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Oceania" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:DropDownList ID="ListServices" runat="server" CssClass="margin-bottom-large text-orange bold large backimgdrop2 dropdown-border" Width="200px" Height="30px" AutoPostBack="true" OnSelectedIndexChanged="OnListServiceChanged">
                        <asp:ListItem Text="--" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Rides" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Restaurants" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Shows" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <!--List View-->
            <div id="ListViewContainer" class="display-border padding-64">
                <asp:Label ID="labl" runat="server"></asp:Label>
                <asp:ListView ID="ListView1" runat="server" GroupItemCount="3" OnSelectedIndexChanging="OnSelectedItem">

                   <LayoutTemplate>
                      <div align="center" class="margin-32 padding-64" runat="server">
                          <div runat="server" id="groupPlaceholder">
                          </div>
                      </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="quarter display-border-template col large item-container uppercase bold padding-16">
                            <div>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                            </div>
                            <div style="height:70%">
                                <asp:Image ID="Image1" runat="server" CssClass="image-template" ImageUrl='<%#Eval("image") %>' />
                            </div>
                            <div>
                                <asp:Label ID="Label2" Visible="false" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                            </div>
                            <div>
                                <asp:LinkButton runat="server" CssClass="button-template" Text="See More!" CommandName="Select"></asp:LinkButton>
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

  
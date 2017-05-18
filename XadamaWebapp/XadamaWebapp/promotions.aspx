﻿<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="promotions.aspx.cs" Inherits="XadamaWebapp.promo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Promo</title>
    <link rel="stylesheet" type="text/css" href="Style/promo.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="backimgPromo display-container">
        <div class="display-middle front">
            <div class="center wide xxlarge black padding-large appear"> PROMOTIONS </div>
        </div>
    </div>

    <div class="content container padding-32 center">
        <div class="center large text-black margin-top bold">
            Have a look at the set of special promotions available for you.
        </div>
    </div>
    <div>

    <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>

    <asp:ListView ID="ListViewPromo" runat="server" DataKeyNames="cod" GroupItemCount="1">
            <LayoutTemplate>
                  <div align="center" class="margin-32 padding-64" runat="server">
                      <div runat="server" id="groupPlaceholder">
                      </div>
                  </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="display-border-orange mycontainer padding-32 margin-left">
                    <div class="bold uppercase text-black">
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                    </div>
                    
                    <div class="bold uppercase margin-top margin-bottom">
                        <asp:Button ID="CodeButton" runat="server" CssClass="button-slice xlarge margin-32" Text="SHOW CODE" ></asp:Button>
                        <asp:Panel ID="Panel1" runat="server" class="backPopup text-black wide bold uppercase padding-32" >
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("cod") %>'></asp:Label>
                            </br> 
                            <asp:Button ID="closeBtn" class="close-button text-white uppercase margin-top" runat="server" Text="Close" />
                        </asp:Panel>
                        <ajaxToolkit:ModalPopupExtender ID="PromoPopup" runat="server" 
                                                        TargetControlID="CodeButton"
                                                        OkControlID="closeBtn" 
                                                        PopupControlID="Panel1" >
                        </ajaxToolkit:ModalPopupExtender>
                    </div>
                    <div>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                    </div>
                    <div>
                        *Available until 
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("dateend") %>'></asp:Label>
                    </div>
                </div>
           
            </ItemTemplate>
            <GroupTemplate>
                    <div runat="server" id="promoRow" class="margin-bottom-large" style="height:270px">
                        <div runat="server" id="itemPlaceholder">
                        </div>
                    </div>
            </GroupTemplate>
        </asp:ListView>
        </div>

    <div class="content container center" style="padding-bottom: 32px !important">
        <div class="center large text-black margin-bottom-large ">
            *Copy the code and paste it in the code field when you are going to pay in order to get your discount. 
        </div>
        <div class="center large text-black margin-bottom-large bold">
            If none of them suits you, keep on visiting us periodically... New promotions are comming! 
        </div>
    </div>
</asp:Content>
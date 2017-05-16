﻿<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="tickets.aspx.cs" Inherits="XadamaWebapp.tickets" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Tickets</title>
    <link rel="stylesheet" type="text/css" href="Style/tickets.css" />
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">
       
        $(document).ready(function () {

            $(".calculo").each(function () {
                $(this).keyup(function () {
                    var total = 0;
                    var totalchildren = 0;
                    var totaladult = 0;
                    $(".calculo-children").each(function () {
                        if (!isNaN(this.value) && this.value.length != 0) {
                            totalchildren = parseFloat(this.value) * 25;
                        }
                    });

                    $(".calculo-adult").each(function () {
                        if (!isNaN(this.value) && this.value.length != 0) {
                            totaladult = parseFloat(this.value) * 40;
                        }
                    });

                    total = totaladult + totalchildren;
                    $('#<%=totalprice.ClientID %>').html(total.toString() + "€");
                });
            });

        });
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="backimgt1 display-container">
        <div class="display-middle no-opacity">
            <asp:label runat="server" CssClass="center padding-medium black xxlarge wide" text="WEB TICKET OFFICE"></asp:label>
        </div>
    </div>
     
    <div class="content container padding-16">
        <div class="center padding-medium darkblue xlarge wide">
            <a>BUY YOUR TICKETS: </a>
        </div>
        <div align ="center">
    </div>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="type" >
            <AlternatingItemTemplate>
                <li style="list-style:none;"  class="text-darkblue bold textleft">
                    <asp:Label ID="nameLabel" CssClass="uppercase textleft" runat="server" Text='<%# Eval("type") %>' />
                    
                    <asp:Label ID="priceLabelchildren" CssClass="textleft" runat="server" Text='<%# Eval("price") %>' />€
                    <br />
                </li>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <li style="background-color: #FFCC66;color: #000080; list-style:none; ">
                    <asp:Label ID="nameLabel1" runat="server" Text='<%# Eval("type") %>' />
                    <br />
                    
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                </li>
            </EditItemTemplate>
            <EmptyDataTemplate>
               
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <li style="">
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("type") %>' />
                    <br />
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />€
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                </li>
            </InsertItemTemplate>
            <ItemSeparatorTemplate>
<br />
            </ItemSeparatorTemplate>
            <ItemTemplate>
                <li style="margin-top:40px; text-align:left; list-style:none;" class="text-darkblue bold">
                    <asp:Label ID="nameLabel" CssClass="uppercase" runat="server" Text='<%# Eval("type") %>' />
  
                    <asp:Label ID="priceLabeladult" CssClass="calculo price-adult" runat="server" Text='<%# Eval("price") %>' />€
                    <br />
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ul id="itemPlaceholderContainer" runat="server" class="prices bold xlarge">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
                <div class="info">
                    <asp:Image runat="server" ImageUrl="~/Media/Icons/info.png" CssClass="info-logo margin-left" /> </br>
                    <asp:Label runat="server" Text="Children: 4-16 years."  CssClass="margin-left-tickets medium text-darkblue"></asp:Label></br>
                    <asp:Label runat="server" Text="Adults: +17 years."  CssClass="margin-left-tickets medium text-darkblue"></asp:Label></br>
                    <asp:Label runat="server" Text="FREE ENTRY: children under 4 years."  CssClass="margin-left-tickets medium text-darkblue"></asp:Label>
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <li style="background-color: #ffffff;color: #284775;font-weight: bold;color: #000080;">
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("type") %>' />
                    <br />
                    
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %> ' />
                    <br />
                </li>
            </SelectedItemTemplate>
        </asp:ListView>
        
        </div>

    <div class="content container padding-16"></div>
      <div class="content container padding-32">
        <div class="lightblue" style="height: 130px">
            <div class="field col fifth" style="margin-left: 4%">
                <asp:Label runat="server" Text="DATE"></asp:Label>
                <asp:TextBox runat="server" placeholder="MM/DD/YYYY" ID="date" CssClass="field textright large" style="border-radius: 0px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValidatorFrom" runat="server" ControlToValidate="date" CssClass="error-text" ErrorMessage="Date Required"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="ValidatorFrom" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                    TargetControlID="date" FirstDayOfWeek="Monday" PopupPosition="BottomRight" />
            </div>
            <div class="field col seventh">
               <asp:Label runat="server" Text="Children"></asp:Label>
               <asp:TextBox runat="server" ID="Children" MaxLength="2" CssClass="textright text-darkblue large calculo calculo-children"></asp:TextBox>
            </div>
            <div class="field col seventh">
               <asp:Label runat="server" Text="Adults"></asp:Label>
               <asp:TextBox runat="server" ID="Adults" MaxLength="2" TextMode="Number" CssClass="textright text-darkblue large calculo calculo-adult"></asp:TextBox>
            </div>
            <div class="field col fifth">
               <asp:Label runat="server" Text="Promotions"></asp:Label>
               <asp:TextBox runat="server" placeholder="Enter your code" ID="Promo" CssClass="textright text-darkblue medium calculo calculo-promo"></asp:TextBox>
            </div> 
            <div class="margin-50 col seventh">
                <asp:Label runat="server" ID="totalprice" Text="0€" CssClass="textright text-darkblue bold xxlarge"></asp:Label>
            </div>
            <div class="col seventh">
                <asp:Button Text="BUY NOW" runat="server" CssClass="darkblue buytickets xlarge margin-50" OnClick="buyTicket" ValidateRequestMode="Disabled"></asp:Button>
            </div>
        </div>
     </div>
   <div class="content container padding-32"></div>
  

</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="tickets.aspx.cs" Inherits="XadamaWebapp.tickets" %>

<%@ Register Src="~/signin.ascx" TagPrefix="uc1" TagName="signin" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Tickets</title>
    <link rel="stylesheet" type="text/css" href="Style/tickets.css" />
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
    

            <div class="col fifth">
                <asp:ListView ID="ListViewTickets" runat="server" DataKeyNames="type" GroupItemCount="1">
                    <LayoutTemplate>
                          <div align="center" runat="server">
                              <div runat="server" id="groupPlaceholder">
                              </div>
                          </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="bold large uppercase text-black display-circle padding-16 margin-32 margin-left margin-right-large" >
                            <div>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("type") %>'></asp:Label>
                            </div>
                            <div>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("price") %>'></asp:Label>€
                            </div>
                        </div>
                    </ItemTemplate>
                    <GroupTemplate>
                            <div runat="server" id="ticketsRow">
                                <div runat="server" id="itemPlaceholder">
                                </div>
                            </div>
                    
                    </GroupTemplate>
                </asp:ListView>
            </div>


            <div class="col three-quarter">
                <div class="form-content container padding-32">
                    <div align="center" class="blue shadow">
                    <div style="height: 100px;">
                        <div class="margin-top-large margin-left">
                        <div style="width: 100%;">
                            <div align="right" class="col third bold uppercase text-black padding-right">
                                <asp:Label runat="server" Text="DATE"></asp:Label>
                            </div>
                            <div class ="col half">
                                <asp:TextBox runat="server" placeholder="DD/MM/YYYY" ID="date" CssClass=" textright large" style="border-radius: 1px;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ValidatorDate" runat="server" ControlToValidate="date" CssClass="error-text" ErrorMessage="Date Required"></asp:RequiredFieldValidator>
                                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="ValidatorDate" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                                                TargetControlID="date" FirstDayOfWeek="Monday" PopupPosition="BottomRight"  Format="dd/MM/yyyy"/>
                            </div>
                        </div>
                    
                        <div style="width: 100%;">
                            <div align="right" class="col third bold uppercase text-black padding-right">
                                <asp:Label runat="server" Text="Promotion Code"></asp:Label>
                            </div>
                            <div class ="col half">
                                <asp:TextBox runat="server" placeholder="Enter your code" Text="" ID="PromoCode" CssClass="textright large" style="border-radius: 1px;"></asp:TextBox>
                            </div>
                            </div>
                        </div>
                    
                    </div>
                    <asp:ListView ID="ListViewBuyTickets" runat="server" DataKeyNames="type" GroupItemCount="1">
                        <LayoutTemplate>
                              <div align="center" class="margin-32" runat="server">
                                  <div runat="server" id="groupPlaceholder">
                                  </div>
                              </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div >
                                <div align="right" class="col third bold uppercase text-black">
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("type") %>'></asp:Label>
                                </div>
                                <div class ="col third">
                                    <asp:TextBox runat="server" ID="QuantityBox" MaxLength="2" TextMode="Number" Text="0"  ValidationGroup="numbers" CssClass="textright large margin-left" style="border-radius: 1px;"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator2" Type="Integer" MinimumValue="0"  MaximumValue="99" ControlToValidate="QuantityBox" runat="server" CssClass="error-text margin-left" ErrorMessage="Incorrect quantity"></asp:RangeValidator>
                                    <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RangeValidator2" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                                </div>
                            </div>
           
                        </ItemTemplate>
                        <GroupTemplate>
                                <div runat="server" id="promoRow"  style="height:50px">
                                    <div runat="server" id="itemPlaceholder">
                                    </div>
                                </div>
                        </GroupTemplate>
                    </asp:ListView>
                    <div>
                        <asp:Button Text="BUY NOW" runat="server" CssClass="darkblue buytickets xlarge margin-50" OnClick="OnClickBuyNow" ValidateRequestMode="Disabled"></asp:Button>
                    </div>
                </div>
                </div>
           </div>
    </div>
   

   <div class="content container padding-32"></div>
  

</asp:Content>
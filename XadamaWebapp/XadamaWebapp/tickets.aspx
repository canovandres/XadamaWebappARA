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
        <div align ="center">
    </div>
        <!-- mio></!-->

        <asp:ListView ID="ListViewTickets" runat="server" DataKeyNames="type" GroupItemCount="2">
            <LayoutTemplate>
                  <div align="center" runat="server">
                      <div runat="server" id="groupPlaceholder">
                      </div>
                  </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="fifth col margin-32 bold large uppercase text-black display-circle padding-16" style="margin-left: 20%">
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
                    <div>
                        <asp:ImageButton ID="infoBtn" runat="server" ImageUrl="~/Media/Icons/info.png" class="info-button margin-left margin-16"> </asp:ImageButton>
                        <asp:Panel ID="InfoPanel" runat="server" class="info-popup text-black " >
                            <asp:Button ID="closeBtn" runat="server" class="close-button text-white uppercase"  Style="cursor:pointer" Text="x" />
                            <div class="padding-16">
                                <asp:Label runat="server" Text="Children: 4-16 years" class="medium"></asp:Label></br>
                                <asp:Label runat="server" Text="Adults: +17 years" class="medium"></asp:Label></br>
                                <asp:Label runat="server" Text="FREE ENTRY: children under 4 years" class="medium"></asp:Label>
                            </div>
                        </asp:Panel>
                        <ajaxToolkit:ModalPopupExtender ID="InfoPopup" runat="server" 
                                                        TargetControlID="infoBtn"
                                                        OkControlID="closeBtn" 
                                                        PopupControlID="InfoPanel" >
                        </ajaxToolkit:ModalPopupExtender>
                    </div>
            </GroupTemplate>
        </asp:ListView>
        </div>
        
        

        <!-->
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
    </!-->
    <div class="content container padding-16"></div>
      <div class="content container padding-32">
        <div class="lightblue" style="height: 130px">
            <div class="field col fifth" style="margin-left: 4%">
                <asp:Label runat="server" Text="DATE"></asp:Label>
                <asp:TextBox runat="server" placeholder="DD/MM/YYYY" ID="date" CssClass="field textright large" style="border-radius: 0px;"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ValidatorDate" runat="server" ControlToValidate="date" CssClass="error-text" ErrorMessage="Date Required"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="ValidatorDate" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                    TargetControlID="date" FirstDayOfWeek="Monday" PopupPosition="BottomRight"  Format="dd/MM/yyyy"/>
            </div>
            <div class="field col seventh">
               <asp:Label runat="server" Text="Children"></asp:Label>
               <asp:TextBox runat="server" ID="Children" MaxLength="2" TextMode="Number" Text="0"  ValidationGroup="numbers" CssClass="textright text-darkblue large calculo calculo-children"></asp:TextBox>
               <asp:RangeValidator ID="RangeValidator2" Type="Integer" MinimumValue="0"  MaximumValue="99" ControlToValidate="Children" runat="server" CssClass="error-text" ErrorMessage="Incorrect quantity"></asp:RangeValidator>
               <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RangeValidator2" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>

            </div>
            <div class="field col seventh">
               <asp:Label runat="server" Text="Adults"></asp:Label>
               <asp:TextBox runat="server" ID="Adults" MaxLength="2" TextMode="Number" Text="0"  ValidationGroup="numbers" CssClass="textright text-darkblue large calculo calculo-adult"></asp:TextBox>
               <asp:RangeValidator ID="RangeValidator1" Type="Integer" MinimumValue="0"  MaximumValue="99" ControlToValidate="Adults" runat="server" CssClass="error-text" ErrorMessage="Incorrect quantity"></asp:RangeValidator>
               <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RangeValidator1" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>

            </div>
            
            <div class="field col fifth">
               <asp:Label runat="server" Text="Promotion Code"></asp:Label>
               <asp:TextBox runat="server" placeholder="Enter your code" Text="" ID="PromoCode" CssClass="textright text-darkblue medium calculo calculo-promo"></asp:TextBox>
            </div> 
            <div class="margin-50 col seventh">
            </div>
            <div class="col seventh">
                <asp:Button Text="BUY NOW" runat="server" CssClass="darkblue buytickets xlarge margin-50" OnClick="OnClickBuyNow" ValidateRequestMode="Disabled"></asp:Button>
            </div>
        </div>
     </div>




    <asp:Panel runat="server" ID="TicketsError" CssClass="display-container" Height="300px">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center padding-medium xxlarge wide text-red" text="Sorry, your selection is not correct. Please, change it."></asp:Label>
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="PromoError" CssClass="display-container" Height="300px">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center padding-medium xxlarge wide text-red" text="Sorry, the promotion code you entered is not correct. Please, change it."></asp:Label>
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="boughtCorrectly" CssClass="display-container" Height="300px">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center padding-medium xxlarge wide text-darkblue" text="Thanks for buying tickets for the park."></asp:Label>
            <asp:Label runat="server" CssClass="center padding-medium xxlarge wide text-darkblue" text="An email has been sent to you. Please, check it."></asp:Label>
        </div>
    </asp:Panel>


    <asp:Panel runat="server" ID="TicketsCorrect" CssClass="display-container " style="margin-left:20%;" Height="300px">
            <div class="row-padding">
                <asp:Label runat="server" CssClass="center padding-medium xxlarge wide text-darkblue" text="This is your tickets selection: "></asp:Label>
            </div>
            <div class="row-padding" style="margin-left:5%;">
                <asp:Label runat="server" CssClass="xlarge text-darkblue" Text="Tickets for the day: "></asp:Label>
                <asp:Label runat="server" ID="Date2" CssClass="text-darkblue xlarge padding-large"></asp:Label>
            </div>
            <div class="row-padding" style="margin-left:5%;">
                <asp:Label runat="server" ID="Adults2" CssClass="text-darkblue xlarge padding-large"></asp:Label>
                <asp:Label runat="server" CssClass="xlarge text-darkblue" Text=" adult tickets"></asp:Label>
            </div>
            <div class="row-padding" style="margin-left:5%;">
                <asp:Label runat="server" ID="Children2" CssClass="text-darkblue xlarge padding-large"></asp:Label>
                <asp:Label runat="server" CssClass="xlarge text-darkblue" Text=" child tickets"></asp:Label>
            </div>
            <div class="row-padding" style="margin-left:5%;">
                 <asp:Label runat="server" CssClass="xlarge text-darkblue" Text="Promotion discount: "></asp:Label>
                 <asp:Label runat="server" ID="Promo2" CssClass="text-darkblue xlarge padding-large"></asp:Label>
                 <asp:Label runat="server" CssClass="xlarge text-darkblue" Text="%"></asp:Label>
            </div>
            <div class="row-padding" style="margin-left:5%;">
                <asp:Label runat="server" CssClass="xxlarge text-darkblue" Text="Total price: "></asp:Label>
                <asp:Label runat="server" ID="Price2" CssClass="text-darkblue xxlarge padding-large"></asp:Label>
                <asp:Label runat="server" CssClass="xxlarge text-darkblue" Text="€"></asp:Label>
            </div>
            <div class="row-padding">
                <asp:Label runat="server" CssClass="center padding-medium xlarge text-darkblue" text="Do you want to confirm your purchase? "></asp:Label>
            </div>
            <div class="col seventh margin-left">
                <asp:Button runat="server" ID="ConfirmBtn" CssClass="button-slice xlarge margin-32" Style="cursor:pointer; align-content:center" Text="CONFIRM" OnClick="buyTickets"/>
            </div>
            <div class="col seventh">
                <asp:Button runat="server" ID="Button2" CssClass="button-slice xlarge margin-32 " Style="cursor:pointer; align-content:center; margin-left:20%" Text="CANCEL" NavigateUrl="main.aspx"></asp:Button>
            </div>
             <asp:Panel runat="server" ID="registerPanel" Visible="False" HorizontalAlign="Center">
                <uc1:signin runat="server" ID="signin" align="center" />
            </asp:Panel>
    </asp:Panel>

   

   <div class="content container padding-32"></div>
  

</asp:Content>
<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="XadamaWebapp.shop" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Shop</title>
    <link rel="stylesheet" type="text/css" href="Style/shop.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="backimg3 display-container">
        <div class="display-middle front">
            <div class="center wide xxlarge black padding-large appear"> SHOP </div>
        </div>
    </div>

    <div>
        <asp:ImageButton id="cart" runat="server"  CssClass="imgbeg" ImageUrl="~/Media/Icons/carritonar.png" PostBackUrl="shoppingcart.aspx" />
    </div>
    <div class="content container padding-32 center">
        <div class="center large text-black margin-bottom-large margin-top bold">
            Welcome to our shop. There are many items you can buy online or in our physical shop when you come to our park. 
        </div>
    </div>

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="hgfj">
        <ContentTemplate>
        <div class="form-content">
            <asp:Panel runat="server" DefaultButton="searchbutton">
                <div class="field-2">
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Search by product name"></asp:TextBox>
                    <div>
                        <ajaxToolkit:AutoCompleteExtender runat="server" CompletionListCssClass="completion-list" CompletionListItemCssClass="completion-list-item" CompletionListHighlightedItemCssClass="completion-list-selected" UseContextKey="true" TargetControlID="TextBox1" ServiceMethod="SuggestionList" EnableCaching="true" CompletionInterval="5" MinimumPrefixLength="1" CompletionSetCount="1" BehaviorID="TextBox1_AutoCompleteExtender"></ajaxToolkit:AutoCompleteExtender>
                    </div>
                </div>
                <div class="field-aux">
                    <asp:ImageButton id="searchbutton" runat="server"  CssClass="imgbeg-aux" ImageUrl="~/Media/Others/lupabuscar.png" OnClick="OnBrowseClick" />
                </div>
                
            </asp:Panel>
        </div>
    <div class="slider-container margin-top">
        <div class="picture-container">
            <div class="show-pictures">
                <div class="backTshirt">
                    <asp:LinkButton CssClass="display-middle darkblue center button padding-medium large wide bold button-slice" runat="server" Text="T-SHIRTS" style="cursor: pointer;" onclick="OnTShirtsClicked"></asp:LinkButton>
                </div>
            </div>
            <div class="show-pictures">
                <div class="backJumper">
                     <asp:LinkButton runat="server" CssClass="display-middle darkblue center button padding-medium large wide bold button-slice" Text="JUMPERS" style="cursor: pointer;" onclick="OnJumpersClicked"></asp:LinkButton>
                </div>            
            </div>
            <div class="show-pictures">
                <div class="backCap">
                     <asp:LinkButton runat="server" class="display-middle darkblue center button padding-medium large wide bold button-slice" style="cursor: pointer;" Text="CAPS" onclick="OnCapsClicked"></asp:LinkButton>
                </div>
            </div>
            <div class="show-pictures">
                <div class="backBag">
                     <asp:LinkButton runat="server" Text="BAGS" class="display-middle darkblue center button padding-medium large wide bold button-slice" style="cursor: pointer;" onclick="OnBagsClicked"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>

    <div class="content container padding-32 center">
        <div class="center large text-orange uppercase wide margin-bottom-large margin-top bold ">
        Feel free to have a look in any of our categories
        </div>
    </div>

     <!-- <div class="slider-container margin-top">
        <div class="swiper">
            <div class="slide hide">
                <asp:Image ID="Image9" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Africa/AfricanPyramid.jpg" />
                <div class="show-text show-text-africa">
                    <asp:Label ID="Label3" runat="server" CssClass="text-white" Text="AFRICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Enjoy the wild animals and beautiful sabannahs</p>
                        <asp:Button runat="server" text="GO!" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image10" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/America/AmericanHollywood.jpg" />
                <div class="show-text show-text-america">
                    <asp:Label ID="Label12" runat="server" CssClass="text-white" Text="AMERICA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Live an authentic american expirience</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-america button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image11" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Europe/EuropeanLondonEye.jpg" />
                <div class="show-text show-text-europe">
                    <asp:Label ID="Label13" runat="server" CssClass="text-white" Text="EUROPE"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Immerse yourself in the different cultures Europe has to offer</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-europe button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide">
                <asp:Image ID="Image12" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Asia/AsianChina.jpg" />
                <div class="show-text show-text-asia">
                    <asp:Label ID="Label10" runat="server" CssClass="text-white" Text="ASIA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Travel to the amazing China and explore the oriental culture</p>
                        <asp:Button runat="server" text="GO!" CssClass="button-asia button-sign" />
                    </div>
                </div>
            </div>
            <div class="slide hide">
                <asp:Image ID="Image13" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Oceania/OceanianTurtleaux.jpg" />
                <div class="show-text show-text-oceania">
                    <asp:Label ID="Label14" runat="server" CssClass="text-white" Text="OCEANIA"></asp:Label>
                    <div class="slide-hide text-white">
                        <p>Love the long beaches and the paradisiac landscapes</p>
                        <asp:Button runat="server" text="GO!" />
                    </div>
                </div>
            </div>
        </div>
        <div class=" arrow arrow-prev left front text-white xlarge">
            <p style="margin: 13px">❮</p>
        </div>
        <div class="arrow arrow-next right front text-white xlarge">
            <p style="margin: 15px">❯</p>
        </div>
    </div>-->
       <div class="center">
           <asp:Label ID="LabelLv" runat="server"></asp:Label>
       </div>

    <div>
        <asp:ListView ID="ListView1" runat="server" GroupItemCount="3" OnSelectedIndexChanging="AddToCart">
            <LayoutTemplate>
                  <div align="center" class="margin-32 padding-64" runat="server">
                      <div runat="server" id="groupPlaceholder">
                      </div>
                  </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="quarter display-border-grey col large text-orange item-container uppercase bold padding-16">
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
                 <asp:Label ID="Label3" runat="server" Visible="false" Text='<%#Eval("cod") %>'></asp:Label>
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
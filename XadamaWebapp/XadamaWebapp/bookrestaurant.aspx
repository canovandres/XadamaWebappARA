<%@ Page Title="Xadama RESERVE Restaurant" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="bookrestaurant.aspx.cs" Inherits="XadamaWebapp.bookrestaurant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Style/bookrestaurant.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="backimgr display-container">
        <div class="display-middle no-opacity">
            <asp:label runat="server" CssClass="center padding-medium black xxlarge wide" text="RESTAURANT"></asp:label>
        </div>
        <div class="display-middle-sub">
            <asp:Label runat="server" CssClass="center padding-small black large wide" Text="Reserve table in our zone's restaurants" ></asp:Label>
        </div>
    </div>
     <div class="content container padding-32"></div>
    <div class="backimg-africa display-container">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center darkblue large wide" Text="BAOBAB EXOTIC"></asp:Label>
        </div>
    </div>
    <div class="content container padding-32"></div>
    <div class="content container padding-32">
        <div class="col three-quarter">
            <asp:Image ID="Image1" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/african.jpg" />
            <asp:Image ID="Image2" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/african2.jpg" />
        </div>
        <div>
            <asp:Label runat="server" Text="NUMBER OF TABLES" CssClass="xlarge text-darkblue bold"></asp:Label> 
        </div>
        <div>
            <asp:TextBox runat="server" CssClass="margin-bottom center" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label>
        </div>
        <div>
            <input type="date" required="required"/><br />
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" />
        </div>
    </div>

     <div class="content container padding-32"></div>
    <div class="backimg-america display-container">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center darkblue large wide" Text="DELICIOUS BURGER"></asp:Label>
        </div>
    </div>
    <div class="content container padding-32"></div>
    <div class="content container padding-32">
        <div class="col three-quarter">
            <asp:Image ID="Image3" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/american.jpg" />
            <asp:Image ID="Image4" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/american2.jpg" />
        </div>
        <div>
            <asp:Label runat="server" Text="NUMBER OF TABLES" CssClass="xlarge text-darkblue bold"></asp:Label> 
        </div>
        <div>
            <asp:TextBox runat="server" CssClass="margin-bottom center" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label>
        </div>
        <div>
            <input type="date" required="required"/><br />
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" />
        </div>
    </div>

     <div class="content container padding-32"></div>
    <div class="backimg-asia display-container">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center darkblue large wide" Text="SUSHI KING"></asp:Label>
        </div>
    </div>
    <div class="content container padding-32"></div>
    <div class="content container padding-32">
        <div class="col three-quarter">
            <asp:Image ID="Image5" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/asian.jpg" />
            <asp:Image ID="Image6" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/asian2.jpg" />
        </div>
        <div>
            <asp:Label runat="server" Text="NUMBER OF TABLES" CssClass="xlarge text-darkblue bold"></asp:Label> 
        </div>
        <div>
            <asp:TextBox runat="server" CssClass="margin-bottom center" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label>
        </div>
        <div>
            <input type="date" required="required"/><br />
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" />
        </div>
    </div>
    <div class="content container padding-32"></div>
    <div class="backimg-europe display-container">
       <div class="display-middle">
            <asp:Label runat="server" CssClass="center darkblue large wide" Text="SHELLFISH RESTAURANT"></asp:Label>
       </div>
    </div>
    <div class="content container padding-32"></div>
    <div class="content container padding-32">
        <div class="col three-quarter">
            <asp:Image ID="asia1" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/europe.jpg" />
            <asp:Image ID="asia2" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/europe2.jpg" />
        </div>
        <div>
            <asp:Label runat="server" Text="NUMBER OF TABLES" CssClass="xlarge text-darkblue bold"></asp:Label> 
        </div>
        <div>
            <asp:TextBox runat="server" CssClass="margin-bottom center" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label>
        </div>
        <div>
            <input type="date" required="required"/><br />
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" />
        </div>
    </div>

     <div class="content container padding-32"></div>
    <div class="backimg-oceania display-container">
        <div class="display-middle">
            <asp:Label runat="server" CssClass="center darkblue large wide" Text="GREAT BARRIER"></asp:Label>
        </div>
    </div>
    <div class="content container padding-32"></div>
    <div class="content container padding-32">
        <div class="col three-quarter">
            <asp:Image ID="Image7" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/oceanic.jpg" />
            <asp:Image ID="Image8" runat="server" CssClass="restaurant-image-small" ImageUrl="~/Media/Restaurants/oceanic2.jpg" />
        </div>
        <div>
            <asp:Label runat="server" Text="NUMBER OF TABLES" CssClass="xlarge text-darkblue bold"></asp:Label> 
        </div>
        <div>
            <asp:TextBox runat="server" CssClass="margin-bottom center" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label>
        </div>
        <div>
            <input type="date" required="required"/><br />
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" />
        </div>
    </div>
    <div class="content container padding-32"></div>
</asp:Content>

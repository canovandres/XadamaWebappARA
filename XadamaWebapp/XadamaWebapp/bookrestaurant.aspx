<%@ Page Title="Xadama RESERVE Restaurant" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="bookrestaurant.aspx.cs" Inherits="XadamaWebapp.bookrestaurant" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Style/bookrestaurant.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="backimgr display-container">
        <div class="display-middle no-opacity">
            <asp:label runat="server" CssClass="center padding-medium black xxlarge wide" text="RESTAURANT"></asp:label>
        </div>
        <div class="display-middle-sub">
            <asp:Label runat="server" CssClass="center padding-small black large wide" Text="Reserve table in our zone's restaurants" ></asp:Label>
        </div>
    </div>

    <!--AFRICA-->
    <div id="Africa">
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
            <asp:TextBox runat="server" ID="TablesAfrica" CssClass="margin-bottom textright text-darkblue" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ValidatorTableAfrica" runat="server" ControlToValidate="TablesAfrica" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Number of tables required" ValidationGroup="africa"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="ValidatorTableAfrica" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label> 
        </div>
        <div>
            <asp:TextBox runat="server" placeholder="MM/DD/YYYY" ID="TextBox" CssClass="Calendar textleft"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" DefaultView="Days" PopupPosition="BottomRight" Animated="true" runat="server" TargetControlID="TextBox" />
            <asp:RequiredFieldValidator ID="ValidatorAfrica" runat="server" ControlToValidate="TextBox" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Date Required" ValidationGroup="africa"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="ValidatorAfrica" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" OnClick="reserveAfrica" ValidationGroup="africa"/>
        </div>
    </div>
    </div>

    <!--AMERICA-->
    <div id="America">
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
            <asp:TextBox runat="server" CssClass="margin-bottom textright text-darkblue" ID="TablesAmerica" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ValidatorTableAmerica" runat="server" ControlToValidate="TablesAmerica" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Number of tables required" ValidationGroup="america"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="ValidatorTableAmerica" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label>
        </div>
        <div>
            <asp:TextBox runat="server" placeholder="MM/DD/YYYY" ID="TextBox1" CssClass="Calendar"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" DefaultView="Days" PopupPosition="BottomRight" Animated="true" runat="server" TargetControlID="TextBox1" />
            <asp:RequiredFieldValidator ID="ValidatorAmerica" runat="server" ControlToValidate="TextBox1" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Date required" ValidationGroup="america"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="ValidatorAmerica" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" OnClick="reserveAmerica" ValidationGroup="america" />
        </div>
    </div>
    </div>

     <!--ASIA-->
    <div id="Asia">
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
            <asp:TextBox runat="server" CssClass="margin-bottom textright text-darkblue" ID="TablesAsia" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ValidatorTableAsia" runat="server" ControlToValidate="TablesAsia" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Number of tables required" ValidationGroup="asia"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="ValidatorTableAsia" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label>
        </div>
        <div>
            <asp:TextBox runat="server" placeholder="MM/DD/YYYY" ID="TextBox2" CssClass="Calendar"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" DefaultView="Days" PopupPosition="BottomRight" Animated="true" runat="server" TargetControlID="TextBox2" />
            <asp:RequiredFieldValidator ID="ValidatorAsia" runat="server" ControlToValidate="TextBox2" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Date required" ValidationGroup="asia"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="ValidatorAsia" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" OnClick="reserveAsia" ValidationGroup="asia" />
        </div>
    </div>
    </div>

     <!--EUROPA-->
    <div id="Europa">
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
            <asp:TextBox runat="server" ID="TablesEuropa" CssClass="margin-bottom textright text-darkblue" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ValidatorTableEuropa" runat="server" ControlToValidate="TablesEuropa" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Number of tables required" ValidationGroup="europa"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="ValidatorTableEuropa" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label>
        </div>
        <div>
            <asp:TextBox runat="server" placeholder="MM/DD/YYYY" ID="TextBox3" CssClass="Calendar"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" DefaultView="Days" PopupPosition="BottomRight" Animated="true" runat="server" TargetControlID="TextBox3" />
             <asp:RequiredFieldValidator ID="ValidatorEuropa" runat="server" ControlToValidate="TextBox3" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Date required" ValidationGroup="europa"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="ValidatorEuropa" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" OnClick="reserveEuropa" ValidationGroup="europa" />
        </div>
    </div>
    </div>

     <!--OCEANIA-->
    <div id="Oceania">
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
            <asp:TextBox runat="server" ID="TablesOceania" CssClass="margin-bottom textright text-darkblue" Font-Bold="True" Font-Size="Medium" Height="20px" Width="49px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ValidatorTableOceania" runat="server" ControlToValidate="TablesOceania" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Number of tables required" ValidationGroup="oceania"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="ValidatorTableOceania" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div>
            <asp:Label runat="server" Text="DAY" CssClass="xlarge text-darkblue bold"></asp:Label>
        </div>
        <div>
            <asp:TextBox runat="server" placeholder="MM/DD/YYYY" ID="TextBox4" CssClass="Calendar"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender5" DefaultView="Days" PopupPosition="BottomRight" Animated="true" runat="server" TargetControlID="TextBox4" />
             <asp:RequiredFieldValidator ID="ValidatorOceania" runat="server" ControlToValidate="TextBox4" CssClass="error-text margin-medium" style="display: inline-block" ErrorMessage="Date required" ValidationGroup="oceania"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" TargetControlID="ValidatorOceania" HighlightCssClass="form-error"></ajaxToolkit:ValidatorCalloutExtender>
        </div>
        <div class="col quarter margin-top-button">
            <asp:Button runat="server" text="RESERVE" CssClass="margin-top center button padding-medium xxlarge wide button-slice" OnClick="reserveOceania" ValidationGroup="oceania" />
        </div>
    </div>
    </div>

    <div class="content container padding-32"></div>
</asp:Content>

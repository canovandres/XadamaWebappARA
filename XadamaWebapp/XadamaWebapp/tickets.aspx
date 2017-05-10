<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="tickets.aspx.cs" Inherits="XadamaWebapp.tickets" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Tickets</title>
    <link rel="stylesheet" type="text/css" href="Style/tickets.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="backimgt1 display-container">
        <div class="display-middle no-opacity">
            <asp:label runat="server" CssClass="center padding-medium black xxlarge wide" text="WEB TICKET OFFICE"></asp:label>
        </div>
    </div>

    <div class="content container padding-16">
        <div class="center padding-medium darkblue xlarge wide">
            <a>TICKET PRICES: </a>
        </div>
    </div>

    <div class="content container padding-16">
        
    <div class="wrapt">
    <div class="table">
    <p class="indications">CHILDREN: 3-12 years</p>
    <p class="indications">SENIOR: +60 years</p>
    <p class="indications">FREE entry to children under 3 years.</p>

    <ul id="tickets" class="ultickets">
    
    <li class="litickets">
      <div class="topt days">
        <h1>1 DAY</h1>
        <div class="circle">40€</div>
      </div>
      <div class="bottomt">
        <p>Children: 10% discount </p>
        <p>Senior:   15% discount </p>
      </div>
    </li>
  
    <li class="litickets">
      <div class="topt days">
        <h1>2 DAYS</h1>
        <div class="circle">65€</div>
      </div>
        <div class="bottomt">
        <p>Children: 15% discount </p>
        <p>Senior:   19% discount </p>
      </div>
    </li>
  
    <li class="litickets">
      <div class="topt days">
        <h1>3 DAYS</h1>
        <div class="circle">90€</div>
      </div>
        <div class="bottomt">
        <p>Children: 20% discount </p>
        <p>Senior:   23% discount </p>
      </div>
    </li>
  
    <li class="litickets">
      <div class="topt days">
        <h1>4 DAYS</h1>
        <div class="circle">140€</div>
      </div>
        <div class="bottomt">
        <p>Children: 25% discount </p>
        <p>Senior:   30% discount </p>
      </div>
    </li>
  
    </ul>
    </div>
    </div>
   </div>
   
     <div class="content container padding-32"></div>
   <div class="back1 display-container"></div>
    <div class="content container padding-32"></div>
         <table id="buytickets" class="center">
             <caption>BUY YOUR TICKETS</caption>
             <tr>
                 <th>Children</th>
                 <th>Adult</th>
                 <th>Senior</th>
             </tr>
             
             <tr>
                 <td>
                     <asp:DropDownList ID="children" runat="server">
                         <asp:ListItem>0</asp:ListItem>
                         <asp:ListItem>1</asp:ListItem>
                         <asp:ListItem>2</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                         <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>5</asp:ListItem>
                         <asp:ListItem>6</asp:ListItem>
                         <asp:ListItem>7</asp:ListItem>
                         <asp:ListItem>8</asp:ListItem>
                         <asp:ListItem>9</asp:ListItem>
                         <asp:ListItem>10</asp:ListItem>
                     </asp:DropDownList>
                 </td>
                 <td>
                     <asp:DropDownList ID="adults" runat="server">
                         <asp:ListItem>0</asp:ListItem>
                         <asp:ListItem>1</asp:ListItem>
                         <asp:ListItem>2</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                         <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>5</asp:ListItem>
                         <asp:ListItem>6</asp:ListItem>
                         <asp:ListItem>7</asp:ListItem>
                         <asp:ListItem>8</asp:ListItem>
                         <asp:ListItem>9</asp:ListItem>
                         <asp:ListItem>10</asp:ListItem>
                     </asp:DropDownList>
                 </td>
                 <td>
                     <asp:DropDownList ID="senior" runat="server" CssClass="center">
                         <asp:ListItem>0</asp:ListItem>
                         <asp:ListItem>1</asp:ListItem>
                         <asp:ListItem>2</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                         <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>5</asp:ListItem>
                         <asp:ListItem>6</asp:ListItem>
                         <asp:ListItem>7</asp:ListItem>
                         <asp:ListItem>8</asp:ListItem>
                         <asp:ListItem>9</asp:ListItem>
                         <asp:ListItem>10</asp:ListItem>
                     </asp:DropDownList>
                 </td>
             </tr>
             <tr>
                 <td></td>
                 <td></td>
                 <td><asp:ImageButton ID="buyticketsconfirm" runat="server" ImageUrl="~/Media/Others/buy-tickets-button.png" CssClass="right"/></td>
             </tr>
         </table>
    <div class="container center footer padding-64" id="footer-bar">

</asp:Content>
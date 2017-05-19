<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="XadamaWebapp.admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Admin</title>
    <link rel="stylesheet" type="text/css" href="Style/admin.css" />
    <link rel="stylesheet" type="text/css" href="Style/client.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-client padding-128-client">
        <div class="col fifteen blue">
            <asp:menu runat="server" Orientation="Vertical" CssClass="left menu full" OnMenuItemClick="MenuItemClick" ID="MenuAdmin">
                <StaticMenuItemStyle CssClass="client-bar-item button text-white center border-menu"/>
                <StaticMenuStyle CssClass="full"/>
                <items>
                    <asp:menuitem text="Poducts" Value="0" Selected="True"></asp:menuitem>
                    <asp:menuitem text="Rides" Value="1"></asp:menuitem>
                    <asp:menuitem text="Restaurants" Value="2"></asp:menuitem>
                    <asp:menuitem text="Shows" Value="3"></asp:menuitem>
                    <asp:menuitem text="Reviews" Value="4"></asp:menuitem>
                    <asp:menuitem text="Tickets" Value="5"></asp:menuitem>
                    <asp:menuitem text="Clients" Value="6"></asp:menuitem>
                    <asp:menuitem text="Workers" Value="7"></asp:menuitem>
                </items>
            </asp:menu>
        </div>


        <div class="col three-quarter">
            <div class="margin-medium grey shadow center" style="overflow-x: scroll; max-width: 100%">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

                    <asp:View ID="View1" runat="server">
                    </asp:View>
                    
                    <asp:View ID="View2" runat="server">
                        <asp:GridView id="GridRides" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View3" runat="server">
                        <asp:GridView id="GridRestaurants" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View4" runat="server">
                        <asp:GridView id="GridShows" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View5" runat="server">
                        <asp:GridView id="GridReviews" runat="server" AutoGenerateEditButton="True" AllowPaging="True" CssClass="margin-large">
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View6" runat="server">
                        <!--<asp:GridView id="GridTickets" runat="server" AutoGenerateColumns = "false" AllowPaging="True" OnPageIndexChanging="GridTickets_PageIndexChanging" 
                            OnRowCancelingEdit="GGridTickets_RowCancelingEdit" OnRowDeleting="GridTickets_RowDeleting" OnRowEditing="GridTickets_RowEditing" 
                            OnRowUpdating="GridTickets_RowUpdating" CssClass="margin-large" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width = "150px"  HeaderText = "Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblType" runat="server"
                                        Text='<%# Eval("type")%>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtType" Width = "80px"  runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "80px"  HeaderText = "Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPrice" runat="server"
                                            Text='<%# Eval("price")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:CommandField  ShowDeleteButton="True" />
                                <asp:CommandField  ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>-->
                    </asp:View>

                    <asp:View ID="View7" runat="server">
                        <asp:GridView id="GridClients" runat="server" AutoGenerateColumns = "false" AllowPaging="True" OnPageIndexChanging="GridClients_PageIndexChanging" 
                            OnRowCancelingEdit="GridClients_RowCancelingEdit" OnRowDeleting="GridClients_RowDeleting" OnRowEditing="GridClients_RowEditing" 
                            OnRowUpdating="GridClients_RowUpdating" CssClass="margin-large" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width = "150px"  HeaderText = "Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmail" runat="server"
                                        Text='<%# Eval("usuario")%>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtEmail" Width = "80px"  runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "80px"  HeaderText = "Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("name")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtName" runat="server"
                                            Text='<%# Eval("name")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "80px"  HeaderText = "Surname 1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSurname1" runat="server"
                                            Text='<%# Eval("surname1")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSurname1" runat="server"
                                            Text='<%# Eval("surname1")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtSurname1" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "80px"  HeaderText = "Surname 2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSurname2" runat="server"
                                            Text='<%# Eval("surname2")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSurname2" runat="server"
                                            Text='<%# Eval("surname2")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtSurname2" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "Birth Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAge" runat="server"
                                            Text='<%# Eval("age")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAge" runat="server"
                                            Text='<%# Eval("age")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "60px"  HeaderText = "Phone">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPhone" runat="server"
                                            Text='<%# Eval("phone")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPhone" runat="server"
                                            Text='<%# Eval("phone")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "200px"  HeaderText = "Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddress" runat="server"
                                            Text='<%# Eval("address")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAddress" runat="server"
                                            Text='<%# Eval("address")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "120px"  HeaderText = "Credit Card">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreditCard" runat="server"
                                            Text='<%# Eval("creditCard")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCreditCard" runat="server"
                                            Text='<%# Eval("creditCard")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtCreditCard" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:CommandField  ShowDeleteButton="True" />
                                <asp:CommandField  ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
                    </asp:View>

                    <asp:View ID="View8" runat="server">
                        <asp:GridView id="GridWorkers" runat="server" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="GridWorkers_PageIndexChanging" 
                            OnRowCancelingEdit="GridWorkers_RowCancelingEdit" OnRowDeleting="GridWorkers_RowDeleting" OnRowEditing="GridWorkers_RowEditing" 
                            OnRowUpdating="GridWorkers_RowUpdating" CssClass="margin-large" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            <Columns>
                                <asp:TemplateField ItemStyle-Width = "150px"  HeaderText = "Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmail" runat="server"
                                        Text='<%# Eval("usuario")%>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtEmail" Width = "80px"  runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "80px"  HeaderText = "Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("name")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtName" runat="server"
                                            Text='<%# Eval("name")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "80px"  HeaderText = "Surname 1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSurname1" runat="server"
                                            Text='<%# Eval("surname1")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSurname1" runat="server"
                                            Text='<%# Eval("surname1")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtSurname1" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "80px"  HeaderText = "Surname 2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSurname2" runat="server"
                                            Text='<%# Eval("surname2")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSurname2" runat="server"
                                            Text='<%# Eval("surname2")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtSurname2" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "100px"  HeaderText = "Birth Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAge" runat="server"
                                            Text='<%# Eval("age")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAge" runat="server"
                                            Text='<%# Eval("age")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width = "60px"  HeaderText = "Phone">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPhone" runat="server"
                                            Text='<%# Eval("phone")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPhone" runat="server"
                                            Text='<%# Eval("phone")%>'></asp:TextBox>
                                    </EditItemTemplate> 
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:CommandField  ShowDeleteButton="True" />
                                <asp:CommandField  ShowEditButton="True" />
                            </Columns>
                        </asp:GridView>
                    </asp:View>

                </asp:MultiView>
            </div>
        </div>
    </div>
</asp:Content>
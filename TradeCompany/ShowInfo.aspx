<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowInfo.aspx.cs" Inherits="TradeCompany.ShowInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Информация</title>
</head>
<body>
    <form id="InfoForm" runat="server">
        <div>
            <asp:GridView ID="CustomersGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="TradeCompanyDataSource" AutoGenerateSelectButton="True">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id заказчика" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Фамилия" SortExpression="Surname" />
                    <asp:BoundField DataField="YearOfBirth" HeaderText="Год рождения" SortExpression="YearOfBirth" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="TradeCompanyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDbConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="CustomerOrdersGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="TradeCompanyDataSource2">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id заказа" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Товар" SortExpression="Title" />
                    <asp:BoundField DataField="CustomerId" HeaderText="Id заказчика" SortExpression="CustomerId" />
                    <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                    <asp:BoundField DataField="Count" HeaderText="Количество" SortExpression="Count" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="TradeCompanyDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDbConnectionString %>" SelectCommand="SELECT * FROM [Orders] WHERE ([CustomerId] = @CustomerId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="CustomersGridView" Name="CustomerId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>

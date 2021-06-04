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
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Фамилия" SortExpression="Surname" />
                    <asp:BoundField DataField="YearOfBirth" HeaderText="Год рождения" SortExpression="YearOfBirth" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="TradeCompanyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDbConnectionString %>" SelectCommand="SELECT * FROM [Customers]" DeleteCommand="DELETE FROM Customers WHERE Id = @Id" InsertCommand="INSERT INTO Customers (Name, Surname, YearOfBirth)
VALUES (@Name, @Surname, @YearOfBirth)" UpdateCommand="UPDATE Customers 
SET Name = @Name, Surname = @Surname, YearOfBirth = @YearOfBirth
WHERE Id = @Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="CustomersGridView" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="Customer_Name" Name="Name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Customer_Surname" Name="Surname" PropertyName="Text" />
                    <asp:ControlParameter ControlID="Customer_YearOfBirth" Name="YearOfBirth" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="CustomersGridView" Name="Name" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomersGridView" Name="Surname" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomersGridView" Name="YearOfBirth" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomersGridView" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="Add_Customer_Btn" runat="server" OnClick="Add_Customer_Btn_Click" Text="Добавить покупателя" />
            <asp:Button ID="Update_Customer_Btn" runat="server" Text="Редактировать покупателей" OnClick="Update_Customer_Btn_Click" />
            <asp:Button ID="Delete_Customer_Btn" runat="server" Text="Удалить покупателя" OnClick="Delete_Customer_Btn_Click" />
            <br />
            <br />
            <asp:Panel ID="Add_Customer_Pnl" runat="server" Visible="False">
                Имя:<asp:TextBox ID="Customer_Name" runat="server"></asp:TextBox>
                <br />
                Фамилия:<asp:TextBox ID="Customer_Surname" runat="server"></asp:TextBox>
                <br />
                Год рождения:<asp:TextBox ID="Customer_YearOfBirth" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="Add_Customer_Pnl_Btn" runat="server" Text="Добавить" OnClick="Add_Customer_Pnl_Btn_Click" />
                <asp:Button ID="Clean_Customer_Btn" runat="server" OnClick="Clean_Customer_Btn_Click" Text="Очистить" />
            </asp:Panel>
            <br />
            <asp:GridView ID="CustomerOrdersGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="TradeCompanyDataSource2">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер заказа" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Товар" SortExpression="Title" />
                    <asp:BoundField DataField="CustomerId" HeaderText="Номер заказчика" SortExpression="CustomerId" ReadOnly="True" />
                    <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                    <asp:BoundField DataField="Count" HeaderText="Количество" SortExpression="Count" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="TradeCompanyDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDbConnectionString %>" SelectCommand="SELECT * FROM [Orders] WHERE ([CustomerId] = @CustomerId)" InsertCommand="INSERT INTO ORDERS (Title, CustomerId, Price, Count)
VALUES (@Title, @CustomerId, @Price, @Count)" UpdateCommand="UPDATE ORDERS 
SET Title = @Title, CustomerId = @CustomerId, Price = @Price, Count = @Count
WHERE Id = @Id
" DeleteCommand="DELETE FROM ORDERS 
WHERE Id = @Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="CustomerOrdersGridView" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="Order_Name" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="CustomersGridView" Name="CustomerId" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="Order_Price" Name="Price" PropertyName="Text" Type="Decimal"/>
                    <asp:ControlParameter ControlID="Order_Count" Name="Count" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="CustomersGridView" Name="CustomerId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="CustomerOrdersGridView" Name="Title" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomersGridView" Name="CustomerId" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomerOrdersGridView" Name="Price" PropertyName="SelectedValue" Type="Decimal"/>
                    <asp:ControlParameter ControlID="CustomerOrdersGridView" Name="Count" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="CustomerOrdersGridView" Name="Id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="Add_Order_Btn" runat="server" OnClick="Add_Order_Btn_Click" Text="Добавить заказ" />
            <asp:Button ID="Update_Order_Btn" runat="server" Text="Редактировать заказы" OnClick="Update_Order_Btn_Click" />
            <asp:Button ID="Delete_Order_Btn" runat="server" OnClick="Delete_Order_Btn_Click" Text="Удалить заказ" />
            <br />
            <br />
            <br />
        </div>
        <asp:Panel ID="Add_Order_Pnl" runat="server" Visible="False">
            Название товара:
            <asp:TextBox ID="Order_Name" runat="server"></asp:TextBox>
            <br />
            Цена:
            <asp:TextBox ID="Order_Price" runat="server"></asp:TextBox>
            <br />
            Количество:
            <asp:TextBox ID="Order_Count" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Add_Order_Pnl_Btn" runat="server" OnClick="Add_Order_Pnl_Btn_Click" Text="Добавить" />
            <asp:Button ID="Clean_Order_Btn" runat="server" OnClick="Clean_Order_Btn_Click" Text="Отменить" />
        </asp:Panel>
    </form>
</body>
</html>

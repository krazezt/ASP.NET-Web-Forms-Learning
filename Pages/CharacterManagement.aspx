<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CharacterManagement.aspx.cs" Inherits="Pages_CharacterList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <title>Character List</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:GridView
        ID="GridView1"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="Id"
        DataSourceID="CharacterListSrc"
        ShowHeaderWhenEmpty="True"
        ShowFooter="True"
        OnRowCommand="RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="ID" SortExpression="Id">
                <ItemTemplate>
                    <%# Eval("Id") %>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="InsertButton" runat="server" Text="新しく作る" CommandName="Insert" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <ItemTemplate>
                    <%# Eval("Name") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="InsertNameTextBox" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                <ItemTemplate>
                    <%# Eval("Price") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="InsertPriceTextBox" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rarity" SortExpression="RarityId">
                <ItemTemplate>
                    <%# Eval("RarityAlias") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList
                        ID="DropDownListRarity"
                        runat="server"
                        DataSourceID="RarityDataSource"
                        DataTextField="Alias"
                        DataValueField="Id"
                        SelectedValue='<%# Bind("RarityId") %>'
                        CssClass="custom-select" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList
                        ID="InsertDropDownListRarity"
                        runat="server"
                        DataSourceID="RarityDataSource"
                        DataTextField="Alias"
                        DataValueField="Id"
                        CssClass="custom-select" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="行動">
                <ItemTemplate>
                    <asp:Button ID="EditButton" runat="server" Text="変更" CommandName="Edit" />
                    <asp:Button ID="DeleteButton" runat="server" Text="削除" CommandName="Delete" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="UpdateButton" runat="server" Text="送信" CommandName="Update" />
                    <asp:Button ID="CancelButton" runat="server" Text="キャンセル" CommandName="Cancel" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource
        ID="CharacterListSrc"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:GachaDB %>"
        DeleteCommand="DELETE FROM [Characters] WHERE [Id] = @Id"
        InsertCommand="INSERT INTO [Characters] ([Name], [Price], [RarityId]) VALUES (@Name, @Price, @RarityId)"
        SelectCommand="SELECT Characters.Id, Characters.Name, Characters.Price, Characters.RarityId, Rarities.Alias AS RarityAlias FROM Characters INNER JOIN Rarities ON Characters.RarityId = Rarities.Id"
        UpdateCommand="UPDATE [Characters] SET [Name] = @Name, [Price] = @Price, [RarityId] = @RarityId WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Int32" />
            <asp:Parameter Name="RarityId" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource
        ID="RarityDataSource"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:GachaDB %>"
        SelectCommand="SELECT [Id], [Alias] FROM [Rarities]" />
</asp:Content>


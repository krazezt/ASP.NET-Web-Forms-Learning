<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RarityManagement.aspx.cs" Inherits="Pages_RarityManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:GridView
        ID="GridView1"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="Id"
        DataSourceID="RarityDataSrc"
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
            <asp:TemplateField HeaderText="Alias" SortExpression="Alias">
                <ItemTemplate>
                    <%# Eval("Alias") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="AliasTextBox" runat="server" Text='<%# Bind("Alias") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="InsertAliasTextBox" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rate" SortExpression="Rate">
                <ItemTemplate>
                    <%# Eval("Rate") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="RateTextBox" runat="server" Text='<%# Bind("Rate") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="InsertRateTextBox" runat="server" />
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
        <EmptyDataTemplate>
            There's just no Rarity yet!
        </EmptyDataTemplate>
    </asp:GridView>

    <asp:SqlDataSource
        ID="RarityDataSrc"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:GachaDB %>"
        DeleteCommand="DELETE FROM [Rarities] WHERE [Id] = @Id"
        SelectCommand="SELECT * FROM [Rarities]"
        UpdateCommand="UPDATE [Rarities] SET [Alias] = @Alias, [Rate] = @Rate WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Alias" Type="String" />
            <asp:Parameter Name="Rate" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>


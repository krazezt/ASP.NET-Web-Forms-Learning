using DatabaseContext;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_RarityManagement : Page {
    protected void Page_Load(object sender, EventArgs e) {
        
    }

    protected void RowCommand(object sender, GridViewCommandEventArgs e) {
        if (e.CommandName == "Insert" && Page.IsValid) {
            GachaDB db = new GachaDB();
            TextBox aliasTextBox = (TextBox)GridView1.FooterRow.FindControl("InsertAliasTextBox");
            TextBox rateTextBox = (TextBox)GridView1.FooterRow.FindControl("InsertRateTextBox");

            db.Rarities.Add(new Rarity() {
                Alias = aliasTextBox.Text,
                Rate = int.Parse(rateTextBox.Text),
            });

            db.SaveChanges();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}
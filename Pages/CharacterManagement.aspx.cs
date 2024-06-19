using DatabaseContext;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_CharacterList : Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void RowCommand(object sender, GridViewCommandEventArgs e) {
        if (e.CommandName == "Insert" && Page.IsValid) {
            GachaDB db = new GachaDB();
            TextBox nameTextBox = (TextBox)GridView1.FooterRow.FindControl("InsertNameTextBox");
            TextBox priceTextBox = (TextBox)GridView1.FooterRow.FindControl("InsertPriceTextBox");
            DropDownList rarityDDL = (DropDownList)GridView1.FooterRow.FindControl("InsertDropDownListRarity");

            db.Characters.Add(new Character() {
                Name = nameTextBox.Text,
                Price = int.Parse(priceTextBox.Text),
                RarityId = int.Parse(rarityDDL.SelectedValue),
            });

            db.SaveChanges();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}
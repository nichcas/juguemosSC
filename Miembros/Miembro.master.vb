
Partial Class Site
    Inherits System.Web.UI.MasterPage


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Me.lblUsuario.Text = HeadLoginName.Page.User.Identity.Name
    End Sub
End Class


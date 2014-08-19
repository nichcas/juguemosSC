
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If User.IsInRole("Admin") Then
            Me.HyperLink1.Visible = True
        Else
            Me.HyperLink1.Visible = False
        End If
    End Sub
End Class

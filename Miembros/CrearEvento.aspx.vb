
Partial Class Miembros_CrearEvento
    Inherits System.Web.UI.Page

    Dim dias As Integer

    Protected Sub Calendar1_DayRender(sender As Object, e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
        dias = 7

        If e.Day.Date > System.DateTimeOffset.Now.AddDays(dias) Then

            e.Day.IsSelectable = False
            e.Cell.Font.Strikeout = True

        End If
        If e.Day.Date < (System.DateTime.Today) Then

            e.Day.IsSelectable = False
            e.Cell.Font.Strikeout = True

        End If
    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As System.EventArgs) Handles Calendar1.SelectionChanged

        txtFecha.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy")

    End Sub

End Class

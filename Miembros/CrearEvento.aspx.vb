Imports System.Data.SqlClient

Partial Class Miembros_CrearEvento
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=NICH-HP\SQLEXPRESS;Initial Catalog=Juguemos;Integrated Security=True")

    Dim dias As Integer

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Me.lblUsuario.Text = LoginName1.Page.User.Identity.Name
        Populate()
    End Sub

    Public Sub Populate()
        Dim 
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand("select * from #horas_diponibles where hora NOT IN(Select DatePart(Hour, ce.hora) from Crear_Evento as ce inner join Cancha as c on ce.id_cancha=c.id_cancha inner join EstadoEvento as ee on ce.id_evento=ee.id_evento where ce.id_cancha=@cancha and ce.fecha=@fecha  and ee.estado=1 "), con)
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

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

        txtFecha.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd")

    End Sub
   
    
    Protected Sub btnCrear_Click(sender As Object, e As System.EventArgs) Handles btnCrear.Click

        'Dim fecha As String = txtFecha.Text
        'DateTime.Parse(fecha)

        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand(String.Format("INSERT INTO Crear_Evento VALUES('{0}', '{1}','{2}', '{3}','{4}','{5}','{6}','{7}')", lblUsuario.Text, txtFecha.Text, drdHora.SelectedValue, drdParticipantes.SelectedValue, txtMin.Text, txtMax.Text, drdParam.SelectedValue, drdCancha.SelectedValue), con)
        cmd.ExecuteNonQuery()
        con.Close()

        Response.Redirect("Satisfactorio.aspx")

    End Sub

   
End Class

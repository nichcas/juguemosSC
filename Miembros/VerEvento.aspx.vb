Imports System.Data.SqlClient
Imports System.Data

Partial Class Miembros_VerEvento
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=NICH-HP\SQLEXPRESS;Initial Catalog=Juguemos;Integrated Security=True")

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Me.lblUsuario.Text = LoginName1.Page.User.Identity.Name
        Me.lblEvento.Text = Request.QueryString("id_evento")

        Dim cmd As SqlCommand
        Dim cmd2 As SqlCommand

        con.Open()

        cmd = New SqlCommand("SELECT * FROM ParticipantesXevento WHERE username = " & "'" & lblUsuario.Text & "'" & " AND id_evento=" & lblEvento.Text & "", con)

        Dim dr As SqlDataReader
        dr = cmd.ExecuteReader

        Dim HasRows As Boolean = dr.HasRows
        If HasRows = True Then
            Button1.Enabled = False
        End If
        con.Close()
        con.Open()

        cmd2 = New SqlCommand("SELECT cant_participantes FROM Crear_Evento WHERE id_evento=" & lblEvento.Text & "", con)

        Dim sqlRder As Data.SqlClient.SqlDataReader

        sqlRder = cmd2.ExecuteReader()

        sqlRder.Read()
        Me.lblNoPart.Text = sqlRder("cant_participantes")

        con.Close()

        If Me.lblNoPart.Text = 0 Then
            Button1.Enabled = False
        End If


    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand(String.Format("INSERT INTO ParticipantesXevento VALUES('{0}', '{1}')", lblEvento.Text, lblUsuario.Text), con)
        cmd.ExecuteNonQuery()
        con.Close()
        Response.Redirect(Request.RawUrl)
    End Sub


End Class

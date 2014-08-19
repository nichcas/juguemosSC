Imports System.Data.SqlClient
Imports System.Data
Partial Class Miembros_index
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=SQL5011.myASP.NET;Initial Catalog=DB_9B2B73_juguemos;User Id=DB_9B2B73_juguemos_admin;Password=P1rurara")

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Me.lblUsuario.Text = LoginName1.Page.User.Identity.Name

        Dim cmd As SqlCommand

        con.Open()
        cmd = New SqlCommand("SELECT edad, genero FROM Usuario WHERE username =" & "'" & lblUsuario.Text & "'" & "", con)

        Dim sqlRder As Data.SqlClient.SqlDataReader

        sqlRder = cmd.ExecuteReader()

        sqlRder.Read()
        Me.lblEdad.Text = sqlRder("edad")
        Me.lblGenero.Text = sqlRder("genero")

        con.Close()

    End Sub
End Class

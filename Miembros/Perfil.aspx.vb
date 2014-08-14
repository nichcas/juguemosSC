Imports System.Data.SqlClient
Imports System.Data

Partial Class Miembros_Mensajes
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=NICH-HP\SQLEXPRESS;Initial Catalog=Juguemos;Integrated Security=True")

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Me.lblUsuario.Text = LoginName1.Page.User.Identity.Name
    End Sub
    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>

    Protected Sub btnImagen_Click(sender As Object, e As System.EventArgs) Handles btnImagen.Click

        If FileUpload1.HasFile Then


            Dim str As String
            Dim path As String
            Dim cmd As SqlCommand

            str = FileUpload1.FileName
            FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "//../Fotos//" + str)
            path = "~//fotos//" + str.ToString()

            Dim commandText As String
            commandText = "Update Usuario set foto =@foto where username = @usuario"

            con.Open()
            cmd = New SqlCommand(commandText, con)
            cmd.Parameters.Add("@usuario", SqlDbType.VarChar)
            cmd.Parameters("@usuario").Value = lblUsuario.Text
            cmd.Parameters.AddWithValue("@foto", path)


            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect(Request.RawUrl)
        Else
            lblTexto.Text = "Por favor seleccione una imagen"

        End If

    End Sub
End Class

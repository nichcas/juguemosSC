Imports System.Data.SqlClient
Imports System

Partial Class Account_Register
    Inherits System.Web.UI.Page

    Dim con As SqlConnection = New SqlConnection("Data Source=NICH-HP\SQLEXPRESS;Initial Catalog=Juguemos;Integrated Security=True")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RegisterUser.ContinueDestinationPageUrl = Request.QueryString("ReturnUrl")
    End Sub

    Protected Sub RegisterUser_CreatedUser(ByVal sender As Object, ByVal e As EventArgs) Handles RegisterUser.CreatedUser
        FormsAuthentication.SetAuthCookie(RegisterUser.UserName, False)

        Dim Username As TextBox
        Username = RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("UserName")

        Dim email As TextBox
        email = RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Email")

        Dim Tel As TextBox
        Tel = RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("txtTel")

        Dim Genero As DropDownList
        Genero = RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("drdGenero")

        Dim Ano As DropDownList
        Ano = RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("drdano")

        Dim Mes As DropDownList
        Mes = RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("drdMes")

        Dim Dia As DropDownList
        Dia = RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("drdDia")

        Dim fecha As String = Ano.SelectedValue + "-" + Mes.SelectedValue + "-" + Dia.SelectedValue
        DateTime.Parse(fecha)

        Dim Edad As Integer
        Edad = Today.Year - Ano.SelectedValue

        Dim FU As FileUpload
        FU = RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("FileUpload1")

        Dim str As String
        Dim path As String

        str = FU.FileName
        FU.PostedFile.SaveAs(Server.MapPath(".") + "//../fotos//" + str)
        path = "~//fotos//" + str.ToString()

        Dim cmd As SqlCommand
        con.Open()
        cmd = New SqlCommand(String.Format("INSERT INTO Usuario VALUES('{0}', '{1}','{2}', '{3}','{4}','{5}','{6}')", Username.Text, email.Text, Tel.Text, Genero.SelectedValue, fecha, Edad, path), con)
        cmd.ExecuteNonQuery()
        con.Close()


        Dim continueUrl As String = RegisterUser.ContinueDestinationPageUrl
        If String.IsNullOrEmpty(continueUrl) Then
            continueUrl = "~/"
        End If

        Response.Redirect(continueUrl)
    End Sub
End Class

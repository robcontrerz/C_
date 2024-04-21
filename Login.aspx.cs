using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    static string _Nombre;
    static string _Programa;
    static string _DatosEnt;
    static string _Respuesta;
    static string _NombreEmpleado;
    static string _Puesto;
    string pass = string.Empty;
    string usr = string.Empty;
    static string _QueryStringOriginal;
    private string sLogFormat;
    private string sErrorTime;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
                ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);
                _QueryStringOriginal = Request.QueryString.ToString();
                Session.Add("QueryStringOriginal", _QueryStringOriginal);

            }
            catch(Exception err)
            {
                string reg = err.ToString();
                this.loading.Visible = false;
            }
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet loge = new DataSet();
        usererr.Text = "No existe el usuario";
        contraerr.Text = "Password incorrecto";
        usererr.Visible = false;
        contraerr.Visible = false;
        usr  =   txtUsuario.Text;
        pass = txtContraseña.Text;
        //this.loading.Visible = true;
        System.Threading.Thread.Sleep(300);
        try
        {

            loge = sp_log(usr, pass);
 
 

           
            _Nombre = loge.Tables[0].Rows[0][0].ToString();
            _Respuesta = loge.Tables[0].Rows[0][1].ToString();
            _NombreEmpleado = loge.Tables[0].Rows[0][2].ToString();
            _Puesto = loge.Tables[0].Rows[0][10].ToString();
          

            if (_Nombre != "")
           {

               usererr.Visible = false;
               contraerr.Visible = false;
               Session.Add("Nombre", _Nombre);
                Session.Add("Respuesta", _Respuesta);
                Session.Add("NombreEmpleado", _NombreEmpleado);
                Session.Add("Puesto", _Puesto);

 

                Response.Redirect("Default.aspx", false);
                //this.loading.Visible = false;
            }
           else 
           {
                this.loading.Visible = false;
                //Response.Redirect("Horas.aspx", false);
                usererr.Visible = true;
               contraerr.Visible = true;
               usererr.Text = "No existe el usuario";
               contraerr.Text = "Password incorrecto";
               //Response.Write("<script language=javascript>alert('" + usererr + "');</script>");

           }


        }
        catch(Exception err)
        {
            this.loading.Visible = false;
            //Response.Redirect("Horas.aspx", false);
            usererr.Visible = true;
            contraerr.Visible = true;
            usererr.Text = "No existe el usuario";
            contraerr.Text = "Password incorrecto";
            string reg = err.ToString();
            grabalog( "Login.aspx :" + reg);
            Response.Redirect("Default.aspx", false);
        }

    }


    public DataSet sp_log(string usr, string pass)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@NE", SqlDbType.Int)
            {
                Value = int.Parse(usr)
            };
            param[1] = new SqlParameter("@PA", SqlDbType.VarChar)
            {
                Value = pass
            };
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_VALIDA";
            cmd.Connection = conn;
            cmd.Parameters.AddRange(param);
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            
            string tex = ex.Message.ToString();
            grabalog("Login.aspx : sp_log " + tex);
            //Response.Write("<script language=javascript>alert('" + tex.ToString() + "');</script>");

            return ds;
        }
        finally
        {
            conn.Close();
            ((IDisposable)conn).Dispose();
            ((IDisposable)cmd).Dispose();
            ((IDisposable)da).Dispose();
            System.GC.Collect();
        }



    }

    private static void grabalog(string error)
    {
        try
        {
            const string fic = @"E:\Sitios\Admon\logadmon.txt";
            string texto = DateTime.Now.ToShortDateString() + "|" + DateTime.Now.ToShortTimeString() + " | " + error + " | ";

            System.IO.StreamWriter sw = new System.IO.StreamWriter(fic, true);
            sw.WriteLine(texto);
            sw.Close();
        }
        catch 
        {
            
        }


    }

    protected void txtUsuario_Load(object sender, EventArgs e)
    {
        txtUsuario.Attributes.Add("style", "text-transform:uppercase;");
        txtUsuario.Attributes.Add("onKeypress", "return validar(event);");
    }

}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Pretickets : System.Web.UI.Page
{
    public string usuario;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string nombre;
        DataSet sem = new DataSet();
        DataSet sem1 = new DataSet();

        try
        {
            if (!IsPostBack)
            {
                sem = TraeDatosNet("EXEC [SP_SEM]");

                var regresem = sem;

                string si = regresem.Tables[0].Rows[0][1].ToString();
                string sf = regresem.Tables[0].Rows[0][2].ToString();
 
              
                nombre = HttpContext.Current.Session["Preticket"].ToString();
                usuario = nombre;
                //FOLIOS 

                sem1 = TraeDatosNet("EXEC [dbo].[SP_PRETICKET_negocio] '" + nombre + "'");
                //sem = TraeDatosNet("SELECT  DISTINCT (a.ID_REQUERIMIENTO), A.[ASUNTO]   FROM[IUSA].[dbo].[REQUERIMIENTO]  a  left join[IUSA].[dbo].[PRETICKET] b on a.ID_REQUERIMIENTO = b.ID_REQUERIMIENTO where  b.BA = (SELECT CONVERT(varchar(255), isnull([Primer apellido], '') + ' ' + isnull([Segundo apellido], '') + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "')   Or b.BC =( SELECT CONVERT(varchar(255), isnull([Primer apellido],'') + ' ' + isnull([Segundo apellido],'')  + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "')  ORDER BY A.ID_REQUERIMIENTO ");
                GridView2.DataSource = sem1;
                GridView2.DataBind();
                //Chart1.DataSource = sem1;
                lblTemp.Text = GridView2.Rows.Count.ToString() + " pretickets de  tipo : " + nombre;
              

            }

        }
        catch (Exception err)
        {
            string ct = err.ToString();
            
        }
    }

    public System.Data.DataSet TraeDatosNet(string SQLQuery)
    {
        System.Data.DataSet dataSet = new System.Data.DataSet();
        System.Data.IDbConnection dbConnection = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ToString());
        System.Data.IDbDataAdapter dataAdapter = new System.Data.SqlClient.SqlDataAdapter();
        System.Data.IDbCommand dbCommand = new System.Data.SqlClient.SqlCommand();
        try
        {
            dbCommand.CommandTimeout = 1200;
            dbCommand.CommandText = SQLQuery;
            dbCommand.Connection = dbConnection;
            dataAdapter.SelectCommand = dbCommand;
            dataAdapter.Fill(dataSet);
            return dataSet;
        }
        catch (Exception ex)
        {
            string tex = ex.Message.ToString();

            return dataSet;
        }
        finally
        {
            dbConnection.Close();
            ((IDisposable)dbConnection).Dispose();
            ((IDisposable)dbCommand).Dispose();
            ((IDisposable)dataAdapter).Dispose();
            System.GC.Collect();
        }

    }

    protected void gvCustomers_SelectedIndexChanged1(object sender, GridViewCommandEventArgs e)
    {
        DataSet per = new DataSet();
        try
        {
            string lectureId = string.Empty;
            if (e.CommandName == "Semanas")
            {
                LinkButton lnkView = (LinkButton)e.CommandSource;
                lectureId = lnkView.CommandArgument;
                Label1.Text = lectureId;
                per  = TraeDatosNet("EXEC [dbo].[SP_preticket_personas] '" + lectureId + "'");

                GridView3.DataSource = per;
                GridView3.DataBind();
            }
             

        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
             
        }
    }

    protected void busqueda_Click(object sender, EventArgs e)
    {
        string user = HttpContext.Current.Session["Persona"].ToString();

        DataSet sem2 = new DataSet();
        try
        {

            string si = string.Empty;
            //string sf = string.Empty;
            //si = TextBox1.Text;
            //sf = finTabla.Text;
            //string timeinin = TextBox1.Text;
            //string inicior = timeinin.Replace("/", "");

            //string timeinin2 = finTabla.Text;
            //string inicior2 = timeinin2.Replace("/", "");
            //sem2 = TraeDatosNet("EXEC [SP_RESUMEN_DIRECCION] " + user + ",'" + inicior + "' ,'" + inicior2 + "'");
            //GridView2.DataSource = sem2;
            //GridView2.DataBind();
            //string semanax = (int.Parse(sem2.Tables[0].Rows[0][12].ToString()) - 1).ToString();
            //string semanax = sem2.Tables[0].Rows[0][12].ToString();
 
            lblTemp.Text = GridView2.Rows.Count.ToString();
        }
        catch (Exception err)
        {
            string se = err.ToString();
        }

    }

}
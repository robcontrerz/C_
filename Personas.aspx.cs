using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Newtonsoft.Json;

public partial class Personas : System.Web.UI.Page
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
                //sem = TraeDatosNet("SELECT [Semanas 2016],CONVERT(VARCHAR(10), [Comienza] , 112),CONVERT(VARCHAR(10), [Finaliza] , 112),[SEMANA],[year]  FROM [IUSA].[dbo].[SEMANAS] where SEMANA = (select datepart(WEEK,GETDATE())- 1) and year =datepart(YEAR,GETDATE())");
                sem = TraeDatosNet("EXEC [SP_SEM]");
                var regresem = sem;

                string si = regresem.Tables[0].Rows[0][1].ToString();
                string sf = regresem.Tables[0].Rows[0][2].ToString();
                TextBox1.Text = si;
                finTabla.Text = sf;
              
                nombre = HttpContext.Current.Session["Persona"].ToString();
                usuario = nombre;
                //FOLIOS 

                sem1 = TraeDatosNet("EXEC [SP_RESUMEN_DIRECCION] " + nombre + ",'"+ si + "' ,'" + sf + "'");

                string semanax = sem1.Tables[0].Rows[0][12].ToString();
                this.lblsemanax.Text = semanax;
                //sem = TraeDatosNet("SELECT  DISTINCT (a.ID_REQUERIMIENTO), A.[ASUNTO]   FROM[IUSA].[dbo].[REQUERIMIENTO]  a  left join[IUSA].[dbo].[PRETICKET] b on a.ID_REQUERIMIENTO = b.ID_REQUERIMIENTO where  b.BA = (SELECT CONVERT(varchar(255), isnull([Primer apellido], '') + ' ' + isnull([Segundo apellido], '') + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "')   Or b.BC =( SELECT CONVERT(varchar(255), isnull([Primer apellido],'') + ' ' + isnull([Segundo apellido],'')  + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "')  ORDER BY A.ID_REQUERIMIENTO ");
                GridView2.DataSource = sem1;
                GridView2.DataBind();
                Chart1.DataSource = sem1;
                lblTemp.Text = GridView2.Rows.Count.ToString();
              

            }

        }
        catch (Exception err)
        {
            string ct = err.ToString();
            grabalog(ct + "personas.aspx Page_Load");
            
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
            dbCommand.CommandTimeout = 1600;
            dbCommand.CommandText = SQLQuery;
            dbCommand.Connection = dbConnection;
            dataAdapter.SelectCommand = dbCommand;
            dataAdapter.Fill(dataSet);
           
            return dataSet;
        }
        catch (Exception ex)
        {
            string tex = ex.Message.ToString();
            grabalog(tex + "personas.aspx traedatosnet");
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

    public string Datajsont(DataTable table)
    {
        string JSONString = string.Empty;
        JSONString = JsonConvert.SerializeObject(table);
        return JSONString;
    }


    protected void Btnfolios_Click(object sender, EventArgs e)
    {

    }

    protected void Butpreti_Click(object sender, EventArgs e)
    {

    }

    protected void Buttactividad_Click(object sender, EventArgs e)
    {

    }

    protected void editRecord(object sender, GridViewEditEventArgs e)
    {

    }

    protected void updateRecord(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void cancelRecord(object sender, GridViewCancelEditEventArgs e)
    {

    }
    private static void grabalog(string error)
    {
        try
        {
            const string fic = @"E:\Sitios\Admon\logadmon.txt";
            //  const string fic = @"c:\Sitios\Admon\logadmon.txt";
            string texto = DateTime.Now.ToShortDateString() + "|" + DateTime.Now.ToShortTimeString() + " | " + error + " | ";

            System.IO.StreamWriter sw = new System.IO.StreamWriter(fic, true);
            sw.WriteLine(texto);
            sw.Close();
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
        try {

            string si = string.Empty;
            string sf = string.Empty;
            si= TextBox1.Text;
            sf= finTabla.Text;
            string timeinin = TextBox1.Text;
            string inicior = timeinin.Replace("/", "");

            string timeinin2 = finTabla.Text;
            string inicior2 = timeinin2.Replace("/", "");
            sem2 = TraeDatosNet("EXEC [SP_RESUMEN_DIRECCION] " + user + ",'" + inicior + "' ,'" + inicior2 + "'");
            GridView2.DataSource = sem2;
            GridView2.DataBind();
            string semanax = (int.Parse(sem2.Tables[0].Rows[0][12].ToString()) - 1).ToString();
            //string semanax = sem2.Tables[0].Rows[0][12].ToString();
            this.lblsemanax.Text = semanax;
            Datajsont(sem2.Tables[0]);
            Chart1.DataSource = sem2;
            lblTemp.Text = GridView2.Rows.Count.ToString();
        }
        catch (Exception err)
        {
            string se = err.ToString();
            grabalog(se + "personas.aspx busqueda_Click");
        }

    }
}
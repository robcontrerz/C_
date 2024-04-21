using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class costo : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (!IsPostBack)
            {



            }

        }

        catch (Exception err)
        {
            string tex = err.Message.ToString();
            grabalog("Page_Load " + tex);
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
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            grabalog("grabalog " + tex);
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
            dbCommand.CommandText = SQLQuery;
            dbCommand.Connection = dbConnection;
            dataAdapter.SelectCommand = dbCommand;
            dataAdapter.Fill(dataSet);
            return dataSet;
        }
        catch (Exception ex)
        {
            string tex = ex.Message.ToString();

            grabalog("TraeDatosNet " + tex);
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

   
  

    protected void A2_Click(object sender, ImageClickEventArgs e)
    {

        DataSet ds = new DataSet();
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DataSet TOT = new DataSet();
        DataSet empt = new DataSet();
        DataSet sem = new DataSet();
        try
        {
            //sem = TraeDatosNet("SELECT [Semanas 2016],CONVERT(VARCHAR(10), [Comienza] , 112),CONVERT(VARCHAR(10), [Finaliza] , 112),[SEMANA],[year]  FROM [IUSA].[dbo].[SEMANAS] where SEMANA = (select datepart(WEEK,GETDATE())- 1) and year =datepart(YEAR,GETDATE())");
            //var regresem = sem;

            //Lblsemana.Text = regresem.Tables[0].Rows[0][0].ToString();
            //Lblanio.Text = regresem.Tables[0].Rows[0][4].ToString();

       

        }

        catch (Exception err)
        {
            string tex = err.Message.ToString();
            grabalog("A2_Click " + tex);
        }
    }




  

  
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
            
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class CS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvCustomers.DataSource = GetData("EXEC SP_HORAS_SEMANA_year 2,2"); 
            //gvCustomers.DataSource = GetData("SELECT * FROM [dbo].[SP_EMPRH_1](2) where id not in (2) ORDER BY Nombre");
            gvCustomers.DataBind();
        }
    }

    private static DataTable GetData(string query)
    {

        DataTable X = new DataTable();
        try {
            string strConnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
        catch 
        {
            return X;
        }
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string customerId = gvCustomers.DataKeys[e.Row.RowIndex].Value.ToString();
            GridView gvOrders = e.Row.FindControl("gvOrders") as GridView;
            gvOrders.DataSource = GetData(string.Format("EXEC SP_HORAS_SEMANA_year {0} , 1 ", customerId));
             

            //gvOrders.DataSource = GetData(string.Format("SELECT * FROM [dbo].[SP_EMPRH]('{0}') where Id not in ('{0}')", customerId));
            gvOrders.DataBind();
        }
    }
}
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Home : System.Web.UI.Page
{
    private object ConexionBD;

    protected void Page_Load(object sender, EventArgs e)
    {

        txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");


       

    }

    public System.Data.DataSet TraeDatosNet(string SQLQuery)
    {
        System.Data.DataSet dataSet = new System.Data.DataSet();
        System.Data.IDbConnection dbConnection = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        System.Data.IDbDataAdapter dataAdapter = new System.Data.SqlClient.SqlDataAdapter();
        System.Data.IDbCommand dbCommand = new System.Data.SqlClient.SqlCommand();
        try
        {
            dbCommand.CommandTimeout = 200;
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            //GridView1.DataSource = TraeDatosNet(" EXEC SP_Edo_cuenta '01/01/2020','31/12/2023','31/12/2023','265'; "); 
            ////'GridView1.DataSource = TraeDatosNet("EXEC SP_Edo_cuenta " + "," + txtDate1.Text + "," + txtDate2.Text);
            //GridView1.DataBind();

            //SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
            //SqlCommand cmd = new SqlCommand();
            //DataTable dataTable = new DataTable();
            //SqlDataAdapter sqlDA; cnn.Open();
            //cmd.CommandText = "EXEC SP_Edo_cuenta '01/01/2020','31/12/2023','31/12/2023','265';";
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Connection = cnn;
            //sqlDA = new SqlDataAdapter(cmd);
            //sqlDA.Fill(dataTable);
            //cnn.Close();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = "listado_authors";
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("FechaInicial", SqlDbType.DateTime2);
            param[0].Value = "01/01/2020";
            param[1] = new SqlParameter("FechaFinal", SqlDbType.DateTime2);
            param[1].Value = "31/12/2023";
            param[2] = new SqlParameter("FechaCorte", SqlDbType.DateTime2);
            param[2].Value = "31/12/2023";
            param[3] = new SqlParameter("IDCliente", SqlDbType.BigInt);
            param[3].Value = "265";

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_Edo_cuenta";
            cmd.Connection = conn;
            cmd.Parameters.AddRange(param);

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();


        }
        catch (Exception err)
        {
            string reg = err.ToString();
        }
    }




    protected void imgPopup_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void Buttactividad0_Click(object sender, EventArgs e)
    {
        try
        {
            //GridView1.DataSource = TraeDatosNet(" EXEC SP_Edo_cuenta '01/01/2020','31/12/2023','31/12/2023','265'; "); 
            ////'GridView1.DataSource = TraeDatosNet("EXEC SP_Edo_cuenta " + "," + txtDate1.Text + "," + txtDate2.Text);
            //GridView1.DataBind();

            //SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
            //SqlCommand cmd = new SqlCommand();
            //DataTable dataTable = new DataTable();
            //SqlDataAdapter sqlDA; cnn.Open();
            //cmd.CommandText = "EXEC SP_Edo_cuenta '01/01/2020','31/12/2023','31/12/2023','265';";
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Connection = cnn;
            //sqlDA = new SqlDataAdapter(cmd);
            //sqlDA.Fill(dataTable);
            //cnn.Close();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand();
            //cmd.CommandText = "listado_authors";
            SqlParameter[] param = new SqlParameter[4];
            param[0] = new SqlParameter("FechaInicial", SqlDbType.DateTime2);
            param[0].Value = "01/01/2020";
            param[1] = new SqlParameter("FechaFinal", SqlDbType.DateTime2);
            param[1].Value = "31/12/2023";
            param[2] = new SqlParameter("FechaCorte", SqlDbType.DateTime2);
            param[2].Value = "31/12/2023";
            param[3] = new SqlParameter("IDCliente", SqlDbType.BigInt);
            param[3].Value = "265";

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_Edo_cuenta";
            cmd.Connection = conn;
            cmd.Parameters.AddRange(param);

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();


        }
        catch (Exception err)
        {
            string reg = err.ToString();
        }
    }

    protected void Botonborrar_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
    }


    private void ExportGridToExcel()
    {
        try
        {
            Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "Línea_146" + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GridView1.GridLines = GridLines.Both;
        GridView1.HeaderStyle.Font.Bold = true;
        GridView1.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();
        }
        catch (Exception err)
        {
            string reg = err.ToString();
        }
    }
}
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text;
using System.Windows.Forms;
using System.Collections.Generic;

public partial class TabControl : System.Web.UI.Page
{
    string usuario = String.Empty;
    string nombre = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                Cargaactividad();
            }
          
        }

        catch (Exception err)
        {
            string errr = err.ToString();
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
    private void Cargaactividad()
    {

        DataTable subjects = new DataTable();

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ToString()))
        {

            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT [ID],[DESCRIPCION],[GRUPO] FROM [IUSA].[dbo].[Actividades]", con);
                adapter.Fill(subjects);

                DropDownList1.DataSource = subjects;
                DropDownList1.DataTextField = "DESCRIPCION";
                DropDownList1.DataValueField = "DESCRIPCION";
                DropDownList1.DataBind();
            }
            catch (Exception ex)
            {
                string es = ex.ToString();
            }

        }

        // Add the initial item - you can add this even if the options from the
        // db were not successfully loaded
        DropDownList1.Items.Insert(0, new ListItem("<Actividad>", "0"));

    }
    // SI SE USA
    protected void Buttactividad_Click(object sender, EventArgs e)
    {

        try
        {
            string INSERTA = String.Empty;
            string horass = addhrs.Text;
            string FOLIO = folio.Text;
            string DESC = DropDownList1.SelectedItem.Text.ToString(); //actividadx.Text;


            string finr = string.Empty;
            string inicior = string.Empty;
            string usuario;
            string nombre;
            DataSet sem = new DataSet();
            DataSet sem1 = new DataSet();
            nombre = HttpContext.Current.Session["Puesto"].ToString();
            usuario = nombre;

             

            string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
            if (actividaddia.Text == "Inicio")
            {

                //MessageBox.Show("Debes selecionar la fecha de registro...", "",
                //     MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
            }
            else
            {
                int fil = 0;
                using (SqlConnection conn = new SqlConnection(cnString))
                {
                    finr = actividaddia.Text;
                    inicior = finr.Replace("/", "");
                    SqlCommand cmdSelect = conn.CreateCommand();
                    conn.Open();

                    cmdSelect.CommandType = CommandType.StoredProcedure;
                    cmdSelect.CommandText = "Act_Registro";
                    cmdSelect.Connection = conn;

                    cmdSelect.Parameters.AddWithValue("@title", FOLIO);
                    cmdSelect.Parameters.AddWithValue("@description", DESC);
                    cmdSelect.Parameters.AddWithValue("@startDate", inicior);
                    cmdSelect.Parameters.AddWithValue("@endDate ", inicior);
                    cmdSelect.Parameters.AddWithValue("@emp", usuario);

                    cmdSelect.Parameters.AddWithValue("@folio", "");
                    cmdSelect.Parameters.AddWithValue("@actividad1", 0);
                    cmdSelect.Parameters.AddWithValue("@actividad2", 0);
                    cmdSelect.Parameters.AddWithValue("@actividad3", 0);
                    cmdSelect.Parameters.AddWithValue("@actividad4", 0);
                    cmdSelect.Parameters.AddWithValue("@actividad5", 0);
                    cmdSelect.Parameters.AddWithValue("@actividad6", 0);
                    cmdSelect.Parameters.AddWithValue("@actividad7", 0);
                    cmdSelect.Parameters.AddWithValue("@foliohrs", horass);
                    fil = cmdSelect.ExecuteNonQuery();
                    conn.Close();
                    if (fil > 0)
                    {

                        folio.Text = "";
                        //actividadx.Text = "";
                        Cargaactividad();

                        addhrs.Text = "";
                   //     MessageBox.Show("Registro guardado ...", "",
                   //MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                  Response.Write("<script> alert('Registro guardado ...') </script>");
                    }
                    else
                    {
                        folio.Text = "";
                        //actividadx.Text = "";
                        Cargaactividad();
                        addhrs.Text = "";

                        MessageBox.Show("Ocurrio un error ...", "",
                 MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                       // Response.Write("<script> alert('Ocurrio un error ...') </script>");

                    }
                }


                folio.Text = "";
                //actividadx.Text = "";
                Cargaactividad();
                addhrs.Text = "";

            }
        }

        catch (Exception ERR)
        {
            folio.Text = "";
            //actividadx.Text = "";
            Cargaactividad();
            addhrs.Text = "";

            string S = ERR.ToString();

        }
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> SearchCustomers(string prefixText, int count)
    {
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["IUSAConnectionString"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select dbo.PROPERCASE(SOLICITANTE) SOLICITANTE from (select distinct(SOLICITANTE) from (SELECT SOLICITANTE, CATEGORIA_NEGOCIO FROM[IUSA].[dbo].[PRETICKET] union all select SOLICITANTE, CATEGORIA_NEGOCIO from [IUSA].[dbo].[REQUERIMIENTO]  ) as asunto WHERE asunto.SOLICITANTE NOT LIKE '%=%') as  reg  where " +
                "reg.SOLICITANTE like  @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                conn.Open();
                List<string> customers = new List<string>();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(sdr["SOLICITANTE"].ToString());
                    }
                }
                conn.Close();
                return customers;
            }
        }
    }



}

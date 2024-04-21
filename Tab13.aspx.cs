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
               
                
                 nombre = HttpContext.Current.Session["Puesto"].ToString();
                usuario = nombre;
                DataTable dtLeft = new DataTable("Supplier");

                dtLeft.Columns.Add(new DataColumn("ID", System.Type.GetType("System.UInt64")));
                dtLeft.Columns.Add(new DataColumn("FOLIO"));
                dtLeft.Columns.Add(new DataColumn("ASUNTO"));
                dtLeft.Columns.Add(new DataColumn("ASUNTO1"));
                dtLeft.Columns.Add(new DataColumn("ASUNTO2"));
                dtLeft.Columns.Add(new DataColumn("ASUNTO3"));
                dtLeft.Columns.Add(new DataColumn("ASUNTO4"));
                dtLeft.Columns.Add(new DataColumn("ASUNTO5"));
                dtLeft.Columns.Add(new DataColumn("ASUNTO6"));
                dtLeft.Columns.Add(new DataColumn("ASUNTO7"));



                BindPrimaryGrid();



                ViewState["dtLeft"] = dtLeft;

            }
            // System.Web.HttpBrowserCapabilities browser = Request.Browser;
        }

        catch (Exception err)
        {
            string errr = err.ToString();
        }
      
    }
   

    //SI SE USA
    private void BindPrimaryGrid()
    {
        try
        {
            string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

            string query = "EXEC [SP_FOL_PRE_P_USER] " + HttpContext.Current.Session["Puesto"].ToString();

            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();

            sda.Fill(dt);
            gvLeft.DataSource = dt;
            gvLeft.DataBind();

        }
        catch (Exception err)
        {
            string ee = err.ToString();
        }
    }

    protected void cmdRight_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dtLeft = (DataTable)ViewState["dtLeft"];
            DataTable dtRight = (DataTable)ViewState["dtRight"];
            int tmp = 1;

            foreach (GridViewRow oItemLeft in gvLeft.Rows)
            {
                if (((System.Web.UI.WebControls.CheckBox)oItemLeft.FindControl("chk")).Checked)
                {
                    dtRight.Rows.Add(gvLeft.DataKeys[oItemLeft.DataItemIndex].Value, oItemLeft.Cells[1].Text, oItemLeft.Cells[2].Text, 0, 0, 0, 0, 0, 0, 0);
                    //dtLeft.Rows.RemoveAt(oItemLeft.DataItemIndex - tmp);
                    tmp++;
                }
            }


            BindPrimaryGrid();
            ViewState["dtLeft"] = dtLeft;
            ViewState["dtRight"] = dtRight;
        }
        catch (Exception err)
        {
            string er = err.ToString();
        }
    }

    protected void cmdLeft_Click(object sender, EventArgs e)
    {

        try
        {
            DataTable dtLeft = (DataTable)ViewState["dtLeft"];
            DataTable dtRight = (DataTable)ViewState["dtRight"];
            int tmp = 0;

            foreach (GridViewRow oItemRight in gvLeft.Rows)
            {
                if (((System.Web.UI.WebControls.CheckBox)oItemRight.FindControl("chk")).Checked)
                {
                    //dtLeft.Rows.Add(gvRight.DataKeys[oItemRight.DataItemIndex].Value, oItemRight.Cells[1].Text, oItemRight.Cells[2].Text);
                    dtRight.Rows.RemoveAt(oItemRight.DataItemIndex - tmp);
                    tmp++;
                }
            }

            gvLeft.DataSource = dtRight;
            gvLeft.DataBind();
            ViewState["dtLeft"] = dtLeft;
            ViewState["dtRight"] = dtRight;
        }
        catch (Exception err)
        {
            string ss = err.ToString();

        }
    }
    // SI SE USA
    protected void cmdUpdate_Click(object sender, EventArgs e)
    {

        string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

        try
        {
            string INSERTA = String.Empty;
            string aas = this.gvLeft.Rows.Count.ToString();
            string timeinin = inicioTabla.Text;

            string inicior = timeinin.Replace("/", "");

            usuario = HttpContext.Current.Session["Puesto"].ToString();
            int suma = 0;
            if (timeinin == "Inicio")
            {
                  Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
            }
            else
            {
                int fil = 0;
                foreach (GridViewRow oItem in gvLeft.Rows)
                {
                    if (((System.Web.UI.WebControls.CheckBox)oItem.FindControl("chk")).Checked)
                    {
                     var z = oItem.FindControl("TBox1") as System.Web.UI.WebControls.TextBox;
                    var z1 = oItem.FindControl("TBox2") as System.Web.UI.WebControls.TextBox;
                    var z2 = oItem.FindControl("TBox3") as System.Web.UI.WebControls.TextBox;
                    var z3 = oItem.FindControl("TBox4") as System.Web.UI.WebControls.TextBox;
                    var z4 = oItem.FindControl("TBox5") as System.Web.UI.WebControls.TextBox;
                    var z5 = oItem.FindControl("TBox6") as System.Web.UI.WebControls.TextBox;
                    var z6 = oItem.FindControl("TBox7") as System.Web.UI.WebControls.TextBox;

                    string variable = oItem.Cells[1].Text;
                    string variable1 = oItem.Cells[2].Text;
                    string variable2 = z.Text;
                    string variable3 = z1.Text;
                    string variable4 = z2.Text;
                    string variable5 = z3.Text;
                    string variable6 = z4.Text;
                    string variable7 = z5.Text;
                    string variable8 = z6.Text;
                    int x = Int32.Parse(z.Text);
                    int x1 = Int32.Parse(z1.Text);
                    int x2 = Int32.Parse(z2.Text);
                    int x3 = Int32.Parse(z3.Text);
                    int x4 = Int32.Parse(z4.Text);
                    int x5 = Int32.Parse(z5.Text);
                    int x6 = Int32.Parse(z6.Text);

                    suma = suma + (x) + (x1) + (x2) + (x3) + (x4) + (x5) + (x6);


                        using (SqlConnection conn = new SqlConnection(cnString))
                        {

                            SqlCommand cmdSelect = conn.CreateCommand();

                            conn.Open();

                            cmdSelect.CommandType = CommandType.StoredProcedure;
                            cmdSelect.CommandText = "Act_Registro";
                            cmdSelect.Connection = conn;

                            cmdSelect.Parameters.AddWithValue("@title", variable);
                            cmdSelect.Parameters.AddWithValue("@description", variable1);
                            cmdSelect.Parameters.AddWithValue("@startDate", inicior);
                            cmdSelect.Parameters.AddWithValue("@endDate ", inicior);
                            cmdSelect.Parameters.AddWithValue("@emp", usuario);

                            cmdSelect.Parameters.AddWithValue("@folio", variable);
                            cmdSelect.Parameters.AddWithValue("@actividad1", x);
                            cmdSelect.Parameters.AddWithValue("@actividad2", x1);
                            cmdSelect.Parameters.AddWithValue("@actividad3", x2);
                            cmdSelect.Parameters.AddWithValue("@actividad4", x3);
                            cmdSelect.Parameters.AddWithValue("@actividad5", x4);
                            cmdSelect.Parameters.AddWithValue("@actividad6", x5);
                            cmdSelect.Parameters.AddWithValue("@actividad7", x6);
                            cmdSelect.Parameters.AddWithValue("@foliohrs", 0);
                            fil = cmdSelect.ExecuteNonQuery();
                            conn.Close();
                        }

                    }

                }
                if (fil > 0)
                {
                    inicioTabla.Text="Inicio";
                    hORASLBL.Text = suma.ToString() + " hrs.";
                    DataTable ds = new DataTable();
                    ds = null;
                    gvLeft.DataSource = null;
                    gvLeft.DataBind();
                    BindPrimaryGrid();


                     Response.Write("<script> alert('Registro guardado ...') </script>");
                }
                else
                {
                    Response.Write("<script> alert('Ocurrio un error ...') </script>");

                }





            }
        }
        catch (Exception err)
        {

            string es = err.ToString();
            //Response.Write("<script> alert('Ocurrio un error ...') </script>");
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

    // SI SE USA
    protected void imgPopup_Click(object sender, EventArgs e)
    {
        Label3.Text = inicioTabla.Text;
    }

  
  
}

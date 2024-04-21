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

public partial class Tab17 : System.Web.UI.Page
{
    string usuario = String.Empty;
    string nombre = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                nombre = "RC190G";//HttpContext.Current.Session["Puesto"].ToString();
                usuario = nombre;
                BindPrimaryGrid();
            }
            //LoadGrid();
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

            GridView1.Visible = true;
            GridView1.DataSource = TraeDatosNet(query);
            GridView1.DataBind();
            Label4.Text = GridView1.Rows.Count.ToString();
            DropDownList1.DataSource = TraeDatosNet("exec sp_semanalista");
            DropDownList1.DataTextField = "Semanas 2016";
            DropDownList1.DataValueField = "Semana";
            DropDownList1.DataBind();

            //DataSet ds = new DataSet();
            //ds= TraeDatosNet("exec sp_semanalista");

            string anio = string.Empty;

            anio = DateTime.Now.Year.ToString();

            DataList1.DataSource=TraeDatosNet("EXEC [SP_HORAS_XSEM] '"+ anio + "0101' ,'" + anio + "1231','" + HttpContext.Current.Session["Puesto"].ToString() +"'");
            DataList1.DataBind();

        }
        catch (Exception err)
        {
            string ee = err.ToString();
        }
    }



    // SI SE USA
    protected void cmdUpdate_Click(object sender, EventArgs e)
    {

        string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

        try
        {
            string INSERTA = String.Empty;
            string aas = this.GridView1.Rows.Count.ToString();
  
            string inicior = DropDownList1.SelectedIndex.ToString();

            usuario = HttpContext.Current.Session["Puesto"].ToString();
            int suma = 0;
            if (inicior == "0")
            {
                Response.Write("<script> alert('Debes selecionar la semana de registro...') </script>");
            }
            else
            {
                int fil = 0;
                foreach (GridViewRow oItem in GridView1.Rows)
                {


                    var cantidad = oItem.FindControl("txtCantidad") as System.Web.UI.WebControls.TextBox;


                    //if (((System.Web.UI.WebControls.CheckBox)oItem.FindControl("chk")).Checked)
                    if (cantidad.Text != "0")
                    {
                        var z = oItem.FindControl("txtCantidad") as System.Web.UI.WebControls.TextBox;
                        var z1 = oItem.FindControl("lblFOLIO") as System.Web.UI.WebControls.Label; 
                        var z2 = oItem.FindControl("lblASUNTO") as System.Web.UI.WebControls.Label; 
                        string variable = oItem.Cells[3].Text;
                        string variable1 = oItem.Cells[4].Text;
                        string variable2 = z.Text;
 
                        int x = Int32.Parse(z.Text);
 
                        inicior = Label3.Text.Substring(0, 10);
                        suma = suma + (x);


                        using (SqlConnection conn = new SqlConnection(cnString))
                        {

                            SqlCommand cmdSelect = conn.CreateCommand();

                            conn.Open();

                            cmdSelect.CommandType = CommandType.StoredProcedure;
                            cmdSelect.CommandText = "Act_Registro";
                            cmdSelect.Connection = conn;

                            cmdSelect.Parameters.AddWithValue("@title", z1.Text);
                            cmdSelect.Parameters.AddWithValue("@description", z2.Text);
                            cmdSelect.Parameters.AddWithValue("@startDate", inicior);
                            cmdSelect.Parameters.AddWithValue("@endDate ", inicior);
                            cmdSelect.Parameters.AddWithValue("@emp", usuario);

                            cmdSelect.Parameters.AddWithValue("@folio", z1.Text);
                            cmdSelect.Parameters.AddWithValue("@actividad1", x);
                            cmdSelect.Parameters.AddWithValue("@actividad2", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad3", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad4", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad5", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad6", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad7", 0);
                            cmdSelect.Parameters.AddWithValue("@foliohrs", 0);
                            fil = cmdSelect.ExecuteNonQuery();
                            conn.Close();
                        }

                    }

                }
                if (fil > 0)
                {
                    //inicioTabla.Text="Inicio";
                    //hORASLBL.Text = suma.ToString() + " hrs.";
                    DataTable ds = new DataTable();
                    ds = null;
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    BindPrimaryGrid();


                    Response.Write("<script> alert('Registro guardado ...') </script>");
                }
                else
                {
                    DataTable ds = new DataTable();
                    ds = null;
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    BindPrimaryGrid();
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

    protected void Buscar_Click(object sender, EventArgs e)
    {
        cmdUpdate0.Visible = true;

        try
        {
            string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

            string query = "EXEC SP_FOL_PRE_P_todo  '" + busquedabt.Text + "'";

            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DropDownList2.SelectedIndex = 0;
            addhrs.Visible = false;
            Label6.Visible = false;
            cmdUpdate1.Visible = false;
            DataTable dt = new DataTable();
            GridView1.Visible = false;
            cmdUpdate.Visible = false;
            GridView2.Visible = true;
            sda.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            busquedabt.Text = "";

        }
        catch (Exception err)
        {
            busquedabt.Text = "";
            string ee = err.ToString();
        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        cmdUpdate0.Visible = true;

        try
        {
            string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

            string query = "EXEC SP_FOL_PRE_P_todo  '" + busquedabt.Text + "'";

            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DropDownList2.SelectedIndex = 0;
            addhrs.Visible = false;
            Label6.Visible = false;
            cmdUpdate1.Visible = false;
            DataTable dt = new DataTable();
            GridView1.Visible = false;
            cmdUpdate.Visible = false;
            GridView2.Visible = true;
            sda.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            busquedabt.Text = "";

        }
        catch (Exception err)
        {
            busquedabt.Text = "";
            string ee = err.ToString();
        }
    }



    // SI SE USA
    protected void imgPopup_Click(object sender, EventArgs e)
    {
        try
        {
            Label3.Text = DropDownList1.SelectedValue.ToString();

        }
        catch (Exception err)
        {

            string ee = err.ToString();
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadGrid();
        }


        catch (Exception err)
        {

            string ee = err.ToString();
        }

    }
    private void LoadGrid()
    {
        try
        {
            string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

            string query = "EXEC [SP_FOL_PRE_P_USER] " + HttpContext.Current.Session["Puesto"].ToString();


            GridView1.DataSource = TraeDatosNet(query);
            GridView1.DataBind();
        }
        catch (Exception err)
        {

            string ee = err.ToString();
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowIndex == 0)
                    e.Row.Style.Add("height", "80px");

                var x = e.Row.FindControl("ESTADOX") as System.Web.UI.WebControls.Label;
                var BOT = e.Row.FindControl("lblFOLIO") as System.Web.UI.WebControls.Label;

                if (x.Text == "1")
                {
                    LinkButton lb = new LinkButton();
                    System.Web.UI.WebControls.Button btt = new System.Web.UI.WebControls.Button
                    {
                        Text = BOT.Text,
                        Height = 20
                    };
                    btt.Click += new EventHandler(btt1);
                    btt.OnClientClick += new EventHandler(btt1);
                    btt.CausesValidation = true;

                    e.Row.Cells[0].Controls.Add(btt);
                }
            }
            //LoadGrid();
        }
        catch (Exception err)
        {

            string ee = err.ToString();
        }
    }

    public void btt1(object sender, EventArgs e)
    {
        try
        {

            string Y = ((System.Web.UI.WebControls.Button)(sender)).Text.ToString();
            TraeDatosNet("EXEC SP_FOL_NO_USER_1 '" + Y + "',' ','" + HttpContext.Current.Session["Puesto"].ToString() + "',2");
            LoadGrid();
        }
        catch (Exception err)
        {

            string ee = err.ToString();
        }
    }

    public DataSet HORASSEMANA(string fechaini, string fechafin, string attid)
    {
        DataSet horas = new DataSet();

        try
        {
            return horas = TraeDatosNet("exec SP_SEMANAATTID '" + fechaini + "','" + fechafin + "','" + attid + "'");

        }

        catch
        {
            return horas;
        }

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string fecinii = string.Empty;
        string fecfini = string.Empty;
        try
        {
            string fechas = DropDownList1.SelectedValue.ToString();
            Label5.Text = " " + DropDownList1.SelectedIndex.ToString();

            Label3.Text = fechas;
            Label3.Text.Substring(0, 10);
            fecinii = Label3.Text.Substring(3, 2) + "/" + Label3.Text.Substring(0, 2) + "/" + Label3.Text.Substring(6, 4);
            fecfini = Label3.Text.Substring(16, 2) + "/" + Label3.Text.Substring(13, 2) + "/" + Label3.Text.Substring(19, 4);

            var semana = HORASSEMANA(fecinii, fecfini, HttpContext.Current.Session["Puesto"].ToString());

            this.Label8.Text = semana.Tables[0].Rows[0][0].ToString() + " hrs";
            switch (semana.Tables[0].Rows[0][1].ToString())
            {
                case "ROJO":
                    this.Label8.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                    break;
                case "VERDE":
                    this.Label8.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                    break;
                case "AMARILLO":
                    this.Label8.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                    break;
                default:
                    this.Label8.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                    break;
            }
        }

        catch (Exception err)
        {

            string ee = err.ToString();
        }

    }

    protected void cmdUpdate0_Click(object sender, EventArgs e)
    {
        string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

        try
        {
            string INSERTA = String.Empty;
            string aas = this.GridView1.Rows.Count.ToString();
            //string timeinin = inicioTabla.Text;

            string inicior = DropDownList1.SelectedIndex.ToString();

            usuario = HttpContext.Current.Session["Puesto"].ToString();
            int suma = 0;
            if (inicior == "0")
            {
                Response.Write("<script> alert('Debes selecionar la semana de registro...') </script>");
            }
            else
            {
                int fil = 0;
                foreach (GridViewRow oItem in GridView2.Rows)
                {

                    var cantidad = oItem.FindControl("txtCantidad0") as System.Web.UI.WebControls.TextBox;


                    //if (((System.Web.UI.WebControls.CheckBox)oItem.FindControl("chk")).Checked)
                    if (cantidad.Text != "0")
                    {
                        var z = oItem.FindControl("txtCantidad0") as System.Web.UI.WebControls.TextBox;
                        var z1 = oItem.FindControl("lblFOLIO0") as System.Web.UI.WebControls.Label;//oItem.FindControl("TBox2") as System.Web.UI.WebControls.TextBox;
                        var z2 = oItem.FindControl("lblASUNTO0") as System.Web.UI.WebControls.Label;//oItem.FindControl("TBox3") as System.Web.UI.WebControls.TextBox;
                        //var z3 = oItem.FindControl("TBox4") as System.Web.UI.WebControls.TextBox;
                        //var z4 = oItem.FindControl("TBox5") as System.Web.UI.WebControls.TextBox;
                        //var z5 = oItem.FindControl("TBox6") as System.Web.UI.WebControls.TextBox;
                        //var z6 = oItem.FindControl("lblFOLIO") as System.Web.UI.WebControls.TextBox;


                        string variable = oItem.Cells[3].Text;
                        string variable1 = oItem.Cells[4].Text;
                        string variable2 = z.Text;
                        //string variable3 = z1.Text;
                        //string variable4 = z2.Text;
                        //string variable5 = z3.Text;
                        //string variable6 = z4.Text;
                        //string variable7 = z5.Text;
                        //string variable8 = z6.Text;
                        int x = Int32.Parse(z.Text);
                        //int x1 = Int32.Parse(z1.Text);
                        //int x2 = Int32.Parse(z2.Text);
                        //int x3 = Int32.Parse(z3.Text);
                        //int x4 = Int32.Parse(z4.Text);
                        //int x5 = Int32.Parse(z5.Text);
                        //int x6 = Int32.Parse(z6.Text);
                        inicior = Label3.Text.Substring(0, 10);
                        suma = suma + (x);


                        using (SqlConnection conn = new SqlConnection(cnString))
                        {

                            SqlCommand cmdSelect = conn.CreateCommand();

                            conn.Open();

                            cmdSelect.CommandType = CommandType.StoredProcedure;
                            cmdSelect.CommandText = "Act_Registro";
                            cmdSelect.Connection = conn;

                            cmdSelect.Parameters.AddWithValue("@title", z1.Text);
                            cmdSelect.Parameters.AddWithValue("@description", z2.Text);
                            cmdSelect.Parameters.AddWithValue("@startDate", inicior);
                            cmdSelect.Parameters.AddWithValue("@endDate ", inicior);
                            cmdSelect.Parameters.AddWithValue("@emp", usuario);

                            cmdSelect.Parameters.AddWithValue("@folio", z1.Text);
                            cmdSelect.Parameters.AddWithValue("@actividad1", x);
                            cmdSelect.Parameters.AddWithValue("@actividad2", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad3", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad4", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad5", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad6", 0);
                            cmdSelect.Parameters.AddWithValue("@actividad7", 0);
                            cmdSelect.Parameters.AddWithValue("@foliohrs", 0);
                            fil = cmdSelect.ExecuteNonQuery();
                            conn.Close();
                        }

                        TraeDatosNet("EXEC SP_FOL_NO_USER '" + z1.Text + "','" + z2.Text + "','" + usuario + "',1");

                    }

                }
                if (fil > 0)
                {
                    //inicioTabla.Text="Inicio";
                    //hORASLBL.Text = suma.ToString() + " hrs.";
                    DataTable ds = new DataTable();
                    ds = null;
                    GridView2.DataSource = null;
                    GridView2.DataBind();
                    GridView2.Visible = false;
                    cmdUpdate0.Visible = false;
                    GridView1.Visible = true;
                    cmdUpdate.Visible = true;
                    BindPrimaryGrid();
                    Response.Write("<script> alert('Registro guardado ...') </script>");

                }
                else
                {
                    cmdUpdate0.Visible = Visible;
                    DataTable ds = new DataTable();
                    ds = null;
                    GridView2.DataSource = null;
                    GridView2.DataBind();
                    GridView2.Visible = false;
                    cmdUpdate0.Visible = false;
                    GridView1.Visible = true;
                    cmdUpdate.Visible = true;
                    BindPrimaryGrid();
                    Response.Write("<script> alert('Ocurrio un error ...') </script>");

                }





            }
        }
        catch (Exception err)
        {

            string es = err.ToString();
            //Response.Write("<script> alert('Ocurrio un error ...') </script>");
            Response.Write("<script> alert('Ocurrio un error ... cmdUpdate0_Click') </script>");
        }
    }

    protected void cmdUpdate1_Click(object sender, EventArgs e)
    {
        string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
        try
        {

            string inicior = DropDownList1.SelectedIndex.ToString();

            string title = DropDownList2.SelectedValue.ToString();

            String fol = HttpContext.Current.Session["Puesto"].ToString();

            if (fol != "")
            {
                if (inicior == "0")
            {

                //MessageBox.Show("Debes selecionar la fecha de registro...", "",
                //     MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
            }
            else
            {
                inicior = Label3.Text.Substring(0, 10);
                usuario = HttpContext.Current.Session["Puesto"].ToString();
                int fil = 0;

                using (SqlConnection conn = new SqlConnection(cnString))
                {


                    SqlCommand cmdSelect = conn.CreateCommand();
                    conn.Open();

                    cmdSelect.CommandType = CommandType.StoredProcedure;
                    cmdSelect.CommandText = "Act_Registro";
                    cmdSelect.Connection = conn;

                    cmdSelect.Parameters.AddWithValue("@title", title);
                    cmdSelect.Parameters.AddWithValue("@description", title);
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
                    cmdSelect.Parameters.AddWithValue("@foliohrs", addhrs.Text);
                    fil = cmdSelect.ExecuteNonQuery();
                    conn.Close();
                    if (fil > 0)
                    {
                        DropDownList2.SelectedIndex = 0;
                        addhrs.Visible = false;
                        cmdUpdate1.Visible = false;
                        cmdUpdate.Visible = true;
                        Label6.Visible = false;
                        addhrs.Text = "0";
                        GridView1.Visible = true;
                        GridView2.Visible = false;
                        BindPrimaryGrid();
                        //     MessageBox.Show("Registro guardado ...", "",
                        //MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                        Response.Write("<script> alert('Registro guardado ...') </script>");
                    }
                    else
                    {

                        addhrs.Visible = false;
                        cmdUpdate1.Visible = false;
                        cmdUpdate.Visible = true;
                        Label6.Visible = false;
                        addhrs.Text = "0";
                        GridView1.Visible = true;
                        GridView2.Visible = false;
                        BindPrimaryGrid();
                        Response.Write("<script> alert('Registro guardado ...') </script>");
                        //MessageBox.Show("Ocurrio un error ...", "", MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);

                        // Response.Write("<script> alert('Ocurrio un error ...') </script>");

                    }
                }
            }

            }
            else
            {
                Response.Write("<script> alert('Dar click en Icono de AT&T se perdió sesión') </script>");
            }
        }
        catch (Exception err)
        {

            string es = err.ToString();
            Response.Write("<script> alert('Ocurrio un error ... cmdUpdate1_Click _TAB17') </script>");
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string actividad = DropDownList2.SelectedValue.ToString();
            if (actividad == "Actividades")
            {
                addhrs.Visible = false;
                cmdUpdate.Visible = true;
                cmdUpdate1.Visible = false;
                cmdUpdate0.Visible = false;
                Label6.Visible = false;
                addhrs.Text = "0";
                GridView1.Visible = true;
                GridView2.Visible = false;
                DropDownList2.SelectedIndex = 0;
            }
            else
            {
                addhrs.Visible = true;
                cmdUpdate.Visible = false;
                cmdUpdate0.Visible = false;
                cmdUpdate1.Visible = true;
                Label6.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = false;

            }

        }

        catch (Exception err)
        {

            string ee = err.ToString();
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        string c = string.Empty;
        string regrevalor = string.Empty;
        int valor = 0;

       
        if (DataList1.Items.Count > 0)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                System.Web.UI.WebControls.Label Prueba = item.FindControl("Horas") as System.Web.UI.WebControls.Label;
                //System.Web.UI.WebControls.Label semanas = item.FindControl("semana") as System.Web.UI.WebControls.Label;
                regrevalor = Prueba.Text.ToString();
                valor = int.Parse(regrevalor);

                if (valor >= 31)
                {
                    Prueba.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");

                    //    this.Label8.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");

                    //case "VERDE":
                    //    this.Label8.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");

                    //case "AMARILLO":
                    //    this.Label8.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                    //e.Item.FindControl("Horas");
                }
                else if (valor <= 30 & valor >= 16)
                {
                    Prueba.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                }

                else if (valor <= 15)
                {
                    Prueba.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                }

                //if (semanas.Text.ToString()  == "42")
                //{
                //    Prueba.Enabled = false;
                //}


            }

        }



        //if (e.Item.ItemType == ListItemType.Header)
        //{
        //    int index = 0;
        //    System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)DataList1.Items[index].FindControl("Horas");
        //    c = ((System.Web.UI.WebControls.Label)DataList1.SelectedItem.FindControl("Horas")).Text;
        //    index = int.Parse(e.Item.FindControl("Horas").ToString());
            
        //    if (index >= 45)
        //    {
               
        //        e.Item.FindControl("Horas"); 

        //    }

        //}
        //else
        //{
        //   // e.Item.Cells[0].ForeColor = System.Drawing.Color.Red;
        //}

        //  if (e.Item.c.RowType == DataControlRowType.DataRow)
        //      4:        {
        //      5:            Literal tot = (Literal)e.Row.FindControl("ltltotal");
        //      6:            Double total = Double.Parse(tot.Text);
        //      7:  
        //        if (total == 500)
        //          9:            {
        //          10:                e.Row.BackColor = Color.FromName("#c6efce");
        //          11:                //e.Row.Cells[2].BackColor = Color.FromName("#c6efce");
        //        }
        //if (total >= 600)
        //          14:            {
        //          15:                e.Row.BackColor = Color.FromName("#ffeb9c");
        //          16:               
        // }
        //                 if (total < 300)
        //                      {
        //                          e.Row.BackColor = Color.FromName("#ffc7ce");

        //       }
        //        }
    }



    protected void busquedabt_TextChanged(object sender, EventArgs e)
    {
    }
}

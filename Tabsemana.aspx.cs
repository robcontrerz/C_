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

public partial class Tabsemana : System.Web.UI.Page
{
    public string usuarioc = string.Empty;
    string usuario = String.Empty;
    string nombre = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                DataSet MENU = new DataSet();
                DataSet ID = new DataSet();
                nombre = HttpContext.Current.Session["Puesto"].ToString();
                usuario = nombre;

                usuarioc = nombre;
                //                MENU = TraeDatosNet("select [ID],[Nombre],[Cargo], ((select count(id) from  SP_EMPRH(x.id)) )ca from SP_EMPRH_1(1) as x WHERE Cargo LIKE  '%DIRE%' OR Cargo LIKE  '%vp%' ORDER BY ca desc");
                MENU = TraeDatosNet("EXEC SP_INICIO_DIRECCION " + nombre);

                string si = MENU.Tables[2].Rows[0][1].ToString();

                inicioTabla.Text = si;
                BindPrimaryGrid();


            }

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
            string timeinin = inicioTabla.Text;

            string inicior = timeinin.Replace("/", "");
            string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

            string query = "EXEC [SP_FOL_PRE_P_USER] '" + HttpContext.Current.Session["Puesto"].ToString() + "','" + inicior + "'";
            //TraeDatosNet
            //SqlConnection con = new SqlConnection(constr);
            //SqlDataAdapter sda = new SqlDataAdapter(query, con);

            //DataTable dt = new DataTable();

            //sda.Fill(dt);
            gvLeft.DataSource = TraeDatosNet(query);
            gvLeft.DataBind();
             //WebDataGrid1.DataSource = TraeDatosNet(query);
             //WebDataGrid1.DataBind();
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
    int fil = 0;
    protected void cmdUpdate_Click(object sender, EventArgs e)
    {

        

        DataTable Dsem = new DataTable("Semana");
        Dsem.Columns.Add(new DataColumn("Horas"));
        Dsem.Columns.Add(new DataColumn("Fecha"));
        Dsem.Columns.Add(new DataColumn("Actividad"));

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
                


                //for (int i = 0; i < gvLeft.Rows.Count; i++)
                //{
                //    var renglon = gvLeft.Rows[i].RowIndex.ToString();

                //    var columna = gvLeft.Columns[i].AccessibleHeaderText.ToString();
                //    //var xx= gvLeft.Columns[0].ItemStyle.HeaderText = "text Here";
                //}

                DataRow dr = Dsem.NewRow();
                foreach (GridViewRow oItem in gvLeft.Rows)
                {
                    if (((System.Web.UI.WebControls.CheckBox)oItem.FindControl("chk")).Checked)
                    {
                        //var xds = oItem.Cells[3].FindControl("DropLUNES1") as DropDownList;

                        string variable = oItem.Cells[1].Text;
                        string variable1 = oItem.Cells[2].Text;
                        var z2 = oItem.FindControl("TBox1") as System.Web.UI.WebControls.TextBox;
                        var z2_1 = oItem.FindControl("Lbllunes") as System.Web.UI.WebControls.Label;
                        var z2_2 = oItem.FindControl("DropLUNES1") as DropDownList;
                        //                             
                        dr["Horas"] = z2.Text.ToString();
                        dr["Fecha"] = z2_1.Text.ToString();
                        dr["Actividad"] = z2_2.SelectedItem.Text.ToString();
                        var z3 = oItem.FindControl("TBox2") as System.Web.UI.WebControls.TextBox;
                        var z3_1 = oItem.FindControl("Lblmartes") as System.Web.UI.WebControls.Label;
                        var z3_2 = oItem.FindControl("DropMARTES") as DropDownList;
                        //                                  
                        dr["Horas"] = z3.Text.ToString();
                        dr["Fecha"] = z3_1.Text.ToString();
                        dr["Actividad"] = z3_2.SelectedItem.Text.ToString();
                        var z4 = oItem.FindControl("TBox3") as System.Web.UI.WebControls.TextBox;
                        var z4_1 = oItem.FindControl("Lblmiercoles") as System.Web.UI.WebControls.Label;
                        var z4_2 = oItem.FindControl("DropMIERCOLES") as DropDownList;
                        //                                 
                        dr["Horas"] = z4.Text.ToString();
                        dr["Fecha"] = z4_1.Text.ToString();
                        dr["Actividad"] = z4_2.SelectedItem.Text.ToString();
                        var z5 = oItem.FindControl("TBox4") as System.Web.UI.WebControls.TextBox;
                        var z5_1 = oItem.FindControl("Lbljueves") as System.Web.UI.WebControls.Label;
                        var z5_2 = oItem.FindControl("DropJUEVES") as DropDownList;
                        //                                    
                        dr["Horas"] = z5.Text.ToString();
                        dr["Fecha"] = z5_1.Text.ToString();
                        dr["Actividad"] = z5_2.SelectedItem.Text.ToString();
                        var z6 = oItem.FindControl("TBox5") as System.Web.UI.WebControls.TextBox;
                        var z6_1 = oItem.FindControl("Lblviernes") as System.Web.UI.WebControls.Label;
                        var z6_2 = oItem.FindControl("DropVIERNES") as DropDownList;
                        //                                  
                        dr["Horas"] = z6.Text.ToString();
                        dr["Fecha"] = z6_1.Text.ToString();
                        dr["Actividad"] = z6_2.SelectedItem.Text.ToString();

                        var z7 = oItem.FindControl("TBox6") as System.Web.UI.WebControls.TextBox;
                        var z7_1 = oItem.FindControl("Lblsabado") as System.Web.UI.WebControls.Label;
                        var z7_2 = oItem.FindControl("DropSABADO") as DropDownList;
                        //                              
                        dr["Horas"] = z7.Text.ToString();
                        dr["Fecha"] = z7_1.Text.ToString();
                        dr["Actividad"] = z7_2.SelectedItem.Text.ToString();

                        var z8 = oItem.FindControl("TBox7") as System.Web.UI.WebControls.TextBox;
                        var z8_1 = oItem.FindControl("Lbldomingo") as System.Web.UI.WebControls.Label;
                        var z8_2 = oItem.FindControl("DropDOMINGO") as DropDownList;
                        //                                  
                        dr["Horas"] = z8.Text.ToString();
                        dr["Fecha"] = z8_1.Text.ToString();
                        dr["Actividad"] = z8_2.SelectedItem.Text.ToString();




                        //add the row to DataTable
                        Dsem.Rows.Add(dr);
                        Inserta(Dsem, variable, variable1);

                           Inserta(Dsem, variable, variable1) ; 
                        //DataRow oItemc in Dsem.Rows)



                    }



                }
                if (fil > 0)
                {
                    inicioTabla.Text = "Inicio";
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

    public void Inserta(DataTable llena,string variable,string variable1)
    {
        DataTable llega = new DataTable();
        string respuesta = "";
        //string variable2 = z2.Text;
        //string variable3 = z2_2.SelectedItem.Text;
        //string variable4 = z2.Text;
        //string variable5 = z3.Text;
        //string variable6 = z4.Text;
        //string variable7 = z5.Text;
        //string variable8 = z6.Text;
        //int x = Int32.Parse(z2.Text);
        //int x1 = Int32.Parse(z3.Text);
        //int x2 = Int32.Parse(z4.Text);
        //int x3 = Int32.Parse(z5.Text);
        //int x4 = Int32.Parse(z6.Text);
        //int x5 = Int32.Parse(z7.Text);
        //int x6 = Int32.Parse(z8.Text);

        //suma = suma + (x) + (x1) + (x2) + (x3) + (x4) + (x5) + (x6);
        string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
        try
        {
              fil = 0;
            for (int i = 0; i < llena.Rows.Count; i++)
            {

                if (int.Parse(llena.Rows[i][0].ToString()) > 0)
                {

                    using (SqlConnection conn = new SqlConnection(cnString))
                    {

                        SqlCommand cmdSelect = conn.CreateCommand();

                        conn.Open();

                        cmdSelect.CommandType = CommandType.StoredProcedure;
                        cmdSelect.CommandText = "Act_Registro";
                        cmdSelect.Connection = conn;

                        cmdSelect.Parameters.AddWithValue("@title", variable);
                        cmdSelect.Parameters.AddWithValue("@description", variable1);
                        //cmdSelect.Parameters.AddWithValue("@startDate", inicior);
                        //cmdSelect.Parameters.AddWithValue("@endDate ", inicior);
                        //cmdSelect.Parameters.AddWithValue("@emp", usuario);

                        //cmdSelect.Parameters.AddWithValue("@folio", variable);
                        //cmdSelect.Parameters.AddWithValue("@actividad1", x);
                        //cmdSelect.Parameters.AddWithValue("@actividad2", x1);
                        //cmdSelect.Parameters.AddWithValue("@actividad3", x2);
                        //cmdSelect.Parameters.AddWithValue("@actividad4", x3);
                        //cmdSelect.Parameters.AddWithValue("@actividad5", x4);
                        //cmdSelect.Parameters.AddWithValue("@actividad6", x5);
                        //cmdSelect.Parameters.AddWithValue("@actividad7", x6);
                        //cmdSelect.Parameters.AddWithValue("@foliohrs", 0);
                        fil = cmdSelect.ExecuteNonQuery();
                        conn.Close();
                        respuesta = fil.ToString();
                    }
                }

            }

            respuesta = "0";
        }
        catch (Exception ex)
        {
            ex.ToString();
            respuesta ="0";

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

        BindPrimaryGrid();
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

                //this.DropLUNES.DataSource = subjects;
                //this.DropLUNES.DataTextField = "DESCRIPCION";
                //this.DropLUNES.DataValueField = "GRUPO";
                //this.DropLUNES.DataBind();


                //this.DropMARTES.DataSource = subjects;
                //this.DropMARTES.DataTextField = "DESCRIPCION";
                //this.DropMARTES.DataValueField = "GRUPO";
                //this.DropMARTES.DataBind();

                //this.DropMIERCOLES.DataSource = subjects;
                //this.DropMIERCOLES.DataTextField = "DESCRIPCION";
                //this.DropMIERCOLES.DataValueField = "GRUPO";
                //this.DropMIERCOLES.DataBind();


            }
            catch (Exception ex)
            {
                // Handle the error
            }

        }

        // Add the initial item - you can add this even if the options from the
        // db were not successfully loaded
        //DropLUNES.Items.Insert(0, new ListItem("<Actividad>", "0"));

    }



    protected void gvLeft_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowIndex == 0)
                e.Row.Style.Add("height", "80px");
        }
    }
}

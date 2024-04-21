using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Capturas : System.Web.UI.Page
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
     

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception err)
            {
                string erre = err.ToString();
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
                usuario = HttpContext.Current.Session["Puesto"].ToString();
                int suma = 0;
                if (timeinin == "Inicio")
                {
                    MessageBox.Show("Debes selecionar la fecha de registro...", "",
                    MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                    //Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
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
                                cmdSelect.Parameters.AddWithValue("@startDate", timeinin);
                                cmdSelect.Parameters.AddWithValue("@endDate ", timeinin);
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
                        hORASLBL.Text = suma.ToString() + " hrs.";
                        DataTable ds = new DataTable();
                        ds = null;
                        gvLeft.DataSource = null;
                        gvLeft.DataBind();
                        BindPrimaryGrid();


                        //Response.Write("<script> alert('Registro guardado ...') </script>");
                    }
                    else
                    {
                        // Response.Write("<script> alert('Ocurrio un error ...') </script>");

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

        // SI SE USA
        protected void Buttactividad_Click(object sender, EventArgs e)
        {

            try
            {
                string INSERTA = String.Empty;
                string horass = addhrs.Text;
                string FOLIO = addEventName.Text;
                string DESC = addEventDesc.Text;
                string usuario;
                string nombre;
                DataSet sem = new DataSet();
                DataSet sem1 = new DataSet();
                nombre = HttpContext.Current.Session["Puesto"].ToString();
                usuario = nombre;
                string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
                if (actividaddia.Text == "Inicio")
                {

                    MessageBox.Show("Debes selecionar la fecha de registro...", "",
                         MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                    //Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
                }
                else
                {
                    int fil = 0;
                    using (SqlConnection conn = new SqlConnection(cnString))
                    {
                        SqlCommand cmdSelect = conn.CreateCommand();
                        conn.Open();

                        cmdSelect.CommandType = CommandType.StoredProcedure;
                        cmdSelect.CommandText = "Act_Registro";
                        cmdSelect.Connection = conn;

                        cmdSelect.Parameters.AddWithValue("@title", FOLIO);
                        cmdSelect.Parameters.AddWithValue("@description", DESC);
                        cmdSelect.Parameters.AddWithValue("@startDate", actividaddia.Text);
                        cmdSelect.Parameters.AddWithValue("@endDate ", actividaddia.Text);
                        cmdSelect.Parameters.AddWithValue("@emp", usuario);

                        cmdSelect.Parameters.AddWithValue("@folio", FOLIO);
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

                            addEventName.Text = "";
                            addEventDesc.Text = "";
                            addhrs.Text = "";
                            MessageBox.Show("Registro guardado ...", "",
                       MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                            //Response.Write("<script> alert('Registro guardado ...') </script>");
                        }
                        else
                        {

                            addEventName.Text = "";
                            addEventDesc.Text = "";
                            addhrs.Text = "";

                            MessageBox.Show("Ocurrio un error ...", "",
                     MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                            // Response.Write("<script> alert('Ocurrio un error ...') </script>");

                        }
                    }



                    addEventName.Text = "";
                    addEventDesc.Text = "";
                    addhrs.Text = "";

                }
            }

            catch (Exception ERR)
            {
                addEventName.Text = "";
                addEventDesc.Text = "";
                addhrs.Text = "";

                string S = ERR.ToString();

            }
        }
        // SI SE USA
        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

            try
            {
                string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

                string query = "EXEC SP_FOL_PRE_P_todo  " + busquedabt.Text;

                SqlConnection con = new SqlConnection(constr);
                SqlDataAdapter sda = new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();

                sda.Fill(dt);
                busquedag.DataSource = dt;
                busquedag.DataBind();
                busquedabt.Text = "";
                busqueda.Visible = true;
            }
            catch (Exception err)
            {
                busquedabt.Text = "";
                string ee = err.ToString();
            }
        }

        protected void busquedamas_Click(object sender, EventArgs e)
        {

            try
            {
                DataTable dtLeft1 = new DataTable("Supplier1");
                dtLeft1.Columns.Add(new DataColumn("ID", System.Type.GetType("System.UInt64")));
                dtLeft1.Columns.Add(new DataColumn("FOLIO"));
                dtLeft1.Columns.Add(new DataColumn("ASUNTO"));
                dtLeft1.Columns.Add(new DataColumn("ASUNTO1"));
                dtLeft1.Columns.Add(new DataColumn("ASUNTO2"));
                dtLeft1.Columns.Add(new DataColumn("ASUNTO3"));
                dtLeft1.Columns.Add(new DataColumn("ASUNTO4"));
                dtLeft1.Columns.Add(new DataColumn("ASUNTO5"));
                dtLeft1.Columns.Add(new DataColumn("ASUNTO6"));
                dtLeft1.Columns.Add(new DataColumn("ASUNTO7"));

                int tmp = 0;

                foreach (GridViewRow oItemLeft in busquedag.Rows)
                {
                    if (((System.Web.UI.WebControls.CheckBox)oItemLeft.FindControl("chk")).Checked)
                    {
                        dtLeft1.Rows.Add(gvLeft.DataKeys[oItemLeft.DataItemIndex].Value, oItemLeft.Cells[1].Text, oItemLeft.Cells[2].Text, 0, 0, 0, 0, 0, 0, 0);

                        tmp++;
                    }
                }

                busquedag.DataSource = dtLeft1;
                busquedag.DataBind();
                BindPrimaryGrid1();
                ViewState["dtLeft1"] = dtLeft1;

            }
            catch (Exception err)
            {
                string sd = err.ToString();
            }

        }
        // SI SE USA
        private void BindPrimaryGrid1()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

                string query = "EXEC SP_FOL_PRE_P_todo  " + busquedabt.Text;

                SqlConnection con = new SqlConnection(constr);
                SqlDataAdapter sda = new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();

                sda.Fill(dt);
                busquedag.DataSource = dt;
                busquedag.DataBind();

            }
            catch (Exception err)
            {
                string ee = err.ToString();
            }
        }

        protected void borrarbusqueda_Click(object sender, EventArgs e)
        {

            try
            {
                DataTable dtLeft1 = (DataTable)ViewState["dtLeft1"];

                int tmp = 0;

                foreach (GridViewRow oItemRight in busquedag.Rows)
                {
                    if (((System.Web.UI.WebControls.CheckBox)oItemRight.FindControl("chk")).Checked)
                    {
                        //dtLeft.Rows.Add(gvRight.DataKeys[oItemRight.DataItemIndex].Value, oItemRight.Cells[1].Text, oItemRight.Cells[2].Text);
                        dtLeft1.Rows.RemoveAt(oItemRight.DataItemIndex - tmp);
                        tmp++;
                    }
                }

                busquedag.DataSource = dtLeft1;
                busquedag.DataBind();
                ViewState["dtLeft1"] = dtLeft1;

            }
            catch (Exception err)
            {
                string er = err.ToString();
            }
        }
        // SI SE USA
        protected void busquedagrabar_Click(object sender, EventArgs e)
        {
            string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

            try
            {
                string INSERTA = String.Empty;
                string aas = this.busquedag.Rows.Count.ToString();
                string timeinin = TextBox1.Text;
                usuario = HttpContext.Current.Session["Puesto"].ToString();
                int suma = 0;
                if (timeinin == "Inicio")
                {
                    MessageBox.Show("Debes selecionar la fecha de registro...", "",
                   MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                    // Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
                }
                else
                {
                    int fil = 0;
                    foreach (GridViewRow oItem in busquedag.Rows)
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
                            cmdSelect.Parameters.AddWithValue("@startDate", timeinin);
                            cmdSelect.Parameters.AddWithValue("@endDate ", timeinin);
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
                    if (fil > 0)
                    {
                        Label2.Text = suma.ToString() + " hrs.";
                        BindPrimaryGrid1();
                        busquedag.DataSource = null;
                        busquedag.DataBind();
                        Label1.Text = timeinin;
                        busqueda.Visible = false;
                        MessageBox.Show("Registro guardado ...", "",
                  MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                        //Response.Write("<script> alert('Registro guardado ...') </script>");
                    }
                    else
                    {
                        MessageBox.Show("Ocurrio un error ...", "",
                  MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                        //Response.Write("<script> alert('Ocurrio un error ...') </script>");

                    }
                }
            }
            catch (Exception err)
            {

                string es = err.ToString();
                MessageBox.Show("Ocurrio un error ...", "",
                 MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                //Response.Write("<script> alert('Ocurrio un error ...') </script>");
            }
        }
        // SI SE USA
        protected void Buttactividad0_Click(object sender, EventArgs e)
        {

            try
            {
                string INSERTA = String.Empty;
                string INICIO = TextBox2.Text;
                string FIN = TextBox3.Text;
                string usuario;
                string nombre;
                DataSet sem = new DataSet();
                DataSet sem1 = new DataSet();
                nombre = HttpContext.Current.Session["Puesto"].ToString();
                usuario = nombre;
                string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
                if (TextBox2.Text == "Inicio" & TextBox3.Text == "Fin")
                {
                    MessageBox.Show("Debes selecionar el periodo de busqueda...", "",
                MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                    //Response.Write("<script> alert('Debes selecionar el periodo de busqueda...') </script>");
                }
                else
                {
                    DataSet reg = new DataSet();
                    reg = TraeDatosNet("Select * from eventos where emp ='" + usuario + "' and startDate between '" + INICIO + "' and '" + FIN + "' order by startDate desc");
                    Resumengrid.DataSource = reg;
                    Resumengrid.DataBind();

                    //Response.Write("<script> alert('Registro guardado ...') </script>");
                }

            }

            catch (Exception ERR)
            {

                string S = ERR.ToString();
                MessageBox.Show("Ocurrio un error ...", "",
               MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                //Response.Write("<script> alert('Ocurrio un error ...') </script>");
            }
        }




        protected void Resumengrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataSet x = new DataSet();
            try
            {
                int id = Int32.Parse(Resumengrid.DataKeys[e.RowIndex].Value.ToString());

                int ID = int.Parse(Resumengrid.Rows[e.RowIndex].Cells[0].ToString());
                x = TraeDatosNet("DELETE FROM [IUSA].[dbo].[eventos] WHERE id =" + ID);
                Resumengrid.DataBind();
                int index = Resumengrid.SelectedIndex;


            }
            catch (Exception err)
            {
                string se = err.ToString();
            }


        }

        // SI SE USA
        protected void Botonborrar_Click(object sender, EventArgs e)
        {

            DataSet x = new DataSet();
            try
            {
                string usuario;
                string nombre;
                string INICIO = TextBox2.Text;
                string FIN = TextBox3.Text;

                nombre = HttpContext.Current.Session["Puesto"].ToString();
                usuario = nombre;



                foreach (GridViewRow oItemRight in Resumengrid.Rows)
                {
                    if (((System.Web.UI.WebControls.CheckBox)oItemRight.FindControl("chk")).Checked)
                    {
                        string strEmail = ((System.Web.UI.WebControls.Label)oItemRight.FindControl("id")).Text;


                        x = TraeDatosNet("DELETE FROM [IUSA].[dbo].[eventos] WHERE id =" + strEmail);

                    }
                }
                //consulta de nuevo la tabla enventos

                DataSet reg = new DataSet();

                reg = TraeDatosNet("Select * from eventos where emp ='" + usuario + "' and startDate between '" + INICIO + "' and '" + FIN + "'");
                Resumengrid.DataSource = reg;
                Resumengrid.DataBind();


            }
            catch (Exception err)
            {
                string er = err.ToString();
            }
        }

    }

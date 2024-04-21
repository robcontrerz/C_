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

public partial class Capturas : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string usuario;
        string nombre;
        DataSet sem = new DataSet();
        DataSet sem1 = new DataSet();
        try
        {
            if (!IsPostBack)
            {
                // Call FillGridView Method
                //FillGridView();

                nombre = HttpContext.Current.Session["Puesto"].ToString();
                usuario = nombre;
                //FOLIOS
               
                //sem = TraeDatosNet("EXEC SP_FOLIOS " + usuario);
                sem = TraeDatosNet("EXEC [SP_FOL_PRE_P_USER] " + usuario);
                //sem = TraeDatosNet("SELECT  DISTINCT (a.ID_REQUERIMIENTO), A.[ASUNTO]   FROM[IUSA].[dbo].[REQUERIMIENTO]  a  left join[IUSA].[dbo].[PRETICKET] b on a.ID_REQUERIMIENTO = b.ID_REQUERIMIENTO where  b.BA = (SELECT CONVERT(varchar(255), isnull([Primer apellido], '') + ' ' + isnull([Segundo apellido], '') + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "')   Or b.BC =( SELECT CONVERT(varchar(255), isnull([Primer apellido],'') + ' ' + isnull([Segundo apellido],'')  + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "')  ORDER BY A.ID_REQUERIMIENTO ");
                GridView2.DataSource = sem;
                GridView2.DataBind();

                lblTemp.Text = GridView2.Rows.Count.ToString();
                ////PRETICKET
                //sem1 = TraeDatosNet("EXEC [SP_pretickect] '" + usuario + "'");
                //GridView3.DataSource = sem1;
                //GridView3.DataBind();

                //Label1.Text = GridView3.Rows.Count.ToString();
            }

        }
        catch (Exception err)
        {
            string ct = err.ToString();
            Response.Redirect("Capturas.aspx", false);
        }
    }


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
            GridView3.DataSource = dt;
            GridView3.DataBind();
            busquedabt.Text = "";
           
        }
        catch (Exception err)
        {
            busquedabt.Text = "";
            string ee = err.ToString();
        }
    }

    /// <summary>
    /// Fill record into GridView
    /// </summary>
    public void FillGridView()
    {
        string usuario;
        string nombre;
        try
        {
            nombre = HttpContext.Current.Session["Puesto"].ToString();
            usuario = nombre;
            string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cnString);
            GlobalClass.adap = new SqlDataAdapter("select * FROM [IUSA].[dbo].[eventos] where emp ='" + usuario + "' order  by fechacaptura", con);
            SqlCommandBuilder bui = new SqlCommandBuilder(GlobalClass.adap);
            GlobalClass.dt = new DataTable();
            GlobalClass.adap.Fill(GlobalClass.dt);
            //GridView1.UseAccessibleHeader = true;


            ////GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            //GridView1.DataSource = GlobalClass.dt;
            //GridView1.DataBind();
        }
        catch
        {
            Response.Write("<script> alert('Error...') </script>");
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
    protected void Btnfolios_Click(object sender, EventArgs e)
    {
        string usuario;
        string nombre;
        DataSet sem = new DataSet();
        DataSet sem1 = new DataSet();
        nombre = HttpContext.Current.Session["Puesto"].ToString();

        usuario = nombre;
        string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
        try
        {
            nombre = HttpContext.Current.Session["Puesto"].ToString();
            usuario = nombre;
            string INSERTA = String.Empty;
            string aas = this.GridView2.Rows.Count.ToString();
            string timeinin = inicioTabla.Text;
            //string timefin = Hidden2.Value;

            //if (timeinin == "fecha captura")
            if (timeinin == "fecha captura")
            {
                Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
            }
            else
            {
                int fil = 0;
                int suma = 0;
                foreach (GridViewRow row in GridView2.Rows)
                {

                    CheckBox cb = (CheckBox)row.FindControl("ProductSelector");
                    if (cb != null && cb.Checked)
                    {

                        //string dd = row.Cells[1].ToString();

                        // First, get the ProductID for the selected row
                        string productID = GridView2.DataKeys[row.RowIndex].Value.ToString();


                        var z = row.FindControl("TBox1") as System.Web.UI.WebControls.TextBox;
                        var z1 = row.FindControl("TBox2") as System.Web.UI.WebControls.TextBox;
                        var z2 = row.FindControl("TBox3") as System.Web.UI.WebControls.TextBox;
                        var z3 = row.FindControl("TBox4") as System.Web.UI.WebControls.TextBox;
                        var z4 = row.FindControl("TBox5") as System.Web.UI.WebControls.TextBox;
                        var z5 = row.FindControl("TBox6") as System.Web.UI.WebControls.TextBox;
                        var z6 = row.FindControl("TBox7") as System.Web.UI.WebControls.TextBox;

                        string variable = row.Cells[1].Text;
                        string variable1 = row.Cells[2].Text;
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
                    sem = TraeDatosNet("EXEC [SP_FOL_PRE_P_USER] " + usuario);
                    GridView2.DataSource = sem;
                    GridView2.DataBind();
                    Response.Write("<script> alert('Registro guardado ...') </script>");
                }
                else
                {
                    Response.Write("<script> alert('Ocurrio un error ...') </script>");
                }

            }

            //UncheckAll_Click();
           
            //FillGridView();

        }
        catch (Exception err)
        {

            string es = err.ToString();

        }
    }




    protected void Butpreti_Click(object sender, EventArgs e)
    {
        string usuario;
        string nombre;
        DataSet sem = new DataSet();
        DataSet sem1 = new DataSet();
        nombre = HttpContext.Current.Session["Puesto"].ToString();

        usuario = nombre;
        string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
        try
        {
            nombre = HttpContext.Current.Session["Puesto"].ToString();
            usuario = nombre;
            string INSERTA = String.Empty;
            string aas = this.GridView3.Rows.Count.ToString();
            string timeinin = inicioTabla.Text;
            //string timefin = Hidden2.Value;

            //if (timeinin == "fecha captura")
            if (timeinin == "fecha captura")
            {
                Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
            }
            else
            {

                int fil = 0;
                foreach (GridViewRow row in GridView3.Rows)
                {

                    CheckBox cb = (CheckBox)row.FindControl("ProductSelector");
                    if (cb != null && cb.Checked)
                    {
                        string productID = GridView3.DataKeys[row.RowIndex].Value.ToString();
                        var z = row.FindControl("TBox7") as TextBox;
                        var z1 = row.FindControl("TBox8") as TextBox;
                        var z2 = row.FindControl("TBox9") as TextBox;
                        var z3 = row.FindControl("TBox10") as TextBox;
                        var z4 = row.FindControl("TBox11") as TextBox;
                        var z5 = row.FindControl("TBox12") as TextBox;
                        var z6 = row.FindControl("TBox13") as TextBox;
                        string variable = row.Cells[1].Text;
                        string variable1 = row.Cells[2].Text;
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
                        int suma = (x) + (x1) + (x2) + (x3) + (x4) + (x5) + (x6);

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
                    GridView3.DataSource = null;
                    GridView3.DataBind();
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

        }
    }

    protected void Buttactividad_Click(object sender, EventArgs e)
    {
        //string sdfsa = e.ToString();
        //string timeinin = inicioTabla.Text;

        try
        {
            string INSERTA = String.Empty;
            string horass = addhrs.Value;
            string FOLIO = addEventName.Text;
            string DESC = addEventDesc.Text;
            string usuario;
            string nombre;
            DataSet sem = new DataSet();
            DataSet sem1 = new DataSet();

            nombre = HttpContext.Current.Session["Puesto"].ToString();
            usuario = nombre;
            string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

            if (inicioTabla.Text == "fecha captura")
            {
                Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(cnString))
                {
                     
                    SqlCommand cmdSelect =  conn.CreateCommand();

                    conn.Open();
                     
                    cmdSelect.CommandType = CommandType.StoredProcedure;
                    cmdSelect.CommandText = "Act_Registro";
                    cmdSelect.Connection = conn;

                    cmdSelect.Parameters.AddWithValue("@title", FOLIO);
                    cmdSelect.Parameters.AddWithValue("@description", DESC);
                    cmdSelect.Parameters.AddWithValue("@startDate", inicioTabla.Text);
                    cmdSelect.Parameters.AddWithValue("@endDate ", inicioTabla.Text);
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
                    int fil =   cmdSelect.ExecuteNonQuery();
                    conn.Close();
                    if (fil > 0)
                    {
                        //Todo ha ido 
                        Response.Write("<script> alert('Registro guardado ...') </script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('Ocurrio un error ...') </script>");
                        //No se ha ejecutado correctamente
                    }
                }
                //    INSERTA = "INSERT INTO [IUSA].[dbo].[eventos]  ([title],[description],[startDate],[endDate],[emp],[folio],[actividad1],[actividad2],[actividad3],[actividad4],[actividad5],[actividad6],[foliohrs],fechacaptura) ";
                //INSERTA = INSERTA + " VALUES (' " + FOLIO + "','" + DESC + "','" + inicioTabla.Text + "','" + inicioTabla.Text + "','" + usuario + "','" + FOLIO + "',0,0,0,0,0,0," + horass + " ,getdate() )";
                //var s = TraeDatosNet(INSERTA);
               
                // addEventName  = "";
                addEventName.Text = "";
                addEventDesc.Text = "";
                addhrs.Value = "";
                //FillGridView();
                //string A = this.addEventStartDate.Value;
                //string b = addEventEndDate.Value;
                //var x = FindControl("addEventStartDate") as TextBox;
            }
        }

        catch (Exception ERR)
        {
            addEventName.Text = "";
            addEventDesc.Text = "";
            addhrs.Value = "";
            FillGridView();
            string S = ERR.ToString();

        }
    }






    //protected void GridView2_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    //{
    //    decimal ldec_grd_tot = 0;

    //    if (GridView2.Rows.Count > 0)
    //    {

    //        for (int i = 0; i < GridView2.Rows.Count; i++)
    //        {
    //            decimal ld_tot = 0;
    //            bool isChecked_Short;
    //            GridViewRow row = GridView2.Rows[i];

    //            if (isChecked_Short = ((CheckBox)row.FindControl("ProductSelector")).Checked)
    //            {
    //                ld_tot = Convert.ToDecimal(((TextBox)row.FindControl("TBox1")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox2")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox3")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox4")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox5")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox6")).Text);
    //            }
    //            ldec_grd_tot = ldec_grd_tot + ld_tot;
    //        }

    //    }
    //    Totalhrs.Text = ldec_grd_tot.ToString();
    //}

    //protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    decimal ldec_grd_tot = 0;

    //    if (GridView2.Rows.Count > 0)
    //    {

    //        for (int i = 0; i < GridView2.Rows.Count; i++)
    //        {
    //            decimal ld_tot = 0;
    //            bool isChecked_Short;
    //            GridViewRow row = GridView2.Rows[i];

    //            if (isChecked_Short = ((CheckBox)row.FindControl("ProductSelector")).Checked)
    //            {
    //                ld_tot = Convert.ToDecimal(((TextBox)row.FindControl("TBox1")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox2")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox3")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox4")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox5")).Text) + Convert.ToDecimal(((TextBox)row.FindControl("TBox6")).Text);
    //            }
    //            ldec_grd_tot = ldec_grd_tot + ld_tot;
    //        }

    //    }
    //    Totalhrs.Text = ldec_grd_tot.ToString();
    //}

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
            //    MessageBox.Show("Debes selecionar el periodo de busqueda...", "",
            //MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
                 Response.Write("<script> alert('Debes selecionar el periodo de busqueda...') </script>");
            }
            else
            {
                DataSet reg = new DataSet();
                reg = TraeDatosNet("Select * from eventos where emp ='" + usuario + "' and startDate between '" + INICIO + "' and '" + FIN + "' order by ID desc");
                Resumengrid.DataSource = reg;
                Resumengrid.DataBind();

                //Response.Write("<script> alert('Registro guardado ...') </script>");
            }

        }

        catch (Exception ERR)
        {

            string S = ERR.ToString();
           // MessageBox.Show("Ocurrio un error ...", "",
           //MessageBoxButtons.OKCancel, MessageBoxIcon.Asterisk);
            Response.Write("<script> alert('Ocurrio un error ...') </script>");
        }
    }

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

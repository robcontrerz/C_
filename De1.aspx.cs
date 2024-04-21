using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using Office = Microsoft.Office.Core;
using Excel = Microsoft.Office.Interop.Excel;

public partial class _De1    : System.Web.UI.Page
{
    public string usuarioc = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //loading.Visible = true;
        string _Nombre;
        DataSet loge = new DataSet();
        string _Respuesta;
        string _NombreEmpleado;
        string _Puesto;
        string _consultor;
        DataSet global = new DataSet();
        try
        {
            if (!IsPostBack)
            {
                //CSP.User userx = (CSP.User)System.Web.HttpContext.Current.User;

                //string nombre = userx.attuid.ToString();

                string nombre = "HC477C"; //comentar PARA PRODUCCION

                loge = sp_log(nombre, "");
 
                _Nombre = loge.Tables[0].Rows[0][0].ToString();
                _Respuesta = loge.Tables[0].Rows[0][1].ToString();
                _NombreEmpleado = loge.Tables[0].Rows[0][2].ToString();
                _Puesto = loge.Tables[0].Rows[0][10].ToString();


                if (_Nombre != "")
                {


                    Session.Add("Nombre", _Nombre);
                    Session.Add("Respuesta", _Respuesta);
                    Session.Add("NombreEmpleado", _NombreEmpleado);
                    Session.Add("Puesto", _Puesto);


                    global = TraeDatosNet("EXEC [SP_VALIDA1] " + nombre);

                    _consultor = global.Tables[0].Rows[0][5].ToString();
                    _Nombre = global.Tables[0].Rows[0][2].ToString();

                    if (_consultor == "CONSULTOR")
                    {
                        string nombre1 = _Nombre;// HttpContext.Current.Session["NombreEmpleado"].ToString();

                        string a = "1";
                        Panel5.Visible = false;
                        Panel6.Visible = true;
                        Panel9.Visible = false;
                        Panel10.Visible = false;
                        Panel12.Visible = false;

                        //loading.Visible = false;

                        IframeDoctos.Attributes.Add("src", "Tab13.aspx");
                        //Response.Redirect("Tab13.aspx", false);
                        //loading.Visible = false;
                    }
                    else
                    {
                        string a = "2";
                        string nombre1 = _Nombre;// HttpContext.Current.Session["NombreEmpleado"].ToString();
                                                 //string nombre1 = HttpContext.Current.Session["NombreEmpleado"].ToString();

                        DataSet sem = new DataSet();
                        DataSet TOT = new DataSet();
                        DataSet empt = new DataSet();
                        DataSet MENU = new DataSet();
                        DataSet ID = new DataSet();
                        DataSet EXTERNO = new DataSet();


                        EXTERNO = TraeDatosNet("exec [SP_EXTERNOS]");
                        DataList4.DataSource = EXTERNO.Tables[0];
                        DataList4.DataBind();

                        usuarioc = nombre;
                        //                MENU = TraeDatosNet("select [ID],[Nombre],[Cargo], ((select count(id) from  SP_EMPRH(x.id)) )ca from SP_EMPRH_1(1) as x WHERE Cargo LIKE  '%DIRE%' OR Cargo LIKE  '%vp%' ORDER BY ca desc");
                        MENU = TraeDatosNet("EXEC SP_INICIO_DIRECCION " + nombre);

                        DataList1.DataSource = MENU.Tables[0];
                        DataList1.DataBind();
                        DataList2.DataSource = MENU.Tables[0];
                        DataList2.DataBind();

                        DataList3.DataSource = MENU.Tables[3];
                        DataList3.DataBind();


                        //PRETICKETS
                        DataList6.DataSource = MENU.Tables[4];
                        DataList6.DataBind();
                        //CalendarEvent x = new CalendarEvent();
                        //x.emp = nombre;
                        // sem = TraeDatosNet("SELECT [Semanas 2016],CONVERT(VARCHAR(10), [Comienza] , 112),CONVERT(VARCHAR(10), [Finaliza] , 112),[SEMANA],[year]  FROM [IUSA].[dbo].[SEMANAS] where SEMANA = (select datepart(WEEK,GETDATE())- 1) and year =datepart(YEAR,GETDATE())");
                        //sem.Tables.Add(MENU.Tables[2]);
                        //ID.Tables.Add(MENU.Tables[1]);
                        //var EMPLEADO = MENU.Tables[1];


                        var regresem = sem;
                        this.NOMBREEMP.Text = nombre1;


                        Lblanio.Text = MENU.Tables[2].Rows[0][4].ToString();
                        string si = MENU.Tables[2].Rows[0][1].ToString();
                        string sf = MENU.Tables[2].Rows[0][2].ToString();
                        inicioTabla.Text = si;
                        finTabla.Text = sf;
                        color(MENU.Tables[1].Rows[0][0].ToString());

                        string empladoid = MENU.Tables[1].Rows[0][0].ToString();
                        string TOTAL = "EXEC [SP_PROYECTOS_TOTAL] '" + si + "','" + sf + "'," + empladoid;

                        TOT = TraeDatosNet(TOTAL);
                        var TOT1 = TOT;
                        DataTable table;
                        table = TOT.Tables[0];

                        switch (TOT1.Tables[0].Rows[0][1].ToString())
                        {
                            case "rojo":
                                this.estatusHoras.Attributes.Add("class", "rojo-status");
                                this.ESTADOCOLOR.Text = "rojo";
                                /*
                                this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                                this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                                this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                                this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                                this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                                this.Lblazul.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                                this.lblazultot.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                                this.Lblazultotal.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                                this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
                                 */

                                break;
                            case "verde":
                                this.estatusHoras.Attributes.Add("class", "verde-status");
                                this.ESTADOCOLOR.Text = "verde";
                                /*
                                this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                                this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                                this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                                this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                                this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                                this.Lblazul.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                                this.lblazultot.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                                this.Lblazultotal.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                                this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
                                 * */

                                break;
                            case "amarillo":
                                this.estatusHoras.Attributes.Add("class", "amarillo-status");
                                this.ESTADOCOLOR.Text = "amarillo";
                                /*
                                this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                                this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                                this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                                this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                                this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                                this.Lblazul.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                                this.lblazultot.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                                this.Lblazultotal.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                                this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
                                 */

                                break;
                            default:
                                this.estatusHoras.Attributes.Add("class", "naranja-status");
                                this.ESTADOCOLOR.Text = "";
                                /*
                                this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                                this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                                this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                                this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                                this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                                this.Lblazul.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                                this.lblazultot.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                                this.Lblazultotal.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                                this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                                 * */

                                break;
                        }

                        object sumObject;
                        sumObject = table.Compute("Sum(hrs)", "Estatus is not null");
                        empt = TraeDatosNet("select distinct(COUNT(id)) from[dbo].[SP_EMPRH](" + empladoid + ")");



                        this.Lblazul.Text = empt.Tables[0].Rows[0][0].ToString() + " <b>colaboradores</b>";
                        this.lblazultot.Text = sumObject.ToString() + " <b>horas devengadas</b>";
                        this.Lblazultotal.Text = TOT1.Tables[1].Rows[0][3].ToString() + " <b>% de carga</b>";
                        this.Lblsemana.Text = TOT1.Tables[1].Rows[0][2].ToString() + " <b>horas planeadas</b>";

                        foreach (DataRow row in TOT1.Tables[0].Rows)
                        {
                            if (row["Estatus"].ToString() == "amarillo")
                            {
                                Lblamarillo.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                                Lblamarillohrs.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";
                            }
                            else if (row["Estatus"].ToString() == "verde")
                            {
                                Lblverde.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                                Lblverdehrs.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";
                            }
                            else if (row["Estatus"].ToString() == "rojo")
                            {
                                Lblrojo.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                                Lblrojohrs.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";

                            }
                            else if (row["Estatus"].ToString() == "gris")
                            {
                                Lbliguala.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                                Lbliguala1.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";

                            }
                        }


                        this.Label2.Text = MENU.Tables[1].Rows[0][5].ToString();//"Maria Eugenia Ayala Porras";
                        this.Lablid.Text = empladoid;
                        this.Label1.Text = MENU.Tables[1].Rows[0][9].ToString();//"Director Ej Gestion  y Real de Serv";

                        DataSet ds = new DataSet();
                        DataSet ds1 = new DataSet();
                        DataSet ds2 = new DataSet();

                        gvCustomers.DataSource = TraeDatosNet("EXEC SP_HORAS_SEMANA_year_3 '" + si + "','" + sf + "'," + empladoid + ",2");
                        gvCustomers.DataBind();

                        //gvCustomers.DataSource = GetData("EXEC SP_JUNTA_PROYECTOS '" + si + "','" + sf + "',"+ empladoid + ", 1");
                        //gvCustomers.DataBind();

                        detalles(si, sf, empladoid, MENU.Tables[1].Rows[0][5].ToString());

                        Lblanio.Text = "";
                        //loading.Visible = false;
                    }




                }

            }
        }
        catch (Exception err)
        {
            //loading.Visible = false;
            string tex = err.StackTrace.ToString();
            grabalog("Page_Load DEFAULT.ASPX" + tex);
            // Response.Redirect("Login.aspx", false);
        }

    }

    public DataSet sp_log(string usr, string pass)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        try
        {
            conn.Open();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@NE", SqlDbType.VarChar);
            param[0].Value = usr;
            //param[1] = new SqlParameter("@PA", SqlDbType.VarChar);
            //param[1].Value = pass;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_VALIDA1";
            cmd.Connection = conn;
            cmd.Parameters.AddRange(param);
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {

            string tex = ex.Message.ToString();

            return ds;
        }
        finally
        {
            conn.Close();
            ((IDisposable)conn).Dispose();
            ((IDisposable)cmd).Dispose();
            ((IDisposable)da).Dispose();
            System.GC.Collect();
        }
    }


    private static void grabalog(string error)
    {
        try
        {
            const string fic = @"E:\Sitios\Admon\logadmon.txt";
            //  const string fic = @"c:\Sitios\Admon\logadmon.txt";
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

    public void color(string emp)
    {
        DataSet colores = new DataSet();
        try
        {
            string si = inicioTabla.Text;
            string sf = finTabla.Text;
          

            string inicior = si.Replace("/", "");
            string finr = sf.Replace("/", "");
            colores = TraeDatosNet("EXEC SP_color_hrs1 '" + inicior + "','" + finr + "'," + emp);
            DataRow[] verde;
            DataRow[] rojo;
            DataRow[] amarillo;
            verde = colores.Tables[0].Select("Estatus = 'verde'");
            rojo = colores.Tables[0].Select("Estatus = 'rojo'");
            amarillo = colores.Tables[0].Select("Estatus = 'amarillo'");
            DataTable verdedt = new DataTable("verde");
            DataTable rojodt = new DataTable("rojo");
            DataTable amarillodt = new DataTable("amarillo");

            verdedt = colores.Tables[0].Copy();
            verdedt.Rows.Clear();

            rojodt = colores.Tables[0].Copy();
            rojodt.Rows.Clear();

            amarillodt = colores.Tables[0].Copy();
            amarillodt.Rows.Clear();

            foreach (DataRow row in verde)
            {
                verdedt.ImportRow(row);
            }
            foreach (DataRow row in rojo)
            {
                rojodt.ImportRow(row);
            }
            foreach (DataRow row in amarillo)
            {
                amarillodt.ImportRow(row);
            }



            Gridgris.DataSource = TraeDatosNet("SELECT *,0 [Hrs_Work]  FROM SP_EMPRH(" + emp + ") WHERE id IN(select id from iguala) order by nombre");
            Gridgris.DataBind();
            Gridverde.DataSource = verdedt.DefaultView;
            Gridverde.DataBind();
            Gridamarillo.DataSource = amarillodt.DefaultView;
            Gridamarillo.DataBind();
            Gridrojo.DataSource = rojodt.DefaultView;
            Gridrojo.DataBind();

        }

        catch (Exception err)
        {
            string tex = err.Message.ToString();
            grabalog("color " + tex);
        }

    }

    public void detalles(string fi, string ff, string emp, string name)
    {
        DataSet Total = new DataSet();
        DataSet Total1 = new DataSet();
        try
        {

            //loading.Visible = true;
            string proyect1 = "exec SP_PROYECTOS_1 '" + fi + "','" + ff + "'," + emp + ",1";
            GridView1.DataSource = TraeDatosNet(proyect1);
            GridView1.DataBind();
            string proyectos = "EXEC SP_PROYECTOS_1 '" + fi + "','" + ff + "'," + emp + ",2";
            GridViewTareas.DataSource = TraeDatosNet(proyectos);
            GridViewTareas.DataBind();

            Total = TraeDatosNet(proyect1);
            var TOT1 = Total;
            DataTable table;
            table = Total.Tables[0];

            object sumObject;
            sumObject = table.Compute("Sum(horas)", "tiporegistro is not null");

            Total1 = TraeDatosNet(proyectos);
            var TOT2 = Total1;
            DataTable table1;
            table1 = Total1.Tables[0];

            object sumObject1;
            sumObject1 = table1.Compute("Sum(horas)", "tiporegistro is not null");


            this.Lblname.Text = name;
            this.lblp.Text = "Total horas proyectos: " + sumObject.ToString();

            this.Lblt.Text = "Total horas actividades: " + sumObject1.ToString();

            //loading.Visible = false;

        }
        catch (Exception err)
        {
            //loading.Visible = false;
            string tex = err.Message.ToString();
            grabalog("detalles " + tex);
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

            grabalog("TraeDatosNet DEFAULT.ASPX " + tex);
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

    private static DataTable GetData(string query)
    {
        DataTable x = new DataTable();
        try
        {
            string strConnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandTimeout = 1600;
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
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            grabalog("GetData " + tex);
            return x;
        }
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            string si = inicioTabla.Text;
            string sf = finTabla.Text;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string customerId = gvCustomers.DataKeys[e.Row.RowIndex].Value.ToString();
                GridView gvOrders = e.Row.FindControl("gvOrders") as GridView;

                
                gvOrders.DataSource = TraeDatosNet(string.Format("EXEC SP_JUNTA_PROYECTOS '" + si + "','" + sf + "', {0} , 2 ", customerId));
                gvOrders.DataBind();
                //gvOrders.DataSource = GetData(string.Format("EXEC SP_HORAS_SEMANA_year '" + si + "','" + sf + "', {0} , 1 ", customerId));
                //gvOrders.DataBind();
            }


        }

        catch (Exception err)
        {
            string tex = err.Message.ToString();
            grabalog("OnRowDataBound " + tex);
        }



    }

    protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        { }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            grabalog("gvCustomers_SelectedIndexChanged " + tex);
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
            Lblamarillo.Text = "0";
            Lblamarillohrs.Text = "0";

            Lblverde.Text = "0";
            Lblverdehrs.Text = "0";

            Lblrojo.Text = "0";
            Lblrojohrs.Text = "0";
            Lbliguala.Text = "0";
            Lbliguala1.Text = "0";
            //sem = TraeDatosNet("SELECT [Semanas 2016],CONVERT(VARCHAR(10), [Comienza] , 112),CONVERT(VARCHAR(10), [Finaliza] , 112),[SEMANA],[year]  FROM [IUSA].[dbo].[SEMANAS] where SEMANA = (select datepart(WEEK,GETDATE())- 1) and year =datepart(YEAR,GETDATE())");
            //var regresem = sem;

            //Lblsemana.Text = regresem.Tables[0].Rows[0][0].ToString();
            //Lblanio.Text = regresem.Tables[0].Rows[0][4].ToString();
            string ID = HttpContext.Current.Session["Nombre"].ToString();
            string si = inicioTabla.Text;
            string sf = finTabla.Text;
            string inicior = si.Replace("/", "");
            string finr = sf.Replace("/", "");
            string reg = ((System.Web.UI.WebControls.Image)sender).ImageUrl.ToString();
            var x = reg.Substring(2).ToString();
            String value = ((System.Web.UI.WebControls.Image)sender).ImageUrl.ToString();
            String substring;
            if (int.Parse(value.Length.ToString()) == 11)
            {
                substring = value.Substring(6, 1); ;
            }
            else
            {
                substring = value.Substring(6, 2);
            }
            this.Lablid.Text = substring;
            switch (substring)
            {
                case "1":
                    this.Label2.Text = "Pablo Salazar";
                    this.Label1.Text = "Vp Chief Information";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblsemana.Text = "";
                    //this.Lblanio.Text = "";

                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //colorpane = "#0066FF";
                    break;

                case "4":
                    this.Label2.Text = "Maria Eugenia Ayala Porras";
                    this.Label1.Text = "Director Ej Gestion  y Real de Serv";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //colorpane = "#0066FF";
                    break;
                case "2":
                    this.Label2.Text = "Ernesto Wagner Echeagaray";
                    this.Label1.Text = "Director Ejecutivo IT Quality";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //colorpane = "#EB7400";
                    break;
                case "28":
                    this.Label2.Text = "Ricardo Salas Cobos";
                    this.Label1.Text = "Director Ej Desarrollo y Soporte Aplicac";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //colorpane = "#FFB71C";
                    break;

                case "5":
                    this.Label2.Text = "Luis Fernando Valdeon Villalba";
                    this.Label1.Text = "Director Ej Arquitectura Empresarial";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //colorpane = "#007B3F";
                    break;

                case "7":
                    this.Label2.Text = "Chan Leo, Jose";
                    this.Label1.Text = "Director Ej de Operaciones IT";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    this.Lblsemana.Text = "";
                    this.Lblanio.Text = "";

                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //colorpane = "#0066FF";
                    break;

                case "29":
                    this.Label2.Text = "Estrada Foucher, Raphael Valerio";
                    this.Label1.Text = "Director Ej Compliance";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //colorpane = "#0066FF";
                    break;
                case "36":
                    this.Label2.Text = "Sanchez Garcia, Iliana Cecilia";
                    this.Label1.Text = "Technology Director";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //colorpane = "#EB7400";
                    break;
                case "27":
                    this.Label2.Text = "Miranda, Fernando";
                    this.Label1.Text = "Director It";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //colorpane = "#FFB71C";
                    break;

                case "3":
                    this.Label2.Text = "Ramirez Hernandez, Etson Jose Luis";
                    this.Label1.Text = "Director Ejecutivo Seguridad De La Inf";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //colorpane = "#007B3F";
                    break;

                case "31":
                    this.Label2.Text = "Seymour, Jeffrey";
                    this.Label1.Text = "AVP Tech";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //colorpane = "#007B3F";
                    break;

                default:
                    substring = ID.ToString();
                    break;

            }

            color(substring);

            inicioTabla.Text = si;
            finTabla.Text = sf;

            string TOTAL = "EXEC [SP_PROYECTOS_TOTAL] '" + inicior + "','" + finr + "'," + substring;
            TOT = TraeDatosNet(TOTAL);
            var TOT1 = TOT;
            DataTable table;
            table = TOT.Tables[0];
            switch (TOT1.Tables[0].Rows[0][1].ToString())
            {
                case "rojo":
                    this.estatusHoras.Attributes.Add("class", "rojo-status");
                    this.ESTADOCOLOR.Text = "rojo";
                      break;
                case "verde":
                    this.estatusHoras.Attributes.Add("class", "verde-status");
                    this.ESTADOCOLOR.Text = "verde";
                    break;
                case "amarillo":
                    this.estatusHoras.Attributes.Add("class", "amarillo-status");
                    this.ESTADOCOLOR.Text = "amarillo";
                     break;
                default:
                    this.estatusHoras.Attributes.Add("class", "naranja-status");
                    this.ESTADOCOLOR.Text = "";
                    break;
            }
            //switch (TOT1.Tables[0].Rows[0][1].ToString())
            //{
            //    case "rojo":
            //        this.ESTADOCOLOR.Text = "rojo";
            //        this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
            //        this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
            //        this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
            //        this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
            //        this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
            //        this.Lblazul.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
            //        this.lblazultot.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
            //        this.Lblazultotal.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");
            //        this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D9534F");

            //        break;
            //    case "verde":
            //        this.ESTADOCOLOR.Text = "verde";
            //        this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
            //        this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
            //        this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
            //        this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
            //        this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
            //        this.Lblazul.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
            //        this.lblazultot.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
            //        this.Lblazultotal.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");
            //        this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#5CB85C");

            //        break;
            //    case "amarillo":
            //        this.ESTADOCOLOR.Text = "amarillo";
            //        this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
            //        this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
            //        this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
            //        this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
            //        this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
            //        this.Lblazul.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
            //        this.lblazultot.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
            //        this.Lblazultotal.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");
            //        this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#F0AD4E");

            //        break;
            //    default:
            //        this.ESTADOCOLOR.Text = "";
            //        this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
            //        this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
            //        this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
            //        this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
            //        this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
            //        this.Lblazul.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
            //        this.lblazultot.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
            //        this.Lblazultotal.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
            //        this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");

            //        break;
            //}

            object sumObject;
            sumObject = table.Compute("Sum(hrs)", "Estatus is not null");
  

            empt = TraeDatosNet("select distinct(COUNT(id)) from[dbo].[SP_EMPRH](" + substring + ")");
 
            //----------------
            this.Lblazul.Text = empt.Tables[0].Rows[0][0].ToString() + " <b>colaboradores</b>";
            this.lblazultot.Text = sumObject.ToString() + " <b>horas devengadas</b>";
            this.Lblazultotal.Text = TOT1.Tables[1].Rows[0][3].ToString() + " <b>% de carga</b>";
            this.Lblsemana.Text = TOT1.Tables[1].Rows[0][2].ToString() + " <b>horas planeadas</b>";

            foreach (DataRow row in TOT1.Tables[0].Rows)
            {
                if (row["Estatus"].ToString() == "amarillo")
                {
                    Lblamarillo.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                    Lblamarillohrs.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";
                }
                else if (row["Estatus"].ToString() == "verde")
                {
                    Lblverde.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                    Lblverdehrs.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";
                }
                else if (row["Estatus"].ToString() == "rojo")
                {
                    Lblrojo.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                    Lblrojohrs.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";

                }
                else if (row["Estatus"].ToString() == "gris")
                {
                    Lbliguala.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                    Lbliguala1.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";

                }
            }
       
            gvCustomers.DataSource = TraeDatosNet("EXEC SP_HORAS_SEMANA_year_3 '" + si + "', '" + sf + "'," + substring + ",2");
            gvCustomers.DataBind();
            Lblanio.Text = "Vs";

            detalles(inicior, finr, substring, this.Label2.Text);
            Panel5.Visible = true;
            Panel6.Visible = false;
            Panel9.Visible = false;
            Panel10.Visible = false;
            Panel12.Visible = false;
            Panel14.Visible = false;
            Panel16.Visible = false;
            Panel17.Visible = false;
     
            //loading.Visible = false;
        }

        catch (Exception err)
        {
            Panel5.Visible = true;
            Panel6.Visible = false;
            Panel9.Visible = false;
            Panel10.Visible = false;
            Panel12.Visible = false;
            Panel14.Visible = false;
            Panel16.Visible = false;
            Panel17.Visible = false;
            //loading.Visible = false;
            string tex = err.Message.ToString();
            grabalog("A2_Click " + tex);
        }
    }

    protected void Proyectos(object sender, ImageClickEventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DataSet TOT = new DataSet();
        DataSet empt = new DataSet();
        DataSet sem = new DataSet();
        try
        {

            string si = inicioTabla.Text;
            string sf = finTabla.Text;



            string ID = HttpContext.Current.Session["Nombre"].ToString();
            Lblamarillo.Text = "0";
            Lblamarillohrs.Text = "0";

            Lblverde.Text = "0";
            Lblverdehrs.Text = "0";

            Lblrojo.Text = "0";
            Lblrojohrs.Text = "0";
            Lbliguala.Text = "0";
            Lbliguala1.Text = "0";
            string substring = this.Lablid.Text;

            switch (substring)
            {
                case "1":
                    this.Label2.Text = "Pablo Salazar";
                    this.Label1.Text = "Vp Chief Information";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblsemana.Text = "";
                    //this.Lblanio.Text = "";

                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //colorpane = "#0066FF";
                    break;

                case "4":
                    this.Label2.Text = "Maria Eugenia Ayala Porras";
                    this.Label1.Text = "Director Ej Gestion  y Real de Serv";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //colorpane = "#0066FF";
                    break;
                case "2":
                    this.Label2.Text = "Ernesto Wagner Echeagaray";
                    this.Label1.Text = "Director Ejecutivo IT Quality";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //colorpane = "#EB7400";
                    break;
                case "28":
                    this.Label2.Text = "Ricardo Salas Cobos";
                    this.Label1.Text = "Director Ej Desarrollo y Soporte Aplicac";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //colorpane = "#FFB71C";
                    break;

                case "5":
                    this.Label2.Text = "Luis Fernando Valdeon Villalba";
                    this.Label1.Text = "Director Ej Arquitectura Empresarial";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //colorpane = "#007B3F";
                    break;

                case "7":
                    this.Label2.Text = "Chan Leo, Jose";
                    this.Label1.Text = "Director Ej de Operaciones IT";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#1780c3");
                    this.Lblsemana.Text = "";
                    this.Lblanio.Text = "";

                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //colorpane = "#0066FF";
                    break;

                case "29":
                    this.Label2.Text = "Estrada Foucher, Raphael Valerio";
                    this.Label1.Text = "Director Ej Compliance";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
                    //colorpane = "#0066FF";
                    break;
                case "36":
                    this.Label2.Text = "Sanchez Garcia, Iliana Cecilia";
                    this.Label1.Text = "Technology Director";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#EB7400");
                    //colorpane = "#EB7400";
                    break;
                case "27":
                    this.Label2.Text = "Miranda, Fernando";
                    this.Label1.Text = "Director It";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFB71C");
                    //colorpane = "#FFB71C";
                    break;

                case "3":
                    this.Label2.Text = "Ramirez Hernandez, Etson Jose Luis";
                    this.Label1.Text = "Director Ejecutivo Seguridad De La Inf";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //colorpane = "#007B3F";
                    break;

                case "31":
                    this.Label2.Text = "Seymour, Jeffrey";
                    this.Label1.Text = "AVP Tech";
                    //this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblsemana.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //this.Lblanio.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //Titulo1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#007B3F");
                    //colorpane = "#007B3F";
                    break;
                default:
                    substring = ID.ToString();
                    break;
            }

            color(substring);

            inicioTabla.Text = si;
            finTabla.Text = sf;
            string inicior = si.Replace("/", "");
            string finr = sf.Replace("/", "");
            string TOTAL = "EXEC [SP_PROYECTOS_TOTAL] '" + inicior + "','" + finr + "'," + substring;
            TOT = TraeDatosNet(TOTAL);
            var TOT1 = TOT;
            DataTable table;
            table = TOT.Tables[0];

            // Declare an object variable.
            object sumObject;
            sumObject = table.Compute("Sum(hrs)", "Estatus is not null");

            empt = TraeDatosNet("select distinct(COUNT(id)) from[dbo].[SP_EMPRH](" + substring + ")");

 


            this.Lblazul.Text = empt.Tables[0].Rows[0][0].ToString() + " <b>colaboradores</b>";
            this.lblazultot.Text = sumObject.ToString() + " <b>horas devengadas</b>";
            this.Lblazultotal.Text = TOT1.Tables[1].Rows[0][3].ToString() + " <b>% de carga</b>";
            this.Lblsemana.Text = TOT1.Tables[1].Rows[0][2].ToString() + " <b>horas planeadas</b>";



            foreach (DataRow row in TOT1.Tables[0].Rows)
            {
                if (row["Estatus"].ToString() == "amarillo")
                {
                    Lblamarillo.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                    Lblamarillohrs.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";
                }
                else if (row["Estatus"].ToString() == "verde")
                {
                    Lblverde.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                    Lblverdehrs.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";
                }
                else if (row["Estatus"].ToString() == "rojo")
                {
                    Lblrojo.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                    Lblrojohrs.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";

                }
                else if (row["Estatus"].ToString() == "gris")
                {
                    Lbliguala.Text = row.ItemArray[2].ToString() + " <b>Colaboradores</b>";
                    Lbliguala1.Text = row.ItemArray[0].ToString() + " <b>Horas</b>";

                }
            }

            gvCustomers.DataSource = TraeDatosNet("EXEC SP_HORAS_SEMANA_year_3 '" + inicior + "', '" + finr + "'," + substring + ",2");
            gvCustomers.DataBind();


            detalles(inicior, finr, substring, this.Label2.Text);

            //loading.Visible = false;

        }

        catch (Exception err)
        {
            //loading.Visible = false;
            string tex = err.Message.ToString();
            grabalog("Button1_Click " + tex);
        }
    }

    protected void gvCustomers_SelectedIndexChanged1(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string lectureId = string.Empty;
            if (e.CommandName == "Semanas")
            {
                LinkButton lnkView = (LinkButton)e.CommandSource;
                lectureId = lnkView.CommandArgument;

            }
            string si = inicioTabla.Text;
            string sf = finTabla.Text;



            detalles(si, sf, lectureId, ((System.Web.UI.WebControls.LinkButton)e.CommandSource).Text);

            //loading.Visible = false;

        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            grabalog("gvCustomers_SelectedIndexChanged1 " + tex);
        }
    }

    protected void ImageButton2_Click(Object sender, EventArgs e)
    {
        try
        {
            if (HttpContext.Current.Session["Puesto"].ToString()  == "rc190g")
            {
                Response.Redirect("Consulta.aspx", false);
                //loading.Visible = false;
            }
            else
            {
               
                String value = ((System.Web.UI.Control)sender).ClientID.ToString();
                String substring;
                substring = value.Substring(1, 2);
                if (substring.ToString() == "13")
                {
                    Panel5.Visible = false;
                    Panel6.Visible = true;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel12.Visible = false;
                    Panel14.Visible = false;
                    Panel16.Visible = false;
                    Panel17.Visible = false;
                   
                    //loading.Visible = false;

                    IframeDoctos.Attributes.Add("src", "Tab17.aspx");
                    //Response.Redirect("Tab13.aspx", false);
                    //loading.Visible = false;
                }
                else if (substring.ToString() == "14")
                {
                    Panel5.Visible = false;
                    Panel6.Visible = true;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel12.Visible = false;
                    Panel14.Visible = false;
                    Panel16.Visible = false;
                    Panel17.Visible = false;
                   
                    //loading.Visible = false;
                    IframeDoctos.Attributes.Add("src", "Tab14.aspx");
                  //  Response.Redirect("Tab14.aspx", false);
                    //loading.Visible = false;
                }

                else if (substring.ToString() == "15")
                {
                    Panel5.Visible = false;
                    Panel6.Visible = true;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel12.Visible = false;
                    Panel14.Visible = false;
                    Panel16.Visible = false;
                    Panel17.Visible = false;
            
                    //loading.Visible = false;
                    IframeDoctos.Attributes.Add("src", "Tab15.aspx");
                    //Response.Redirect("Tab15.aspx", false);
                    //loading.Visible = false;
                }
                else if (substring.ToString() == "16")
                {
                    Panel5.Visible = false;
                    Panel6.Visible = true;
                    Panel9.Visible = false;
                    Panel10.Visible = false;
                    Panel12.Visible = false;
                    Panel14.Visible = false;
                    Panel16.Visible = false;
                    Panel17.Visible = false;
         
                    //loading.Visible = false;
                    IframeDoctos.Attributes.Add("src", "Tab16.aspx");
                   // Response.Redirect("Tab16.aspx", false);
                    //loading.Visible = false;
                }
            }
           
        }
        catch(Exception err)
        {
            string se = err.ToString();
            //loading.Visible = false;
        }
    }

    protected void ImageButton6_Click(Object sender, EventArgs e)
    {
        try
        {
            Panel5.Visible = false;
            Panel6.Visible = false;
            Panel9.Visible = true;
            Panel10.Visible = false;
            //loading.Visible = false;
            Panel12.Visible = false;

            Panel16.Visible = false;
            Panel17.Visible = false;
            Panel14.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }
        catch { }
       
       

    



    }
 
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            gvCustomers.AllowPaging = false;
            //this.BindGrid();

            gvCustomers.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in gvCustomers.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            gvCustomers.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
            //loading.Visible = false;
        }
    }
 
    protected void A1_Click1(object sender, ImageClickEventArgs e)
    {
        try
        {
            string reg = ((System.Web.UI.WebControls.Image)sender).ImageUrl.ToString();
            var x = reg.Substring(2).ToString();
            String value = ((System.Web.UI.WebControls.Image)sender).ImageUrl.ToString();
            String substring;
            if (int.Parse(value.Length.ToString()) == 11)
            {
                substring = value.Substring(6, 1); ;
            }
            else
            {
                substring = value.Substring(6, 2);
            }


            string ID = HttpContext.Current.Session["Nombre"].ToString();
            Panel5.Visible = false;
            Panel6.Visible = false;
            Panel14.Visible = false;
            Panel16.Visible = false;
            Panel17.Visible = false;
            Panel9.Visible = true;

            Panel10.Visible = true;
            Panel12.Visible = false;
            if (substring == "99")
            {
                Session.Add("Persona", ID);
            }
            else
            {
                Session.Add("Persona", substring);
            }

            //loading.Visible = false;
        }
        catch
        {
            //loading.Visible = false;
        }


    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }

    private void ExportGridToExcel()
    {
        try
        {
            string nombre1 = HttpContext.Current.Session["NombreEmpleado"].ToString();


            string FileName = nombre1 + ".xls";
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename=" + FileName);
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            PInfoempleado.RenderControl(htmlWrite);
            gvCustomers.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();

        }
        catch (Exception err) {
            string error = err.ToString();
        }
      

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
 
    }

    //PROYECTOS 
    protected void A4_Click(object sender, ImageClickEventArgs e)
    {
        string tipo = ((System.Web.UI.WebControls.WebControl)sender).ToolTip.ToString();

        Session.Add("Tipo", tipo);
        //Panel5.Visible = false;
        //Panel6.Visible = false;
        //Panel9.Visible = true;
        //resultados.Visible = false;
        //Panel10.Visible = true;
        //Panel12.Visible = false;
        Panel16.Visible = false;
        Panel17.Visible = false;
        Panel14.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel9.Visible = false;
        Panel10.Visible = false;
        Panel12.Visible = true;
  
        //loading.Visible = false;
    }

    //EXTERNOS
    protected void A5_Click(object sender, ImageClickEventArgs e)
    {
        string EXTERNOS = ((System.Web.UI.WebControls.WebControl)sender).ToolTip.ToString();
        string id = ((System.Web.UI.WebControls.Image)sender).ImageUrl.ToString();
         


        String substring;
        if (int.Parse(id.Length.ToString()) == 11)
        {
            substring = id.Substring(6, 1); ;
        }
        else
        {
            substring = id.Substring(6, 2);
        }

        Session.Add("Externo", substring);
        Session.Add("Externoarea", EXTERNOS);
 
 

        //Panel5.Visible = false;
        //Panel6.Visible = false;
        //Panel9.Visible = true;
        //resultados.Visible = false;
        //Panel10.Visible = true;
        //Panel12.Visible = false;
        Panel16.Visible = true;
        Panel17.Visible = true;
        Panel14.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel9.Visible = false;
        Panel10.Visible = false;
        Panel12.Visible = false;

        //loading.Visible = false;
    }


    //PRETICKETS
    protected void A6_Click(object sender, ImageClickEventArgs e)
    {
        string preticket = ((System.Web.UI.WebControls.WebControl)sender).ToolTip.ToString();

        Session.Add("Preticket", preticket);
        //Panel5.Visible = false;
        //Panel6.Visible = false;
        //Panel9.Visible = true;
        //resultados.Visible = false;
        //Panel10.Visible = true;
        //Panel12.Visible = false;
        Panel16.Visible = false;
        Panel17.Visible = false;
        Panel14.Visible = true;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel9.Visible = false;
        Panel10.Visible = false;
        Panel12.Visible = false;
    
        //loading.Visible = false;
    }
}
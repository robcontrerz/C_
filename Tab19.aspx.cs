using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Profile;
using System.IO;
using System.Drawing;

public partial class Tab19 : System.Web.UI.Page
{
    private string folio = string.Empty;
    private string nonb = string.Empty;

    private DataTable folios= new DataTable();
    private DataTable busqueda = new DataTable();
    private string EXPORTA = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                //nonb = HttpContext.Current.Session["Puesto"].ToString();
                nonb = "gv893y";
                //universityGrid.DataSource = TraeDatosNet("exec SP_FOL__XX '" + nonb + "'");
                //universityGrid.DataBind();
                Getdata();

                //DropEstatus.DataSource = TraeDatosNet("exec SP_ESTADOS");
                //DropEstatus.DataTextField = "ESTADO";
                //DropEstatus.DataValueField = "ESTADO";
                //DropEstatus.DataBind();

 

                
            }
            else
            {
                //DropEstatus.DataSource = TraeDatosNet("exec SP_ESTADOS");
                //DropEstatus.DataTextField = "ESTADO";
                //DropEstatus.DataValueField = "ESTADO";
                //DropEstatus.DataBind();
            }
            //Response.AddHeader("Refresh", Convert.ToString((Session.Timeout * 60) + 5));

            //if (Session["SesionActiva"] == null)
            //    Response.Redirect("Default.aspx");
        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("Page_Load_tab18 " + err);
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
            grabalog("TraeDatosNet " + ex);
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
    public void Getdata()
    {
        try
        {
            //EXPORTA = "1";
            //DataSet Total1 = new DataSet();
            //Total1 = TraeDatosNet("exec SP_FOL__XX gv893y " ) ; 
            ////+ HttpContext.Current.Session["Puesto"].ToString() + "'");
            //universityGrid.DataSource = Total1;
            //universityGrid.DataBind();
            //folios.Clear();
            //folios = Total1.Tables[0] as DataTable;
            //Session.Add("Tabla_folios", folios);
            //Session.Add("Exporta", EXPORTA);


        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("Getdata " + err);
        }
    }

    protected void universityGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        string x = string.Empty;
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    string id1 = universityGrid.DataKeys[e.Row.RowIndex].Value.ToString();
        //    DataTable dt = Getdata1.Clone();
        //    foreach (DataRow dr in Getdata1.Rows)
        //    {
        //        if (dr[2].ToString() == id1)
        //        {
        //            DataRow newdr = dt.NewRow();
        //            newdr[0] = dr[0];
        //            newdr[1] = dr[1];
        //            newdr[2] = dr[2];
        //            dt.Rows.Add(newdr);
        //        }
        //    }
        //    GridView grdview = e.Row.FindControl("clgGrid") as GridView;
        //    grdview.DataSource = dt;
        //    grdview.DataBind();
        //}


    }

    //protected void clgGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    try
    //    {
    //        if (e.Row.RowType == DataControlRowType.DataRow)
    //        {

    //        }
    //    }
    //    catch (Exception err)
    //    {
    //        string tex = err.Message.ToString();
    //        Response.Write("<script> alert('" + err + "') </script>");
    //        grabalog("clgGrid_RowDataBound " + err);
    //    }
    //}




    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string x = string.Empty;

        try
        {

        }

        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("btnUpdate_Click " + err);
        }

    }
    void Popup(bool isDisplay)
    {
        StringBuilder builder = new StringBuilder();
        if (isDisplay)
        {
            builder.Append("<script language=JavaScript> ShowPopup(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowPopup", builder.ToString());
        }
        else
        {
            builder.Append("<script language=JavaScript> HidePopup(); </script>\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "HidePopup", builder.ToString());
        }
    }

    protected void universityGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "ShowPopup")
            {
                LinkButton btndetails = (LinkButton)e.CommandSource;
                GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;

                folio = e.CommandArgument.ToString();
                Session.Add("Foliox", folio);
                Getdataregreso(folio);
                Popup(true);
            }
        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("universityGrid_RowCommand " + err);
        }

    }
    //grabar
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cnString = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
        try
        {

            String fol = HttpContext.Current.Session["Foliox"].ToString();

            String fol1 = HttpContext.Current.Session["Puesto"].ToString();

            if (fol1 != "")
            {

                int fil = 0;

                //TextDrops.Text= DropEstatus.SelectedValue.ToString();

           

            }
            else
            {
                Response.Write("<script> alert('Dar click en Icono de AT&T se perdió sesión') </script>");
            }

        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("Button1_Click " + err);
        }




    }
    private void Getdatavacia()
    {
 
    }
    private void Getdataregreso(string folio)
    {
        string drop = string.Empty;
        try
        {
            DataSet Total1 = new DataSet();
            Total1 = TraeDatosNet("exec SP_FOL__XX_regreso '" + folio + "'");

 
        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("Getdataregreso " + err);
        }
    }

    protected void Buscar_Click(object sender, EventArgs e)
    {

        DataSet Total1 = new DataSet();
        Panel5.Visible = true;
        try
        {
            
            EXPORTA = "2";
            Total1 = TraeDatosNet("EXEC [SP_FOL__XX_busca] '" );
            Session.Add("Exporta", EXPORTA);
            if (Total1.Tables[0].Rows.Count > 0)
            {
 
            }
            else
            {
                //Getdata();
                Response.Write("<script> alert('No existen registros con ese dato...') </script>");
            }

        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("Buscar_Click " + err);
        }

    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        DataTable fo = new DataTable();
        DataTable fo1 = new DataTable();

        fo = HttpContext.Current.Session["Tabla_folios"] as DataTable;
        fo1 = HttpContext.Current.Session["Tabla_busca"] as DataTable;
        string sino = string.Empty;

        sino = HttpContext.Current.Session["Exporta"].ToString();

        try
        {


            if (sino == "1")
            {
 
                ExportaraExcel(fo);
            }
            else if (sino == "2")
            {
                ExportaraExcel(fo1);
            }


        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
        }
        
    }

    public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
    {
       
    }


    private void ExportGridToExcel()
    {
        try
        {
            //string nombre1 = HttpContext.Current.Session["NombreEmpleado"].ToString();
            //string FileName = nombre1 + ".xls";
            Response.AddHeader("content-disposition", "attachment;filename=WRs.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
            //universityGrid.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();
   
        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("ExportGridToExcel " + err);
        }


    }

    protected void ExportToExcel(object sender, EventArgs e)
    {
        try { 
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=WRs.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            //universityGrid.AllowPaging = false;
            //this.Getdata();

            //universityGrid.HeaderRow.BackColor = Color.White;
            //foreach (TableCell cell in universityGrid.HeaderRow.Cells)
            //{
            //    cell.BackColor = universityGrid.HeaderStyle.BackColor;
            //}
            //foreach (GridViewRow row in universityGrid.Rows)
            //{
            //    row.BackColor = Color.White;
            //    foreach (TableCell cell in row.Cells)
            //    {
            //        if (row.RowIndex % 2 == 0)
            //        {
            //            cell.BackColor = universityGrid.AlternatingRowStyle.BackColor;
            //        }
            //        else
            //        {
            //            cell.BackColor = universityGrid.RowStyle.BackColor;
            //        }
            //        cell.CssClass = "textmode";
            //    }
            //}

            //universityGrid.RenderControl(hw);

            ////style to format numbers to string
            //string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            //Response.Write(style);
            //Response.Output.Write(sw.ToString());
            //Response.Flush();
            //Response.End();
        }
        }
        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("ExportToExcel " + err);
        }
    }


    public void ExportaraExcel(DataTable dt)
    {
               
        if (dt.Rows.Count > 0)
        {
            string filename = "Requerimientos.xls";
            System.IO.StringWriter tw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);
            DataGrid dgGrid = new DataGrid
            {
                DataSource = dt
            };
            dgGrid.DataBind();
            dgGrid.RenderControl(hw);
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1");
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
            this.EnableViewState = false;
            Response.Write(tw.ToString());
            Response.End();
        }
    }


 

    protected void DropEstatus_SelectedIndexChanged(object sender, EventArgs e)
    {

        try
        {
            

            //if (DropEstatus.SelectedValue != null)
            //{
            //    TextDrops.Text = DropEstatus.SelectedValue.ToString();
            //}

        }

        catch (Exception err)
        {
            string tex = err.Message.ToString();
            Response.Write("<script> alert('" + err + "') </script>");
            grabalog("DropEstatus_SelectedIndexChanged " + err);
        }

    }





    protected void inicioTabla_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void imgPopup_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
      
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
         
        this.panel6.Visible = true;
        this.pagos.Visible = true;


    }

    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {
       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }

 
    protected void inicioTabla_TextChanged2(object sender, EventArgs e)
    {
        //inicioTabla.Text = inicioTabla.Text;
    }
}
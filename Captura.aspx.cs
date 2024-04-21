using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Mvc;
using System.Data.Odbc;
using System.Text;

public partial class Captura : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet sem = new DataSet();
        DataSet TOT = new DataSet();
        DataSet empt = new DataSet();
        string usuario = string.Empty;
        try {
            string nombre = HttpContext.Current.Session["Puesto"].ToString();

           
            if (!this.IsPostBack)
            {
                usuario = nombre;
                //FOLIOS
                sem = TraeDatosNet("SELECT *  FROM[IUSA].[dbo].[REQUERIMIENTO]  a  left join[IUSA].[dbo].[PRETICKET] b on a.ID_REQUERIMIENTO = b.ID_REQUERIMIENTO where  b.BA = (SELECT CONVERT(varchar(255), isnull([Primer apellido], '') + ' ' + isnull([Segundo apellido], '') + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '"+ usuario + "')   Or b.BC =( SELECT CONVERT(varchar(255), isnull([Primer apellido],'') + ' ' + isnull([Segundo apellido],'')  + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "') ");
                Repeater1.DataSource = sem;
                Repeater1.DataBind();
                //FreezeGridviewHeader(rptTable, _tb, PanelContainer);

                //PRETICKET
                DataTable dt = this.GetData();
                rptTable.DataSource = sem;
                rptTable.DataBind();
                //Building an HTML string.
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table border = '1'>");

                //Building the Header row.
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th class='activoFIjoImg'>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");
                }
                html.Append("</tr>");

                //Building the Data rows.
                foreach (DataRow row in dt.Rows)
                {
                    html.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        html.Append("<td>");
                        html.Append(row[column.ColumnName]);
                        html.Append("</td>");
                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                //PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }

        }
        catch (Exception err)
        {
            string err3 = err.ToString();
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


    #region GridView1 Functions

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
            if (e.Row.RowIndex == 1) { }
        //FreezeGridviewHeader(GridView1, _tb, PanelContainer);
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header) { }
        //AddSortDirectionImage(GridView1, e.Row);
    }

    #endregion


    #region GridView1 Functions
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
            if (e.Row.RowIndex == 1) { }
        //FreezeGridviewHeader(GridView1, _tb, PanelContainer);
    }

    protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header) { }
            //AddSortDirectionImage(GridView1, e.Row);
    }

    #endregion


    protected void FreezeGridviewHeader(GridView _gv1, Table _tb1, Panel _pc1)
    {
        Page.EnableViewState = false;

        //[Español]Copiando las propiedades del renglon de encabezado

        _tb1.Rows.Add(_gv1.HeaderRow);
        _tb1.Rows[0].ControlStyle.CopyFrom(_gv1.HeaderStyle);
        _tb1.CellPadding = _gv1.CellPadding;
        _tb1.CellSpacing = _gv1.CellSpacing;
        _tb1.BorderWidth = _gv1.BorderWidth;

        //if (!_gv1.Width.IsEmpty)
        //_gv1.Width = Unit.Pixel(Convert.ToInt32(_gv1.Width.Value) + Convert.ToInt32(_tb1.Width.Value) + 13);

        //[Español]Copiando las propiedades de cada celda del nuevo encabezado.

        int Count = 0;
        _pc1.Width = Unit.Pixel(100);
        for (Count = 0; Count < _gv1.HeaderRow.Cells.Count - 1; Count++)
        {
            _tb1.Rows[0].Cells[Count].Width = _gv1.Columns[Count].ItemStyle.Width;
            _tb1.Rows[0].Cells[Count].BorderWidth = _gv1.Columns[Count].HeaderStyle.BorderWidth;
            _tb1.Rows[0].Cells[Count].BorderStyle = _gv1.Columns[Count].HeaderStyle.BorderStyle;
            _pc1.Width = Unit.Pixel(Convert.ToInt32(_tb1.Rows[0].Cells[Count].Width.Value) + Convert.ToInt32(_pc1.Width.Value) + 14);
        }
        //Panel1.Width = Unit.Pixel(Convert.ToInt32(_tb1.Rows[0].Cells[Count-1].Width.Value) + 12);
    }



    public void AddSortDirectionImage(GridView gridviewID, GridViewRow itemRow)
    {
        if (gridviewID.AllowSorting == false)
            return;

        Image sortImage = new Image();
        Label space = new Label();

        sortImage.ImageUrl = (gridviewID.SortDirection == SortDirection.Ascending ? @"~/sort_asc.gif" : @"~/sort_desc.gif");
        sortImage.Visible = true;
        space.Text = " ";


        for (int i = 0; i < gridviewID.Columns.Count; i++)
        {
            string colExpr = gridviewID.Columns[i].SortExpression;
            if (colExpr != "" && colExpr == gridviewID.SortExpression)
            {
                itemRow.Cells[i].Controls.Add(space);
                itemRow.Cells[i].Controls.Add(sortImage);
            }
        }
    }


private DataTable GetData()
{
    string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
    using (SqlConnection con = new SqlConnection(constr))
    {
            using (SqlCommand cmd = new SqlCommand("select top 100 * from(SELECT distinct([proyecto]),[asunto],[tipo],[estado] FROM[IUSA].[dbo].[HorasReportadas] where proyecto is not null) as x order by x.proyecto"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
    }
}


    protected void cbCoaching_OnCheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
        RepeaterItem item = (RepeaterItem)chk.NamingContainer;
        Label lblCampCode = (Label)item.FindControl("lblCampCode");
        string CampCode = lblCampCode.Text;//  here i want to get the value of CampCode in that row
    }



    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string Rpt = "Repeater Items Checked:<br />";
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                CheckBox chk = (CheckBox)Repeater1.Items[i].FindControl("TextBox6");
                if (chk.Checked)
                {
                    Rpt += (chk.Text + "<br />");
                }
            }
            string Text = Rpt;
        }
        catch
        {

        }
    }

 
}
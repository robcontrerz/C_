using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPrimaryGrid();
            BindsecondGrid();
            BindSecondaryGrid();
        }
    }

    private void BindsecondGrid()
    {
        try
        {
            string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;
            string query = "EXEC [SP_FOLIOS_TODOS]"; ;

            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);

            DataTable dt = new DataTable();


            sda.Fill(dt);
            GRIDTODOS.DataSource = dt;
            GRIDTODOS.DataBind();
        }
        catch (Exception err)
        {
            string ee = err.ToString();
        }
    }


    private void BindPrimaryGrid()
    {
        try {
            string constr = ConfigurationManager.ConnectionStrings["IUSAConnectionString"].ConnectionString;

           string query = "EXEC [SP_FOL_PRE_P_USER] " + HttpContext.Current.Session["Puesto"].ToString();

            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
          
            DataTable dt = new DataTable();
          

            sda.Fill(dt);
  
            gvAll.DataSource = dt;
            gvAll.DataBind();

        }
        catch (Exception err)
        {
            string ee = err.ToString();
        }
    }

protected void OnPaging(object sender, GridViewPageEventArgs e)
{
    GetData();
        GetData1();
        gvAll.PageIndex = e.NewPageIndex;
    GRIDTODOS.PageIndex = e.NewPageIndex;
    BindPrimaryGrid();
    BindsecondGrid();
    SetData();
    SetData1();
    }

private void GetData()
{
    DataTable dt;
    if (ViewState["SelectedRecords"] != null)
        dt = (DataTable)ViewState["SelectedRecords"];
    else
        dt = CreateDataTable();
    CheckBox chkAll = (CheckBox)gvAll.HeaderRow
                        .Cells[0].FindControl("chkAll");
    for (int i = 0; i < gvAll.Rows.Count; i++)
    {
        if (chkAll.Checked)
        {
            dt = AddRow(gvAll.Rows[i], dt);
        }
        else
        {
            CheckBox chk = (CheckBox)gvAll.Rows[i]
                            .Cells[0].FindControl("chk");
            if (chk.Checked)
            {
                dt = AddRow(gvAll.Rows[i], dt);
            }
            else
            {
                dt = RemoveRow(gvAll.Rows[i], dt);
            }
        }
    }
    ViewState["SelectedRecords"] = dt;
}

    private void GetData1()
    {
        DataTable dt;
        if (ViewState["SelectedRecords"] != null)
            dt = (DataTable)ViewState["SelectedRecords"];
        else
            dt = CreateDataTable();
        CheckBox chkAll = (CheckBox)GRIDTODOS.HeaderRow
                            .Cells[0].FindControl("chkAll");
        for (int i = 0; i < GRIDTODOS.Rows.Count; i++)
        {
            if (chkAll.Checked)
            {
                dt = AddRow(GRIDTODOS.Rows[i], dt);
            }
            else
            {
                CheckBox chk = (CheckBox)GRIDTODOS.Rows[i]
                                .Cells[0].FindControl("chk");
                if (chk.Checked)
                {
                    dt = AddRow(GRIDTODOS.Rows[i], dt);
                }
                else
                {
                    dt = RemoveRow(GRIDTODOS.Rows[i], dt);
                }
            }
        }
        ViewState["SelectedRecords"] = dt;
    }
    private void SetData()
    {
        CheckBox chkAll = (CheckBox)gvAll.HeaderRow.Cells[0].FindControl("chkAll");
        chkAll.Checked = true;
        if (ViewState["SelectedRecords"] != null)
        {
            DataTable dt = (DataTable)ViewState["SelectedRecords"];
            for (int i = 0; i < gvAll.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)gvAll.Rows[i].Cells[0].FindControl("chk");
                if (chk != null)
                {
                    DataRow[] dr = dt.Select("CustomerID = '" + gvAll.Rows[i].Cells[1].Text + "'");
                    chk.Checked = dr.Length > 0; 
                    if (!chk.Checked)
                    {
                        chkAll.Checked = false;
                    }
                }
            }
        }
    }
    private void SetData1()
    {
        CheckBox chkAll = (CheckBox)GRIDTODOS.HeaderRow.Cells[0].FindControl("chkAll");
        chkAll.Checked = true;
        if (ViewState["SelectedRecords"] != null)
        {
            DataTable dt = (DataTable)ViewState["SelectedRecords"];
            for (int i = 0; i < GRIDTODOS.Rows.Count; i++)
            {
                CheckBox chk = (CheckBox)GRIDTODOS.Rows[i].Cells[0].FindControl("chk");
                if (chk != null)
                {
                    DataRow[] dr = dt.Select("CustomerID = '" + GRIDTODOS.Rows[i].Cells[1].Text + "'");
                    chk.Checked = dr.Length > 0;
                    if (!chk.Checked)
                    {
                        chkAll.Checked = false;
                    }
                }
            }
        }
    }

private DataTable CreateDataTable()
{
    DataTable dt = new DataTable();
    dt.Columns.Add("CustomerID");
    dt.Columns.Add("ContactName");
    //dt.Columns.Add("City");
    dt.AcceptChanges();
    return dt;
}

private DataTable AddRow(GridViewRow gvRow, DataTable dt)
{
    DataRow[] dr = dt.Select("CustomerID = '" + gvRow.Cells[1].Text + "'");
    if (dr.Length <= 0)
    {
        dt.Rows.Add();
        dt.Rows[dt.Rows.Count - 1]["CustomerID"] = gvRow.Cells[1].Text;
        dt.Rows[dt.Rows.Count - 1]["ContactName"] = gvRow.Cells[2].Text;
        //dt.Rows[dt.Rows.Count - 1]["City"] = gvRow.Cells[3].Text;
        dt.AcceptChanges();
    }
    return dt;
}

private DataTable RemoveRow(GridViewRow gvRow, DataTable dt)
{
    DataRow[] dr = dt.Select("CustomerID = '" + gvRow.Cells[1].Text + "'");
    if (dr.Length > 0)
    {
        dt.Rows.Remove(dr[0]);
        dt.AcceptChanges();
    }
    return dt;
}

protected void CheckBox_CheckChanged(object sender, EventArgs e)
{
    GetData();
        GetData1();
        SetData();
        SetData1();
        BindSecondaryGrid();
}

private void BindSecondaryGrid()
{
        try
        {
            DataTable dt = (DataTable)ViewState["SelectedRecords"];
            gvSelected.DataSource = dt;
            gvSelected.DataBind();
        }
        catch (Exception err)
        {
            string erar = err.ToString();
        }
}

    protected void Btnfolios_Click(object sender, EventArgs e)
    {
        string usuario;
        string nombre;
        DataSet sem = new DataSet();
        DataSet sem1 = new DataSet();
        try
        {
            nombre = HttpContext.Current.Session["Puesto"].ToString();
            usuario = nombre;
            string INSERTA = String.Empty;
            string aas = this.gvSelected.Rows.Count.ToString();
            string timeinin = inicioTabla.Text;
            //string timefin = Hidden2.Value;

            //if (timeinin == "fecha captura")
            if (timeinin == "Inicio")
            {
                Response.Write("<script> alert('Debes selecionar la fecha de registro...') </script>");
            }
            else
            {


                foreach (GridViewRow row in gvSelected.Rows)
                {

                    //CheckBox cb = (CheckBox)row.FindControl("ProductSelector");
                    //if (cb != null && cb.Checked)
                    //{

                        //string dd = row.Cells[1].ToString();

                        // First, get the ProductID for the selected row
                       // string productID = gvSelected.DataKeys[row.RowIndex].Value.ToString();


                        var z = row.FindControl("TBox1") as TextBox;
                        var z1 = row.FindControl("TBox2") as TextBox;
                        var z2 = row.FindControl("TBox3") as TextBox;
                        var z3 = row.FindControl("TBox4") as TextBox;
                        var z4 = row.FindControl("TBox5") as TextBox;
                        var z5 = row.FindControl("TBox6") as TextBox;
                        var z6 = row.FindControl("TBox7") as TextBox;

                        string variable = row.Cells[0].Text;
                        string variable1 = row.Cells[1].Text;
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
                       Totalhrs.Text =   suma.ToString();
                        INSERTA = "INSERT INTO [IUSA].[dbo].[eventos]  ([title],[description],[startDate],[endDate],[emp],[folio],[actividad1],[actividad2],[actividad3],[actividad4],[actividad5],[actividad6],[actividad7],fechacaptura ) ";
                        INSERTA = INSERTA + " VALUES ('" + variable + "','" + variable1 + "','" + timeinin + "','" + timeinin + "','" + usuario + "','" + variable + "'," + x + "," + x1 + "," + x2 + "," + x3 + "," + x4 + "," + x5 + "," + x6 + "  ,getdate()  )";
                        var s = TraeDatosNet(INSERTA);
                        //variable,variable1,
                       
                    //}
                }

                Response.Write("<script> alert('Registro guardado ...') </script>");
            }

            BindPrimaryGrid();
            
            gvSelected.DataBind();

            // UncheckAll_Click();
            //sem = TraeDatosNet("EXEC SP_FOLIOS " + usuario);
            //GridView2.DataSource = sem;
            //GridView2.DataBind();
            //FillGridView();

        }
        catch (Exception err)
        {

            string es = err.ToString();

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
}
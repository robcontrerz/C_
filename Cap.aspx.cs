using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Text.RegularExpressions;


[WebService(Namespace = "http://costosit.com/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
[System.Web.Script.Services.ScriptService]

public partial class Cap : System.Web.UI.Page
{
    string usuario = string.Empty;
    DataSet sem = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        DataSet TOT = new DataSet();
        DataSet empt = new DataSet();

        try
        {
            string nombre = HttpContext.Current.Session["Puesto"].ToString();


            if (!this.IsPostBack)
            {
                //usuario = "sv496r";//nombre;
                usuario = nombre;
                //FOLIOS
                //sem = TraeDatosNet("SELECT *  FROM[IUSA].[dbo].[REQUERIMIENTO]  a  left join[IUSA].[dbo].[PRETICKET] b on a.ID_REQUERIMIENTO = b.ID_REQUERIMIENTO where  b.BA = (SELECT CONVERT(varchar(255), isnull([Primer apellido], '') + ' ' + isnull([Segundo apellido], '') + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "')   Or b.BC =( SELECT CONVERT(varchar(255), isnull([Primer apellido],'') + ' ' + isnull([Segundo apellido],'')  + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "') ");
                //GridView2.DataSource = sem;
                //GridView2.DataBind();
                ////FreezeGridviewHeader(rptTable, _tb, PanelContainer);
                //lblTemp.Text = GridView2.Rows.Count.ToString();
                //////PRETICKET

                //GridView1.DataSource = sem;
                //GridView1.DataBind();
                //PRETICKET
                //DataTable dt = this.GetData();
           
                ////Building an HTML string.
                //StringBuilder html = new StringBuilder();

                ////Table start.
                //html.Append("<table border = '1'>");

                ////Building the Header row.
                //html.Append("<tr>");
                //foreach (DataColumn column in dt.Columns)
                //{
                //    html.Append("<th class='activoFIjoImg'>");
                //    html.Append(column.ColumnName);
                //    html.Append("</th>");
                //}
                //html.Append("</tr>");

                ////Building the Data rows.
                //foreach (DataRow row in dt.Rows)
                //{
                //    html.Append("<tr>");
                //    foreach (DataColumn column in dt.Columns)
                //    {
                //        html.Append("<td>");
                //        html.Append(row[column.ColumnName]);
                //        html.Append("</td>");
                //    }
                //    html.Append("</tr>");
                //}

                ////Table end.
                //html.Append("</table>");

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


    //this method only updates title and description
    //this is called when a event is clicked on the calendar
    [System.Web.Services.WebMethod(true)]
    public static string UpdateEvent(CalendarEvent cevent)
    {

        List<int> idList = (List<int>)System.Web.HttpContext.Current.Session["idList"];
        if (idList != null && idList.Contains(cevent.id))
        {
            if (CheckAlphaNumeric(cevent.title) && CheckAlphaNumeric(cevent.description))
            {
                EventDAO.updateEvent(cevent.id, cevent.title, cevent.description);

                return "updated event with id:" + cevent.id + " update title to: " + cevent.title +
                " update description to: " + cevent.description;
            }

        }

        return "unable to update event with id:" + cevent.id + " title : " + cevent.title +
            " description : " + cevent.description;
    }

    //this method only updates start and end time
    //this is called when a event is dragged or resized in the calendar
    [System.Web.Services.WebMethod(true)]
    public static string UpdateEventTime(ImproperCalendarEvent improperEvent)
    {
        List<int> idList = (List<int>)System.Web.HttpContext.Current.Session["idList"];
        if (idList != null && idList.Contains(improperEvent.id))
        {
            EventDAO.updateEventTime(improperEvent.id,
                DateTime.ParseExact(improperEvent.start, "dd-MM-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture),
                DateTime.ParseExact(improperEvent.end, "dd-MM-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture));

            return "updated event with id:" + improperEvent.id + "update start to: " + improperEvent.start +
                " update end to: " + improperEvent.end;
        }

        return "unable to update event with id: " + improperEvent.id;
    }

    //called when delete button is pressed
    [System.Web.Services.WebMethod(true)]
    public static String deleteEvent(int id)
    {
        //idList is stored in Session by JsonResponse.ashx for security reasons
        //whenever any event is update or deleted, the event id is checked
        //whether it is present in the idList, if it is not present in the idList
        //then it may be a malicious user trying to delete someone elses events
        //thus this checking prevents misuse
        List<int> idList = (List<int>)System.Web.HttpContext.Current.Session["idList"];
        if (idList != null && idList.Contains(id))
        {
            EventDAO.deleteEvent(id);
            return "deleted event with id:" + id;
        }

        return "unable to delete event with id: " + id;

    }

    //called when Add button is clicked
    //this is called when a mouse is clicked on open space of any day or dragged 
    //over mutliple days
    [System.Web.Services.WebMethod]
    public static int addEvent(ImproperCalendarEvent improperEvent)
    {

        CalendarEvent cevent = new CalendarEvent()
        {
            title = improperEvent.title,
            description = improperEvent.description,
            start = DateTime.ParseExact(improperEvent.start, "dd-MM-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture),
            end = DateTime.ParseExact(improperEvent.end, "dd-MM-yyyy hh:mm:ss tt", CultureInfo.InvariantCulture)
           

        };

        if (CheckAlphaNumeric(cevent.title) && CheckAlphaNumeric(cevent.description))
        {
            int key = EventDAO.addEvent(cevent);

            List<int> idList = (List<int>)System.Web.HttpContext.Current.Session["idList"];

            if (idList != null)
            {
                idList.Add(key);
            }

            return key;//return the primary key of the added cevent object

        }

        return -1;//return a negative number just to signify nothing has been added

    }

    private static bool CheckAlphaNumeric(string str)
    {

        return Regex.IsMatch(str, @"^[a-zA-Z0-9 ]*$");


    }

    protected void btnUpdate23_Click(object sender, EventArgs j)
    {
        //lblTemp.Text = "asdfdsa " + ddlTemp.SelectedItem.Text + " sadfasd " + DateTime.Now.ToString();
        try
        {



        //    foreach (GridViewRow row in GridView2.Rows)
        //    {

        //        CheckBox cb = (CheckBox)row.FindControl("ProductSelector");
        //        if (cb != null && cb.Checked)
        //        {

        //            string dd = row.Cells[1].ToString();

        //            // First, get the ProductID for the selected row
        //            string productID = GridView2.DataKeys[row.RowIndex].Value.ToString();


        //            var z = row.FindControl("TBox1") as TextBox;
        //            var z1 = row.FindControl("TBox2") as TextBox;
        //            var z2 = row.FindControl("TBox3") as TextBox;
        //            var z3 = row.FindControl("TBox4") as TextBox;
        //            var z4 = row.FindControl("TBox5") as TextBox;
        //            var z5 = row.FindControl("TBox6") as TextBox;

        //            string variable = row.Cells[1].Text;
        //            string variable1 = row.Cells[2].Text;
        //            string variable2 = z.Text;
        //            string variable3 = z1.Text;
        //            string variable4 = z2.Text;
        //            string variable5 = z3.Text;
        //            string variable6 = z4.Text;
        //            string variable7 = z5.Text;
        //            int x = Int32.Parse(z.Text);
        //            int x1 = Int32.Parse(z1.Text);
        //            int x2 = Int32.Parse(z2.Text);
        //            int x3 = Int32.Parse(z3.Text);
        //            int x4 = Int32.Parse(z4.Text);
        //            int x5 = Int32.Parse(z5.Text);
        //            int suma = (x) + (x1) + (x2) + (x3) + (x4) + (x5);
        //            var s = TraeDatosNet("INSERT INTO [IUSA].[dbo].[eventos]  ([title],[description],[startDate],[endDate],[emp],[folio],[actividad1],[actividad2],[actividad3],[actividad4],[actividad5],[actividad6],[foliohrs]) ");
        //            //productID,

        //        }

        //        UncheckAll_Click();
        //        sem = TraeDatosNet("SELECT *  FROM[IUSA].[dbo].[REQUERIMIENTO]  a  left join[IUSA].[dbo].[PRETICKET] b on a.ID_REQUERIMIENTO = b.ID_REQUERIMIENTO where  b.BA = (SELECT CONVERT(varchar(255), isnull([Primer apellido], '') + ' ' + isnull([Segundo apellido], '') + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "')   Or b.BC =( SELECT CONVERT(varchar(255), isnull([Primer apellido],'') + ' ' + isnull([Segundo apellido],'')  + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "') ");
        //        GridView2.DataSource = sem;
        //        GridView2.DataBind();


        //    }
        }
        catch (Exception err)
        {
            string e = err.ToString();
        }

    }


    protected void btnUpdate333_Click(object sender, EventArgs j)
    {
        try
        {
            //PRETICKECTS


            //foreach (GridViewRow row in GridView2.Rows)
            //{

            //    CheckBox cb = (CheckBox)row.FindControl("ProductSelector");
            //    if (cb != null && cb.Checked)
            //    {

            //        string dd = row.Cells[1].ToString();

            //        // First, get the ProductID for the selected row
            //        string productID = GridView1.DataKeys[row.RowIndex].Value.ToString();


            //        var z = row.FindControl("TBox7") as TextBox;
            //        var z1 = row.FindControl("TBox8") as TextBox;
            //        var z2 = row.FindControl("TBox9") as TextBox;
            //        var z3 = row.FindControl("TBox10") as TextBox;
            //        var z4 = row.FindControl("TBox11") as TextBox;
            //        var z5 = row.FindControl("TBox12") as TextBox;

            //        string variable = row.Cells[1].Text;
            //        string variable1 = row.Cells[2].Text;
            //        string variable2 = z.Text;
            //        string variable3 = z1.Text;
            //        string variable4 = z2.Text;
            //        string variable5 = z3.Text;
            //        string variable6 = z4.Text;
            //        string variable7 = z5.Text;
            //        int x = Int32.Parse(z.Text);
            //        int x1 = Int32.Parse(z1.Text);
            //        int x2 = Int32.Parse(z2.Text);
            //        int x3 = Int32.Parse(z3.Text);
            //        int x4 = Int32.Parse(z4.Text);
            //        int x5 = Int32.Parse(z5.Text);
            //        int suma = (x) + (x1) + (x2) + (x3) + (x4) + (x5);
            //        var s = TraeDatosNet("INSERT INTO [IUSA].[dbo].[eventos]  ([title],[description],[startDate],[endDate],[emp],[folio],[actividad1],[actividad2],[actividad3],[actividad4],[actividad5],[actividad6],[foliohrs]) ");
            //        //productID,

            //    }

            //    UncheckAll_Click();
            //    sem = TraeDatosNet("SELECT *  FROM[IUSA].[dbo].[REQUERIMIENTO]  a  left join[IUSA].[dbo].[PRETICKET] b on a.ID_REQUERIMIENTO = b.ID_REQUERIMIENTO where  b.BA = (SELECT CONVERT(varchar(255), isnull([Primer apellido], '') + ' ' + isnull([Segundo apellido], '') + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "')   Or b.BC =( SELECT CONVERT(varchar(255), isnull([Primer apellido],'') + ' ' + isnull([Segundo apellido],'')  + ', ' + [Nombre]) Nombre FROM[IUSA].[dbo].[ActivosITRH]    where[Tipo de empleo]= '" + usuario + "') ");
            //    GridView1.DataSource = sem;
            //    GridView1.DataBind();


            //}
        }
        catch (Exception err)
        {
            string e = err.ToString();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs j)
    {
        //lblTemp.Text = "You selected: " + ddlTemp.SelectedItem.Text + " was changed at " + DateTime.Now.ToString();
    }

    protected void btnUpdate2_Click(object sender, EventArgs j)
    {
        //lblPhLevel.Text = "You selected: " + ddlPH.SelectedItem.Text + " was changed at " + DateTime.Now.ToString();
    }
  
    //private void ToggleCheckState(bool checkState)
    //{
    //    // Iterate through the Products.Rows property
    //    foreach (GridViewRow row in GridView2.Rows)
    //    {
    //        // Access the CheckBox
    //        CheckBox cb = (CheckBox)row.FindControl("ProductSelector");
    //        if (cb != null)
    //            cb.Checked = checkState;
    //    }

    //    foreach (GridViewRow row in GridView1.Rows)
    //    {
    //        // Access the CheckBox
    //        CheckBox cb = (CheckBox)row.FindControl("ProductSelector");
    //        if (cb != null)
    //            cb.Checked = checkState;
    //    }

    //}

    //protected void CheckAll_Click()
    //{
    //    ToggleCheckState(true);
    //}

    //protected void UncheckAll_Click()
    //{
    //    ToggleCheckState(false);
    //}

    //protected void Button1_Click1(object sender, EventArgs e)
    //{
    //    string sdfsa = e.ToString();
    //}



}

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

            }
          
        }

        catch (Exception err)
        {
            string errr = err.ToString();
            Response.Redirect("Default.aspx", false);
        }
      
    }
 
 
}

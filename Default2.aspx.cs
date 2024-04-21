using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void A13_ServerClick(object sender, EventArgs e)
    {
        try
        {
 
 

                String value = ((System.Web.UI.Control)sender).ClientID.ToString();
                String substring;
                substring = value.Substring(1, 2);
                if (substring.ToString() == "10")
                {
            
                    Panel6.Visible = true;
  

                    //loading.Visible = false;

                    IframeDoctos.Attributes.Add("src", "Tab19.aspx");
                    //Response.Redirect("Tab13.aspx", false);
                    //loading.Visible = false;
                }
                else if (substring.ToString() == "11")
                {
       
                    Panel6.Visible = true;
     

                    //loading.Visible = false;
                    IframeDoctos.Attributes.Add("src", "Tab16.aspx");
                    //  Response.Redirect("Tab14.aspx", false);
                    //loading.Visible = false;
                }
 
         

        }
        catch (Exception err)
        {
            string se = err.ToString();
            //loading.Visible = false;
 
        }
    }


}
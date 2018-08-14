using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem
{
    public partial class Master : System.Web.UI.MasterPage
    {
        string pagename;
        protected void Page_Load(object sender, EventArgs e)
        {
            pagename = (string)Session["PageName"];
            if(pagename != null)
            {
                UserPageName.Text = pagename;
            }
            else
            {
                LoginDetails.Visible = false;
            }
            /* try
             {
                 if (IsPostBack)
                 {
                     pagename = (string)Session["PageName"];
                 }
                 else
                 {
                     try
                     {
                       Server.Transfer("Login.aspx",true);
                     }
                    catch(Exception ex)
                     {
                         Response.Write("<script language=javascript>alert(" + ex.Message + ")</script>");
                     }
                 }
             }
             catch (Exception ex)
             {
                 Response.Write("<script language=javascript>alert(" + ex.Message + ")</script>");
             }
            */
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["role"] = null;
            Session["PageName"] = null;
            Server.Transfer("~/Login.aspx");
        }
    }
}
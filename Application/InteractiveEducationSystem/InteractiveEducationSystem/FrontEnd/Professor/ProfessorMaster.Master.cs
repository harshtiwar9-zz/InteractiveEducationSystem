using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem.FrontEnd.Professor
{
    public partial class ProfessorMaster : System.Web.UI.MasterPage
    {
        string pagename;
        string UserTypeSession;
        protected void Page_Load(object sender, EventArgs e)
        {
            pagename = (string)Session["PageName"];
            if (pagename != null)
            {
                UserPageName.Text = pagename;
            }
            else
            {
                LoginDetails.Visible = false;
            }
            if (!IsPostBack)
            {
                UserTypeSession = (string)(Session["username"]);
            }
        }
    }
}
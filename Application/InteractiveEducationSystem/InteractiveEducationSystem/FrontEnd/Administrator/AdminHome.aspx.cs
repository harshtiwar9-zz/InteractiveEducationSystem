using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem.FrontEnd.Administrator
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RolePage(object sender, EventArgs e)
        {
            Server.Transfer("~/AssignRole.aspx");
        }

        protected void MonitorUser(object sender, EventArgs e)
        {
            Server.Transfer("~/MonitorUser.aspx");
        }

        protected void RConflicts(object sender, EventArgs e)
        {
            Server.Transfer("~/IConflict.aspx");
        }
    }
}
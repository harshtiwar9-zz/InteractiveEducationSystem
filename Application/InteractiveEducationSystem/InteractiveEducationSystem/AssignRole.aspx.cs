using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem
{
    public partial class AssignRole1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void StuRole(object sender, EventArgs e)
        {
            Session["usertype"] = "s";
            Server.Transfer("RegRole.aspx");
        }

        protected void ProfessorRole_Click(object sender, EventArgs e)
        {
            Session["usertype"] = "p";
            Server.Transfer("RegProfRole.aspx");
        }

        protected void CourseCordinatorRole_Click(object sender, EventArgs e)
        {
            Session["usertype"] = "c";
            Server.Transfer("RegCourseCordinator.aspx");
        }
    }
}
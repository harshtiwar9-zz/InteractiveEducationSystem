using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem
{
    public partial class AssignRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btnsubmit_Click(object sender, EventArgs e)
        {
           
        }

        protected void Student_Click(object sender, EventArgs e)
        {
            Server.Transfer("FrontEnd/Administrator/studentdata.aspx");

        }

        protected void Professor_Click(object sender, EventArgs e)
        {
            Server.Transfer("FrontEnd/Administrator/ProfessorData.aspx");

        }
        protected void Coordinator_Click(object sender, EventArgs e)
        {
            Server.Transfer("FrontEnd/Administrator/CoordinatorData.aspx");

        }


    }
    }
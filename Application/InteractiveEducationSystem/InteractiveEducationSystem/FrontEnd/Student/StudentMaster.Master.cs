﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem.FrontEnd
{
    public partial class StudentMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String UserTypeSession;
            if (!IsPostBack)
            {
                UserTypeSession = (string)(Session["username"]);
            }

        }
    }
}
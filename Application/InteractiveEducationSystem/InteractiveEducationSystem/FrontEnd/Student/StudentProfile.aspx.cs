using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace InteractiveEducationSystem.FrontEnd.Student
{
    public partial class StudentProfile : System.Web.UI.Page
    {
        string UserId;
        SqlConnection conn = new SqlConnection();
        SqlCommand comm = new SqlCommand();
        //string connectionString =ConfigurationManager.ConnectionStrings["IES"].ConnectionString;

        public object MessageBox { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UserId = (string)(Session["username"]);

            

            if (!this.IsPostBack) // to avoid reloading your control on postback
            {
                var con = ConfigurationManager.ConnectionStrings["IES"].ToString();
                using (SqlConnection myConnection = new SqlConnection(con))
                {
                    
                }
            }
        }

    }
}
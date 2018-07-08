using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem.FrontEnd.Professor
{
    public partial class StudentList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connectionString = WebConfigurationManager.ConnectionStrings["IES"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand("SELECT *  from Student", con);

            try
            {
                con.Open();
                SqlDataAdapter adp = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                StudentList1.DataSource = ds;
                StudentList1.DataBind();
            }
            catch
            {
                con.Close();
            }


        }
    }
}
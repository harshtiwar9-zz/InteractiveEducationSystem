using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem.FrontEnd.Administrator
{
    public partial class IConflict : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
        SqlConnection mycon;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void IssueDelete(object sender, EventArgs e)
        {
            //string selIssueId = GridView1.SelectedRow.Cells[0].Text;
            //mycon = new SqlConnection(connectionString);
            //mycon.Open();

            //cmd = new SqlCommand("Delete from Conflicts where Issue_Id = "+selIssueId, mycon);
            //cmd.ExecuteNonQuery();
            //mycon.Close();
            //GridView1.DataBind();
        }
    }
}
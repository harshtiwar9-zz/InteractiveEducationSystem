using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem
{
    public partial class ResolveConflicts : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
        SqlConnection mycon;
        SqlCommand cmd;
        String username;
        protected void Page_Load(object sender, EventArgs e)
        {
            username = (string)Session["username"];
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            mycon = new SqlConnection(connectionString);
            mycon.Open();

                cmd = new SqlCommand("INSERT INTO Conflicts (Issue, ID_FK) VALUES (@Issue, @ID_FK)", mycon);
                cmd.Parameters.Add("@Issue", SqlDbType.NVarChar, 50);
                cmd.Parameters["@Issue"].Value = issueDesc.Text;
                cmd.Parameters.Add("@ID_FK", SqlDbType.Int);
                cmd.Parameters["@ID_FK"].Value = username;
                cmd.ExecuteNonQuery();

                mycon.Close();
                Response.Redirect("~/Login.aspx");
           
            
        }
    }
}
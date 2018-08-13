using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem
{
    public partial class RegRole : System.Web.UI.Page
    {
        SqlDataReader reader;
        SqlConnection mycon;
        SqlCommand cmd;
        SqlCommand cmd2;
        SqlCommand cmd3;
        string NewUserID;
        string UserTypeSession;
        string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            UserTypeSession = (string)(Session["usertype"]);
        }

        protected void RegisterUser(object sender, EventArgs e)
        {
            string selStudentId = GridView1.SelectedRow.Cells[1].Text;
            string selFname = GridView1.SelectedRow.Cells[2].Text;
            string selLname = GridView1.SelectedRow.Cells[3].Text;
            string GenPassword = selLname + selFname;

            mycon = new SqlConnection(connectionString);

            try
            {
                mycon.Open();
                cmd = new SqlCommand("INSERT INTO Users(Role, Password) VALUES (@role, @password)", mycon);
                cmd.Parameters.Add("@role", SqlDbType.NVarChar, 1);
                cmd.Parameters["@role"].Value = UserTypeSession;
                cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50);
                cmd.Parameters["@password"].Value = GenPassword;
                cmd.ExecuteNonQuery();

                cmd2 = new SqlCommand("Select TOP 1 ID_PK FROM Users ORDER BY ID_PK DESC", mycon);
                reader = cmd2.ExecuteReader();
                NewUserID = reader.GetString(0);

                cmd3 = new SqlCommand("INSERT INTO Student(ID_FK) VALUES (@NEWID)", mycon);
                cmd.Parameters.Add("@NEWID", SqlDbType.Int);
                cmd.Parameters["@NEWID"].Value = NewUserID;
                cmd.ExecuteNonQuery();

                mycon.Close();
            } 
            catch(Exception ex)
            {
                Response.Write("<script language=javascript>alert("+ ex.Message +")</script>");
            }

        }
    }
}
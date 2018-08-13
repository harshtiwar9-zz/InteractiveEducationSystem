using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem
{

    public partial class Login : System.Web.UI.Page
    {
        string role;
        string result;
        string userName;
        string password;
        string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
        SqlConnection mycon;
        SqlCommand cmd;
        SqlDataReader reader;
        string PageName;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void loginbutton_Click(object sender, EventArgs e)
        {
            userName = Loginbox.Text;
            password = Passwordbox.Text;

            result = UserLogin(userName, password);

            Page_re(result);
        }


        private string UserLogin(string userName, string password)
        {
            var con = ConfigurationManager.ConnectionStrings["IES"].ToString();
            using (SqlConnection myConnection = new SqlConnection(con))
            {
                string oString = "SELECT *  from Users WHERE ID_PK = @UserName AND Password= @Password";
                SqlCommand oCmd = new SqlCommand(oString, myConnection);
                oCmd.Parameters.AddWithValue("@UserName", userName);
                oCmd.Parameters.AddWithValue("@Password", password);

                myConnection.Open();
                using (SqlDataReader oReader = oCmd.ExecuteReader())
                {
                    while (oReader.Read())
                    {
                        role = oReader["Role"].ToString();

                    }

                    if (string.IsNullOrEmpty(role))
                    {
                        //invalid user/password , return flase 
                        return "no_user";
                    }
                    else
                    {
                        // valid login
                        return role;
                    }


                }

            }

        }

        public void Page_re(string role)
        {

            mycon = new SqlConnection(connectionString);

            if (role != "no_user")
            {
                if (role.Equals("s"))
                {
                   /* cmd = new SqlCommand("SELECT First_name from Student WHERE Id_FK = @UserName", mycon);
                    //reader = cmd.ExecuteReader();
                    PageName = reader.GetString(0);
                    Response.Write("<script language=javascript>alert(" + PageName + ")</script>");
                    */
                    Session["username"] = userName;
                    Session["role"] = role;

                    Server.Transfer("FrontEnd/Student/StudentHome.aspx");
                }
                else if (role.Equals("p"))
                {

                    Session["username"] = userName;
                    Session["role"] = role;
                    Server.Transfer("FrontEnd/Professor/ProfessorHome.aspx");
                }
                else if (role.Equals("c"))
                {

                    Session["username"] = userName;
                    Session["role"] = role;
                    Server.Transfer("CoursecoHome.aspx");
                }
                else if (role.Equals("a"))
                {

                    Session["username"] = userName;
                    Session["role"] = role;
                    Server.Transfer("FrontEnd/Administrator/AdminHome.aspx");
                }

            }
            else
            {
                Server.Transfer("Login.aspx");
            }
        }

    }
}
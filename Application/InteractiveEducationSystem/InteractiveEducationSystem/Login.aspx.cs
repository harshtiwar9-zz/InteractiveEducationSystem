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
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void loginbutton_Click(object sender, EventArgs e)
        {
            string userName = Loginbox.Text;
            string password = Passwordbox.Text;

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
            if (role != "no_user")
            {
                if(role.Equals("s"))
                {
                    Server.Transfer("FrontEnd/Student/StudentHome.aspx");
                    Session["username"] = Loginbox.Text;
                }
                else if(role.Equals("p"))
                {
                    Server.Transfer("FrontEnd/Professor/ProfessorHome.aspx");
                }
                else if(role.Equals("c"))
                {
                    Server.Transfer("CoursecoHome.aspx");
                }
                else if(role.Equals("a"))
                {
                    Server.Transfer("AdminHome.aspx");
                }
               
            }
            else
            {
                Server.Transfer("Login.aspx");
            }
        }
       
    }
}
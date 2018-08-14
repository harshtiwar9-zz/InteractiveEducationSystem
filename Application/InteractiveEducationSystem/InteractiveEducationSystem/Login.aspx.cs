using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
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
        public void loginbutton_Click(object sender, EventArgs e)
        {
            userName = Loginbox.Text;
            password = Passwordbox.Text;
            result = UserLogin(userName, password);

            Page_re(result);
        }

        
        public string UserLogin(string userName, string password)
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
                if(role.Equals("s"))
                {
                    StudentName(userName);
                    Session["username"] =userName ;
                    Session["role"] = role;
                    Server.Transfer("FrontEnd/Student/StudentHome.aspx");
                }
                else if(role.Equals("p"))
                {
                    ProfessorName(userName);
                    Session["username"] = userName;
                    Session["role"] = role;
                    Server.Transfer("FrontEnd/Professor/ProfessorHome.aspx");
                }
                else if(role.Equals("c"))
                {
                    CoordinatorName(userName);
                    Session["username"] = userName;
                    Session["role"] = role;
                    Server.Transfer("~/FrontEnd/Course-Coordinator/CourseCoordinator.aspx");
                }
                else if(role.Equals("a"))
                {
                    AdministratorName(userName);
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
        public void StudentName(string userid)
        {
            mycon.Open();
            cmd = new SqlCommand("SELECT First_name from Student WHERE ID_FK = @UserName", mycon);
            cmd.Parameters.AddWithValue("@UserName", userid);
            reader = cmd.ExecuteReader();
            if (reader.HasRows.Equals(true))
            {
                while (reader.Read())
                {
                    PageName = reader[0].ToString();
                }
                Session["PageName"] = PageName;
            }
            mycon.Close();
        }
        public void ProfessorName(string userid)
        {
            mycon.Open();
            cmd = new SqlCommand("SELECT First_name from Professor WHERE ID_FK = @UserName", mycon);
            cmd.Parameters.AddWithValue("@UserName", userid);
            reader = cmd.ExecuteReader();
            if (reader.HasRows.Equals(true))
            {
                while (reader.Read())
                {
                    PageName = reader[0].ToString();
                }
                Session["PageName"] = PageName;
            }
            mycon.Close();
        }
        public void CoordinatorName(string userid)
        {
            mycon.Open();
            cmd = new SqlCommand("SELECT First_name from Course_coordinator WHERE ID_FK = @UserName", mycon);
            cmd.Parameters.AddWithValue("@UserName", userid);
            reader = cmd.ExecuteReader();
            if (reader.HasRows.Equals(true))
            {
                while (reader.Read())
                {
                    PageName = reader[0].ToString();
                }
                Session["PageName"] = PageName;
            }
            mycon.Close();
        }
        public void AdministratorName(string userid)
        {
            mycon.Open();
            cmd = new SqlCommand("SELECT First_name from Administrator WHERE ID_FK = @UserName", mycon);
            cmd.Parameters.AddWithValue("@UserName", userid);
            reader = cmd.ExecuteReader();
            if (reader.HasRows.Equals(true))
            {
                while (reader.Read())
                {
                    PageName = reader[0].ToString();
                }
                Session["PageName"] = PageName;
            }
            mycon.Close();
        }
    }
}
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
        bool result;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void loginbutton_Click(object sender, EventArgs e)
        {
            string userName = Loginbox.Text;
            string password = Passwordbox.Text;

            result = UserLogin(userName, password);
            page_re();

        }

        
        private bool UserLogin(string userName, string password)
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
                        return false;
                    }
                    else
                    {
                        // valid login
                        return true;
                    }

                   
                }
               
            }



          /*  String connectionString = WebConfigurationManager.ConnectionStrings["IES"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand("SELECT *  from Users WHERE ID_PK = @UserName AND Password= @Password", con);
            


            com.Parameters.Add("@UserName", SqlDbType.Int).Value = Login1.UserName;
            com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Login1.Password;

            con.Open();
           
            //' execute the select statment 
             string result = Convert.ToString(com.ExecuteScalar());
         
           
            //' check the result 
            if (string.IsNullOrEmpty(result))
            {
                //invalid user/password , return flase 
                return false;
            }
            else
            {
                // valid login
                return true;
            }*/
        }

        public void page_re()
        {
            if (result == true)
            {
                Server.Transfer("Home.aspx");
            }
            else
            {
                Server.Transfer("Login.aspx");
            }
        }
       
    }
}
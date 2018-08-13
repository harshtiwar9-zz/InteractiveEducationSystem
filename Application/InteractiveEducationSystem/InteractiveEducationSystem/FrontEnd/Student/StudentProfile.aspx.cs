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

            Console.WriteLine(UserId);
            Label1.Text = UserId;

            if (!this.IsPostBack) // to avoid reloading your control on postback
            {
                var con = ConfigurationManager.ConnectionStrings["IES"].ToString();
                using (SqlConnection myConnection = new SqlConnection(con))
                {
                    //string String = "Select * from Student where ID_FK = "+UserId +" ;"; // selecting only one student from table 
                    //comm = new SqlCommand(String, myConnection);
                    
                    /*
                    myConnection.Open();
                    SqlDataReader oReader = comm.ExecuteReader()
                    myConnection.Close;
                        
                        
                        {
                        while (oReader.Read())
                        {
                            txtfirstname.Text = oReader["First_name"].ToString();
                            txtlastname.Text = oReader["Last_name"].ToString();
                            //txtprofileid.Value = oReader["Prof_Id"].ToString();
                            var value = this.txtprofileid.Value;
                            string gender = oReader["Gender"].ToString();

                            var item = drpGender.Items.FindByValue(gender.Trim().ToLower());
                            if (item != null)
                                item.Selected = true;
                        }
                    }*/
                }
            }
        }
           

        /*protected void UpdateProfile(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand comm = new SqlCommand("UPDATE dbo.Student SET First_name=@First_name, Last_name=@Last_name,Gender=@Gender  Where Student_Id=@id", conn))
                {
                    comm.Parameters.AddWithValue("@First_name", txtfirstname.Text);
                    comm.Parameters.AddWithValue("@Last_name", txtlastname.Text);
                    comm.Parameters.AddWithValue("@Gender", drpGender.SelectedItem.Value);
                    //comm.Parameters.AddWithValue("@id", txtprofileid.Value);
                    comm.ExecuteNonQuery();
                    Response.Redirect(HttpContext.Current.Request.Path);
                }
            }

        }*/
    }
}
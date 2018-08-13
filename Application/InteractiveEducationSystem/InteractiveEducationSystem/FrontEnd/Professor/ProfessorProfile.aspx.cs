using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace InteractiveEducationSystem.FrontEnd.Professor
{
    public partial class ProfessorProfile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand comm = new SqlCommand();
        //string connectionString =ConfigurationManager.ConnectionStrings["IES"].ConnectionString;

        public object MessageBox { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) // to avoid reloading your control on postback
            {
                var con = ConfigurationManager.ConnectionStrings["IES"].ToString();
                using (SqlConnection myConnection = new SqlConnection(con))
                {
                    string oString = "SELECT top 1 * from Professor"; // selecting only one professor from table 
                    comm = new SqlCommand(oString, myConnection);

                    myConnection.Open();
                    using (SqlDataReader oReader = comm.ExecuteReader())
                    {
                        while (oReader.Read())
                        {
                            txtfirstname.Text = oReader["First_Name"].ToString();
                            txtlastname.Text = oReader["Last_Name"].ToString();
                            txtprofileid.Value = oReader["Prof_Id"].ToString();
                            var value = this.txtprofileid.Value;
                            string gender = oReader["Gender"].ToString();

                            var item = drpGender.Items.FindByValue(gender.Trim().ToLower());
                            if (item != null)
                                item.Selected = true;
                        }
                    }
                }
            }

        }

        protected void UpdateProfile(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand comm = new SqlCommand("UPDATE dbo.Professor SET First_Name=@firstname, Last_Name=@lastname,Gender=@gender  Where prof_id=@id", conn))
                {
                    comm.Parameters.AddWithValue("@firstname", txtfirstname.Text);
                    comm.Parameters.AddWithValue("@lastname", txtlastname.Text);
                    comm.Parameters.AddWithValue("@gender", drpGender.SelectedItem.Value);
                    comm.Parameters.AddWithValue("@id", txtprofileid.Value);
                    comm.ExecuteNonQuery();
                    Response.Redirect(HttpContext.Current.Request.Path);
                }
            }
        }
    }
}
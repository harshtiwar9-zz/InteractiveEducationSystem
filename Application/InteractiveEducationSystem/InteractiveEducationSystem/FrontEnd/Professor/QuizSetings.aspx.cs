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
    public partial class QuizSetings : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand comm = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) // to avoid reloading your control on postback
            {
                Dataload();
            }

        }
        private void Dataload()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                DataTable dt = new DataTable();
                conn.Open();
                SqlDataReader reader = null;
                comm = new SqlCommand("select QuizAttempt, QuizTime from Professor_Setting where prof_id=1", conn);
                reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    quizAttempts_tb.Text = (reader["QuizAttempt"].ToString());
                    quizTime_tb.Text = (reader["QuizTime"].ToString());
                }
                conn.Close();
            }
        }

        protected void ApplyChange_button_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand comm = new SqlCommand("UPDATE dbo.Professor_Setting SET QuizAttempt=@quizattempt, QuizTime=@quiztime Where prof_id=@id", conn))
                {
                    comm.Parameters.AddWithValue("@quizattempt", quizAttempts_tb.Text);
                    comm.Parameters.AddWithValue("@quiztime", quizTime_tb.Text);
                    comm.Parameters.AddWithValue("@id", 1);
                    comm.ExecuteNonQuery();
                }

            }
        }
        



    }
}
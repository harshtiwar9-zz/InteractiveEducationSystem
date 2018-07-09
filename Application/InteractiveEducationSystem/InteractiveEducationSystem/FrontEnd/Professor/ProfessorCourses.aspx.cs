using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem.FrontEnd.Professor
{


    public partial class ProfessorCourses : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand comm;

        string connectionString =
        ConfigurationManager.ConnectionStrings["IES"].ConnectionString;



        protected void Page_Load(object sender, EventArgs e)
        {
            no_datalbl.Visible = false;
            datafound.Visible = false;

        }
              
        protected void stu_answer_Click(object sender, EventArgs e)
        {

            int quizid = Convert.ToInt32(QuizIdTxt.Text);
            int studentid = Convert.ToInt32(stuIdTxt.Text);
            conn = new SqlConnection(connectionString);

            /*
            try
            {

                if (stuIdTxt.Text == null && stuIdTxt.Text == null)
                {
                    comm = new SqlCommand("Select Quiz_id_FK, User_id_FK, Answer from Student_quiz", conn);
                    conn.Open();
                    comm.ExecuteNonQuery();
                }
                else if (QuizIdTxt.Text == null && stuIdTxt.Text != null)
                {
                    int studentid = Convert.ToInt32(stuIdTxt.Text);
                    comm = new SqlCommand("Select Quiz_id_FK, User_id_FK, Answer from Student_quiz where User_id_FK=" + studentid + " ;", conn);
                    conn.Open();
                    comm.ExecuteNonQuery();
                }
                else if (QuizIdTxt.Text != null && stuIdTxt.Text == null)
                {
                    int quizid = Convert.ToInt32(QuizIdTxt.Text);

                    comm = new SqlCommand("Select Quiz_id_FK, User_id_FK, Answer from Student_quiz where quiz_id_FK=" + quizid + ";", conn);
                    conn.Open();
                    comm.ExecuteNonQuery();
                }
                else
                {
                    int quizid = Convert.ToInt32(QuizIdTxt.Text);
                    int studentid = Convert.ToInt32(stuIdTxt.Text);

                    comm = new SqlCommand("Select Quiz_id_FK, User_id_FK, Answer from Student_quiz where quiz_id_FK=" + quizid + " AND User_id_FK=" + studentid + " ;", conn);
                    conn.Open();
                    comm.ExecuteNonQuery();
                }
            }

            finally
            {
                Console.WriteLine("Error in database statement");
            }
            */

            comm = new SqlCommand("Select Quiz_id_FK, User_id_FK, Answer from Student_quiz where quiz_id_FK=" + quizid + " AND User_id_FK=" + studentid + " ;", conn);
            conn.Open();
            comm.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(comm);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            Grid_answers.DataSource = ds;
            Grid_answers.DataBind();
            
            if(Grid_answers.Rows.Count==0)
            {
                no_datalbl.Visible = true;
            }
            else
            {
                datafound.Visible = true;
            }

        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace InteractiveEducationSystem.FrontEnd
{
    public partial class StudentHome : System.Web.UI.Page
    {

        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        SqlDataAdapter adapter = new SqlDataAdapter();
        string connectionString =
        ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
        DataSet questionList = new DataSet();
        String StudentResponse;
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSave.Visible = false;
            string QuizStatus = "1";
            BtnTakeQuiz.Enabled = false;
            quizDiv.Visible = false;
            lblSuccess.Visible = false;
            List<int> studentList = new List<int>();
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT Student_Id FROM Student where QuizStatus =@QuizStatus", conn);
            comm.Parameters.AddWithValue("@QuizStatus", QuizStatus);
            try
            {

                conn.Open();
                reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    studentList.Add(reader.GetInt32(0));
                }
                reader.Close();


                Console.WriteLine("******" + studentList);
                int studentLogin = 1;
                for (int i = 0; i < studentList.Count; i++)
                {
                    if (studentList[i].Equals(studentLogin))
                    {

                        BtnTakeQuiz.Enabled = true;
                       
                    }
                }
            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }

        

        protected void BtnTakeQuiz_Click(object sender, EventArgs e)
        {
            quizDiv.Visible = true;

            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT Question FROM Quiz_question", conn);
            adapter.SelectCommand = comm;
           

                conn.Open();
                adapter.Fill(questionList);
                Console.WriteLine("******" + questionList);
            
            lblQuestion.Text = Convert.ToString(questionList.Tables[0].Rows[0]["Question"]);
            conn.Close();
                
            
        }

        private static int i = 1;

        protected void btnNext_Click(object sender, EventArgs e)
        {
            quizDiv.Visible = true;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT Question FROM Quiz_question", conn);
            adapter.SelectCommand = comm;
          
            conn.Open();
            StudentResponse = " "+txtResponse.Text + " ";
            adapter.Fill(questionList);
            lblQuestion.Text = "";
            txtResponse.Text = "";
            lblQuestion.Text = Convert.ToString(questionList.Tables[0].Rows[i]["Question"]);
            conn.Close();
            if (i == 2)
            {
                btnNext.Enabled = false;
                btnSave.Visible = true;


            }
            else
            {
                i++;
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Console.WriteLine("someone else is doing the story");
            lblSuccess.Visible = true;
            lblSuccess.Text = "Your responses have been saved Successfully !";
            BtnTakeQuiz.Enabled = false;
           
        }
    }
}

 
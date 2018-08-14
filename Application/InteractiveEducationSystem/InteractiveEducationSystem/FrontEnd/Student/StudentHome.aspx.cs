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
        
        //string currentUserName = HttpContext.Current.User.Identity.Name;
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        SqlDataAdapter adapter = new SqlDataAdapter();
        string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;
        DataSet questionList = new DataSet();
        String StudentResponse;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            string username = (string)Session["username"];
           
            btnSave.Visible = false;
            int studentID = Convert.ToInt32(username);
            BtnTakeQuiz.Enabled = false;
            quizDiv.Visible = false;
            lblSuccess.Visible = false;
            List<int> studentList = new List<int>();
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT Question FROM Quiz_question where Quiz_question_id =(" +
                "Select Quiz_question_id from Notification where Student_Id = "+studentID+" )", conn);
            comm.Parameters.AddWithValue("@Student_Id", studentID);          

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
                int studentLogin = 7;
                for (int i = 0; i < studentList.Count; i++)
                {
                    if (true)
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
            string username = (string)Session["username"];
            // int studentID = Convert.ToInt32(username);
            int studentID = 7;
            quizDiv.Visible = true;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT Question FROM Quiz_question where Quiz_question_id =" +
                "Select Quiz_question_id from Notification where Student_Id = " + studentID, conn);
            comm.Parameters.AddWithValue("@Student_Id", studentID);     
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

 
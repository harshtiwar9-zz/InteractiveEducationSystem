using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;

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
        String username;
        int QuizId = 0;

        public void Page_Load(object sender, EventArgs e)
        {
            
            username = (string)Session["username"];
           
            btnSave.Visible = true;
            int studentID = Convert.ToInt32(username);
            BtnTakeQuiz.Enabled = false;
            quizDiv.Visible = false;
            lblSuccess.Visible = false;
            //List<int> studentList = new List<int>();
            conn = new SqlConnection(connectionString);
            //comm = new SqlCommand("SELECT Question FROM Quiz_question where Quiz_question_id =(" +
            //    "Select Quiz_question_id from Notification where Student_Id = "+studentID+" )", conn);
            //comm.Parameters.AddWithValue("@Student_Id", studentID);          

            comm = new SqlCommand("Select ID_FK,QuizId,QuizStatus from Student where ID_FK = "+username+" ; ",conn);

            try
            {

                conn.Open();
                reader = comm.ExecuteReader();
                
                char QuizStatus = 'N';
                int ID_FK = 0;

                while (reader.Read())
                {
                    ID_FK = reader.GetInt32(0);
                    QuizId = reader.GetInt32(1);
                    QuizStatus = Convert.ToChar(reader["QuizStatus"]);
                }
                reader.Close();

                //Response.Write("<script language=javascript>alert(" + ID_FK + ")</script>");
                //Response.Write("<script language=javascript>alert(" + QuizId + ")</script>");
                //Response.Write("<script language=javascript>alert(" + QuizStatus + ")</script>");

                if (QuizStatus.Equals('Y') && ID_FK.Equals(studentID))
                { 
                    BtnTakeQuiz.Enabled = true;
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
            comm = new SqlCommand("select Q.Question from Quiz_question Q Inner Join Notification n on q.Quiz_question_id = n.Quiz_question_id where n.Student_Id = "+Convert.ToInt32(username)+";", conn);

            conn.Open();
            reader = comm.ExecuteReader();
            string que = "";
            while (reader.Read())
            {
                que = reader.GetString(0);
            }
            reader.Close();


            lblQuestion.Text = que;
            conn.Close();
                
            
        }

        private static int i = 1;

        //protected void btnNext_Click(object sender, EventArgs e)
        //{
        //    string username = (string)Session["username"];
        //    // int studentID = Convert.ToInt32(username);
        //    int studentID = 7;
        //    quizDiv.Visible = true;
        //    conn = new SqlConnection(connectionString);
        //    comm = new SqlCommand("SELECT Question FROM Quiz_question where Quiz_question_id =" +
        //        "Select Quiz_question_id from Notification where Student_Id = " + studentID, conn);
        //    comm.Parameters.AddWithValue("@Student_Id", studentID);     
        //    adapter.SelectCommand = comm;
          
        //    conn.Open();
        //    StudentResponse = " "+txtResponse.Text + " ";
        //    adapter.Fill(questionList);
        //    lblQuestion.Text = "";
        //    txtResponse.Text = "";
        //    lblQuestion.Text = Convert.ToString(questionList.Tables[0].Rows[i]["Question"]);
        //    conn.Close();
        //    if (i == 2)
        //    {
        //        btnNext.Enabled = false;
        //        btnSave.Visible = true;


        //    }
        //    else
        //    {
        //        i++;
        //    }

        //}

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string studentResponse = txtResponse.Text;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("update Student_quiz set Answer = '"+studentResponse+"' where Student_id_FK = " + Convert.ToInt32(username) + " and Quiz_id_FK = "+QuizId+";", conn);

            conn.Open();
            int response = comm.ExecuteNonQuery();
            if (response.Equals(0))
            {
                demolabel.Text = "Something Wrong!!";
            }
            else
            {
                BtnTakeQuiz.Enabled = false;
                comm = new SqlCommand("update Student set QuizStatus = 'N' where ID_FK = " + Convert.ToInt32(username) + " and QuizId = " + QuizId + ";", conn);
                comm.ExecuteNonQuery();
                demolabel.Text = "Submission Succesful!!";
            }

            conn.Close();
        }
    }
}

 
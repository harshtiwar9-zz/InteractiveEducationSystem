using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem.FrontEnd.Professor
{
    public partial class CourseQuiz : System.Web.UI.Page
    {
        SqlConnection mycon;
        SqlCommand cmd;

        string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Toast", "Materialize.toast('Quiz Initiated!!',3000)", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Toast", "Materialize.toast('Quiz Initiated!!',3000)", true);
            }
        }

        protected void editQuiz_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Quiz/EditQuizQuestion.aspx?quiz="+quizchapterselection.SelectedValue);
        }

        protected void initiateQuiz_ServerClick(object sender, EventArgs e)
        {
            mycon = new SqlConnection(connectionString);
            int selectedQuiz = Convert.ToInt32(initiatequizselection.SelectedValue);
            //Insert query for adding quiz

            cmd = new SqlCommand("Update Quiz SET QuizStatus = 1 where Quiz_id_PK = "+selectedQuiz + ";", mycon);

            try
            {
                mycon.Open();
                int a = cmd.ExecuteNonQuery();
                mycon.Close();
                if (a == 0)
                {
                    initiateQuizMSG.InnerText = "Some Issue!!";
                }
                //Not updated.
                else
                {
                    initiateQuizMSG.InnerText = "Quiz Initiated!!";
                    selectStudentForQuiz(selectedQuiz);
                    initiateQuizbtn.Attributes.Add("OnClientClick", "return false;");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Toast", "Materialize.toast('Quiz Initiated!!',3000)", true);
                }
            }
            //Updated.
            catch (Exception ex)
            {
                initiateQuizMSG.InnerText = ex.StackTrace;
            }
        }

        protected void selectStudentForQuiz(int selectedQuiz)
        {
            mycon = new SqlConnection(connectionString);

            //Insert query for adding quiz

            cmd = new SqlCommand("SELECT Student_Id FROM Student WHERE (Student_Id != (SELECT Student_Id_FK FROM Student_quiz WHERE (Quiz_id_FK = "+selectedQuiz+")))", mycon);

            try
            {
                mycon.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                var items = new List<int>();
                
                while (reader.Read())
                {
                    items.Add(Convert.ToInt32(reader["Student_Id"]));
                }
                reader.Close();

                Random random = new Random();
                int[] randomStudentID = new int[3];
                for (int j = 0; j < 3; j++)
                {
                    int randomNO = items[random.Next(0, items.Count())];
                    randomStudentID[j] = items[randomNO];
                    //randomID.InnerText += randomStudentID[j].ToString();
                    cmd = new SqlCommand("INSERT INTO Student_quiz (Quiz_id_FK, Student_id_FK) VALUES (@Quiz_id_FK, @Student_id_FK)", mycon);
                    cmd.Parameters.Add("@Quiz_id_FK", SqlDbType.Int);
                    cmd.Parameters["@Quiz_id_FK"].Value = selectedQuiz;
                    cmd.Parameters.Add("@Student_id_FK", SqlDbType.Int);
                    cmd.Parameters["@Student_id_FK"].Value = randomStudentID[j];
                    cmd.ExecuteNonQuery();
                }
                mycon.Close();
            }
            //Updated.
            catch (Exception ex)
            {
                initiateQuizMSG.InnerText += ex.StackTrace;
            }
        }

    }
}
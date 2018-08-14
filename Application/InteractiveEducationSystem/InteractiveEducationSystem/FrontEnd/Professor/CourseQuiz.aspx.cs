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
        SqlCommand cmd,cmd2,cmd3;
        SqlDataReader reader, reader2;

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
            Response.Redirect("Quiz/EditQuizQuestion.aspx?quiz=" + quizchapterselection.SelectedValue);
        }

        protected void initiateQuiz_ServerClick(object sender, EventArgs e)
        {
            mycon = new SqlConnection(connectionString);
            int selectedQuiz = Convert.ToInt32(initiatequizselection.SelectedValue);
            //Insert query for adding quiz

            cmd = new SqlCommand("Update Quiz SET QuizStatus = 1 where Quiz_id_PK = " + selectedQuiz + ";", mycon);

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

            cmd = new SqlCommand("SELECT ID_FK FROM Student WHERE Student_Id NOT IN(SELECT Student_id_FK FROM Student_quiz WHERE Quiz_id_FK = " + selectedQuiz+")", mycon);
            //cmd = new SqlCommand("Select S.Student_Id From Student S INNER JOIN Student_quiz SQ ON S.Student_Id = SQ.Student_id_FK Where SQ.Quiz_id_FK != " + selectedQuiz + "; ", mycon);

            //studentIDdata2.SelectCommand = "SELECT Student_Id FROM Student WHERE Student_Id NOT IN(SELECT Student_id_FK FROM Student_quiz WHERE Quiz_id_FK = " + selectedQuiz + ")";
            //studentIDdata2.DataBind();

            try
            {
                mycon.Open();
                reader = cmd.ExecuteReader();

                int i = 0;

                DataView dv3 = (DataView)quizQuestionID.Select(DataSourceSelectArguments.Empty);
                Random random = new Random();

                if (reader.HasRows.Equals(false))
                {
                    cmd.Cancel();
                    mycon.Close();
                    mycon.Open();

                    DataView dv = (DataView)studentIDdata.Select(DataSourceSelectArguments.Empty);

                    for (int u = 0; u < dv.Count; u++)
                    {
                        dataList.InnerText += dv.Table.Rows[u]["ID_FK"]+"\n 1st";
                    }

                    try
                    {

                        for (int j = 0; j < 3; j++)
                        {

                            int randomNO = random.Next(0, dv.Count);

                            cmd3 = new SqlCommand("INSERT INTO Student_quiz (Quiz_id_FK, Student_id_FK) VALUES (@Quiz_id_FK, @Student_id_FK)", mycon);
                            cmd3.Parameters.Add("@Quiz_id_FK", SqlDbType.Int);
                            cmd3.Parameters["@Quiz_id_FK"].Value = selectedQuiz;
                            cmd3.Parameters.Add("@Student_id_FK", SqlDbType.Int);
                            cmd3.Parameters["@Student_id_FK"].Value = dv.Table.Rows[randomNO]["ID_FK"];
                            cmd3.ExecuteNonQuery();

                            cmd = new SqlCommand("Update Student set QuizId = "+selectedQuiz+", QuizStatus = 'Y' Where ID_FK = "+ dv.Table.Rows[randomNO]["ID_FK"] +";",mycon);
                            cmd.ExecuteNonQuery();

                            cmd2 = new SqlCommand("INSERT INTO Notification (Message,Quiz_id_FK, Quiz_question_id, Student_Id) VALUES (@Message, @Quiz_id_FK, @Quiz_question_id, @Student_Id)", mycon);
                            cmd2.Parameters.Add("@Message", SqlDbType.NVarChar, 50);
                            cmd2.Parameters["@Message"].Value = "Quiz " + selectedQuiz + " Activated For You.";
                            cmd2.Parameters.Add("@Quiz_id_FK", SqlDbType.Int);
                            cmd2.Parameters["@Quiz_id_FK"].Value = selectedQuiz;
                            cmd2.Parameters.Add("@Quiz_question_id", SqlDbType.Int);
                            cmd2.Parameters["@Quiz_question_id"].Value = dv3.Table.Rows[random.Next(0, dv3.Count)]["Quiz_question_id"];
                            cmd2.Parameters.Add("@Student_Id", SqlDbType.Int);
                            cmd2.Parameters["@Student_Id"].Value = dv.Table.Rows[randomNO]["ID_FK"];
                            cmd2.ExecuteNonQuery();


                        }
                    }
                    catch (Exception ex)
                    {
                        dataList.InnerText += ex.Message;
                    }

        }
                else
                {

                    //while (reader.Read())
                    //  dataList.InnerText += reader.GetInt32(0);


                    DataView dv2 = (DataView)studentIDdata2.Select(DataSourceSelectArguments.Empty);

                    for(int u = 0; u < dv2.Count; u++)
                    {
                        dataList.InnerText += dv2.Table.Rows[u]["ID_FK"]+"\n 2nd";
                    }

                    try
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            int randomNO = random.Next(0, dv2.Count);

                            cmd3 = new SqlCommand("INSERT INTO Student_quiz (Quiz_id_FK, Student_id_FK) VALUES (@Quiz_id_FK, @Student_id_FK)", mycon);
                            cmd3.Parameters.Add("@Quiz_id_FK", SqlDbType.Int);
                            cmd3.Parameters["@Quiz_id_FK"].Value = selectedQuiz;
                            cmd3.Parameters.Add("@Student_id_FK", SqlDbType.Int);
                            cmd3.Parameters["@Student_id_FK"].Value = dv2.Table.Rows[randomNO]["ID_FK"];
                            cmd3.ExecuteNonQuery();

                            cmd = new SqlCommand("Update Student set QuizId = " + selectedQuiz + ", QuizStatus = 'Y' Where ID_FK = " + dv2.Table.Rows[randomNO]["ID_FK"] + ";", mycon);
                            cmd.ExecuteNonQuery();

                            cmd2 = new SqlCommand("INSERT INTO Notification (Message,Quiz_id_FK, Quiz_question_id, Student_Id) VALUES (@Message, @Quiz_id_FK, @Quiz_question_id, @Student_Id)", mycon);
                            cmd2.Parameters.Add("@Message", SqlDbType.NVarChar, 50);
                            cmd2.Parameters["@Message"].Value = "Quiz " + selectedQuiz + " Activated For You.";
                            cmd2.Parameters.Add("@Quiz_id_FK", SqlDbType.Int);
                            cmd2.Parameters["@Quiz_id_FK"].Value = selectedQuiz;
                            cmd2.Parameters.Add("@Quiz_question_id", SqlDbType.Int);
                            cmd2.Parameters["@Quiz_question_id"].Value = dv3.Table.Rows[random.Next(0, dv3.Count)]["Quiz_question_id"];
                            cmd2.Parameters.Add("@Student_Id", SqlDbType.Int);
                            cmd2.Parameters["@Student_Id"].Value = dv2.Table.Rows[randomNO]["ID_FK"];
                            cmd2.ExecuteNonQuery();

                        }
                    }
                    catch (Exception ex)
                    {
                        dataList.InnerText += ex.Message;
                    }

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
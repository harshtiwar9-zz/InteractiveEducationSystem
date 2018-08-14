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
    public partial class ProfessorCourses : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand comm = new SqlCommand();
        //string connectionString =ConfigurationManager.ConnectionStrings["IES"].ConnectionString;

        public object MessageBox { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ProfCourses.Visible = false;


            if (!this.IsPostBack) // to avoid reloading your control on postback
            {
                noDatalbl.Visible = false;
                datafound.Visible = false;
                answersList.Visible = false;
            }
        
        }
       
        protected void Stu_answer_Click(object sender, EventArgs e)
        {
            
                answersList.Visible = true;
                if (answersList.Rows.Count > 0)
                {
                    datafound.Visible = true;
                }
                else
                {
                    noDatalbl.Visible = true;
                }
            
                /*
                conn = new SqlConnection(connectionString);
                try
                {

                    if (stuIdTxt.Text == null && stuIdTxt.Text == null)
                    {
                        comm = new SqlCommand("Select Quiz_id_FK, User_id_FK, Answer from Student_quiz", conn);
                        conn.Open();
                        comm.ExecuteNonQuery();
                        SqlDataAdapter adp = new SqlDataAdapter(comm);
                        DataSet ds = new DataSet();
                        adp.Fill(ds);
                        Grid_answers.DataSource = ds;
                        Grid_answers.DataBind();

                         if (Grid_answers.Rows.Count == 0)
                           {
                                noDatalbl.Visible = true;
                            }
                        else
                            {
                                datafound.Visible = true;
                            }
                    }
                    else if (QuizIdTxt.Text == null && stuIdTxt.Text != null)
                    {
                        int studentid = Convert.ToInt32(stuIdTxt.Text);
                        comm = new SqlCommand("Select Student_quiz_PK, Quiz_id_FK, User_id_FK, Answer, Grade from Student_quiz where User_id_FK=" + studentid + " ;", conn);
                        conn.Open();
                        comm.ExecuteNonQuery();
                        SqlDataAdapter adp = new SqlDataAdapter(comm);
                        DataSet ds = new DataSet();
                        adp.Fill(ds);
                        Grid_answers.DataSource = ds;
                        Grid_answers.DataBind();

                         if (Grid_answers.Rows.Count == 0)
                           {
                                noDatalbl.Visible = true;
                            }
                        else
                            {
                                datafound.Visible = true;
                            }
                    }
                    else if (QuizIdTxt.Text != null && stuIdTxt.Text == null)
                    {
                        int quizid = Convert.ToInt32(QuizIdTxt.Text);

                        comm = new SqlCommand("Select * from Student_quiz where quiz_id_FK=" + quizid + ";", conn);
                        conn.Open();
                        comm.ExecuteNonQuery();
                        SqlDataAdapter adp = new SqlDataAdapter(comm);
                        DataSet ds = new DataSet();
                        adp.Fill(ds);
                        Grid_answers.DataSource = ds;
                        Grid_answers.DataBind();

                         if (Grid_answers.Rows.Count == 0)
                           {
                                noDatalbl.Visible = true;
                            }
                        else
                            {
                                datafound.Visible = true;
                            }
                    }
                    else if (QuizIdTxt.Text != null && stuIdTxt.Text != null)
                    {

                       // int quizid = Convert.ToInt32(QuizIdTxt.Text);
                       // int studentid = Convert.ToInt32(stuIdTxt.Text);
                        comm = new SqlCommand("Select * from Student_quiz where quiz_id_FK=" + QuizIdTxt.Text + " AND User_id_FK=" + stuIdTxt.Text + " ;", conn);
                        conn.Open();
                        comm.ExecuteNonQuery();
                        SqlDataAdapter adp = new SqlDataAdapter(comm);
                        DataSet ds = new DataSet();
                        adp.Fill(ds);
                        Grid_answers.DataSource = ds;
                        Grid_answers.DataBind();

                         if (Grid_answers.Rows.Count == 0)
                           {
                                noDatalbl.Visible = true;
                            }
                        else
                            {
                                datafound.Visible = true;
                            }
                    }
                }

                finally
                {
                    Console.WriteLine("Error in database statement");
                }

                */

                /*
                int quizid = Convert.ToInt32(QuizIdTxt.Text);
                int studentid = Convert.ToInt32(stuIdTxt.Text);
                comm = new SqlCommand("Select Student_quiz_PK, Quiz_id_FK, User_id_FK, Answer, Grade from Student_quiz where quiz_id_FK=" + quizid + " AND User_id_FK=" + studentid + " ;", conn);
                conn.Open();
                comm.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(comm);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                Grid_answers.DataSource = ds;
                Grid_answers.DataBind();

                if (Grid_answers.Rows.Count == 0)
                {
                    noDatalbl.Visible = true;
                }
                else
                {
                    datafound.Visible = true;
                }*/

            
        }

        protected void quiz_man_Click(object sender, EventArgs e)
        {
            Response.Redirect("CourseQuiz.aspx");
        }

       
    }
}
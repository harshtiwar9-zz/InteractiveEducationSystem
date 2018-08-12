using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "", "M.toast({html: 'Data Added Succesfully!!'})", true);
                }
            }
            //Updated.
            catch (Exception ex)
            {
                initiateQuizMSG.InnerText = ex.StackTrace;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteractiveEducationSystem.FrontEnd.Professor.Quiz
{
    public partial class AddQuizQuestions : System.Web.UI.Page
    {

        SqlConnection mycon;
        SqlCommand cmd;

        string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addQues_btn_Click(object sender, EventArgs e)
        {
            mycon = new SqlConnection(connectionString);
            //Insert query for adding quiz
            cmd = new SqlCommand("insert into Quiz_question(Question,Quiz_id) values(@Question,@Quiz_id)", mycon);

            cmd.Parameters.Add("@Question", SqlDbType.VarChar, 50);
            cmd.Parameters["@Question"].Value = questions.Value;

            cmd.Parameters.Add("@Quiz_id", SqlDbType.Int);
            cmd.Parameters["@Quiz_id"].Value = Request.QueryString["quiz"];

            try
            {
                mycon.Open();
                int a = cmd.ExecuteNonQuery();
                mycon.Close();
                if (a == 0)
                {
                    msg.InnerText = "Not Added!!";
                }
                //Not updated.
                else
                {
                    msg.InnerText = "Data Added Succesfully!!";
                    Response.Redirect("~/FrontEnd/Professor/Quiz/AddQuizQuestions.aspx?quiz="+Request.QueryString["quiz"]);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "", "M.toast({html: 'Data Added Succesfully!!'})", true);
                }
            }
            //Updated.
            catch (Exception ex)
            {
                msg.InnerText = ex.StackTrace;
            }
        }
    }
}
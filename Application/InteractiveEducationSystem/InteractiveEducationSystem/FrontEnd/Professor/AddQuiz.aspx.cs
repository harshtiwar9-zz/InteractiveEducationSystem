using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace InteractiveEducationSystem.FrontEnd.Professor
{
    public partial class AddQuiz : System.Web.UI.Page
    {
        
        SqlConnection mycon;
        SqlCommand cmd;

        string mystring = ConfigurationManager.ConnectionStrings["Interactivestring"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddquiz_Click(object sender, EventArgs e)
        {
            mycon = new SqlConnection(mystring);
            //Insert query for adding quiz
            cmd = new SqlCommand("insert into Quiz(Course, Chapter) values(@Course,@Chapter)", mycon);

            cmd.Parameters.AddWithValue("@Course", txtcourse.Text);
            cmd.Parameters.AddWithValue("@Chapter", txtchapter.Text);

            lblmsg.Visible = true;
            btnaddquestion.Visible = true;

            mycon.Open();
            cmd.ExecuteNonQuery();
            mycon.Close();


        }

        protected void btnaddquestion_Click(object sender, EventArgs e)
        {
            

            lblquestion.Visible = true;
            txtquestion.Visible = true;
            btnsubmit.Visible = true;
           
           

           
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            mycon = new SqlConnection(mystring);
            //Insert query for adding question
            cmd = new SqlCommand("insert into Quiz_question(Question) values(@Question)", mycon);

            cmd.Parameters.AddWithValue("@Question", txtquestion.Text);

            lblmsg2.Visible = true;

            mycon.Open();
            cmd.ExecuteNonQuery();
            mycon.Close();
        }
    }
}
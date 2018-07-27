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
	public partial class AddQuiz : System.Web.UI.Page
	{
        SqlConnection mycon;
        SqlCommand cmd;

        string connectionString = ConfigurationManager.ConnectionStrings["IES"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void addQuiz_btn_Click(object sender, EventArgs e)
        {
            mycon = new SqlConnection(connectionString);
            //Insert query for adding quiz
            cmd = new SqlCommand("insert into Quiz(Course_Code,Chapter_no,Quiz_no) values(@Course_Code,@Chapter_no,@Quiz_no)", mycon);

            cmd.Parameters.Add("@Course_Code", SqlDbType.VarChar, 50);
            cmd.Parameters["@Course_Code"].Value = Request.QueryString["course"];

            cmd.Parameters.Add("@Chapter_no", SqlDbType.VarChar, 50);
            cmd.Parameters["@Chapter_no"].Value = chapter_no.Value;

            cmd.Parameters.Add("@Quiz_no", SqlDbType.VarChar, 50);
            cmd.Parameters["@Quiz_no"].Value = quiz_no.Value;

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
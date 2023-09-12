using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace CourierNinjaPro.sites
{
    public partial class SignInPage : System.Web.UI.Page
    {
        private String conString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\TY\Asp.net\Assignment_4\CourierNinjaPro\CourierNinjaPro\App_Data\courier_db.mdf;Integrated Security=True";


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            checkInputIsNotNull();
        }

        private void checkInputIsNotNull()
        {
            String email = etEmailLogin.Text.ToString();
            String pass = etPasswordLogin.Text.ToString();
            
            if (email == "" && pass == "")
            {
                btnLogin.Text = "Pleas fill add details";
            }
            else
            {
                Boolean res = CheckUserIsValidOrNot(email, pass);
                if (res)
                {
                   Response.Redirect("HomePage.aspx");
                }
                else
                {
                    btnLogin.Text = "Invalid email or password.";
                }
            }

        }

        private bool CheckUserIsValidOrNot(string email, string pass)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                string selectQry = "SELECT COUNT(*) FROM Users WHERE uEmail = @uEmail AND uPassword = @uPassword";

                using (SqlCommand cmd = new SqlCommand(selectQry, con))
                {
                    cmd.Parameters.AddWithValue("@uEmail", email);
                    cmd.Parameters.AddWithValue("@uPassword", pass);

                    int count = (int)cmd.ExecuteScalar();

                    return count > 0; 
                }
            }
        }

    }
}
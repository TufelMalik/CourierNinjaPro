using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CourierNinjaPro.sites
{
    public partial class SignUpPage : System.Web.UI.Page
    {
        private String conString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\TY\Asp.net\Assignment_4\CourierNinjaPro\CourierNinjaPro\App_Data\courier_db.mdf;Integrated Security=True";



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            checkInputIsNotNull();

        }

        private void checkInputIsNotNull()
        {
            String name = etFullName.Text.ToString();
            String email = etEmailReg.Text.ToString();
            String pass = etPassword.Text.ToString();
            String phoneNumber = etPhoneNumber.Text.ToString();
            String city = "Bharuch";
            if (name == "" && email == "" && pass == "" && phoneNumber == "")
            {
                btnSubmit.Text = "Pleas fill add details";
            }
            else
            {
                saveDataToDatabase(name, email, pass, phoneNumber, city);
            }

        }


        private void saveDataToDatabase(string name, string email, string pass, string phoneNumber, string city)
        {
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd;
            String insertQry = "INSERT INTO Users (uName, uEmail, uPassword, uNumber, uCity) VALUES (@name, @email, @pass, @number, @city)";

            con.Open();
            try
            {
                cmd = new SqlCommand(insertQry, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@pass", pass);
                cmd.Parameters.AddWithValue("@number", phoneNumber);
                cmd.Parameters.AddWithValue("@city", city);
                cmd.ExecuteNonQuery();
                btnSubmit.Text = "Inserted Successfully...";
            }
            catch (Exception ex)
            {
                con.Close();
                btnSubmit.Text = ex.Message.ToString();
            }

            con.Close();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Recruit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {


        //Setting up SQL
        SqlConnection conn;
        SqlCommand comm;
        //Making a connection string
        string connectionString =
                ConfigurationManager.ConnectionStrings["BasketballinfoConnectionString"].ConnectionString;
        //SQL connection
        conn = new SqlConnection(connectionString);
        //SQL command
        comm = new SqlCommand(
              "INSERT INTO ApplicantTable (FirstName, LastName, PhoneNumber, Email, StreetAddress, City, State, Zip, GPA, ACT, PointAvg, Shooting, Threepoint, ReboundAvg, PositionN, MajorN , SchoolN, FunnelN) " +
                                  "VALUES (@FirstnameI, @LastnameI, @PhoneI, @EmailI, @StreetI, @CityI, @StateI, @ZipI, @GPAI, @ACTI, @PointAvgI, @ShootingAvgI, @ThreePointI, @ReboundAvgI, @PositionNI, @MajorNI, @SchoolN, FunnelN)", conn);

        //adding values from text box
        comm.Parameters.Add("@FirstnameI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@FirstnameI"].Value = txtFirstname.Text;

        comm.Parameters.Add("@LastnameI", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@LastnameI"].Value = txtLastname.Text;

        comm.Parameters.Add("@PhoneI", System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@PhoneI"].Value = txtPhone.Text;

        comm.Parameters.Add("@EmailI", System.Data.SqlDbType.NVarChar, 100);
        comm.Parameters["@EmailI"].Value = txtEmail.Text;

        comm.Parameters.Add("@StreetI", System.Data.SqlDbType.NVarChar, 100);
        comm.Parameters["@StreetI"].Value = txtStreet.Text;

        comm.Parameters.Add("@CityI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@CityI"].Value = txtCity.Text;

        comm.Parameters.Add("@StateI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@StateI"].Value = txtState.Text;

        comm.Parameters.Add("@ZipI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@ZipI"].Value = txtZip.Text;

        comm.Parameters.Add("@GPAI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@GPAI"].Value = txtGpa.Text;

        comm.Parameters.Add("@ACTI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@ACTI"].Value = txtAct.Text;


        comm.Parameters.Add("@PointAvgI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@PointAvgI"].Value = txtPoint.Text;

        comm.Parameters.Add("@ShootingAvgI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@ShootingAvgI"].Value = txtShoot.Text;

        comm.Parameters.Add("@ThreePointI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@ThreePointI"].Value = txt3.Text;

        comm.Parameters.Add("@ReboundAvgI", System.Data.SqlDbType.NVarChar, 10);
        comm.Parameters["@ReboundAvgI"].Value = txtRebound.Text;

        //dropdownlists

        comm.Parameters.Add("@PositionNI", System.Data.SqlDbType.Int);
        comm.Parameters["@PositionNI"].Value = DropDownList1.SelectedValue;

        comm.Parameters.Add("@MajorNI", System.Data.SqlDbType.Int);
        comm.Parameters["@MajorNI"].Value = DropDownList2.SelectedValue;

        comm.Parameters.Add("@SchoolN", System.Data.SqlDbType.Int);
        comm.Parameters["@SchoolN"].Value = DropDownList3.SelectedValue;

        comm.Parameters.Add("@FunnelN", System.Data.SqlDbType.Int);
        comm.Parameters["@FunnelN"].Value = DropDownList4.SelectedValue;

        try
        {

            conn.Open();
            comm.ExecuteNonQuery();

            MultiView1.ActiveViewIndex = 1;
        }
        finally
        {

            conn.Close();
        }
    }

    protected void CoachesPage_Click(object sender, EventArgs e)
    {
        //Setting up SQL
        SqlConnection conn;
        SqlCommand comm;
        //Making a connection string
        string connectionString =
                ConfigurationManager.ConnectionStrings["BasketballinfoConnectionString"].ConnectionString;
        //SQL connection
        conn = new SqlConnection(connectionString);

        try
        {

            conn.Open();


            Response.Redirect("Coach.aspx");
        }
        finally
        {

            conn.Close();
        }
    }
}
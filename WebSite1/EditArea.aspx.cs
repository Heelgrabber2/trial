using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;

public partial class EditArea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLastnameList();
        }
    }

    private void LoadLastnameList()
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "BasketballinfoConnectionString"].ConnectionString;

        conn = new SqlConnection(connectionString);
        comm = new SqlCommand("SELECT ApplicantId,LastName FROM ApplicantTable", conn);

        try
        {

            conn.Open();
            reader = comm.ExecuteReader();
            ddlist.DataSource = reader;
            ddlist.DataValueField = "ApplicantId";
            ddlist.DataTextField = "LastName";
            ddlist.DataBind();
            reader.Close();
        }
        catch
        {

        }
        finally
        {

            conn.Close();
        }



    }


    protected void Button1_Click(object sender, EventArgs e)
    {


        SqlConnection con;
        SqlCommand com;
        SqlDataReader reader;

        string connectionString =
            ConfigurationManager.ConnectionStrings["BasketballinfoConnectionString"].ConnectionString;

        con = new SqlConnection(connectionString);

        com = new SqlCommand(
            "SELECT * FROM ApplicantTable" +
            " WHERE ApplicantId = @ApplicantId", con);
        com.Parameters.Add("@ApplicantId", SqlDbType.Int);
        com.Parameters["@ApplicantId"].Value = ddlist.SelectedItem.Value;

        try
        {

            con.Open();

            reader = com.ExecuteReader();

            if (reader.Read())
            {
                TextBox1.Text = reader["FirstName"].ToString();
                TextBox2.Text = reader["LastName"].ToString();
                TextBox3.Text = reader["PhoneNumber"].ToString();
                TextBox4.Text = reader["Email"].ToString();
                TextBox5.Text = reader["StreetAddress"].ToString();
                TextBox6.Text = reader["City"].ToString();
                TextBox7.Text = reader["State"].ToString();
                TextBox8.Text = reader["Zip"].ToString();
                TextBox9.Text = reader["GPA"].ToString();
                TextBox10.Text = reader["ACT"].ToString();
                TextBox11.Text = reader["PointAvg"].ToString();
                TextBox12.Text = reader["Shooting"].ToString();
                TextBox13.Text = reader["ThreePoint"].ToString();
                TextBox14.Text = reader["ReboundAvg"].ToString();
            }

            reader.Close();


        }

        finally
        {

            con.Close();
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;

        string connectionString =
          ConfigurationManager.ConnectionStrings[
          "BasketballinfoConnectionString"].ConnectionString;

        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
            "UPDATE ApplicantTable SET  FirstName=@FirstName, LastName=@LastName, PhoneNumber=@PhoneNumber, Email=@Email , StreetAddress=@StreetAddress, City=@City, State = @State, Zip=@Zip, GPA=@GPA, ACT =@ACT, Shooting =@Shooting, PointAvg =@PointAvg, ThreePoint =@ThreePoint, ReboundAvg =@ReboundAvg " +
            " WHERE ApplicantId=@ApplicantId", conn);

        comm.Parameters.Add("@FirstName", System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@FirstName"].Value = TextBox1.Text;

        comm.Parameters.Add("@LastName",
            System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@LastName"].Value = TextBox2.Text;

        comm.Parameters.Add("@PhoneNumber",
            System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@PhoneNumber"].Value = TextBox3.Text;

        comm.Parameters.Add("@Email",
            System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@Email"].Value = TextBox4.Text;

        comm.Parameters.Add("@StreetAddress",
            System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@StreetAddress"].Value = TextBox5.Text;

        comm.Parameters.Add("@City",
            System.Data.SqlDbType.NVarChar, 50);
        comm.Parameters["@City"].Value = TextBox6.Text;

        comm.Parameters.Add("@State",
            System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@State"].Value = TextBox7.Text;

        comm.Parameters.Add("@Zip",
           System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@Zip"].Value = TextBox8.Text;

        comm.Parameters.Add("@GPA",
           System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@GPA"].Value = TextBox9.Text;

        comm.Parameters.Add("@ACT",
           System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@ACT"].Value = TextBox10.Text;

        comm.Parameters.Add("@Shooting",
          System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@Shooting"].Value = TextBox11.Text;

        comm.Parameters.Add("@PointAvg",
           System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@PointAvg"].Value = TextBox12.Text;

        comm.Parameters.Add("@ThreePoint",
           System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@ThreePoint"].Value = TextBox13.Text;

        comm.Parameters.Add("@ReboundAvg",
           System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@ReboundAvg"].Value = TextBox14.Text;

        comm.Parameters.Add("@ApplicantId", System.Data.SqlDbType.Int);
        comm.Parameters["@ApplicantId"].Value = ddlist.SelectedItem.Value;

        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
        }
        catch
        {
            Label1.Text =
                "Error updating the details!<br />";
        }
        finally
        {
            conn.Close();
        }
        LoadLastnameList();
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;

        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "BasketballinfoConnectionString"].ConnectionString;

        conn = new SqlConnection(connectionString);

        comm = new SqlCommand("DELETE FROM ApplicantTable " +
            "WHERE ApplicantId = @ApplicantId", conn);

        comm.Parameters.Add("@ApplicantId", System.Data.SqlDbType.Int);
        comm.Parameters["@ApplicantId"].Value =
            ddlist.SelectedItem.Value;
        try
        {

            conn.Open();

            comm.ExecuteNonQuery();
        }
        catch
        {

            Label1.Text =
                "Error deleting the details!<br />";

        }
        finally
        {

            conn.Close();
        }

        LoadLastnameList();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;

        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "BasketballinfoConnectionString"].ConnectionString;

        conn = new SqlConnection(connectionString);

        comm = new SqlCommand(
          "INSERT INTO CoachesTable (Coaches) " +
          "VALUES (@Coaches)", conn);


        comm.Parameters.Add("@Coaches", System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@Coaches"].Value = TextBox15.Text;



        try
        {

            conn.Open();

            comm.ExecuteNonQuery();

            Response.Redirect("EditArea.aspx");
        }
        finally
        {

            conn.Close();
        }
    }

    protected void BtnEditplayer_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    protected void btnEditCoach_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void btnschool_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;

        string connectionString =
            ConfigurationManager.ConnectionStrings[
            "BasketballinfoConnectionString"].ConnectionString;

        conn = new SqlConnection(connectionString);

        comm = new SqlCommand(
          "INSERT INTO SkillTable (SkillLevel) " +
          "VALUES (@SkillLevel)", conn);


        comm.Parameters.Add("@SkillLevel", System.Data.SqlDbType.NChar, 10);
        comm.Parameters["@SkillLevel"].Value = TextBox15.Text;



        try
        {

            conn.Open();

            comm.ExecuteNonQuery();

            Response.Redirect("EditArea.aspx");
        }
        finally
        {

            conn.Close();
        }
    }

    protected void btnLevel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }




    protected void Read1_Click(object sender, EventArgs e)
    {

        SqlConnection con;
        SqlCommand com;
        SqlDataReader reader;

        string connectionString =
            ConfigurationManager.ConnectionStrings["BasketballinfoConnectionString"].ConnectionString;

        con = new SqlConnection(connectionString);

        com = new SqlCommand(
            "SELECT * FROM ApplicantTable" +
            " WHERE ApplicantId = @ApplicantId", con);
        com.Parameters.Add("@ApplicantId", SqlDbType.Int);
        com.Parameters["@ApplicantId"].Value = DDL.SelectedItem.Value;

        try
        {

            con.Open();

            reader = com.ExecuteReader();

            if (reader.Read())
            {
                TextBox17.Text = reader["Comments"].ToString();
         
            }

            reader.Close();


        }

        finally
        {

            con.Close();
        }
    }




    protected void Button12_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;

        string connectionString =
          ConfigurationManager.ConnectionStrings[
          "BasketballinfoConnectionString"].ConnectionString;

        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
            "UPDATE ApplicantTable SET Comments=@Comments" +
            " WHERE ApplicantId=@ApplicantId", conn);

        comm.Parameters.Add("@Comments", System.Data.SqlDbType.NVarChar, 1000000);
        comm.Parameters["@Comments"].Value = TextBox17.Text;

        comm.Parameters.Add("@ApplicantId", System.Data.SqlDbType.Int);
        comm.Parameters["@ApplicantId"].Value = DDL.SelectedItem.Value;

        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
        }
      
        finally
        {
            conn.Close();
        }
        
    }

    protected void btncomments_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
    }
}

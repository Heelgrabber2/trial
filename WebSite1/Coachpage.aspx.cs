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

public partial class Coachpage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataReader reader;
        SqlConnection conn;
        SqlCommand comms;
        //Making a connection string
        string connectionString =
                ConfigurationManager.ConnectionStrings["BasketballinfoConnectionString"].ConnectionString;
        //SQL connection
        conn = new SqlConnection(connectionString);

        string queryString = "SELECT ApplicantId, LastName , CoachN, SkillN, PositionN FROM ApplicantTable";

        bool coachID = false;
        if ((Convert.ToInt32(DropCoach.SelectedItem.Value)) > 0)
        {
            queryString = queryString + " WHERE [CoachN] = @CoachN";
            coachID = true;
        }

        bool LevelID = false;
        if ((Convert.ToInt32(DropLevel.SelectedItem.Value)) > 0)
        {
            if (coachID)
                queryString = queryString + " AND [SkillN]=@SkillN";
            else
                queryString = queryString + " WHERE [SkillN]=@SkillN";
            LevelID = true;
        }

        bool POSID = false;
        if ((Convert.ToInt32(Dropposition.SelectedItem.Value)) > 0)
        {
            if (coachID | LevelID)
                queryString = queryString + " AND [PositionN]=@PositionN";
            else
                queryString = queryString + " WHERE [PositionN]=@PositionN";
            POSID = true;
        }

        //  queryString = queryString + " ORDER BY [LastName],[FirstName]";


        comms = new SqlCommand(queryString, conn);

        if (coachID)
        {
            comms.Parameters.Add("@CoachN", SqlDbType.Int);
            comms.Parameters["@CoachN"].Value = DropCoach.SelectedValue;
        }
        if (LevelID)
        {
            comms.Parameters.Add("@SkillN", SqlDbType.Int);
            comms.Parameters["@SkillN"].Value = DropLevel.SelectedValue;
        }
        if (POSID)
        {
            comms.Parameters.Add("@PositionN", SqlDbType.Int);
            comms.Parameters["@PositionN"].Value = Dropposition.SelectedValue;
        }

        Label1.Text = queryString;
        try
        {
            conn.Open();
            reader = comms.ExecuteReader();
            Filter.DataSource = reader;
            Filter.DataValueField = "ApplicantId";
            Filter.DataTextField = "LastName";
            Filter.DataBind();
            if (Filter.Items.Count == 0)
                Filter.Items.Insert(0, new ListItem("No player found"));
            else
                Filter.Items.Insert(0, new ListItem("Choose player"));
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


    protected void stats_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        DataTable table = new DataTable();
        string querystring1 = "SELECT ApplicantTable.FirstName, ApplicantTable.LastName, ApplicantTable.PointAvg, ApplicantTable.Shooting, ApplicantTable.ThreePoint, ApplicantTable.ReboundAvg, [Table].Position, SkillTable.SkillLevel, ApplicantTable.ApplicantId FROM ApplicantTable INNER JOIN [Table] ON ApplicantTable.PositionN = [Table].PostionId INNER JOIN SkillTable ON ApplicantTable.SkillN = SkillTable.SkillId";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["BasketballinfoConnectionString"].ToString();

        bool applicant = false;
        if ((Convert.ToInt32(Filter.SelectedItem.Value)) > 0)
        {

            querystring1 = querystring1 + " WHERE [ApplicantId]=@ApplicantId";
            applicant = true;
        }

        SqlCommand cmd = new SqlCommand(querystring1, con);
        if (applicant)
        {
            cmd.Parameters.Add("@ApplicantId", SqlDbType.Int);
            cmd.Parameters["@ApplicantId"].Value = Filter.SelectedValue;
        }
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        {
            ad.Fill(table);
        }
        GridView1.DataSource = table;
        GridView1.DataBind();
    }

    protected void Contact_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    protected void academics_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
        DataTable table = new DataTable();
        string querystring1 = "SELECT ApplicantTable.FirstName, ApplicantTable.LastName, ApplicantTable.GPA, ApplicantTable.ACT, MajorTable.Major FROM ApplicantTable INNER JOIN MajorTable ON ApplicantTable.MajorN = MajorTable.MajorId";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["BasketballinfoConnectionString"].ToString();

        bool applicant = false;
        if ((Convert.ToInt32(Filter.SelectedItem.Value)) > 0)
        {

            querystring1 = querystring1 + " WHERE [ApplicantId]=@ApplicantId";
            applicant = true;
        }

        SqlCommand cmd = new SqlCommand(querystring1, con);
        if (applicant)
        {
            cmd.Parameters.Add("@ApplicantId", SqlDbType.Int);
            cmd.Parameters["@ApplicantId"].Value = Filter.SelectedValue;
        }
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        {
            ad.Fill(table);
        }
        GridView3.DataSource = table;
        GridView3.DataBind();
    }
}
using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;


[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class Employee : System.Web.Services.WebService
{
	public Employee()
	{

    }

    [WebMethod]
    public decimal GetCost(string employeeID, DateTime visitDate)
	{

		SqlConnection myConnection = new SqlConnection();
		myConnection.ConnectionString = WebConfigurationManager.ConnectionStrings["Pro_SSRS"].ConnectionString;
		//"Persist Security Info=False;Integrated Security=SSPI;database=Pro_SSRS;server=localhost;Connect Timeout=30";
	    string queryString = "EmpVisitCost";
        SqlCommand command = new SqlCommand(queryString, myConnection);
		command.CommandType = CommandType.StoredProcedure;
		command.Parameters.Add("@EmployeeID", SqlDbType.Char, 20).Value = employeeID;
		command.Parameters.Add("@VisitDate", SqlDbType.DateTime).Value = visitDate;
		SqlParameter parameter = new SqlParameter("@VisitCost", SqlDbType.Decimal);
		parameter.Direction = ParameterDirection.Output;
		command.Parameters.Add(parameter);
		myConnection.Open();
		command.ExecuteNonQuery();
		decimal cost = (decimal)parameter.Value;
		return cost;

    }
}


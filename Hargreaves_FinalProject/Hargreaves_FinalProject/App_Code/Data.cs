using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Hargreaves_FinalProject
{
    public static class Data
    {
        //static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["LocalServer"].ConnectionString;
        static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["uwServer"].ConnectionString;
        public static List<classesById> getClassData()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Select * from vClasses", conn);
                try
                {
                    List<classesById> classes = new List<classesById>();
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        classesById row = new classesById();
                        row.classId = (int)reader["ClassId"];
                        row.className = reader["ClassName"].ToString();
                        row.classDate = (DateTime)reader["ClassDate"];
                        row.classDescription = reader["ClassDescription"].ToString();
                        classes.Add(row);
                    }
                    return classes;
                }
                catch (SqlException e)
                {
                    string error = "An exception occurred:" + e.Message;
                    return null;
                }
            }
        }
        public static int checkLogin(string userID, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("pSelLoginIdByLoginAndPassword", conn);
                try
                {
                    conn.Open();
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    SqlParameter objRC = new SqlParameter("@RC", System.Data.SqlDbType.Int);
                    objRC.Direction = System.Data.ParameterDirection.ReturnValue;
                    cmd.Parameters.Add(objRC);

                    SqlParameter studentID = new SqlParameter("@StudentId", System.Data.SqlDbType.Int);
                    studentID.Direction = System.Data.ParameterDirection.Output;
                    cmd.Parameters.Add(studentID);

                    cmd.Parameters.AddWithValue("@StudentLogin", userID);
                    cmd.Parameters.AddWithValue("@StudentPassword", password);

                    cmd.ExecuteNonQuery();

                    if ((int)cmd.Parameters["@RC"].Value == 100)
                    {
                        return (int)cmd.Parameters["@StudentId"].Value;
                    }
                    else return 0;
                }
                catch (SqlException e)
                {
                    string error = "An exception occurred:" + e.Message;
                    return 0;
                }
            }
        }
        public static List<classesById> getClassesById(int studentID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("pSelClassesByStudentID", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StudentId", studentID);
                try
                {
                    List<classesById> classes = new List<classesById>();
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        classesById row = new classesById();
                        row.studentName = reader["StudentName"].ToString();
                        row.studentEmail = reader["StudentEmail"].ToString();
                        row.classId = (int)reader["ClassId"];
                        row.className = reader["ClassName"].ToString();
                        row.classDate = (DateTime)reader["ClassDate"];
                        row.classDescription = reader["ClassDescription"].ToString();
                        classes.Add(row);
                    }
                    return classes;
                }
                catch (SqlException e)
                {
                    string error = "An exception occurred:" + e.Message;
                    return null;
                }
            }
        }
        public static bool loginRequest(loginReqestData request)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("pInsLoginRequests", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", request.name);
                cmd.Parameters.AddWithValue("@EmailAddress", request.emailAddress);
                cmd.Parameters.AddWithValue("@LoginName", request.loginName);
                cmd.Parameters.AddWithValue("@NewOrReactivate", request.newOrReactivate);
                cmd.Parameters.AddWithValue("@ReasonForAccess", request.reasonForAccess);
                cmd.Parameters.AddWithValue("@DateRequiredBy", request.dateNeededBy);

                SqlParameter objRC = new SqlParameter("@RC", System.Data.SqlDbType.Int);
                objRC.Direction = System.Data.ParameterDirection.ReturnValue;
                cmd.Parameters.Add(objRC);

                SqlParameter loginID = new SqlParameter("@LoginId", System.Data.SqlDbType.Int);
                loginID.Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add(loginID);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    if ((int)cmd.Parameters["@RC"].Value == 100)
                    {
                        return true;
                    }
                    else { return false; }
                }
                catch (SqlException e)
                {
                    string error = "An exception occurred:" + e.Message;
                    return false;
                }
            }
        }
        public static bool classRegister(int classId, int studentID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("pInsClassStudents", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ClassId", classId);
                cmd.Parameters.AddWithValue("@StudentId", studentID);

                SqlParameter objRC = new SqlParameter("@RC", System.Data.SqlDbType.Int);
                objRC.Direction = System.Data.ParameterDirection.ReturnValue;
                cmd.Parameters.Add(objRC);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    if ((int)cmd.Parameters["@RC"].Value == 100)
                    {
                        return true;
                    }
                    else { return false; }
                }
                catch (SqlException e)
                {
                    string error = "An exception occurred:" + e.Message;
                    return false;
                }
            }
        }
        public struct classesById
        {
            public string studentName;
            public string studentEmail;
            public int classId;
            public string className;
            public DateTime classDate;
            public string classDescription;
        }
        public struct loginReqestData
        {
            public string name;
            public string emailAddress;
            public string loginName;
            public string newOrReactivate;
            public string reasonForAccess;
            public DateTime dateNeededBy;
        }
    }
}
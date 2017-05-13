﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;

namespace lib.CAD
{
    class CADClient : CADUser
    {
        private string conString;

        public CADClient()
        {
            conString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ToString();
            conString = conString.Replace("|DataDirectory|", AppDomain.CurrentDomain.GetData("DataDirectory").ToString());
        }

        public void Create(EN.User user) {
            EN.Client newClient = (EN.Client)user;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from Client", con);
                SqlDataAdapter da2 = new SqlDataAdapter("select * from Usuario", con);
                da.Fill(bdvirtual, "client");
                da2.Fill(bdvirtual, "usuario");

                DataTable t = new DataTable();
                DataTable t2 = new DataTable();
                t = bdvirtual.Tables["client"];
                t2 = bdvirtual.Tables["usuario"];

                DataRow newrow = t.NewRow();
                newrow[0] = newClient.email;
                newrow[1] = newClient.name;
                newrow[2] = newClient.surname1;
                newrow[3] = newClient.surname2;
                newrow[4] = newClient.age;
                newrow[5] = newClient.phone;
                newrow[6] = newClient.address;
                newrow[7] = newClient.creditCard;

                DataRow newrow2 = t2.NewRow();
                newrow[0] = newClient.email;
                newrow[1] = newClient.password;

                t.Rows.Add(newrow);
                t2.Rows.Add(newrow2);
                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                SqlCommandBuilder cbuilder2 = new SqlCommandBuilder(da2);
                da.Update(bdvirtual, "client");
                da2.Update(bdvirtual, "usuario");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error Creating Client (CadClient): " + ex.ToString());
            }
            finally { con.Close(); }
        }

        public EN.User Read(String email)
        {
            EN.Client client = new EN.Client("", "", "");
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from client usuario email like '" + email + "'", con);
                SqlDataAdapter da2 = new SqlDataAdapter("select * from usuario where email like '" + email + "'", con);
                da.Fill(bdvirtual, "client");
                da2.Fill(bdvirtual, "usuario");

                DataTable t = new DataTable();
                DataTable t2 = new DataTable();
                t = bdvirtual.Tables["client"];
                t2 = bdvirtual.Tables["usuario"];

                client.email = t.Rows[0][0].ToString();
                client.password = t2.Rows[0][1].ToString();
                client.name = t.Rows[0][1].ToString();
                client.surname1 = t.Rows[0][2].ToString();
                client.surname2 = t.Rows[0][3].ToString();
                client.age = t.Rows[0][4].ToString();
                client.phone = Int32.Parse(t.Rows[0][5].ToString());
                client.address = t.Rows[0][6].ToString();
                client.creditCard = t.Rows[0][7].ToString();
            }
            catch (Exception ex) { }
            finally { con.Close(); }

            return client;
        }

        public void Update(EN.User user) {
            EN.Client newClient = (EN.Client)user;
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from client where usuario like '" + user.email + "'", con);
                SqlDataAdapter da2 = new SqlDataAdapter("select * from usuario where email like '" + user.email + "'", con);
                da.Fill(bdvirtual, "client");
                da2.Fill(bdvirtual, "usuario");

                DataTable t = new DataTable();
                DataTable t2 = new DataTable();
                t = bdvirtual.Tables["client"];
                t2 = bdvirtual.Tables["usuario"];
                
                t.Rows[0][1] = newClient.name;
                t.Rows[0][2] = newClient.surname1;
                t.Rows[0][3] = newClient.surname2;
                t.Rows[0][4] = newClient.age;
                t.Rows[0][5] = newClient.phone;
                t.Rows[0][6] = newClient.address;
                t.Rows[0][7] = newClient.creditCard;
                t2.Rows[0][1] = newClient.password;

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                SqlCommandBuilder cbuilder2 = new SqlCommandBuilder(da2);
                da.Update(bdvirtual, "client");
                da2.Update(bdvirtual, "usuario");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }

        public void Delete(String email) {
            SqlConnection con = new SqlConnection(conString);
            DataSet bdvirtual = new DataSet();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from client where email like '" + email + "'", con);
                SqlDataAdapter da2 = new SqlDataAdapter("select * from usuario where email like '" + email + "'", con);
                da.Fill(bdvirtual, "client");
                da2.Fill(bdvirtual, "usuario");

                DataTable t = new DataTable();
                DataTable t2 = new DataTable();
                t = bdvirtual.Tables["client"];
                t2 = bdvirtual.Tables["usuario"];

                t.Rows[0].Delete();
                t2.Rows[0].Delete();

                SqlCommandBuilder cbuilder = new SqlCommandBuilder(da);
                SqlCommandBuilder cbuilder2 = new SqlCommandBuilder(da2);
                da.Update(bdvirtual, "client");
                da2.Update(bdvirtual, "usuario");
            }
            catch (Exception ex) { }
            finally { con.Close(); }
        }
    }
}

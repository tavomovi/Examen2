using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Examen2.Clases
{
    public class Tecnico
    {
        public static int TecnicoID { get; set; }
        public static string Nombre { get; set; }
        public static string Especialidad { get; set; }


        public Tecnico(int Id, string Nom, string especialidad)
        {
            TecnicoID = Id;
            Nombre = Nom;
            Especialidad = especialidad;
        }

        public Tecnico(string Nom, string especialidad)
        {
            Nombre = Nom;
            Especialidad = especialidad;
        }

        public Tecnico() { }

        public static int AgregarTec(string nom, string especialidad)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("IngresarTecnico", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nom));
                    cmd.Parameters.Add(new SqlParameter("@Especialidad  ", especialidad));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

        public static int BorrarTec(int id)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BorrarTecnico", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@TecnicoID ", id));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;


        }

        public void consultar()
        {

        }

        public static int ModificarTec(int id, string nom, string especialidad)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ActualizarTecnico", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@TecnicoID", id));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nom));
                    cmd.Parameters.Add(new SqlParameter("@Especialidad ", especialidad));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

        public static List<Tecnico> consultaFiltro(int id)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            List<Tecnico> Tecnicos = new List<Tecnico>();
            try
            {

                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ConsultarTecnicoFiltro", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@TecnicoID", id));
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Tecnico Tecnicos1 = new Tecnico(reader.GetInt32(0), reader.GetString(1), reader.GetString(2));  // instancia
                            Tecnicos.Add(Tecnicos1);

                        }


                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return Tecnicos;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return Tecnicos;
        }





        public static List<Tecnico> ObtenerUsuario()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            List<Tecnico> Tecnicos = new List<Tecnico>();
            try
            {

                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ConsultarTecnicos", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Tecnico Tecnicos1 = new Tecnico(reader.GetInt32(0), reader.GetString(1), reader.GetString(2));  // instancia
                            Tecnicos.Add(Tecnicos1);
                        }

                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return Tecnicos;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return Tecnicos;
        }
    }
}

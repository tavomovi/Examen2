using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Examen2.Clases
{
    public class Equipo
    {
        public static int EquipoID { get; set; }
        public static string TipoEquipo { get; set; }
        public static string Modelo { get; set; }
        public static int UsuarioID { get; set; }


        public Equipo(int Id, string tipo, string modelo, int usuarioID)
        {
            EquipoID = Id;
            TipoEquipo = tipo;
            Modelo = modelo;
            UsuarioID = usuarioID;
        }

        public Equipo(string tipo, string modelo, int usuarioID)
        {
            TipoEquipo = tipo;
            Modelo = modelo;
            UsuarioID = usuarioID;
        }

        public Equipo() { }

        public static int AgregarE(string tipo, string modelo, int usuarioID)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("IngresarEquipo", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@TipoEquipo", tipo));
                    cmd.Parameters.Add(new SqlParameter("@Modelo", modelo));
                    cmd.Parameters.Add(new SqlParameter("@UsuarioID", usuarioID));


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

        public static int BorrarE(int id)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BorrarEquipo", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@EquipoID", id));


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

        public static int ModificarE(int Id, string tipo, string modelo, int usuarioID)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ActualizarEquipo", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@UsuarioID", Id));
                    cmd.Parameters.Add(new SqlParameter("@TipoEquipo", tipo));
                    cmd.Parameters.Add(new SqlParameter("@Modelo varchar", modelo));
                    cmd.Parameters.Add(new SqlParameter("@UsuarioID", usuarioID));


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

        public static List<Equipo> consultaFiltroE(int id)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            List<Equipo> Equipos = new List<Equipo>();
            try
            {

                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ConsultarEquipoFiltro", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@EquipoID", id));
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Equipo Equipo1 = new Equipo(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3));  // instancia
                            Equipos.Add(Equipo1);

                        }


                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return Equipos;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return Equipos;
        }





        public static List<Equipo> ObtenerUsuario()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            List<Equipo> Equipos = new List<Equipo>();
            try
            {

                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ConsultarEquipo", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Equipo Equipo1 = new Equipo(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3));  // instancia
                            Equipos.Add(Equipo1);
                        }

                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return Equipos;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return Equipos;
        }
    }
}

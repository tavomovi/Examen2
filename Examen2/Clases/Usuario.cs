using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Examen2.Clases
{
    public class Usuario
    {
        public static int UsuarioID { get; set; }
        public static string Nombre { get; set; }
        public static string CorreoElectronico { get; set; }
        public static string Telefono { get; set; }


        public Usuario(int Id, string Nom, string correo, string tel)
        {
            UsuarioID = Id;
            Nombre = Nom;
            CorreoElectronico = correo;
            Telefono = tel;
        }
        
        public Usuario(string Nom, string correo, string tel)
        {
            Nombre = Nom;
            CorreoElectronico = correo;
            Telefono = tel;
        }

        public Usuario() { }

       public static int Agregar(string nom, string correo, string tel)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("IngresarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nom));
                    cmd.Parameters.Add(new SqlParameter("@CorreoElectronico ", correo));
                    cmd.Parameters.Add(new SqlParameter("@Telefono ", tel));


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
        
        public static int Borrar(int id)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BorrarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@UsuarioID", id));


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

        public static int Modificar(int id, string nom, string correo, string tel)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ActualizarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@UsuarioID", id));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nom));
                    cmd.Parameters.Add(new SqlParameter("@CorreoElectronico ", correo));
                    cmd.Parameters.Add(new SqlParameter("@Telefono ", tel));


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

 
        public static List<Usuario> consultaFiltro(int id)
               {
                   int retorno = 0;

                   SqlConnection Conn = new SqlConnection();
                   List<Usuario> Usuarios = new List<Usuario>();
                   try
                   {

                       using (Conn = DBConn.obtenerConexion())
                       {
                           SqlCommand cmd = new SqlCommand("ConsultarUsuarioFiltro", Conn)
                           {
                               CommandType = CommandType.StoredProcedure
                           };
                           cmd.Parameters.Add(new SqlParameter("@UsuarioID", id));
                           retorno = cmd.ExecuteNonQuery();
                           using (SqlDataReader reader = cmd.ExecuteReader())
                           {
                               while (reader.Read())
                               {
                                   Usuario usuario1 = new Usuario(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetString(3));  // instancia
                                   Usuarios.Add(usuario1);

                               }


                           }
                       }
                   }
                   catch (System.Data.SqlClient.SqlException ex)
                   {
                       return Usuarios;
                   }
                   finally
                   {
                       Conn.Close();
                       Conn.Dispose();
                   }

                   return Usuarios;
               }


       


        public static List<Usuario> ObtenerUsuario()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            List<Usuario> usuarios = new List<Usuario>();
            try
            {

                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ConsultarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Usuario usuario1 = new Usuario(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetString(3));  // instancia
                            usuarios.Add(usuario1);
                        }

                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return usuarios;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return usuarios;
        }
    }
}

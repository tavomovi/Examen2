﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen2
{
    public partial class equipo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
                LlenarUsuarios();
            }
        }

        public void alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Equipos"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            datagrid.DataSource = dt;
                            datagrid.DataBind();  // actualizar el grid view
                        }
                    }
                }
            }
        }

        protected void LlenarUsuarios()
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select Nombre, UsuarioID  from Usuarios"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            DropDownList1.DataSource = dt;

                            DropDownList1.DataTextField = dt.Columns["Nombre"].ToString();
                            DropDownList1.DataValueField = dt.Columns["UsuarioID"].ToString();
                            DropDownList1.DataBind();
                        }
                    }
                }
            }
        }
        
        protected void ButtonAgregarE_Click(object sender, EventArgs e)
        {


            int resultado = Clases.Equipo.AgregarE(ttipo.Text, tmodelo.Text, int.Parse(DropDownList1.SelectedValue));

            if (resultado > 0)
            {
                alertas("Equipo ha sido ingresado con exito");
                tcodigo.Text = string.Empty;
                ttipo.Text = string.Empty;
                tmodelo.Text = string.Empty;
                LlenarGrid();
            }
            else
            {
                alertas("Error al ingresar equipo");

            }
        }

        protected void ButtonBorrarE_Click(object sender, EventArgs e)
        {
            int resultado = Clases.Equipo.BorrarE(int.Parse(tcodigo.Text));

            if (resultado > 0)
            {
                alertas("Equipo ha sido borrado con exito");
                tcodigo.Text = string.Empty;
                ttipo.Text = string.Empty;
                tmodelo.Text = string.Empty;

                LlenarGrid();
            }
            else
            {
                alertas("Error al ingresar codigo del equipo");

            }
        }

        protected void ButtonModificarE_Click(object sender, EventArgs e)
        {


            int resultado = Clases.Equipo.ModificarE(int.Parse(tcodigo.Text), tcodigo.Text, ttipo.Text, int.Parse(DropDownList1.SelectedValue));

            if (resultado > 0)
            {
                alertas("Equipo ha sido modificado con exito");
                tcodigo.Text = string.Empty;
                ttipo.Text = string.Empty;
                tmodelo.Text = string.Empty;
                LlenarGrid();
            }
            else
            {
                alertas("Error al modificar equipo");

            }
        }

        protected void BconsultaE_Click(object sender, EventArgs e)
        {
            int codigo = int.Parse(tcodigo.Text);
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Equipos WHERE EquipoID ='" + codigo + "'"))


                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        datagrid.DataSource = dt;
                        datagrid.DataBind();  // actualizar el grid view
                    }
                }
            }

        }

        protected void BSalirConsultaE_Click(object sender, EventArgs e) { LlenarGrid(); }
    }
}
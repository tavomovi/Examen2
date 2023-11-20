using System;
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
    public partial class tecnico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
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
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Tecnicos"))
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

        protected void ButtonAgregarTec_Click(object sender, EventArgs e)
        {


            int resultado = Clases.Tecnico.AgregarTec(tnombre.Text, tEspecialidad.Text);

            if (resultado > 0)
            {
                alertas("Tecnico ha sido ingresado con exito");
                tnombre.Text = string.Empty;
                tEspecialidad.Text = string.Empty;
                LlenarGrid();
            }
            else
            {
                alertas("Error al ingresar tecnico");

            }
        }

        protected void ButtonBorrarTec_Click(object sender, EventArgs e)
        {
            int resultado = Clases.Tecnico.BorrarTec(int.Parse(tcodigo.Text));

            if (resultado > 0)
            {
                alertas("Tecnico ha sido borrado con exito");
                tcodigo.Text = string.Empty;
                tnombre.Text = string.Empty;
                tEspecialidad.Text = string.Empty;
                LlenarGrid();
            }
            else
            {
                alertas("Error al ingresar id del tecnico");

            }
        }

        protected void ButtonModificarTec_Click(object sender, EventArgs e)
        {


            int resultado = Clases.Tecnico.ModificarTec(int.Parse(tcodigo.Text), tnombre.Text, tEspecialidad.Text);

            if (resultado > 0)
            {
                alertas("Tecnico ha sido modificado con exito");
                tcodigo.Text = string.Empty;
                tnombre.Text = string.Empty;
                tEspecialidad.Text = string.Empty;
                LlenarGrid();
            }
            else
            {
                alertas("Error al modificar Tecnico");

            }
        }

        protected void BconsultaTec_Click(object sender, EventArgs e)
        {
            int codigo = int.Parse(tcodigo.Text);
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Tecnicos WHERE TecnicoID ='" + codigo + "'"))


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

        protected void BSalirConsultaTec_Click(object sender, EventArgs e) { LlenarGrid(); }
    }
}
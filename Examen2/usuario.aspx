<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="usuario.aspx.cs" Inherits="Examen2.usuario1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">   
        <h1>Ingreso de Usuarios al Sistema</h1>
    
    </div>
    <div class="container text-center">
        Notas importantes:<br />
        El ID del usuario es asignado por el Sistema<br />
        Para borrar usuarios es unicamente necesario el el ID <br />
        No se puede borrar un Usuario si tiene un Equipo en el Sistema<br />


    </div>
    <div>
        <br />
        
        <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
            CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
            RowStyle-CssClass="rows" AllowPaging="True" />
        <br />


    </div>
    <div class="container text-center">
        ID del Usuario: <asp:TextBox ID="tcodigo" class="form-control" runat="server"></asp:TextBox>
        Nombre del Usuario: <asp:TextBox ID="tnombre" class="form-control" runat="server"></asp:TextBox>
        Correo: <asp:TextBox ID="tcorreo" class="form-control" runat="server"></asp:TextBox>
        Telefono: <asp:TextBox ID="Ttelefono" class="form-control" runat="server"></asp:TextBox><br />
    </div>

    <div class="container text-center">

        <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" Text="Agregar" OnClick="ButtonAgregarU_Click" />
        <asp:Button ID="Button2" class="btn btn-outline-secondary" runat="server" Text="Borrar" OnClick="ButtonBorrarU_Click" />
        <asp:Button ID="Button3" runat="server" class="btn btn-outline-primary" Text="Modificar" OnClick="ButtonModificarU_Click" />
        <asp:Button ID="Bconsulta" runat="server" class="btn btn-outline-danger" Text="Consultar" OnClick="Bconsulta_Click" />
        <asp:Button ID="Button4" runat="server" class="btn btn-outline-danger" Text="Salir de Consulta" OnClick="BSalirConsulta_Click" />
        

    </div>
</asp:Content>

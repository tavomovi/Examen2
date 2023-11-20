<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="tecnico.aspx.cs" Inherits="Examen2.tecnico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">   
        <h1>Ingreso de Tecnicos al Sistema</h1>
    </div>
        <div class="container text-center">
        Notas importantes:<br />
        El ID del tecnico es asignado por el Sistema<br />
        Para borrar tecnicos es unicamente necesario el el ID <br />
    </div>

    <div>

        <br />
        <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
            CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
            RowStyle-CssClass="rows" AllowPaging="True" />

        <br />


    </div>
    <div class="container text-center">
        ID del Tecnico: <asp:TextBox ID="tcodigo" class="form-control" runat="server"></asp:TextBox>
        Nombre: <asp:TextBox ID="tnombre" class="form-control" runat="server"></asp:TextBox>
        Especialidad: <asp:TextBox ID="tEspecialidad" class="form-control" runat="server"></asp:TextBox><br />
    </div>

    <div class="container text-center">

        <asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" Text="Agregar" OnClick="ButtonAgregarTec_Click" />
        <asp:Button ID="Button2" class="btn btn-outline-secondary" runat="server" Text="Borrar" OnClick="ButtonBorrarTec_Click" />
        <asp:Button ID="Button3" runat="server" class="btn btn-outline-primary" Text="Modificar" OnClick="ButtonModificarTec_Click" />
        <asp:Button ID="Bconsulta" runat="server" class="btn btn-outline-danger" Text="Consultar" OnClick="BconsultaTec_Click" />
        <asp:Button ID="Button4" runat="server" class="btn btn-outline-danger" Text="Salir de Consulta" OnClick="BSalirConsultaTec_Click" />
        

    </div>
</asp:Content>
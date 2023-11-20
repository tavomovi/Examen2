<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="equipo.aspx.cs" Inherits="Examen2.equipo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">   
        <h1>Ingreso de Equipos al Sistema</h1>
</div>
<div class="container text-center">
    Notas importantes:<br />
    El Codigo del equipo es asignado por el Sistema<br />
    Para borrar equipos es unicamente necesario el Codigo <br />
    El ID del Usuario debe estar cargado previamente en el Sistema en el apartado USUARIOS<br />


</div>
<div>

    <br />
    <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
        RowStyle-CssClass="rows" AllowPaging="True" />

    <br />


</div>
<div class="container text-center">
        Codigo Equipo: <asp:TextBox ID="tcodigo" class="form-control" runat="server"></asp:TextBox>
        Tipo Equipo: <asp:TextBox ID="ttipo" class="form-control" runat="server"></asp:TextBox>
        Modelo: <asp:TextBox ID="tmodelo" class="form-control" runat="server"></asp:TextBox>
        <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">ID Usuario</label>
        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
        </div>
</div>

<div class="container text-center">
<br />
<asp:Button ID="Button1" class="btn btn-outline-primary" runat="server" Text="Agregar" OnClick="ButtonAgregarE_Click" />
<asp:Button ID="Button2" class="btn btn-outline-secondary" runat="server" Text="Borrar" OnClick="ButtonBorrarE_Click" />
<asp:Button ID="Button3" runat="server" class="btn btn-outline-primary" Text="Modificar" OnClick="ButtonModificarE_Click" />
<asp:Button ID="Bconsulta" runat="server" class="btn btn-outline-danger" Text="Consultar" OnClick="BconsultaE_Click" />
<asp:Button ID="Button4" runat="server" class="btn btn-outline-danger" Text="Salir de Consulta" OnClick="BSalirConsultaE_Click" />

</div>
</asp:Content>
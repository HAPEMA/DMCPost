<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vista_TiendaBD.aspx.cs" Inherits="segunda.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
   <style>
body, html {
           height: 100%;
           margin: 0;
       }

    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f8f8;
        color: #333;
        margin: 0;
        padding: 0;
    }

    h1 {
        color: #6a1b9a;
        text-align: center;
        margin-top: 20px;
    }

   select, input{
       height: 50px;
       width: 122px;
       background-color: #fff;
       color: #6a1b9a;
       border: 1px solid #6a1b9a;
       border-radius: 5px;
       margin-bottom: 10px;
   }

    table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }

    table th,
    table td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    table th {
        background-color: #6a1b9a;
        color: purple;
    }
    footer {
        background-color: #663399;
        color: white;
        text-align: left;
        padding: 10px;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>

    <div>
        <h1>Lista de Tienda</h1>
    </div>

    <p>
      <asp:DropDownList ID="DropDownList1" runat="server" Height="50px" Width="122px">

  <asp:ListItem id="idcliente">Cliente</asp:ListItem>
  <asp:ListItem id="idtienda">Tienda</asp:ListItem>
</asp:DropDownList>

<asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" Width="75px" />

         
    </p>

   <asp:GridView ID="Tienda" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="id_Tienda" HeaderText="ID Tienda" />
        <asp:BoundField DataField="NombreTienda" HeaderText="Nombre Tienda" />
        <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
        <asp:BoundField DataField="Comuna" HeaderText="Comuna" />
        <asp:BoundField DataField="FK_IdCliente" HeaderText="ID Cliente" />
    </Columns>
</asp:GridView>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vista_ServicioTecnicoBD.aspx.cs" Inherits="segunda.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    body, html {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Arial', sans-serif;
        background-color: #f8f8f8;
        color: #333;
        margin: 0;
    }

    h1 {
        color: #6a1b9a;
        text-align: center;
        margin-top: 20px;
    }

    select {
        height: 50px;
        width: 122px;
        background-color: #fff;
        color: #6a1b9a;
        border: 1px solid #6a1b9a;
        border-radius: 5px;
        margin-bottom: 10px;
    }

    input {
        background-color: #6a1b9a;
        color: #fff;
        width: 75px;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
        margin-bottom: 60px; /* Ajuste para evitar que el footer tape la tabla */
    }

    table th,
    table td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    table th {
        background-color: #6a1b9a;
        color: #fff;
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


    <body>
    <h1>Ver Estado de los Servicios</h1>

        <div class="mb-3">

    <asp:Label ID="labelNombreTecnico" runat="server" Text="Nombre Técnico:" CssClass="form-label"></asp:Label>
    <asp:DropDownList ID="DropDownListNombreTecnico" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>




        <asp:Label ID="list" runat="server" Text="Cliente:" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged"></asp:DropDownList>
                    <%-- El input de cliente  --%>

             <asp:Label ID="tiendaa" runat="server" Text="Tienda:" CssClass="form-label"></asp:Label> 
                        <%-- El input de tienda  --%>
             <asp:DropDownList ID="DropDownListTienda" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>



        <div><asp:Label ID="Label12" runat="server" Text="Estatus:" CssClass="form-label"></asp:Label></div> 
    <asp:DropDownList ID="DropDownListEstado" runat="server" Width="350px">
       
    <asp:ListItem Text="Elige el Estatus" Value="" Selected="True" Disabled="True"></asp:ListItem>
           <asp:ListItem Value="Ambos">Ambos</asp:ListItem>
    <asp:ListItem Value="Realizado">Realizados</asp:ListItem>
           <asp:ListItem Value="Pendiente">Pendientes</asp:ListItem>
    </asp:DropDownList>

                    <div>
              <label for="txtFechaInicio">Fecha de Inicio:</label>
        </div>
      
<asp:TextBox ID="txtFechaInicio" runat="server" type="date" CssClass="form-control"></asp:TextBox>

<label for="txtFechaFin">Fecha de Fin:</label>
<asp:TextBox ID="txtFechaFin" runat="server" type="date" CssClass="form-control"></asp:TextBox>


            </div>
    <asp:Button ID="ButtonMostrar" runat="server" Text="Mostrar" OnClick="ButtonMostrar_Click" />

    <asp:GridView ID="GridViewServicios" runat="server" AutoGenerateColumns="false">
        <Columns>
           <asp:BoundField DataField="Motivo" HeaderText="Motivo" />
           <asp:BoundField DataField="TipoTrabajo" HeaderText="Tipo de Trabajo" />
           <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
           <asp:BoundField DataField="Estatus" HeaderText="Estatus" />
           <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
           <asp:BoundField DataField="Responsable" HeaderText="Responsable" />
           <asp:BoundField DataField="Correo" HeaderText="Correo" />
           <asp:BoundField DataField="NombreTecnico" HeaderText="Nombre Tecnico" />
           <asp:BoundField DataField="NombreTienda" HeaderText="Nombre Tienda" />
           <asp:BoundField DataField="NombreCliente" HeaderText="Nombre Cliente" />
           <asp:BoundField DataField="Telefono1" HeaderText="Teléfono 1" />
           <asp:BoundField DataField="Telefono2" HeaderText="Teléfono 2" />
        </Columns>
    </asp:GridView>
        </body>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VIsta_EditarServicios.aspx.cs" Inherits="segunda.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

    <style>
        body {
            display: flex;
            justify-content: center;
            align-content: center;
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }

        .filtro {
            display: grid;
            grid-template-columns: repeat(4, 5fr);
            gap: 8px; /* Ajusta este valor según sea necesario para el espacio entre elementos */
        }
        .form-label {
            display: block;
            margin-bottom: 8px; /* Ajusta este valor según sea necesario para el espacio entre las etiquetas y los campos de texto */
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            padding: 5px;
            margin-bottom: 5px; /* Ajusta este valor según sea necesario para el espacio entre los campos de texto */
        }

        h1 {
            color: #6a1b9a; /* Morado */
            text-align: center;
        }

        p {
            color: #6a1b9a;
            text-align: center;
        }

        hr {
            border: 1px solid #6a1b9a;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #6a1b9a;
            text-align: left;
            padding: 8px;
            background-color: #fff; /* Blanco */
        }

        th {
            background-color: #6a1b9a;
            color: #fff;
        }

        input{
            padding: 5px;
            margin-bottom: 10px;
            background-color: #6a1b9a;
            color: #fff;
            padding: 10px;
            border: none;
            cursor: pointer;
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

    </style>

    <div>
        <h1>Ver y Editar Servicio</h1> <!--- Título -->
        <p>Ver y editar los servicios que se han realizado</p>
    </div>
    <hr />
    <div class="filtro">

        <!-- Otros controles de filtro -->

        <!-- Controles de edición -->
        <asp:Label ID="motivo" runat="server" Text="Motivo:" CssClass="form-label"></asp:Label>
            <%-- El input de Motivo  --%>
        <asp:TextBox ID="vermotivo" runat="server" CssClass="form-control" placeholder="Ingresar el Motivo de la Visita" ></asp:TextBox>



       <asp:Label ID="cliente" runat="server" Text="Cliente:" CssClass="form-label"></asp:Label>
<asp:DropDownList ID="vercliente" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="unnobrecualquierasoloquieroacabar"></asp:DropDownList>



<asp:Label ID="tipoTrabajo" runat="server" Text="Tipo de Trabajo:" CssClass="form-label"></asp:Label>
<asp:DropDownList ID="TextBox1" runat="server" CssClass="form-control" ></asp:DropDownList>



<asp:Label ID="tienda" runat="server" Text="Tienda:" CssClass="form-label"></asp:Label>
<asp:DropDownList ID="vertienda" runat="server" CssClass="form-control" AutoPostBack="true" ></asp:DropDownList>




        <asp:Label ID="descripcion" runat="server" Text="Descripcion:" CssClass="form-label"></asp:Label>
            <%-- El input de Descripcion --%>
        <asp:TextBox ID="verdescripcion" runat="server" CssClass="form-control" placeholder="Ingresar la Descripcion" TextMode="MultiLine" Rows="2" ></asp:TextBox>

     

          <asp:Label ID="tecnico" runat="server" Text="Nombre Técnico:" CssClass="form-label"></asp:Label>
        <asp:DropDownList ID="vertecnico" runat="server" CssClass="form-label" AutoPostBack="true" Width="360px"></asp:DropDownList>


     <asp:Label ID="estatus" runat="server" Text="Estatus:" CssClass="form-label"></asp:Label>
<asp:DropDownList ID="verestatus" runat="server" CssClass="form-control">
</asp:DropDownList>



        <asp:Label ID="telefono1" runat="server" Text="Telefono 1:" CssClass="form-label"></asp:Label>
                <%-- El input de Telefono 1  --%>
        <asp:TextBox ID="vertelefono1" runat="server" CssClass="form-control" placeholder="Ingresar N° de Telefono" ></asp:TextBox>

        <asp:Label ID="fechaa" runat="server" Text="Fecha:" CssClass="form-label"></asp:Label>
        <asp:TextBox ID="verfechaa" runat="server" CssClass="form-control" type="Date" ></asp:TextBox>

        <asp:Label ID="responsable" runat="server" Text="Responsable:" CssClass="form-label"></asp:Label>
             <%-- El input de Responsable  --%>
        <asp:TextBox ID="verresponsable" runat="server" CssClass="form-control" placeholder="Ingresar el Responsabre"></asp:TextBox>

        <asp:Label ID="correo" runat="server" Text="Correo:" CssClass="form-label"></asp:Label>
                <%-- El input de correo  --%>
        <asp:TextBox ID="vercorreo" runat="server" CssClass="form-control" type="email" placeholder="Ingresar  Correo Electronico" ></asp:TextBox>

        <asp:Label ID="telefono2" runat="server" Text="Telefono 2:" CssClass="form-label"></asp:Label>
            <%-- El input de Telefono 2  --%>
        <asp:TextBox ID="vertelefono2" runat="server" CssClass="form-control"  placeholder="Ingresar N° del Responsable" ></asp:TextBox>

        <asp:Label ID="idservicio" runat="server" Text="ID:" CssClass="form-label" Visible="False"></asp:Label>
            <%-- El input de ID  --%>
        <asp:TextBox ID="veridservicio" runat="server" CssClass="form-control" Visible="False"></asp:TextBox>

    </div>
    <hr />

<!-- Agrega este bloque en la sección de contenido del ASPX -->
<div>
    <asp:Label ID="filtroClienteLabel" runat="server" Text="Filtrar por Cliente:" CssClass="form-label"></asp:Label>
    <asp:DropDownList ID="filtroClienteDropDown" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="FiltrarPorCliente"></asp:DropDownList>
</div>

    <hr />

    <div>
 
        <asp:Button ID="Button2" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />

    </div>

    <asp:GridView ID="GridViewServicios" runat="server" AutoGenerateColumns="false" OnRowCommand="GridViewServicios_RowCommand" OnRowDeleting="GridViewServicios_RowDeleting">
        <Columns>
           
            <asp:BoundField DataField="id_Servicios" HeaderText="#" />
            <asp:BoundField DataField="Motivo" HeaderText="Motivo" />
            <asp:BoundField DataField="TipoTrabajo" HeaderText="Tipo de Trabajo" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
            <asp:BoundField DataField="NombreTienda" HeaderText="Nombre Tienda" />
            <asp:BoundField DataField="NombreTecnico" HeaderText="Nombre Tecnico" />
            <asp:BoundField DataField="NombreCliente" HeaderText="Nombre Cliente" />
            <asp:BoundField DataField="Estatus" HeaderText="Estatus" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
            <asp:BoundField DataField="Responsable" HeaderText="Responsable" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" />
            <asp:BoundField DataField="Telefono1" HeaderText="Teléfono 1" />
            <asp:BoundField DataField="Telefono2" HeaderText="Teléfono 2" />

          <asp:TemplateField HeaderText="ACTUALIZAR">
                <ItemTemplate>
                    <asp:Button ID="ActualizarServicio" runat="server" Text="Editar" CommandName="EditRow" CommandArgument='<%# Container.DataItemIndex %>' />
                </ItemTemplate>
            </asp:TemplateField>

          <asp:TemplateField HeaderText="ELIMINAR">
                <ItemTemplate>
                    <asp:Button ID="btEliminar" runat="server" Text="Eliminar" OnClientClick="return confirm('¿Estás seguro que deseas eliminar este servicio?');" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>' />
                </ItemTemplate>
          </asp:TemplateField>

        </Columns>
    </asp:GridView>
</asp:Content>
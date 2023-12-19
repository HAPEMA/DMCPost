<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vista_DatosFormularioTecnicos.aspx.cs" Inherits="segunda.EquipoTecnico.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 20px auto;
        max-width: 800px;
        background-color: #f4f4f4;
                    display: flex;
            justify-content: center;
            align-content: center;
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            color: #333;
    }

    div {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }

    h1 {
        font-size: 24px;
        color: #333;
        margin-bottom: 10px;
    }

    p {
        font-size: 16px;
        color: #666;
        margin-bottom: 20px;
    }

    .filtro {
        margin-top: 20px;
    }

    .form-label {
        display: block;
        margin-bottom: 10px;
        color: #333;
        font-size: 18px;
    }

    .form-control {
        width: calc(100% - 24px);
        padding: 12px;
        margin-bottom: 20px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 16px;
    }

    hr {
        margin-top: 20px;
        margin-bottom: 20px;
        border: 0;
        border-top: 2px solid #ccc;
    }

    #gridContainer {
        text-align: center;
    }

    #GridViewServicios {
        border-collapse: collapse;
        width: 100%;
        font-size: 16px;
        margin: 0 auto; /* Centra el elemento horizontalmente */
    }

    #GridViewServicios th,
    #GridViewServicios td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }

    #GridViewServicios th {
        background-color: #f2f2f2;
    }

    #GridViewServicios tr:hover {
        background-color: #f5f5f5;
    }

    #Button2,
    #GridViewServicios .editButton,
    #GridViewServicios .pdfButton {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        margin-top: 10px;
    }

    #Button2:hover,
    #GridViewServicios .editButton:hover,
    #GridViewServicios .pdfButton:hover {
        background-color: #45a049;
    }
</style>




    <div>
        <h1>EDITAR si hubo un error y descargar PDF</h1> <!--- Título -->
        <p>Ver y editar los servicios que se han realizado</p>
    </div>
    <hr />
    <div class="filtro">

        <!-- Otros controles de filtro -->

        <!-- Controles de edición -->

        
          <asp:Label ID="tecnico" runat="server" Text="Nombre Técnico:" CssClass="form-label" ></asp:Label>
        <asp:DropDownList ID="vertecnico" runat="server" CssClass="form-label" AutoPostBack="true" Width="360px" ></asp:DropDownList>


               <asp:Label ID="cliente" runat="server" Text="Cliente:" CssClass="form-label" ></asp:Label>
<asp:DropDownList ID="vercliente" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="unnobrecualquierasoloquieroacabar" ></asp:DropDownList>


        <asp:Label ID="tienda" runat="server" Text="Tienda:" CssClass="form-label"></asp:Label>
<asp:DropDownList ID="vertienda" runat="server" CssClass="form-control" AutoPostBack="true" ></asp:DropDownList>


           <asp:Label ID="telefono1" runat="server" Text="Telefono:" CssClass="form-label"></asp:Label>
           <%-- El input de Telefono 1  --%>
   <asp:TextBox ID="vertelefono1" runat="server" CssClass="form-control" placeholder="Ingresar N° de Telefono" ></asp:TextBox>

          <asp:Label ID="correo" runat="server" Text="Correo:" CssClass="form-label"></asp:Label>
          <%-- El input de correo  --%>
  <asp:TextBox ID="vercorreo" runat="server" CssClass="form-control" type="email" placeholder="Ingresar  Correo Electronico" ></asp:TextBox>

          <asp:Label ID="fechaa" runat="server" Text="Fecha:" CssClass="form-label"></asp:Label>
  <asp:TextBox ID="verfechaa" runat="server" CssClass="form-control" type="Date" ></asp:TextBox>


        <asp:Label ID="motivo" runat="server" Text="Motivo:" CssClass="form-label"></asp:Label>
            <%-- El input de Motivo  --%>
        <asp:TextBox ID="vermotivo" runat="server" CssClass="form-control" placeholder="Ingresar el Motivo de la Visita" ></asp:TextBox>

<asp:Label ID="tipoTrabajo" runat="server" Text="Tipo de Trabajo:" CssClass="form-label"></asp:Label>
<asp:DropDownList ID="TextBox1" runat="server" CssClass="form-control"  ></asp:DropDownList>

             <asp:Label ID="estatus" runat="server" Text="Estatus:" CssClass="form-label"></asp:Label>
<asp:DropDownList ID="verestatus" runat="server" CssClass="form-control">
</asp:DropDownList>

        <asp:Label ID="descripcion" runat="server" Text="Descripcion:" CssClass="form-label"></asp:Label>
            <%-- El input de Descripcion --%>
        <asp:TextBox ID="verdescripcion" runat="server" CssClass="form-control" placeholder="Ingresar la Descripcion" TextMode="MultiLine" Rows="2" ></asp:TextBox>

      
        <asp:Label ID="responsable" runat="server" Text="Responsable:" CssClass="form-label"></asp:Label>
             <%-- El input de Responsable  --%>
        <asp:TextBox ID="verresponsable" runat="server" CssClass="form-control" placeholder="Ingresar el Responsable"></asp:TextBox>

      
        <asp:Label ID="telefono2" runat="server" Text="Celular:" CssClass="form-label"></asp:Label>
            <%-- El input de Telefono 2  --%>
        <asp:TextBox ID="vertelefono2" runat="server" CssClass="form-control"  placeholder="Ingresar N° del Responsable" ></asp:TextBox>

        <asp:Label ID="idservicio" runat="server" Text="ID:" CssClass="form-label" Visible="False" ></asp:Label>
            <%-- El input de ID  --%>
        <asp:TextBox ID="veridservicio" runat="server" CssClass="form-control" Visible="False" ></asp:TextBox>

    </div>
    <hr />

<!-- Agrega este bloque en la sección de contenido del ASPX -->
<div>
    <asp:Label ID="filtroClienteLabel" runat="server" Text="Filtrar por Cliente:" CssClass="form-label" Visible="False"></asp:Label>
    <asp:DropDownList ID="filtroClienteDropDown" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="FiltrarPorCliente" Visible="False"></asp:DropDownList>
</div>


    <div>
 
        <asp:Button ID="Button2" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />

    </div>

    <asp:GridView ID="GridViewServicios" runat="server" AutoGenerateColumns="false" OnRowCommand="GridViewServicios_RowCommand">
        <Columns>
           
            <asp:BoundField DataField="id_Servicios" HeaderText="#" />
            <asp:BoundField DataField="NombreCliente" HeaderText=" Cliente" />
            <asp:BoundField DataField="NombreTienda" HeaderText="Tienda" />
            <asp:BoundField DataField="NombreTecnico" HeaderText="Tecnico" />
            <asp:BoundField DataField="Telefono1" HeaderText="Teléfono" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
            <asp:BoundField DataField="Motivo" HeaderText="Motivo" />
            <asp:BoundField DataField="TipoTrabajo" HeaderText="Tipo de Trabajo" />
            <asp:BoundField DataField="Estatus" HeaderText="Estatus" />
            <asp:BoundField DataField="Descripcion" HeaderText="Observacion" />
            <asp:BoundField DataField="Responsable" HeaderText="Responsable" />
            <asp:BoundField DataField="Telefono2" HeaderText="Celular" />

          <asp:TemplateField HeaderText="ACTUALIZAR">
                <ItemTemplate>
                    <asp:Button ID="ActualizarServicio" runat="server" Text="Editar" CommandName="EditRow" CommandArgument='<%# Container.DataItemIndex %>' />
                </ItemTemplate>
            </asp:TemplateField>

          <asp:TemplateField HeaderText="PDF">
                <ItemTemplate>
                    <asp:Button ID="btPdf" runat="server" Text="PDF"  />
                </ItemTemplate>
          </asp:TemplateField>

        </Columns>
    </asp:GridView>
    </form>
</body>
</html>

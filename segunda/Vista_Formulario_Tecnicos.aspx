<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vista_Formulario_Tecnicos.aspx.cs" Inherits="segunda.WebForm16" %>

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
        background-color:white;
          }
    .container {
        max-width: 800px;
        margin: 0 auto;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
        margin-top: 4rem;
        }
    h1 {
        text-align: center;
        color: #6C757D;
        }
    span{
        font-size:2rem;
        color:purple;
    }
    .mb-3 {
        margin-bottom: 1.5rem;
    }

    .form-label, select {
        display: block;
        margin-bottom: 0.5rem;
        color: #6C757D;
    }

    .form-control, select {
        padding: 0.75rem;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;
        width: 100%;
        font-size: 1rem;
    }

    .btn-primary {
        background-color: purple;
        color: #fff;
        border: none;
        padding: 0.75rem 1.5rem;
        border-radius: 0.25rem;
        cursor: pointer;
    }
</style>
    <div runat="server" id="divMensajeValidacion" style="color: red; font-weight: bold; text-align: center;"></div>

    <div class="container">
        <%-- Este div posee todo el formulario--%>


        <h1 class="text-center text-primary">Informe de trabajo / Servicio</h1>
        <%-- El titulo del formulario --%>



        <div class="mb-3">
<asp:ImageButton ID="ImageButton1" ImageUrl="IMG/hahah.png" runat="server" OnClick="CrearTecnico_Click" Width="20px"></asp:ImageButton>
    <asp:Label ID="tecnico" runat="server" Text="Técnico:" CssClass="form-label"></asp:Label>
    <asp:DropDownList ID="DropDownListtxttecnico" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged"></asp:DropDownList>
    <%-- El input de cliente  --%>
</div>


        <div class="mb-3">
            <asp:Label ID="list" runat="server" Text="Cliente:" CssClass="form-label"></asp:Label>
             <asp:ImageButton ID="ImageButton2" ImageUrl="IMG/jeje.png" runat="server" OnClick="CrearTienda_Click2" Width="30px"></asp:ImageButton>
            <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged"></asp:DropDownList>
            <%-- El input de cliente  --%>
        </div>



        <div class="mb-3">
            <asp:Label ID="tiendaa" runat="server" Text="Tienda:" CssClass="form-label"></asp:Label>
       
             <asp:ImageButton ID="CrearTienda" ImageUrl="IMG/aja.png" runat="server" OnClick="CrearTienda_Click" Width="20px"></asp:ImageButton>
            <%-- El input de tienda  --%>
            <asp:DropDownList ID="ddlTienda" runat="server" CssClass="form-control" AutoPostBack="true"></asp:DropDownList>
        </div>

         
                <div class="mb-3">
            <asp:Label ID="telefono2" runat="server" Text="Teléfono:" CssClass="form-label"></asp:Label>
            <%--input del telefono2 --%>
            <asp:TextBox ID="txtfono2" runat="server" CssClass="form-control" placeholder="Ingresar N° de Telefono"></asp:TextBox>
        </div>

           <div class="mb-3">
          <asp:Label ID="correo" runat="server" Text="Correo:" CssClass="form-label"></asp:Label>
              <%-- El input de correo  --%>
          <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" type="email" placeholder="Ingresar  Correo Electronico"></asp:TextBox>
        </div>




        <div class="mb-3">
            <asp:Label ID="fechaa" runat="server" Text="Fecha:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtfecha" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <%-- El input de fecha  --%>
        </div>



        <div class="mb-3">
            <asp:Label ID="motivoo" runat="server" Text="Motivo:" CssClass="form-label"></asp:Label>
            <%-- El input de motivo  --%>
            <asp:TextBox ID="txtmotivo" runat="server" CssClass="form-control" placeholder="Ingresar el Motivo de la Visita"></asp:TextBox>
        </div>

            <div>
                 <asp:Label ID="tipoTrabajo" runat="server" Text="Tipo de trabajo:" CssClass="form-label"></asp:Label>
   <asp:DropDownList ID="DropDownListtipotrabajo" runat="server">
              <asp:ListItem Text="Elige un tipo de Servicio" Value="" Selected="True" Disabled="True"></asp:ListItem>
<asp:ListItem Value="Servicio en terreno">Servicio en terreno</asp:ListItem>
<asp:ListItem Value="Visita en terreno">Visita en terreno</asp:ListItem>
<asp:ListItem Value="Monitoreo o Calibracion">Monitoreo o Calibracion</asp:ListItem>
   </asp:DropDownList>
     </div>
               
 <div>  
                  
                 <asp:Label ID="Label1" runat="server" Text="Estatus del trabajo:" CssClass="form-label"></asp:Label>
     <asp:DropDownList ID="DropDownListEstado" runat="server">
   <asp:ListItem Text="Elige el estatus del Servicio" Value="" Selected="True" Disabled="True"></asp:ListItem>             
         <asp:ListItem Value="Realizado">Realizados</asp:ListItem>
     <asp:ListItem Value="Pendiente">Pendientes</asp:ListItem>
</asp:DropDownList>
           </div>


    
<div class="mb-3">
    <asp:Label ID="descripcion" runat="server" Text="Descripción:" CssClass="form-label"></asp:Label>
    <asp:TextBox ID="txtdescripcion" runat="server" CssClass="form-control" placeholder="Ingresar la Descripcion" TextMode="MultiLine" Rows="3"></asp:TextBox>
    <%--input de descripcion--%>
</div>

      <div class="mb-3">
            <asp:Label ID="responsable" runat="server" Text="Responsable:" CssClass="form-label"></asp:Label>
            <%--input del responsable--%>
            <asp:TextBox ID="txtresponsable" runat="server" CssClass="form-control" placeholder="Ingresar el Responsable"></asp:TextBox>
        </div>

       
                <div class="mb-3">
            <asp:Label ID="telefonor" runat="server" Text="Teléfono Responsable:" CssClass="form-label"></asp:Label>
            <%--input del telefonor --%>
            <asp:TextBox ID="txttelefonor" runat="server" CssClass="form-control" placeholder="Ingresar N° del Responsable" ></asp:TextBox>
        </div>
        
        
   <asp:Button ID="botonEnviar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="botonEnviar_Click"/>           
        <hr />
    <asp:Button ID="btnExportarPDF" runat="server" Text="Exportar PDF" CssClass="btn btn-primary" OnClick="btnPDF_Click" />


    </div>
    </form>
</body>
</html>

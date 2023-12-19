<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vista_DatosFormulrioTecnicos.aspx.cs" Inherits="segunda.WebForm15" %>

<!DOCTYPE html>



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
     <div runat="server" id="divMensajeValidacion" style="color: red; font-weight: bold; text-align: center;"></div>

 <div class="container">
     <%-- Este div posee todo el formulario--%>


     <h1 class="text-center text-primary">Trabajo realizado</h1>
     <%-- El titulo del formulario --%>

     <asp:Image ID="DMCLogo" runat="server" ImageUrl="~/IMG/Logo_dmc.png" Height="70px" Width="75px" />
  
     <asp:GridView ID="GViewDatos" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="Tecnico" HeaderText="Tecnico" />
        <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
        <asp:BoundField DataField="Tienda" HeaderText="Tienda" />
        <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
        <asp:BoundField DataField="Correo" HeaderText="Correo" />
        <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
        <asp:BoundField DataField="Motivo" HeaderText="Motivo" />
        <asp:BoundField DataField="TipoTrabajo" HeaderText="Tipo de Trabajo" />
        <asp:BoundField DataField="Estado" HeaderText="Estado" />
        <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
        <asp:BoundField DataField="Responsable" HeaderText="Responsable" />
        <asp:BoundField DataField="Telefonor" HeaderText="Telefono Responsable" />
    </Columns>
</asp:GridView>
     <br />
     <asp:Button ID="DescargarVista" runat="server" CssClass="form-control" Text="Descargar" OnClick="Descargar_Click" />


     </div>

</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vista_AgregarTienda.aspx.cs" Inherits="segunda.WebForm7" %>
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


    <div class="container mt-4 border p-4 rounded" style="max-width: 600px; margin: 0 auto;">
     
         <h1>Agregar nueva tienda</h1>
         
       <div class="mb-3">
     <asp:Label ID="list" runat="server" Text="Cliente:" CssClass="form-label"></asp:Label>

            

     <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged"></asp:DropDownList>             <%-- El input de cliente  --%>
    </div>
         
        <div class="mb-3">
            <asp:Label ID="Tienda" runat="server" Text="Tienda:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txttienda" runat="server" CssClass="form-control"></asp:TextBox>
         </div>

        <div class="mb-3">
            <asp:Label ID="Direccion" runat="server" Text="Dirección:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtdireccion" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="mb-3">
            <asp:Label ID="Comuna" runat="server" Text="Comuna:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtcomuna" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="mb-3">
            <asp:Label ID="labelid" runat="server" CssClass="form-control" Visible="False"></asp:Label>
        </div>

        <div class="mb-3">
        <asp:Button ID="Guardar" runat="server" Text="Guardar" OnClick="Guardar_Click"/>  <!--boton agregar -->
        </div>

        <div class="mb-3">
            <asp:Label ID="Mensaje" runat="server" Visible="False"></asp:Label>
        </div>

    <div>
        <asp:button id="volvercasa" runat="server" Text="Volver" OnClick="volveracasa23"> 
             
        </asp:button>
    </div>

        </div>


    <asp:GridView ID="GridViewTienda" runat="server" AutoGenerateColumns="false" OnRowDeleting="GridViewTienda_RowDeleting">
     <Columns>
         
         <asp:BoundField DataField="Id_Tienda" HeaderText="#" />
         <asp:BoundField DataField="NombreTienda" HeaderText="Nombre Tienda" />
       <asp:BoundField DataField="Comuna" HeaderText="Comuna Tienda" />
<asp:BoundField DataField="Direccion" HeaderText="Direccion Tienda" />
         <asp:BoundField DataField="NombreCliente" HeaderText="Nombre Cliente" />

  <asp:TemplateField HeaderText="ELIMINAR">
        <ItemTemplate>
            <asp:Button ID="btEliminar" runat="server" Text="Eliminar" OnClientClick="return confirm('¿Estás seguro que deseas eliminar este servicio?');" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>' />
        </ItemTemplate>
  </asp:TemplateField>




     </Columns>
 </asp:GridView>

</asp:Content>

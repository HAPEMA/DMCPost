<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vista_TrabajoClienteBD.aspx.cs" Inherits="segunda.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
/*ESTA MAL*/
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

    p {
        color: #6a1b9a;
        text-align: center;
    }

    label {
        color: #6a1b9a;
    }

    #DropDownList1 {
        height: 50px;
        width: 122px;
        background-color: #fff; /* Fondo blanco */
        color: #6a1b9a; /* Texto morado */
        border: 1px solid #6a1b9a; /* Borde morado */
        border-radius: 5px; /* Bordes redondeados */
        margin-bottom: 10px;
    }

    #TxtBuscar {
        width: 142px;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #6a1b9a;
        border-radius: 5px;
        box-sizing: border-box;
    }

    #input {
        background-color: #6a1b9a;
        color: #fff;
        width: 75px;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
</style>
    <div>
        <H1>  Trabajo Cliente </H1>           <!---titulo-->
        <P> Ver trabajo de cliente en especifico </P>
    </div>

    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" Height="50px" Width="122px" onchange="cambiarTipoInput()">
            <asp:ListItem id="IdCliente">Cliente:</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="TxtBuscar" runat="server" Width="142px" CssClass="tipoInput"></asp:TextBox>
        <asp:Button ID="ButtonBuscar" runat="server" Text="Buscar" Width="75px" />
    </p>

    <asp:GridView ID="Clientes" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="idCliente" HeaderText="ID Cliente" />
            <asp:BoundField DataField="NombreCliente" HeaderText="Nombre Cliente" />
        </Columns>
    </asp:GridView>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vista_EnviarCorreo.aspx.cs" Inherits="segunda.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f2f2f2;
                    margin: 0;
                    padding: 0;
                }
        
                header {
                    color: white;
                    text-align: left;
                    padding: 10px;
                    overflow: hidden;
                }
        
                #logoContainer {
                    float: left;
                }
        
                img {
                    width: 100px;
                    height: auto;
                    margin-right: 10px;
                }
        
                .titulo {
                    display: flex;
                    justify-content: center;
                    align-content: center;
                    color: #8E44AD
                }
        
                #formContainer {
                    text-align: center;
                    margin: 50px auto;
                    padding: 20px;
                    background-color: white;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    max-width: 400px;
                }
        
                label {
                    display: block;
                    margin: 10px 0 5px;
                    color: #663399;
                }
        
                input {
                    width: 100%;
                    padding: 8px;
                    margin-bottom: 10px;
                    box-sizing: border-box;
                }
        
                button {
                    background-color: #663399;
                    color: white;
                    padding: 10px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }
        
                .paraformulario {
                    color: #212529;
                }
    </style>

    <body>
        <header>
            <div id="logoContainer">
                <img src="IMG/Logo_dmc.png" alt="Logo" />
            </div>
        </header>

        <div class="titulo">
            <h1> Descargar Formulario</h1>
        </div>

        <div id="formContainer">
              <button type="button" id="BtnIngresar" runat="server" onserverclick="btnEnviarCorreo_Click">PDF</button>
<br />
            <button type="button" id="Button1" runat="server"> EXCEL </button>
        </div>
    </body>
</asp:Content>

﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vista_Login.aspx.cs" Inherits="segunda.WebForm1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <!DOCTYPE html>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
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
            #iconContainer {
                float: right;
                padding: 15px;
            }

            .icon {
                font-size: 20px;
                color: #fff;
            }

            footer {
                background-color: #663399;
                color: white;
                text-align: center;
                padding: 10px;
                position: fixed;
                bottom: 0;
                width: 100%;
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
            .titulo{
                display:flex;
                justify-content:center;
                align-content:center;
                color: #8E44AD
            }
            .paraformulario{
                color:#212529;
            }
        </style>
    <body>

        <header>
            <div id="logoContainer">
                <img src="IMG/Logo_dmc.png" alt="Logo" />
            </div>
           
        </header>

        <div class="titulo">
                        <h1>Inicio de sesión</h1>
                    </div>

        <div id="formContainer">
            <label for="txtusuario">Usuario:</label>
            <input type="text" id="txtusuario" runat="server" placeholder="Ingrese su usuario" />

            <label for="txtpassword">Contraseña:</label>
            <input type="password" id="txtpassword" runat="server" placeholder="Ingrese su contraseña" />

            <button type="submit" id="BtnIngresar" runat="server">Iniciar sesión</button>

            <asp:Label ID="Mensaje" runat="server"></asp:Label>
        </div>

        <footer>
            Dirección: Tu dirección aquí
        </footer>
    </body>
    </html>
</asp:Content>

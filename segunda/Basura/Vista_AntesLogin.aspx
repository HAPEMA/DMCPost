<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vista_AntesLogin.aspx.cs" Inherits="segunda.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <style>
            body {
                font-family: 'Open Sans', sans-serif;
                background-color: #6924F0;
                margin: 0;
                padding: 0;
                color: #fff;
            }
            .imagen_fondo{
                width:100%;
            }

            header {
                background-color: #6924F0;
                text-align: center;
                padding: 20px;
                border-bottom: 2px solid #fff;
            }

            #logo {
                max-width: 100px;
                height: auto;
            }

            #titulo {
                font-size: 27px;
                margin: 10px 0;
            }

            #boton {
                background-color: #fff;
                color: #663399;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            .slide {
                position: relative;
                box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.64);
                margin-top: 26px;
            }

            .slide-inner {
                position: relative;
                overflow: hidden;
                width: 100%;
                height: calc(300px + 3em);
            }

            .slide-open:checked + .slide-item {
                position: static;
                opacity: 100;
            }

            .slide-item {
                position: absolute;
                opacity: 0;
                -webkit-transition: opacity 0.6s ease-out;
                transition: opacity 0.6s ease-out;
            }

            .slide-item img {
                display: block;
                height: auto;
                max-width: 100%;
            }

            .slide-control {
                background: rgba(0, 0, 0, 0.28);
                border-radius: 50%;
                color: #fff;
                cursor: pointer;
                display: none;
                font-size: 40px;
                height: 40px;
                line-height: 35px;
                position: absolute;
                top: 50%;
                transform: translate(0, -50%);
                text-align: center;
                width: 40px;
                z-index: 10;
            }

            .slide-control.prev {
                left: 2%;
            }

            .slide-control.next {
                right: 2%;
            }

            .slide-control:hover {
                background: rgba(0, 0, 0, 0.8);
                color: #aaaaaa;
            }

            #slide-1:checked ~ .control-1,
            #slide-2:checked ~ .control-2,
            #slide-3:checked ~ .control-3 {
                display: block;
            }

            .slide-indicador {
                list-style: none;
                margin: 0;
                padding: 0;
                position: absolute;
                bottom: 2%;
                left: 0;
                right: 0;
                text-align: center;
                z-index: 10;
            }

            .slide-indicador li {
                display: inline-block;
                margin: 0 5px;
            }

            .slide-circulo {
                color: #828282;
                cursor: pointer;
                display: block;
                font-size: 35px;
            }

            .slide-circulo:hover {
                color: #aaaaaa;
            }

            #slide-1:checked ~ .control-1 ~ .slide-indicador 
                 li:nth-child(1) .slide-circulo,
            #slide-2:checked ~ .control-2 ~ .slide-indicador 
                  li:nth-child(2) .slide-circulo,
            #slide-3:checked ~ .control-3 ~ .slide-indicador 
                  li:nth-child(3) .slide-circulo {
            }
            .paralogin{
                color:#212529;
            }
        </style>
    </head>
    <body>
        <header>
     <div id="logoContainer">
         <img src="IMG/Logo_dmc.png" alt="Logo" />
     </div>
     <div id="iconContainer">
         <!-- Agrega aquí tu icono -->
     </div>
 </header>

        <div class="slide">
            <div class="slide-inner">
     <input class="slide-open" type="radio" id="slide-1" 
                      name="slide" aria-hidden="true" hidden="" checked="checked">

                <div class="slide-item">
                    <img class="imagen_fondo" src="IMG/img1.jpeg">
                </div>
                <input class="slide-open" type="radio" id="slide-2" 
                      name="slide" aria-hidden="true" hidden="">
                <div class="slide-item">
                    <img class="imagen_fondo"  src="IMG/img2.jpeg">
                </div>
                <input class="slide-open" type="radio" id="slide-3" 
                      name="slide" aria-hidden="true" hidden="">
                <div class="slide-item">
                    <img class="imagen_fondo" src="IMG/img3.jpeg">
                </div>
                <label for="slide-3" class="slide-control prev control-1">‹</label>
                <label for="slide-2" class="slide-control next control-1"></label>
                <label for="slide-1" class="slide-control prev control-2">‹</label>
                <label for="slide-3" class="slide-control next control-2">›</label>
                <label for="slide-2" class="slide-control prev control-3">‹</label>
                <label for="slide-1" class="slide-control next control-3">›</label>
                <ol class="slide-indicador">
                    <li>
                        <label for="slide-1" class="slide-circulo">•</label>
                    </li>
                    <li>
                        <label for="slide-2" class="slide-circulo">•</label>
                    </li>
                    <li>
                        <label for="slide-3" class="slide-circulo">•</label>
                    </li>
                </ol>
            </div>
        </div>
    </body>
    </html>
</asp:Content>

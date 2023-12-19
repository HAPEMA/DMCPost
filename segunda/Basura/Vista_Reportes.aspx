<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vista_Reportes.aspx.cs" Inherits="segunda.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <!-- Estilos CSS -->
    <style>
        /* Reset de estilos generales */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Estilos del cuerpo */
        .body {
            font-family: Arial;
        }

        /* Estilos de la barra de navegación */
        .nav {
            background-color: #830248;

            --img1: scale(1);
            --img2: scale(0);
        }

        .nav:has(.dropdown:target) {
            --img1: scale(0);
            --img2: scale(1);
            --clip: inset(0 0 0 0);
        }

        .nav__container {
            width: 90%;
            margin: 0 auto;
            height: 70px;
            display: grid;
            grid-template-columns: max-content max-content;
            grid-template-areas: "title img";
            justify-content: space-between;
            align-items: center;
            overflow: hidden;
        }

        .nav__title {
            color: #fff;
            grid-area: title;
        }

        .nav__menu {
            grid-area: img;
            position: relative;
            z-index: 10;
            transform: var(--img1);
        }

        .nav__menu--second {
            transform: var(--img2);
        }

        .nav__icon {
            width: 30px;
            display: block;
        }

        /* Estilos del menú desplegable */
        .dropdown {
            position: absolute;
            background-color: #000;
            width: 75%;
            max-width: 300px;
            right: 0;
            top: 20%;
            padding: 1em;
            display: grid;
            align-content: center;
            gap: 1rem;
            overflow-y: auto;
            clip-path: var(--clip, inset(0 0 100% 100%));
            transition: clip-path 0.5s;
            height: auto;
        }

        .dropdown__link {
            color: rgb(184, 187, 191);
            padding: 1em 0.7em;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.6rem;
            position: relative;
            background-color: var(--bg, transparent);
            border-radius: 6px;
        }

        .dropdown__list:has(:checked) {
            --rows: 1fr;
            --rotate: rotate(180deg);
            --bg: #28303B;
        }

        .dropdown__check {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .dropdown__icon {
            width: 27px;
            height: 28px;
        }

        .dropdawn_ocultar {
            display: grid;
            grid-template-rows: var(--rows, 0fr);
            transition: 0.3s grid-template-rows;
        }

        .dropdown_subir {
            overflow: hidden;
        }

        .dropdown__li {
       position: relative;
        }

        .dropdown__anchor {
            padding: 1em 0;
            display: block;
            color: #B6BABE;
            text-decoration: none;
        }


                                                                                        /*Css de la tabla */

        main{
            display:flex;
            align-items:center;
            justify-content:center;
            min-height:100vh;
            background: linear-gradient(#b7328d, #ac18c0);
        }
      table {
        color: white;
        font-size: 16px; /* Ajusta el tamaño de fuente de la tabla según tus necesidades */
        table-layout: fixed;
        border-collapse: collapse;
        width: 100%; /* Hace que la tabla ocupe el 100% del contenedor */
    }
        .table{
            color:white;
            font-size:14px;
            table-layout:fixed;
            border-collapse:collapse;
            width: 80%; /* Ajusta el ancho de la tabla según tus necesidades */
            margin: auto; /* Centra la tabla en el contenedor */
        }
        thead{
            background: rgba(243,140,210,0.4) 
        }
        th{
            padding: 20px 15px;
            font-weight:700;
            text-transform:uppercase;
            }
        td{
            padding:15px;
            border: solid 1px  rgba(255,255,255,0.2);
        }
        th, td {
        padding: 20px 15px;
        border: solid 1px rgba(255, 255, 255, 0.2);
    }
        tbody tr{
            cursor:pointer;
        }
        tbody tr:hover{
            background:rgba(243,103,199,0.4);
        }
         .icon-button {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 0; /* Oculta el texto */
        }

        .icon-button span {
            font-size: 24px; /* Tamaño del ícono */
        }

        /* Estilo para colocar los botones al lado derecho de cada fila */
        .table-buttons {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }    

                                                                                                                    /*pie de pagina*/
                                                                                                                    .paginacion {
	margin:20px 0;
}

.paginacion ul {
	list-style:none;
	text-align: center;
}

.paginacion ul li {
	display:inline-block;
	margin-right:10px;
}

.paginacion ul li a {
	display:block;
	padding:10px 20px;
	color:#fff;
	background:#024959;
	text-decoration: none;
}

.paginacion ul li a:hover {
	background:#037E8C;
}

.paginacion ul li .active {
	background:#037E8C;
	font-weight:bold;
}

/*paguinaton */
.paginacion {
    margin: 20px 0;
    background-color: #ac18c0; /* Cambia el color de fondo al color del main */
}

.paginacion ul li a {
    display: block;
    padding: 10px 20px;
    color: #fff;
    background: #ac18c0; /* Cambia el color de fondo al color del main */
    text-decoration: none;
}

.paginacion ul li a:hover {
    background: #830248; /* Cambia el color de fondo al color de la barra de navegación */
}

.paginacion ul li .active {
    background: #830248; /* Cambia el color de fondo al color de la barra de navegación */
    font-weight: bold;
}

/*elegir la paguina*/


    </style>

    <!-- Contenido HTML -->
    <header class="body">

        <!-- Barra de navegación -->
        <nav class="nav">
            <div class="nav__container">

                <!-- Título de la barra de navegación -->
                <h1 class="nav__title">MAdrid 1269</h1>

                <!-- Enlace para desplegar el menú -->
                <a href="#menu" class="nav__menu">
                    <img src="IMG/Logo_dmc.png" class="nav__icon" />
                </a>

                <!-- Enlace para cerrar el menú desplegable -->
                <a href="#" class="nav__menu nav__menu--second">
                    <img src="IMG/Logo_dmc.png" class="nav__icon" />
                </a>

                <!-- Lista de elementos del menú desplegable -->
                <!--todo se escribe aca dentro-->
                <ul class="dropdown" id="menu">





                                                                                          <!--Creacion de tiendas -->

                    <!--li util para la creacion de las tiendas Pillin-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/pillin_logo.png" class="dropdown__icon" />
        <span class="dropdown__span">Pillin</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Pillin 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Pillin 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Pillin 3</a>
            </li>
        </ul>
    </div>
</li>

                    <!--li util para la creacion de las tiendas Ficcus-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/fuccus_logo.png" class="dropdown__icon" />
        <span class="dropdown__span">Fuccus</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Ficcus 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Ficcus 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Ficcus 3</a>
            </li>
        </ul>
    </div>
</li>

<!--li util para la creacion de las tiendas 100% Futbol-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/100_logo.png" class="dropdown__icon" />
        <span class="dropdown__span">100% Futbol</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">100% Futbol 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">100% Futbol 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">100% Futbol 3</a>
            </li>
        </ul>
    </div>
</li>
                    <!--li util para la creacion de las tiendas Maui-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/maui_logo.jpg" class="dropdown__icon" />
        <span class="dropdown__span">Maui</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Maui 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Maui 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Maui 3</a>
            </li>
        </ul>
    </div>
</li>

<!--li util para la creacion de las tiendas Patagonia-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/patagonia_logo.jpg" class="dropdown__icon" />
        <span class="dropdown__span">Patagonia</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Patagonia 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Patagonia 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Patagonia 3</a>
            </li>
        </ul>
    </div>
</li>

<!--li util para la creacion de las tiendas Totto-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/logo_totto.png" class="dropdown__icon" />
        <span class="dropdown__span">Totto</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Totto 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Totto 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Totto 3</a>
            </li>
        </ul>
    </div>
</li>

<!--li util para la creacion de las tiendas Colloky-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/logo_colloky.png" class="dropdown__icon" />
        <span class="dropdown__span">Colloky</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Colloky 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Colloky 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Colloky 3</a>
            </li>
        </ul>
    </div>
</li>

<!--li util para la creacion de las tiendas TUA-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/logo_tua.jpg" class="dropdown__icon" />
        <span class="dropdown__span">TUA</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">TUA 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">TUA 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">TUA 3</a>
            </li>
        </ul>
    </div>
</li>

<!--li util para la creacion de las tiendas Adidas-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/Adidas_logo.jpeg" class="dropdown__icon" />
        <span class="dropdown__span">Adidas</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Adidas 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Adidas 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Adidas 3</a>
            </li>
        </ul>
    </div>
</li>
<!--li util para la creacion de las tiendas Puma-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/puma_logo.png" class="dropdown__icon" />
        <span class="dropdown__span">Puma</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Puma 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Puma 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Puma 3</a>
            </li>
        </ul>
    </div>
</li>

<!--li util para la creacion de las tiendas Nike-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/logo_nike.jpg" class="dropdown__icon" />
        <span class="dropdown__span">Nike</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Nike 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Nike 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">Nike 3</a>
            </li>
        </ul>
    </div>
</li>
<!--li util para la creacion de las tiendas BATA-->
<li class="dropdown__list">
    <a href="#" class="dropdown__link">
        <img src="IMG/bata_logo.png" class="dropdown__icon" />
        <span class="dropdown__span">BATA</span>
        <input type="checkbox" class="dropdown__check">
    </a>
    <div class="dropdawn_ocultar">
        <ul class="dropdown_subir">
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">BATA 1</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">BATA 2</a>
            </li>
            <li class="dropdown__li">
                <a href="#" class="dropdown__anchor">BATA 3</a>
            </li>
        </ul>
    </div>
</li>

                    <!-----llaves de cierre------>
                </ul>
            </div>
        </nav>
    </header>

   <main>

           <div class="paguinas">
    <select id="cliente">
        <!--cliente-->
        <option id="opcion_pagina">
            <!--el opcion pa el dropdown -->
            10
        </option>
        <option>
            20
        </option>
        <option>
            30
        </option>
        <option>
            40
        </option>
        <option>
            50
        </option>
    </select>
</div>

       
        <div class="tabla">
            <table id="mitabla">
               <thead>
                   <tr>
                       <th>Nombre </th>
                       <th>Cantidad </th>
                       <th>Causa </th>
                       <th>Descripción </th>
                       <th>Dirección </th>
                       <td>DESCARGAR</td>
                   </tr>
               </thead>
                <tbody>

                     <tr>
                         <td>Harold</td>
                         <td>02</td>
                         <td>Daño</td>
                         <td>Una paleta fue golpeada</td>
                         <td>Madrid 1269</td>
                         <td class="table-buttons">
                             <button class="icon-button"><span class="material-symbols-outlined">picture_as_pdf</span></button>
                             <button class="icon-button"><span class="material-symbols-outlined">note_add</span></button>
                         </td>
                    </tr>

                     <tr>
                         <td>Juan</td>
                         <td>22</td>
                         <td>Visita</td>
                         <td>Una visita de rutina</td>
                         <td>Peru 65416</td>
                         <td class="table-buttons">
                             <button class="icon-button"><span class="material-symbols-outlined">picture_as_pdf</span></button>
                             <button class="icon-button"><span class="material-symbols-outlined">note_add</span></button>
                         </td>
                     </tr>

                </tbody>
            </table>
        </div>
    </main>




    <section class="paginacion">
			<ul>
				<li><a href="pagina1.html" class="active">1</a></li>
				<li><a href="pagina2.html">2</a></li>
				<li><a href="pagina3.html">3</a></li>
				<li><a href="pagina4.html">4</a></li>
				<li><a href="pagina5.html">5</a></li>
			</ul>
		</section>

</asp:Content>
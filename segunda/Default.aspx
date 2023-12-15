<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="segunda._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>

					body {
    margin: 0;
    padding: 0;
}
ul {
    margin: 0;
    padding: 0;
    list-style-type: none;
}

.p-left {
    float: left;
}

.p-right {
    float: right;
}

.margin-last {
    margin-right: 0;
}

/*#homepage-content {
    margin: 0 auto;
    width: 1171px;
    padding: 0 20px;
}*/

#section-cta {
    background: #fff;
    overflow: hidden;
    font-family: 'PT Sans', sans-serif;
    margin: 40px 0;
    padding: 0 0 20px;
}

.section-cta-content {
    margin: 0 auto;
    width: 1171px;
}

.icon-box {
    margin: 0 30px;
}

.icon-wrap {
  background: #f0f0f0 url(http://mmhimages.fnistools.com/images/RECos/1252/img/box-bg.png);
  width: 134px;
  height: 134px;
  border-radius: 81px;
  padding: 11px;
  margin: 0 auto;
  z-index: 500;
  overflow: hidden;
  display: block;
  position: relative;
}

.icon-border {
  border: 3px solid #1fb25a;
  border-radius: 81px;
  width: 129px;
  height: 129px;
}

.icon-content { background: #fff;
  border-radius: 81px;
  width: 129px;
  height: 129px;
}

span.icon {
  position: relative;
  top: 35px;
  left: 30px;
}

.box-wrap { 
  background: #f0f0f0 url(http://mmhimages.fnistools.com/images/RECos/1252/img/box-bg.png);
  width: 300px;
  height: 300px;
  padding: 11px;
  margin: -83px auto 0;
  z-index: 1;
  display: block;
  position: relative;
}

.box-content {
  background: #fff;
  width: 260px;
  height: 220px;
  padding: 80px 20px 0;
  position: relative;
}

.box-content h3 { 
    margin: 0; 
    padding: 0; 
    text-align: center; 
    font-size: 22px;
}

.box-content p { 
    text-align: center; 
    color: #737373;
    font-size: 14px
}

.box-content a {
    color: #fff;
    background: #0168b3;
    width: 100px;
    display: block;
    padding: 10px 20px;
    font-size: 12px;
    text-decoration: none;
    text-align: center;
    position: absolute;
    top: 287px;
    margin: 0 62px;
}

#section-mec {
    clear: both;
    background: #f0f0f0;
    overflow: hidden;
    font-family: 'PT Sans', sans-serif;
    padding: 40px 0;
}

.section-mec-content {
    margin: 0 auto;
    width: 1171px;
}

.section-mec-content h2 {
    color: #1fb25a;
    font-size: 30px;
    font-weight: 400;
    text-transform: uppercase;
    text-align: center;
    margin: 0;
}

.section-mec-content ul {
    margin: 0;
    padding: 20px 0 0;
}

.section-mec-content ul li {
    display: block;
    float: left;
    padding: 0 55px;
}

.section-mec-content ul li a {
    display: block;
    float: left;
    
}

#section-city {
    font-family: 'PT Sans', sans-serif;
    clear: both;
    padding: 40px 0;
    overflow: hidden;
}

.scc-box {
    float: left;
    width: 261px;
    border: 1px solid #d2d2d2;
    margin: 0 11px;
    text-align: center;
    font-size: 14px;
}

.scc-box h4 {
    background: #0168b3 url(http://mmhimages.fnistools.com/images/RECos/1252/img/box-bg.png);
    margin: 0;
    padding: 10px;
    font-weight: 400;
    text-transform: uppercase;
    color: #fff;
    font-size: 24px;
}

.scc-box p {
    margin: 0;
    padding: 0 0 20px;
}

.scc-box ul {
    padding: 10px 0;
}

.scc-box ul li {
    margin: 5px 0;
}

.scc-box ul li a {
    color: #7f7f7f;
    font-size: 14px;
    text-decoration: none;
}

.scc-box a {
    color: #1fb059;
    text-decoration: none;
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

    </style>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
<div id="section-cta">
	<div class="section-cta-content">








		<div class="icon-box p-left">
			<div class="icon-wrap">
			  	<div class="icon-border">
			    	<div class="icon-content">
<%--			      		<span class="icon"><img src="http://mmhimages.fnistools.com/images/RECos/1252/img/icon-money-sign.png" /></span> --%>
			    	</div>
			  	</div>
			</div>
			<div class="box-wrap">
			  	<div class="box-content">
			    	<h3>FORMULARIO</h3>
			    	<p>Este formulario ha sido diseñado para recopilar información esencial con el fin de facilitar la informacion de la hoja de servicio</p>
			  	</div>
                <asp:Button runat="server" OnClick="Formulario" Text="Ir" /> 
			</div>
		</div>





		<div class="icon-box p-left margin-last">
			<div class="icon-wrap">
			  	<div class="icon-border">
			    	<div class="icon-content">
<%--			      		<span class="icon"><img src="http://mmhimages.fnistools.com/images/RECos/1252/img/icon-account.png" /></span> --%>
			    	</div>
			  	</div>
			</div>
			<div class="box-wrap">
			  	<div class="box-content">
			    	<h3>ESTADO SERVICIOS</h3>
			    	<p>En este apartado podra mirar los clientes y podra ver los estados de sus servicios filtrado por cliente, tienda, estatus, fechas</p>
			  	</div>
                
                <asp:Button runat="server" OnClick="EstadoServicios_Click" Text="Ir" /> 
			</div>
		</div>





        	<div class="icon-box p-left margin-last">
		<div class="icon-wrap">
		  	<div class="icon-border">
		    	<div class="icon-content">
<%--		      		<span class="icon"><img src="http://mmhimages.fnistools.com/images/RECos/1252/img/icon-account.png" /></span> --%>
		    	</div>
		  	</div>
		</div>
		<div class="box-wrap">
		  	<div class="box-content">
		    	<h3>ESTADOS DE SERVICIOS TECNICOS</h3>
		    	<p>En este apartado podra mirar los clientes y podra ver los estados de sus servicios con el tecnico que lo realizo</p>
		  	</div>
 <asp:Button runat="server" OnClick="EstadoServicioTecnico" Text="Ir" /> 		</div>
	</div>





                	<div class="icon-box p-left margin-last">
		<div class="icon-wrap">
		  	<div class="icon-border">
		    	<div class="icon-content">
<%--		      		<span class="icon"><img src="http://mmhimages.fnistools.com/images/RECos/1252/img/icon-account.png" /></span> --%>
		    	</div>
		  	</div>
		</div>
		<div class="box-wrap">
		  	<div class="box-content">
		    	<h3>EDITAR SERVICIOS</h3>
		    	<p>En este apartado podra editar, visualizar y eliminar los servicios de cada tienda en especifica</p>
		  	</div>
 <asp:Button runat="server" OnClick="EditarServicios" Text="Ir" /> 		</div>
	</div>








	</div>
</div>

</asp:Content>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="modelo.Anuncio"%>
<%@page import="java.util.List"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<style type="text/css">
.gm-err-container {
	height: 100%;
	width: 100%;
	display: table;
	background-color: #e0e0e0;
	position: relative;
	left: 0;
	top: 0
}

.gm-err-content {
	border-radius: 1px;
	padding-top: 0;
	padding-left: 10%;
	padding-right: 10%;
	position: static;
	vertical-align: middle;
	display: table-cell
}

.gm-err-content a {
	color: #4285f4
}

.gm-err-icon {
	text-align: center
}

.gm-err-title {
	margin: 5px;
	margin-bottom: 20px;
	color: #616161;
	font-family: Roboto, Arial, sans-serif;
	text-align: center;
	font-size: 24px
}

.gm-err-message {
	margin: 5px;
	color: #757575;
	font-family: Roboto, Arial, sans-serif;
	text-align: center;
	font-size: 12px
}

.gm-err-autocomplete {
	padding-left: 20px;
	background-repeat: no-repeat;
	background-size: 15px 15px
}
</style>
<style type="text/css">
.gm-style .gm-style-mtc label, .gm-style .gm-style-mtc div {
	font-weight: 400
}
</style>
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
<style type="text/css">
.gm-style .gm-style-cc span, .gm-style .gm-style-cc a, .gm-style .gm-style-mtc div
	{
	font-size: 10px
}
</style>
<style type="text/css">
@media print {
	.gm-style .gmnoprint, .gmnoprint {
		display: none
	}
}

@media screen {
	.gm-style .gmnoscreen, .gmnoscreen {
		display: none
	}
}
</style>
<style type="text/css">
.gm-style {
	font: 400 11px Roboto, Arial, sans-serif;
	text-decoration: none;
}

.gm-style img {
	max-width: none;
}
</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<!--
Accord Template
http://www.templatemo.com/tm-478-accord
-->
<title>Accord - Contact</title>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/28/1/intl/pt_br/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/28/1/intl/pt_br/map.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/28/1/intl/pt_br/util.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/28/1/intl/pt_br/onion.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/28/1/intl/pt_br/stats.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/28/1/intl/pt_br/controls.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/28/1/intl/pt_br/marker.js"></script>
</head>

<body class="contact-page">
	<div class="main-body">
		<div class="container">
			<div class="row">

				<div class="main-page">
					<aside class="main-navigation">
					<div class="main-menu">

						<div class="menu-container">
							<div
								class="block-keep-ratio block-keep-ratio-2-1 block-width-full home">
								<a href="index.html"
									class="block-keep-ratio__content  main-menu-link"> <span
									class="main-menu-link-text"> HOME </span>
								</a>
							</div>
						</div>

						<div class="menu-container">
							<div
								class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-left  about-main">
								<a href="about.html"
									class="main-menu-link about block-keep-ratio__content flexbox-center">
									<i class="fa fa-user fa-4x main-menu-link-icon"></i> ABOUT
								</a>
							</div>

							<div
								class="block-keep-ratio  block-keep-ratio-1-1  block-width-half  pull-right  contact-main">
								<a href="contact.html"
									class="main-menu-link contact block-keep-ratio__content flexbox-center">
									<i class="fa fa-envelope-o fa-4x main-menu-link-icon"></i>
									CONTACT
								</a>
							</div>
						</div>

						<div class="menu-container">
							<div
								class="block-keep-ratio block-keep-ratio-1-1 block-keep-ratio-md-2-1 block-width-full gallery">
								<a href="gallery.html"
									class="main-menu-link  block-keep-ratio__content"> <span
									class="main-menu-link-text"> GALLERY </span>
								</a>
							</div>
						</div>

						<!-- sidebar carousel -->
						<div class="menu-container">
							<div class="mauris">
								<div id="carousel-menu" class="carousel slide"
									data-ride="carousel">
									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<div class="item active">
											<img src="images/slider-img-1.png" alt="slider">
											<div class="carousel-caption menu-caption">mauris vita
											</div>
										</div>
										<div class="item">
											<img src="images/menu-bg-home.png" alt="slider">
											<div class="carousel-caption menu-caption">lorem ipsum
											</div>
										</div>
									</div>

									<!-- Controls -->
									<a class="left carousel-control" href="#carousel-menu"
										role="button" data-slide="prev"> <span
										class="fa fa-caret-left" aria-hidden="true"></span> <span
										class="sr-only">Previous</span>
									</a> <a class="right carousel-control" href="#carousel-menu"
										role="button" data-slide="next"> <span
										class="fa fa-caret-right" aria-hidden="true"></span> <span
										class="sr-only">Next</span>
									</a>
								</div>
							</div>
							<!-- .mauris -->
						</div>
					</div>
					<!-- main-menu --> </aside>
					<!-- main-navigation -->

					<div class="content-main contact-content">
						<div class="contact-content-upper">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div class="gallery_title">
										<h3>Editar An�ncio</h3>
										<h4>VendeMais</h4>
									</div>
								</div>
							</div>

							<div class="row">
								<%
									Anuncio anuncio = (Anuncio) request.getAttribute("resultado");
									if (anuncio != null) {
								%>
								<form role="form" action="alterarAnuncio" method="POST">
									<input hidden type="text" name="idAnuncio"
										value="<%=anuncio.getId()%>">
									<table>
										<tbody>
											<tr>
												<input hidden type="text" name="idAnuncio"
													value="<%=anuncio.getId()%>">
												<td><label for="titulo">Titulo: </label></td>
												<td colspan="3"><input type="text" name="titulo"
													value="<%=anuncio.getTitulo()%>" style="width: 400px;"
													id=titulo required></td>
											</tr>
											<tr>
												<td valign=top><label for="descricao">Descri��o:
												</label></td>
												<td colspan="3"><textarea maxlength="500"
														name="descricao" value="<%=anuncio.getDescricao()%>"
														style="width: 400px; height: 150px;" cols="40" rows="5"
														id=descricao required></textarea></td>
											</tr>
											<tr>
												<td><label for="quantidade">Quantidade</label></td>
												<td><input type="text" size=4 name="quantidade"
													value="<%=anuncio.getQuantidade()%>" id=quantidade required /></td>
												<td><label for="preco">Pre�o: </label></td>
												<td><input type="text" size=7 name="preco"
													value="<%=anuncio.getPreco()%>" id=preco required></td>
											</tr>
											<tr>
												<td><label for="estado">Estado: </label></td>
												<td><input type="radio" name="estado" value="usado"
													id=estado required>usado <input type="radio"
													name="estado" value="novo" id=estado required>novo
												</td>
												<td><label for="peso">Peso: </label></td>
												<td><input type="text" size=7 name="peso" id=peso
													required value="<%=anuncio.getPeso()%>"></td>
											</tr>
											<tr>
												<td><label for="altura">Altura: </label></td>
												<td><input type="text" size=7 name="altura"
													value="<%=anuncio.getAltura()%>" id=altura required></td>
												<td><label for="largura">Largura: </label></td>
												<td><input type="text" size=7 name="largura"
													value="<%=anuncio.getLargura()%>" id=largura required></td>
											</tr>
											<tr>
												<td><label for="categoria">Categoria: </label></td>
												<td><input type="text" name="categoria" size=10
													value="<%=anuncio.getCategoria()%>" id=categoria required></td>
												<td><label for="subcategoria">Subcategoria: </label></td>
												<td><input type="text" name="subcategoria" size=10
													value="<%=anuncio.getSubcategoria()%>" id=subcategoria
													required></td>
											</tr>
										</tbody>
									</table>

									<br>
									<input type="submit" class="btn btn-login" value="SALVAR">
								</form>

								<%
									}
								%>
								<p>
									<a href="consultarAnuncio">CANCELAR</a>
								</p>
							</div>
							<!-- .row -->
						</div>



					</div>
					<!-- .contact-content -->
				</div>
				<!-- .main-page -->
			</div>
			<!-- .row -->

			<footer class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
				<p class="copyright">Copyright � 2016 Company Name</p>
			</div>
			</footer>
			<!-- .row -->

		</div>
		<!-- .container -->
	</div>
	<!-- .main-body -->

	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
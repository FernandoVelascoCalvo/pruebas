<%@ include file="/common/taglibs.jsp"%>

<page:applyDecorator name="moad">

<html>
	<head>
		<title><fmt:message key="principal.titulo"/></title>
	</head>
	<body>

		<p class="azul"><fmt:message key="principal.subtitulo"/></p>
		<p class="info"><fmt:message key="principal.comentario"/></p>

		<logic:present name="perfilAdmin">
			<p class="info"><bean:message key="principal.comentario.superusuario"/></p>
				<c:url var="cambiarURL" value="/cambiarContrasena.do">
				</c:url>
				<div class="importar">
					<html-el:link href="${cambiarURL}" styleId="cambiarContrasena" styleClass="enlace_boton">
						<fmt:message key="usuario.enlace.cambiarContrasena"/>
					</html-el:link>
				</div>
		</logic:present>
    </body>
</html>

</page:applyDecorator>
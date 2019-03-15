<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="importarConfiguracion.titulo"/></title>
	</head>
	<body>

		<p class="azul"><fmt:message key="importarConfiguracion.subtitulo"/></p>
		<p class="info"><fmt:message key="importarConfiguracion.comentario"/></p>
		<div class="cabeceraAbajo"></div>

		<div align="center" class="importarXML">
				<c:out value="${ficheroIncidencias.informe}" escapeXml="false"/>
		</div>

	</body>
</html>
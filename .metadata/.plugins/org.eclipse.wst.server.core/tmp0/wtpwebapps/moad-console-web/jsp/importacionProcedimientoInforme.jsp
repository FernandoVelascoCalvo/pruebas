<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="importarProcedimiento.titulo"/></title>
	</head>
	<body>

		<p class="azul"><fmt:message key="importarProcedimiento.subtitulo"/></p>
		<p class="info"><fmt:message key="importarProcedimiento.comentario"/></p>
		<div class="cabeceraAbajo"></div>

		<div align="center" class="importarXML">
				<c:out value="${ficheroIncidencias.informe}" escapeXml="false"/>
		</div>

	</body>
</html>
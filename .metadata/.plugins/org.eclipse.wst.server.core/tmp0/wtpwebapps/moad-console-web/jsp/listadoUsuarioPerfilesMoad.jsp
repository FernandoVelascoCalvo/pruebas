<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><fmt:message key="perfilesMoad.titulo" /></title>
</head>
<body>

	<p class="azul">
		<fmt:message key="perfilesMoad.subtitulo" />
	</p>
	<p class="info">
		<fmt:message key="perfilesMoad.comentario" />
	</p>

	<logic:present name="usuario">

		<!-- Información del usuario -->
		<jsp:include page="/common/infoUsuarioCabecera.jsp" />
		<div class="cabeceraAbajo"></div>

		<!-- Pestañas -->
		<c:set var="tabPerfilesMoad" value="seleccionada" scope="request" />
		<jsp:include page="/common/subPestanasUsuario.jsp" />

		<!-- Enlace a la asignación de un perfil -->
		<c:url var="nuevoURL" value="/asignarPerfilMoad.do">
			<c:param name="d-7953672-p" value="${param['d-7953672-p']}" />
			<c:param name="cdUsuario" value="${param.cdUsuario}" />
			<c:param name="idUsuarios" value="${param.idUsuarios}" />
		</c:url>

		<p class="azul">
			<fmt:message key="perfilesMoad.subtitulo" />
		</p>
		<p class="info">
			<fmt:message key="perfilesMoad.comentario" />
		</p>
		
		<div class="listado">
			<display:table id="listadoUsuarioPerfilesMoad"
				name="listadoUsuarioPerfilesMoadPaginada"
				pagesize="4"
				decorator="es.ja.cice.pct.moad.webapp.decorators.PerfilesMoadDecorator"
				requestURI="listadoUsuarioPerfilesMoad.do"
				excludedParams="idUsuaPerf accion idPerfil org.apache.struts.taglib.html.CANCEL d-3655079-p idOrden">

				<display:column property="descripcion"
					titleKey="perfil.campo.perfil" sortable="false" />
				<display:column property="revocarLink" title="" class="col_1"
					sortable="false" />
			</display:table>
		</div>
		<div>
			<logic:equal  name="listadoUsuarioPerfilesMoadForm" property="habilitarAsignacion" value="true">
			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.asignar" />
			</html-el:link>
			</logic:equal>
		</div>


	</logic:present>
</body>
</html>

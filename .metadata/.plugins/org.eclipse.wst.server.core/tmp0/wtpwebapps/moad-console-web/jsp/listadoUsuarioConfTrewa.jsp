<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><fmt:message key="confTrewa.titulo" /></title>
</head>
<body>

	<p class="azul">
		<fmt:message key="confTrewa.subtitulo" />
	</p>
	<p class="info">
		<fmt:message key="confTrewa.comentario" />
	</p>

	<logic:present name="usuario">

		<!-- Información del usuario -->
		<jsp:include page="/common/infoUsuarioCabecera.jsp" />
		<div class="cabeceraAbajo"></div>

		<!-- Pestañas -->
		<c:set var="tabConfTrewa" value="seleccionada" scope="request" />
		<jsp:include page="/common/subPestanasUsuario.jsp" />

		<!-- Enlace a la asignación de una Configuracion Trewa -->
		<c:url var="nuevoURL" value="/asignarConfiguracionTrewa.do">
			<!--<c:param name="d-7953672-p" value="${param['d-7953672-p']}"/>-->
			<c:param name="cdUsuario" value="${param.cdUsuario}" />
			<c:param name="idUsuarios" value="${param.idUsuarios}" />
			<c:param name="idUsuConfTrewa" value="${param.idUsuConfTrewa}" />
		</c:url>

		<!-- Enlace a la sincronizacion de las Configuraciones Trewa del usuario -->
		<c:url var="sincronizarURL" value="/sincronizarConfTrewa.do">
			<c:param name="cdUsuario" value="${param.cdUsuario}" />
			<c:param name="idUsuarios" value="${param.idUsuarios}" />
			<c:param name="idUsuConfTrewa" value="${param.idUsuConfTrewa}" />
		</c:url>

		<p class="azul">
			<fmt:message key="confTrewa.subtitulo" />
		</p>

		<div class="listado">
			<display:table id="listadoUsuarioConfTrewa"
				name="listadoUsuarioConfTrewaPaginada"
				pagesize="<%=(Integer) request.getAttribute(\"pagesize\")%>"
				partialList="true" size="size"
				decorator="es.ja.cice.pct.moad.webapp.decorators.UsuariosConfTrewaDecorator"
				requestURI="listadoUsuarioConfTrewa.do" excludedParams="">
				<display:column property="confTrewa.nombre"
					titleKey="confTrewa.campo.nombre" sortable="false" />
				<display:column property="confTrewa.descripcion"
					titleKey="confTrewa.campo.descripcion" sortable="false" />
				<display:column property="revocarLink" title="" class="col_1"
					sortable="false" />
			</display:table>
		</div>

		<div>

			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.asignar" />
			</html-el:link>

			<logic:notEmpty name="listadoUsuarioConfTrewaPaginada">
				<html-el:link href="${sincronizarURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.sincronizar" />
				</html-el:link>
			</logic:notEmpty>
		</div>
	</logic:present>
</body>
</html>

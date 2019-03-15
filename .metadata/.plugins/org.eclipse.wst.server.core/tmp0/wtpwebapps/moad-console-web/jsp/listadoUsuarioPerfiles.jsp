<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><fmt:message key="perfiles.titulo" /></title>
</head>
<body>

	<p class="azul">
		<fmt:message key="perfiles.subtitulo" />
	</p>
	<p class="info">
		<fmt:message key="perfiles.comentario" />
	</p>

	<logic:present name="usuario">

		<!-- Información del usuario -->
		<jsp:include page="/common/infoUsuarioCabecera.jsp" />
		<div class="cabeceraAbajo"></div>

		<!-- Pestañas -->
		<c:set var="tabPerfiles" value="seleccionada" scope="request" />
		<jsp:include page="/common/subPestanasUsuario.jsp" />

		<!-- Enlace a la asignación de un perfil -->
		<c:url var="nuevoURL" value="/asignarPerfil.do">
			<c:param name="d-7953672-p" value="${param['d-7953672-p']}" />
			<c:param name="cdUsuario" value="${param.cdUsuario}" />
			<c:param name="idUsuarios" value="${param.idUsuarios}" />
			<c:param name="idUsuConfTrewa" value="${param.idUsuConfTrewa}" />
		</c:url>

		<!-- Enlace a la sincronizacion de los empleos del usuario -->
		<c:url var="sincronizarURL" value="/sincronizarPerfil.do">
			<c:param name="d-7953672-p" value="${param['d-7953672-p']}" />
			<c:param name="cdUsuario" value="${param.cdUsuario}" />
			<c:param name="idUsuarios" value="${param.idUsuarios}" />
			<c:param name="idUsuConfTrewa" value="${param.idUsuConfTrewa}" />
		</c:url>

		<p class="azul">
			<fmt:message key="confTrewa.subtitulo" />
		</p>

		<div class="listado">
			<display:table id="listadoUsuarioConfTrewa2"
				name="listadoUsuarioConfTrewaPaginada"
				partialList="false" size="size"
				decorator="es.ja.cice.pct.moad.webapp.decorators.UsuConfTrewaPerfilesDecorator"
				requestURI="ListadoUsuarioEmpleos.do" excludedParams="">

				<display:column property="nombreLink"
					titleKey="confTrewa.campo.nombre" sortable="false" />
				<display:column property="descripcionLink"
					titleKey="confTrewa.campo.descripcion" sortable="false" />
			</display:table>
		</div>

		<logic:present parameter="idUsuConfTrewa">
			<logic:notEqual parameter="idUsuConfTrewa" value="">

				<p class="azul">
					<fmt:message key="perfiles.subtitulo" />
				</p>
				<p class="info">
					<fmt:message key="perfiles.comentario" />
				</p>

				<div class="listado">
					<display:table id="listadoUsuarioPerfiles"
						name="listadoUsuarioPerfilesPaginada"
						pagesize="<%=(Integer) request.getAttribute(\"pagesize\")%>"
						partialList="true" size="size"
						decorator="es.ja.cice.pct.moad.webapp.decorators.ConvocatoriasPerfilesDecorator"
						requestURI="listadoUsuarioPerfiles.do"
						excludedParams="idUsuaPerf accion idPerfil org.apache.struts.taglib.html.CANCEL d-3655079-p idOrden">

						<display:column property="convocatoria.titulo"
							titleKey="perfil.campo.convocatoria" sortable="false" />
						<display:column property="descripcion"
							titleKey="perfil.campo.perfil" sortable="false" />
						<display:column property="revocarLink" title="" class="col_1"
							sortable="false" />
					</display:table>
				</div>
				<div>
					<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
						<fmt:message key="comun.enlace.asignar" />
					</html-el:link>
					<html-el:link href="${sincronizarURL}" styleClass="enlace_boton">
						<fmt:message key="comun.enlace.sincronizar" />
					</html-el:link>
				</div>

			</logic:notEqual>
		</logic:present>
	</logic:present>
</body>
</html>

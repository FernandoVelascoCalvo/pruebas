<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><fmt:message key="usuarioEmpleos.titulo" /></title>
</head>
<body>

	<p class="azul">
		<fmt:message key="usuarioEmpleos.subtitulo" />
	</p>
	<p class="info">
		<fmt:message key="usuarioEmpleos.comentario" />
	</p>

	<logic:present name="usuario">

		<!-- Información del usuario -->
		<jsp:include page="/common/infoUsuarioCabecera.jsp" />
		<div class="cabeceraAbajo"></div>

		<!-- Pestañas -->
		<c:set var="tabEmpleos" value="seleccionada" scope="request" />
		<jsp:include page="/common/subPestanasUsuario.jsp" />

		<!-- Enlace a la asignación de un nuevo empleo al usuario -->
		<c:url var="nuevoURL" value="/crearEmpleo.do">
			<c:param name="d-7769137-p" value="${param['d-7769137-p']}" />
			<c:param name="cdUsuario" value="${param.cdUsuario}" />
			<c:param name="idUsuarios" value="${param.idUsuarios}" />
			<c:param name="idUsuConfTrewa" value="${param.idUsuConfTrewa}" />
		</c:url>

		<!-- Enlace a la sincronizacion de los empleos del usuario -->
		<c:url var="sincronizarURL" value="/sincronizarEmpleo.do">
			<c:param name="d-7769137-p" value="${param['d-7769137-p']}" />
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
				decorator="es.ja.cice.pct.moad.webapp.decorators.UsuConfTrewaDecorator"
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
					<fmt:message key="usuarioEmpleos.subtitulo" />
				</p>
				<p class="info">
					<fmt:message key="usuarioEmpleos.comentario" />
				</p>

				<div class="listado">
					<display:table id="listadoEmpleos" name="empleos" pagesize="15"
						requestURI="listadoUsuarioEmpleos.do"
						decorator="es.ja.cice.pct.moad.webapp.decorators.EmpleosDecorator"
						excludedParams="fechaCese accion referencia org.apache.struts.taglib.html.CANCEL
									   				   fechaNombramiento id tipo cdPuestoTrabajo tratamiento idUO idEmpleado">
						<display:column property="nombreUO" titleKey="uo.campo.uo"
							sortable="false" />
						<display:column property="nombrePuesto"
							titleKey="puestoTrabajo.campo.puestoTrabajo" sortable="false" />
						<display:column property="fechaCese"
							titleKey="empleo.campo.fechaCese" sortable="false" />
						<display:column property="editarLink" title="" class="col_1"
							sortable="false" />
						<display:column property="borrarLink" title="" class="col_1"
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

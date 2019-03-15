<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="usuarioRoles.titulo"/></title>
	</head>
	<body> 

		<p class="azul"><fmt:message key="usuarioRoles.subtitulo"/></p>
		<p class="info"><fmt:message key="usuarioRoles.comentario"/></p>

		<logic:present name="usuario">

			<!-- Información del usuario -->
			<jsp:include page="/common/infoUsuarioCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabRoles" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasUsuario.jsp"/>

			<!-- Enlace a la asignación de un nuevo rol al usuario -->
			<c:url var="nuevoURL" value="/asignarRol.do">
			<c:param name="d-7926692-p" value="${param['d-7926692-p']}"/>
			<c:param name="cdUsuario" value="${param.cdUsuario}"/>		
			<c:param name="idUsuarios" value="${param.idUsuarios}"/>
			</c:url>
			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.asignar"/>
			</html-el:link>

			<div class="listado">		
				<display:table id="listadoRolesProcedimientos"
							   name="rolProcedimiento"
							   pagesize="15"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.RolesProcedimientosDecorator"
							   requestURI="listadoUsuarioRoles.do"
							   excludedParams="idRolUsuaProc accion org.apache.struts.taglib.html.CANCEL idProcedimiento idRol">
					<display:column property="nombreRol"
									titleKey="rol.campo.rol"
									sortable="false"/>
					<display:column property="nombreProcedimiento"
									titleKey="procedimiento.campo.procedimiento"
									sortable="false"/>
					<display:column property="borrarLink"
	                   				title=""
	                   				class="col_1"
	                   				sortable="false"/>
				</display:table>
			</div>
		</logic:present>
	</body>
</html>

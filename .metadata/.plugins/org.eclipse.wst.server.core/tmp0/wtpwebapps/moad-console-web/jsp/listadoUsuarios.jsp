<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="usuarios.titulo"/></title>
	</head>
	<body>

		<p class="azul"><fmt:message key="usuarios.subtitulo"/></p>
		<p class="info"><fmt:message key="usuarios.comentario"/></p>

        <html-el:form action="/listadoUsuarios.do">

			<!-- Enlace a la creación de un nuevo usuario -->
			<c:url var="nuevoURL" value="/comprobarUsuario.do">
				<c:param name="d-6570285-p" value="${param['d-6570285-p']}"/>
				<c:param name="filtro" value="${param.filtro}"/>
			</c:url>
			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.nuevo"/>
			</html-el:link>

			<!-- Filtro -->
			<fmt:message key="comun.filtro"/>
			<html:text property="filtro" />
			<html:submit styleClass="boton_submit">
				<fmt:message key="comun.boton.filtrar"/>
			</html:submit>

			<div class="listado">
				<display:table id="listadoUsuarios"
							   name="listadoUsuariosPaginada"
							   requestURI="listadoUsuarios.do"
							   partialList="true"
							   pagesize="<%=(Integer)request.getAttribute(\"pagesize\")%>"
                 			   size="size"
							
							   excludedParams="accion movil fallosLogin dni emailContacto fax piso apellido1 cdPais usuario apellido2
							   				   contrasena telefono puerta fechaCaducidadContrasena org.apache.struts.taglib.html.CANCEL
							   				   escalera sexo codigoPostal cdProvincia fechaBaja nombre numero fechaAlta
							   				   cdTipoVia letra email show permisoCambioContrasena nombreVia cdEstadoUsuario cdUsuario id cdMunicipio publico"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.UsuariosDecorator">
					<display:column property="apellido1Link"
									titleKey="usuario.campo.apellido1"
									sortable="false" maxLength="30" />
					<display:column property="apellido2Link"
									titleKey="usuario.campo.apellido2"
									sortable="false" maxLength="30"/>
					<display:column property="nombreLink"
									titleKey="comun.campo.nombre"
									sortable="false" maxLength="30"/>
					<display:column property="dniLink"
									titleKey="usuario.campo.dni"
									sortable="false"/>
					<display:column property="editarLink"
                    				title=""
                    				class="col_1"
                    				sortable="false"/>
          			<display:column property="borrarLink"
                    				title=""
                    				class="col_1"
                    				sortable="false"/>
          			<display:column property="mostrarLink"
                    				title=""
                    				class="col_1"
                    				sortable="false"/>
        		</display:table>
			</div>
        </html-el:form>
	</body>
</html>
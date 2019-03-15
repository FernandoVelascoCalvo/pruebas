<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="configuracionesGenericas.titulo"/></title>
	</head>
	<body> 
		
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		
		<p class="azul"><fmt:message key="gestion.subtitulo"/></p>
		<p class="info"><fmt:message key="gestion.comentario"/></p>

		<!-- Pestañas -->			
		<c:set var="tabConfiguraciones" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasGestion.jsp"/>

		<p class="azul"><fmt:message key="configuracionesGenericas.subtitulo"/></p>
		<p class="info"><fmt:message key="configuracionesGenericas.comentario"/></p>

		<!-- Enlace a la creación de una nueva configuracion -->
		<% if(modoEdicion){%>
		<c:url var="nuevoURL" value="/crearConfiguracion.do">
			<c:param name="d-4460053-p" value="${param['d-4460053-p']}"/>
			<c:param name="idProcedimiento" value="0"/>				
		</c:url>
		<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
			<fmt:message key="comun.enlace.nueva"/>
		</html-el:link>
		<%} %>

		<!-- Enlace para importar una configuración -->
		<% if(modoEdicion){%>
		<div class="importar">
			<c:url var="nuevoURL" value="/importarConfiguracion.do">
				<c:param name="d-4460053-p" value="${param['d-4460053-p']}"/>
				<c:param name="idProcedimiento" value="0"/>				
			</c:url>
			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.importar"/>
			</html-el:link>
		</div>
		<%} %>


		<div class="listado">		

			<!-- Lista de configuraciones del procedimiento -->
			<display:table id="listadoConfiguraciones"
						   name="configuraciones"
						   pagesize="15"
						   requestURI="listadoConfiguraciones.do"
						   excludedParams="nombre accion idConfiguracion org.apache.struts.taglib.html.CANCEL
						   				   descripcion idProcedimiento habilitada"
						   decorator="es.ja.cice.pct.moad.webapp.decorators.ConfiguracionesDecorator">
				<display:column property="habilitada"
                   				class="col_1"
								titleKey="configuracion.campo.habilitada"
								sortable="false"/>
				<display:column property="nombreLink"
								titleKey="comun.campo.nombre"
								sortable="false"/>
				<display:column property="descripcionLink"
								titleKey="comun.campo.descripcion"
								sortable="false" maxLength="80" />
				<% if(modoEdicion){%>
				<display:column property="editarLink"
                   				title=""
                   				class="col_1"
                   				sortable="false"/>
       			<display:column property="borrarLink"
                   				title=""
                   				class="col_1"
                   				sortable="false"/>
                <% } else{%>
            	<display:column property="mostrarLink"
                				title=""
                				class="col_1"
                				sortable="false"/>
                <%} %>
       			<display:column property="exportarLink"
                   				title=""
                   				class="col_1"
                   				sortable="false"/>
       		</display:table>
		</div>
	</body>
</html>
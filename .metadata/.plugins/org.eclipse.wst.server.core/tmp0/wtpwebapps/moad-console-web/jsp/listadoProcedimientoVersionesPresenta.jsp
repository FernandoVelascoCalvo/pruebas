<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="versionPresenta.titulo"/></title>
	</head>
	<body> 
		
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		
		<p class="azul"><fmt:message key="versionPresenta.subtitulo"/></p>
		<p class="info"><fmt:message key="versionPresenta.comentario"/></p>

		<!-- Información del procedimiento -->
		<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
		<div class="cabeceraAbajo"></div>
		
		<!-- Pestañas -->			
		<c:set var="tabVersionesPresenta" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasProcedimiento.jsp"/>
		
		<logic:present name="versionesPresenta">
		
			<div class="listado">		

				<!-- Enlace a la creación de una nueva versión -->
				<% if(modoEdicion){%>
				<c:url var="nuevoURL" value="/crearVersionPresenta.do">
					<c:param name="d-5725043-p" value="${param['d-5725043-p']}"/>
					<c:param name="idProcedimiento" value="${param.idProcedimiento}" />				
				</c:url>
				<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.nueva"/>
				</html-el:link>
				<%} %>

				<!-- Lista de Tipos de Certificados del procedimiento -->
				<display:table id="listadoVersionesPresentaAsignar"
						   name="versionesPresenta"
						   pagesize="15"
						   requestURI="listadoProcedimientoVersionesPresenta.do"
						   excludedParams="accion org.apache.struts.taglib.html.CANCEL descripcion codigo"
						   decorator="es.ja.cice.pct.moad.webapp.decorators.VersionesPresentaDecorator">
				<display:column property="codigoLink"
								titleKey="comun.campo.codigo"
								sortable="false"/>
				<display:column property="descripcionLink"
								titleKey="comun.campo.descripcion"
								sortable="false"/>
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
       			</display:table>
			</div>
			
		</logic:present>
		
	</body>
</html>
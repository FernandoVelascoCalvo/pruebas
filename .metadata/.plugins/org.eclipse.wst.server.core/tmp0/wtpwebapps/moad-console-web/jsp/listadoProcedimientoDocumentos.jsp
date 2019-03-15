<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="documentos.titulo"/></title>
	</head>
	<body>
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %> 

		<p class="azul"><fmt:message key="documentos.subtitulo"/></p>
		<p class="info"><fmt:message key="documentos.comentario"/></p>

		<logic:present name="listaDocumentos">

			<!-- Información del procedimiento -->
			<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabDocumentos" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasProcedimiento.jsp"/>

		
			<div class="listado">		
				
				<% if(modoEdicion){%>
				<!-- Enlace a la creación de un documento -->
				<c:url var="nuevoURL" value="/crearDocumento.do">
					<c:param name="d-3550647-p" value="${param['d-3550647-p']}"/>						
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
				</c:url>
				<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.nuevo"/>
				</html-el:link>
				<%} %>

				<!-- Lista de documentos asociados a un procedimiento -->
				<display:table id="listadoProcedimientoDocumentos"
							   name="listaDocumentos"
							   pagesize="15"
							   requestURI="listadoProcedimientoDocumentos.do"
							   excludedParams="nombre accion org.apache.struts.taglib.html.CANCEL descripcion orden compulsable d-6931142-p"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.DocumentoDecorator">
					<display:column property="nombre"
									titleKey="comun.campo.nombre"
									sortable="false"/>
					<display:column property="descripcion"
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
                    <%} else {%>
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
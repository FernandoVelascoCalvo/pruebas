<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="convocatorias.titulo"/></title>
	</head>
	<body> 
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		
		<p class="azul"><fmt:message key="convocatorias.subtitulo"/></p>
		<p class="info"><fmt:message key="convocatorias.comentario"/></p>

		<logic:present name="procedimiento">
			<logic:present name="orden">
		
				<!-- Información del procedimiento -->
				<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
				<jsp:include page="/common/infoOrdenCabecera.jsp"/>
				<div class="cabeceraAbajo"></div>
	
				<!-- Pestañas -->			
				<c:set var="tabConvocatorias" value="seleccionada" scope="request"/>
				<jsp:include page="/common/subPestanasOrden.jsp"/>
				
				<!-- Enlace a la creación de una convocatoria -->
				<% if(modoEdicion){%>
				<c:url var="nuevoURL" value="/crearConvocatoria.do">
					<c:param name="d-828469-p" value="${param['d-828469-p']}"/>						
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idOrden" value="${param.idOrden}"/>
				</c:url>
				<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.nueva"/>
				</html-el:link>
				<%} %>

				<div class="listado">	
					<!-- Lista de convocatorias de una orden -->
					<display:table id="listadoConvocatorias"
								   name="convocatorias"
								   pagesize="15"
								   requestURI="listadoOrdenConvocatorias.do"
								   excludedParams="fechaFin accion cdProcTrewa org.apache.struts.taglib.html.CANCEL
								   				   titulo descripcion fechaComienzo cdTipoExpTrewa id idConvocatoria
								   				   fechaFinPresentacion fechaInicioPresentacion"
								   decorator="es.ja.cice.pct.moad.webapp.decorators.ConvocatoriasDecorator">
						<display:column property="tituloLink"
										titleKey="convocatoria.campo.titulo"
										sortable="false" maxLength="60"/>
						<display:column property="descripcionLink"
										titleKey="comun.campo.descripcion"
										sortable="false" maxLength="60"/>
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
		</logic:present>
	</body>
</html>
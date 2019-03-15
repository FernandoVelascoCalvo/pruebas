<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="convocatoriaPerfiles.titulo"/></title>
	</head>
	<body> 
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>

		<p class="azul"><fmt:message key="convocatoriaPerfiles.subtitulo"/></p>
		<p class="info"><fmt:message key="convocatoriaPerfiles.comentario"/></p>

		<logic:present name="procedimiento">
			<logic:present name="orden">
				<logic:present name="convocatoria">
		
					<!-- Información del procedimiento, orden y convocatoria -->
					<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
					<jsp:include page="/common/infoOrdenCabecera.jsp"/>
					<jsp:include page="/common/infoConvocatoriaCabecera.jsp"/>
					<div class="cabeceraAbajo"></div>
		
					<!-- Pestañas -->			
					<c:set var="tabPerfiles" value="seleccionada" scope="request"/>
					<jsp:include page="/common/subPestanaConvocatoria.jsp"/>
					
					<!-- Enlace a la creación de un perfil -->
					<% if(modoEdicion){%>
					<c:url var="nuevoURL" value="/crearPerfil.do">
						<c:param name="d-6548574-p" value="${param['d-6548574-p']}"/>						
						<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
						<c:param name="idOrden" value="${param.idOrden}"/>
						<c:param name="idConvocatoria" value="${param.idConvocatoria}"/>
					</c:url>
					<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
						<fmt:message key="comun.enlace.nuevo"/>
					</html-el:link>
					<%} %>
	
					<div class="listado">	
						<!-- Lista de perfiles de una convocatoria -->
						<display:table id="listadoPerfiles"
									   name="perfiles"
									   pagesize="15"
									   requestURI="listadoConvocatoriaPerfiles.do"
									   excludedParams="accion org.apache.struts.taglib.html.CANCEL descripcion 
									   				   cdNombreTrewa publico defecto idPerfil fechaFinPresentacion 
									   				   fechaInicioPresentacion"
									   decorator="es.ja.cice.pct.moad.webapp.decorators.PerfilesDecorator">
							<display:column property="publico"
		                    				class="col_1"
											titleKey="perfil.campo.publico"
											sortable="false"/>
							<display:column property="cdNombreTrewa"
											titleKey="perfil.campo.cdNombreTrewa"
											sortable="false"/>
							<display:column property="descripcion"
											titleKey="comun.campo.descripcion"
											sortable="false"/>
						    <display:column property="cdUsuarioTrewa"
											titleKey="perfil.campo.usuarioPublico"
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
			</logic:present>
		</logic:present>
	</body>
</html>
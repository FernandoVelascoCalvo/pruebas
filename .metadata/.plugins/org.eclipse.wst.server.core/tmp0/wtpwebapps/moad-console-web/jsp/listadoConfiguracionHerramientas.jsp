<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="instHerramientas.titulo"/></title>
	</head>
	<body> 
		
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		
		<logic:lessThan name="procedimiento" property="id" value="1">
			<c:set var="genericas" value="Genericas"/>
		</logic:lessThan>
		<p class="azul"><fmt:message key="instHerramientas${genericas}.titulo"/></p>
		<p class="info"><fmt:message key="instHerramientas${genericas}.comentario"/></p>

		<logic:present name="procedimiento">
			<logic:present name="configuracion">
		
				<!-- Información del procedimiento -->
				<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
				<jsp:include page="/common/infoConfiguracionCabecera.jsp"/>
				<div class="cabeceraAbajo"></div>
	
				<!-- Pestañas -->			
				<logic:greaterEqual name="procedimiento" property="id" value="1">
					<c:set var="tabConfiguraciones" value="seleccionada" scope="request"/>
					<jsp:include page="/common/subPestanasProcedimiento.jsp"/>
				</logic:greaterEqual>
				<logic:lessThan name="procedimiento" property="id" value="1">
					<c:set var="tabConfiguraciones" value="seleccionada" scope="request"/>
					<jsp:include page="/common/subPestanasGestion.jsp"/>
				</logic:lessThan>

				<% if(modoEdicion){%>	
				<!-- Enlace a la creación de una nueva herramienta -->
				<c:url var="nuevoURL" value="/crearInstHerramienta.do">
					<c:param name="d-4460053-p" value="${param['d-4460053-p']}"/>
					<c:param name="d-3449996-p" value="${param['d-3449996-p']}"/>
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idConfiguracion" value="${param.idConfiguracion}"/>
				</c:url>
				<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.nueva"/>
				</html-el:link>
				<%} %>

				<% if(modoEdicion){%>
				<!-- Enlace para chequear las herramientas de una configuración -->
				<div class="importar">
					<c:url var="nuevoURL" value="/chequearConfiguracion.do">
						<c:param name="d-3449996-p" value="${param['d-3449996-p']}"/>
						<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
						<c:param name="idConfiguracion" value="${param.idConfiguracion}"/>
					</c:url>
					<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
						<fmt:message key="comun.boton.chequear"/>
					</html-el:link>
				</div>
				<%} %>
				
				<div class="listado">		

					<!-- Lista de instancias de herramientas de la configuración -->
					<display:table id="listadoInstanciasHerramientas"
								   name="instanciasHerramientas"
								   pagesize="15"
								   requestURI="listadoConfiguracionHerramientas.do"
								   excludedParams="nombre accion org.apache.struts.taglib.html.CANCEL
								   				   descripcion idHerramienta d-4460053-p"
								   decorator="es.ja.cice.pct.moad.webapp.decorators.InstHerramientasDecorator">
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
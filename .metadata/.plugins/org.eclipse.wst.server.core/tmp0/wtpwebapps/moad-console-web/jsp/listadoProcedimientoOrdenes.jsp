<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="ordenes.titulo"/></title>
	</head>
	<body> 

		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		
		<p class="azul"><fmt:message key="ordenes.subtitulo"/></p>
		<p class="info"><fmt:message key="ordenes.comentario"/></p>

		<logic:present name="procedimiento">
		
			<!-- Información del procedimiento -->
			<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabOrdenes" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasProcedimiento.jsp"/>

			<% if(modoEdicion){%>
			<!-- Enlace al listado de ordenes de un procedimiento -->
	  		<c:url var="nuevoURL" value="/crearOrden.do">
				<c:param name="d-7776532-p" value="${param['d-7776532-p']}"/>
				<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>				
			</c:url>
			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.nueva"/>
			</html-el:link>
			<%} %>

			<div class="listado">		
			
				<!-- Lista de órdenes de un procedimiento -->
				<display:table id="listadoOrdenes"
							   name="ordenes"
							   pagesize="15"
							   requestURI="listadoProcedimientoOrdenes.do"
							   excludedParams="fecha accion org.apache.struts.taglib.html.CANCEL titulo beneficiario referenciaBoja convocante cdTipoExpTrewa d-4460053-p d-7926692-p idOrden"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.OrdenesDecorator">
					<display:column property="fechaLink"
									titleKey="orden.campo.fecha"
									sortable="false"/>
					<display:column property="tituloLink"
									titleKey="orden.campo.titulo"
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
<%@ include file="/common/taglibs.jsp"%>

<%@page import="es.ja.cice.pct.moad.webapp.ConstantesWeb"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>
<html>
	<head>
		<title><fmt:message key="tramites.titulo"/></title>
	</head>

	<body>
		
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION);%>
		
		<p class="azul"><fmt:message key="tramites.subtitulo"/></p>
		<p class="info"><fmt:message key="tramites.comentario"/></p>
		
		
				<logic:present name="procedimiento">
		
			<!-- Información del procedimiento -->
			<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabTramites" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasProcedimiento.jsp"/>

            <!-- Enlace al listado de tramites de un procedimiento -->
            <%if(modoEdicion){%>
	  		<c:url var="nuevoURL" value="/crearTramite.do">
				<c:param name="d-7776532-p" value="${param['d-7776532-p']}"/>
				<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>				
			</c:url>
			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.nuevo"/>
			</html-el:link>
			 <%}%>
			
			<div class="listado">		
			
				<!-- Lista de órdenes de un procedimiento -->
				<display:table id="listadoTramites"
							   name="tramites"
							   pagesize="15"
							   requestURI="listadoProcedimientoTramites.do"
							   excludedParams="fecha accion org.apache.struts.taglib.html.CANCEL codigo nombre descripcion"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.TramitesDecorator">
					<display:column property="codigoLink"
									titleKey="tramites.campo.codigo"
									sortable="false"/>
					<display:column property="nombreLink"
									titleKey="tramites.campo.nombre"
									sortable="false"/>
					<display:column property="descripcionLink"
									titleKey="tramites.campo.descripcion"
									sortable="false"/>
 					<%if(modoEdicion){%>									
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


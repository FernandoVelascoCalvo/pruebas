<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="listados.titulo"/></title>
	</head>
	<body> 

		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>

		<p class="azul"><fmt:message key="listados.subtitulo"/></p>
		<p class="info"><fmt:message key="listados.comentario"/></p>

		<logic:present name="procedimiento">
		
			<!-- Información del procedimiento -->
			<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabListados" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasProcedimiento.jsp"/>

			<div class="listado">		

				<% if(modoEdicion){%>
				<!-- Enlace a la asignación de un listado a un procedimiento -->
				<c:url var="nuevoURL" value="/asignarListado.do">
					<c:param name="d-6543861-p" value="${param['d-6543861-p']}"/>						
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>				
				</c:url>
				<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.asignar"/>
				</html-el:link>
				<%} %>

				<!-- Lista de listados del procedimiento -->
				<display:table id="listadoListados"
							   name="listados"
							   pagesize="15"
							   requestURI="listadoProcedimientoListados.do"
							   excludedParams="idListado accion org.apache.struts.taglib.html.CANCEL d-7926692-p"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.ListadosProcedimientoDecorator">
					<display:column property="nombre"
									titleKey="comun.campo.nombre"
									sortable="false"/>
					<display:column property="descripcion"
									titleKey="comun.campo.descripcion"
									sortable="false"/>
					<% if(modoEdicion){%>
					<display:column property="borrarLink"
                    				title=""
                    				class="col_1"
                    				sortable="false"/>
                    <%} %>
        		</display:table>
			</div>
			
		</logic:present>
	</body>
</html>
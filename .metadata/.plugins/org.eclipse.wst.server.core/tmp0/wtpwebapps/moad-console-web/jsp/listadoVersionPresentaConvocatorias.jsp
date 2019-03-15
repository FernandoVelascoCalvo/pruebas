<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="convocatoriaVersionPresenta.titulo"/></title>
	</head>
	<body>
	 
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		
		<p class="azul"><fmt:message key="convocatoriaVersionPresenta.subtitulo"/></p>
		<p class="info"><fmt:message key="convocatoriaVersionPresenta.comentario"/></p>

		<logic:present name="listaConvocatorias">

			<!-- Información del procedimiento -->
			<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>

			<!-- Información de la version presenta -->
			<jsp:include page="/common/infoVersionPresentaCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabConvocatorias" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasPresenta.jsp"/>

		
			<div class="listado">		
				
				<% if(modoEdicion){%>
				<!-- Enlace a la asignación de Tipo de Certificado a un procedimiento -->
				<c:url var="nuevoURL" value="/asignarConvocatoriaVersionPresenta.do">
					<c:param name="d-2002331-p" value="${param['d-2002331-p']}"/>						
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>				
				</c:url>
				<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.asignar"/>
				</html-el:link>
				<%} %>

				<!-- Lista de las convocatorias de una version presenta y un procedimiento -->
				<display:table id="listadoVersionPresentaConvocatorias"
							   name="listaConvocatorias"
							   pagesize="15"
							   requestURI="listadoVersionPresentaConvocatorias.do"
							   excludedParams="accion org.apache.struts.taglib.html.CANCEL"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.ConvocatoriasPresentaDecorator">
					<display:column property="titulo"
									titleKey="convocatoria.campo.titulo"
									sortable="false"/>
					<display:column property="descripcion"
									titleKey="comun.campo.descripcion"
									sortable="false" maxLength="70"/>
					<% if(modoEdicion){%>				
					<display:column property="revocarLink"
                    				title=""
                    				class="col_1"
                    				sortable="false"/>
                    <%} %>
        		</display:table>
			</div>
			
		</logic:present>
	</body>
</html>
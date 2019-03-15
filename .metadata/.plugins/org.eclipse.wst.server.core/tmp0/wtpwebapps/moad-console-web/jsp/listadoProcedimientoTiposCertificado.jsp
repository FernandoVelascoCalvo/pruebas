<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="tiposCertificado.titulo"/></title>
	</head>
	<body> 
		
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		
		<p class="azul"><fmt:message key="tiposCertificado.subtitulo"/></p>
		<p class="info"><fmt:message key="tiposCertificado.comentario"/></p>

		<logic:present name="tiposCertificado">
		
			<!-- Información del procedimiento -->
			<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabTiposCertificado" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasProcedimiento.jsp"/>

			<div class="listado">		
				
				<% if(modoEdicion){%>
				<!-- Enlace a la asignación de Tipo de Certificado a un procedimiento -->
				<c:url var="nuevoURL" value="/asignarTipoCertificado.do">
					<c:param name="d-3954682-p" value="${param['d-3954682-p']}"/>						
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>				
				</c:url>
				<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.asignar"/>
				</html-el:link>
				<%} %>

				<!-- Lista de Tipos de Certificados del procedimiento -->
				<display:table id="listadoProcedimientoTiposCertificado"
							   name="tiposCertificado"
							   pagesize="15"
							   requestURI="listadoProcedimientoTiposCertificado.do"
							   excludedParams="accion org.apache.struts.taglib.html.CANCEL d-7926692-p
							   				   idTipoCertificado"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.TiposCertificadoDecorator">
					<display:column property="entidadLink"
									titleKey="tipoCertificado.campo.entidad"
									sortable="false"/>
					<display:column property="tipoLink"
									titleKey="tipoCertificado.campo.tipo"
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
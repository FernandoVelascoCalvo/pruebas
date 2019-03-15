<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="tiposCertificadoPerfiles.titulo"/></title>
	</head>
	<body>
	 
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		
		<p class="azul"><fmt:message key="tiposCertificadoPerfiles.subtitulo"/></p>
		<p class="info"><fmt:message key="tiposCertificadoPerfiles.comentario"/></p>

		<logic:present name="procedimiento">
		  <logic:present name="tipoCertificado">
		    
		    <!-- Información del procedimiento -->
			<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>
			
			<!-- Información del tipo de certificado -->
		  	<jsp:include page="/common/infoTiposCertificadoCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabTiposCertificado" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasProcedimiento.jsp"/>

			<% if(modoEdicion){%>
			<!-- Enlace a la asignación de un perfil a un tipo de certificado y a un procedimiento -->
			<c:url var="nuevoURL" value="/asignarPerfilTipoCertificado.do">
				<c:param name="d-3351491-p" value="${param['d-3351491-p']}"/>						
				<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>				
				<c:param name="idTipoCertificado" value="${param.idTipoCertificado}"/>				
			</c:url>
			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.asignar"/>
			</html-el:link>
			<%} %>

			<div class="listado">		

				<!-- Lista de listados del procedimiento -->
				<display:table id="listadoTipoCertificadoPerfiles"
							   name="listaPerfiles"
							   pagesize="15"
							   requestURI="listadoTipoCertificadoPerfiles.do"
							   excludedParams="accion org.apache.struts.taglib.html.CANCEL d-3954682-p"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.TiposCertificadoPerfilesDecorator">
					<display:column property="convocatoria.titulo"
									titleKey="convocatoria.campo.convocatoria"
									sortable="false"/>
					<display:column property="descripcion"
									titleKey="perfil.campo.perfil"
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
		</logic:present>
	</body>
</html>
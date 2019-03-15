<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="tipoCertificados.titulo"/></title>
	</head>
	<body>
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		
		<p class="azul"><fmt:message key="gestion.subtitulo"/></p>
		<p class="info"><fmt:message key="gestion.comentario"/></p>
	
		<!-- Pestañas -->			
		<c:set var="tabTiposCertificados" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasGestion.jsp"/>
	
		<p class="azul"><fmt:message key="tipoCertificados.subtitulo"/></p>
		<p class="info"><fmt:message key="tipoCertificados.comentario"/></p>

		<!-- Enlace a la creación de una nueva aplicación -->
		<% if(modoEdicion){%>
		<c:url var="nuevoURL" value="/crearTiposCertificados.do">
			<c:param name="d-6544692-p" value="${param['d-6544692-p']}"/>
		</c:url>
		<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
			<fmt:message key="comun.enlace.nueva"/>
		</html-el:link>
		<%} %>
		
		<!-- Listado de oficinas -->
		
		<!-- Listado de oficinas -->
		<div class="listado">		
			<display:table id="listadoTiposCertificados"
						   name="tiposCertificado"
						   pagesize="15"
						   requestURI="listadoTiposCertificados.do"
						   excludedParams="codigo descripcion entidad tipo accion"
						   decorator="es.ja.cice.pct.moad.webapp.decorators.TipoCertificadoBeanDecorator">
			    <display:column property="entidadLink"
								titleKey="tiposCertificado.campo.entidad"
								sortable="false" maxLength="70" />
				<display:column property="tipoLink"
								titleKey="tiposCertificado.campo.tipo"
								sortable="false" maxLength="70" />
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
	</body>
</html>
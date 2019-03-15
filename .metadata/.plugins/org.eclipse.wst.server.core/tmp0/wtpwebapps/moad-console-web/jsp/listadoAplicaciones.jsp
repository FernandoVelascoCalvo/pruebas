<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>


<html>
	<head>
		<title><fmt:message key="aplicaciones.titulo"/></title>
	</head>
	<body>
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
	
		<p class="azul"><fmt:message key="gestion.subtitulo"/></p>
		<p class="info"><fmt:message key="gestion.comentario"/></p>
	
		<!-- Pestañas -->			
		<c:set var="tabAplicaciones" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasGestion.jsp"/>
	
		<p class="azul"><fmt:message key="aplicaciones.subtitulo"/></p>
		<p class="info"><fmt:message key="aplicaciones.comentario"/></p>

		<!-- Enlace a la creación de una nueva aplicación -->
		<% if(modoEdicion){%>
		<c:url var="nuevoURL" value="/crearAplicacion.do">
			<c:param name="d-8216685-p" value="${param['d-8216685-p']}"/>
		</c:url>
		<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
			<fmt:message key="comun.enlace.nueva"/>
		</html-el:link>
		<%} %>
		
		<!-- Listado de aplicaciones -->
		<div class="listado">		
			<display:table id="listadoAplicaciones"
						   name="aplicaciones"
						   pagesize="15"
						   requestURI="listadoAplicaciones.do"
						   excludedParams="nombre presentable codigo accion org.apache.struts.taglib.html.CANCEL descripcion show idAplicacion"
						   decorator="es.ja.cice.pct.moad.webapp.decorators.AplicacionesDecorator">
			    <display:column property="presentable"
                   				class="col_1"
								titleKey="aplicacion.campo.presentable"
								sortable="false"/>
				<display:column property="nombre"
								titleKey="comun.campo.nombre"
								sortable="false"/>
				<display:column property="descripcion"
								titleKey="comun.campo.descripcion"
								sortable="false" maxLength="75" />
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
	</body>
</html>
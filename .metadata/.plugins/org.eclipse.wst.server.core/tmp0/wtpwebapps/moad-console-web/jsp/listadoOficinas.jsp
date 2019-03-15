<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="oficinas.titulo"/></title>
	</head>
	<body>
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
	
		<p class="azul"><fmt:message key="gestion.subtitulo"/></p>
		<p class="info"><fmt:message key="gestion.comentario"/></p>
	
		<!-- Pestañas -->			
		<c:set var="tabOficinas" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasGestion.jsp"/>
	
		<p class="azul"><fmt:message key="oficinas.subtitulo"/></p>
		<p class="info"><fmt:message key="oficinas.comentario"/></p>

		
		<!-- Enlace a la creación de una nueva aplicación -->
		<% if(modoEdicion){%>
		<c:url var="nuevoURL" value="/crearOficina.do">
			<c:param name="d-6544692-p" value="${param['d-6544692-p']}"/>
		</c:url>
		<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
			<fmt:message key="comun.enlace.nueva"/>
		</html-el:link>
		<%} %>
		
		<!-- Listado de oficinas -->
		<div class="listado">		
			<display:table id="listadoOficinas"
						   name="oficinas"
						   pagesize="15"
						   requestURI="listadoOficinas.do"
						   excludedParams="nombre codigo accion idUO usuarioAries contrasenaAries idProvincia 
						   					org.apache.struts.taglib.html.CANCEL descripcion show idOficina"
						   decorator="es.ja.cice.pct.moad.webapp.decorators.OficinasDecorator">
			    <display:column property="codigo"                   				
								titleKey="oficina.campo.codigo"
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
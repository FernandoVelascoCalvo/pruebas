<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="menus.titulo"/></title>
	</head>
	<body>
		
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		
		<p class="azul"><fmt:message key="gestion.subtitulo"/></p>
		<p class="info"><fmt:message key="gestion.comentario"/></p>
	
		<!-- Pestañas -->			
		<c:set var="tabMenus" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasGestion.jsp"/>
	
		<p class="azul"><fmt:message key="menus.subtitulo"/></p>
		<p class="info"><fmt:message key="menus.comentario"/></p>

		<!-- Enlace a la creación de una nueva aplicación -->
		<% if(modoEdicion){%>
		<c:url var="nuevoURL" value="/crearMenus.do">
			<c:param name="d-6544692-p" value="${param['d-6544692-p']}"/>
		</c:url>
		<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
			<fmt:message key="comun.enlace.nueva"/>
		</html-el:link>
		<%} %>
	
		
		<!-- Listado de menus -->
		<div class="listado">		
			<display:table id="listadoMenus"
						   name="menu"
						   pagesize="15"
						   requestURI="listadoMenus.do"
						   excludedParams="codigo descripcion entidad tipo accion"
						   decorator="es.ja.cice.pct.moad.webapp.decorators.MenuBeanDecorator">
			    <display:column property="nombreLink"
								titleKey="menu.campo.nombre"
								sortable="false" maxLength="14" />
				<display:column property="descripcionLink"
								titleKey="menu.campo.descripcion"
								sortable="false" maxLength="42" />
				<display:column property="urlLink"
								titleKey="menu.campo.url"
								sortable="false" maxLength="32" />	
				<display:column property="ordenLink"
								titleKey="menu.campo.orden"
								sortable="false" maxLength="3" />	
				<%-- <display:column property="activadoLink"
								titleKey="menu.campo.activado"
								sortable="false" maxLength="5" />	 --%>	
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
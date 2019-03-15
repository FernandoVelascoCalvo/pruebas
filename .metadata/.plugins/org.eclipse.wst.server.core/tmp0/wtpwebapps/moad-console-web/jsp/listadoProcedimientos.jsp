<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="procedimientos.titulo"/></title>
	</head>
	<body> 

		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
	
		<p class="azul"><fmt:message key="procedimientos.subtitulo"/></p>
		<p class="info"><fmt:message key="procedimientos.comentario"/></p>

		<% if(modoEdicion){%>
		<!-- Enlace a la creación de un nuevo procedimiento -->
		<c:url var="nuevoURL" value="/crearProcedimiento.do">
		    <pctmoad:param nombre="d-6903951-p"/>
		    <pctmoad:param nombre="filtro"/>
		</c:url>
		<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
		    <fmt:message key="comun.enlace.nuevo" />
		</html-el:link>
		<%} %>

		<!-- Enlace para importar una procedimiento -->
		<% if(modoEdicion){%>
		<div class="importar">
			<c:url var="nuevoURL" value="/importarProcedimiento.do">
				<c:param name="d-6903951-p" value="${param['d-6903951-p']}"/>
			</c:url>
			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.importar"/>
			</html-el:link>
		</div>
		<%} %>

		<div class="listado">		

			<!-- Lista de procedimientos -->
			<display:table id="listadoProcedimientos"
						   name="procedimientos"
						   pagesize="15"
						   requestURI="listadoProcedimientos.do"
						   excludedParams="nombre accion org.apache.struts.taglib.html.CANCEL administrable descripcion visible idProcedimiento d-4460053-p"
						   decorator="es.ja.cice.pct.moad.webapp.decorators.ProcedimientosDecorator">
				<display:column property="nombreLink"
								titleKey="comun.campo.nombre"
								sortable="false"/>
				<display:column property="descripcionLink"
								titleKey="comun.campo.descripcion"
								sortable="false" maxLength="75"/>
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
       			<display:column property="exportarLink"
                   				title=""
                   				class="col_1"
                   				sortable="false"/>
	      		</display:table>
		</div>
	</body>
</html>
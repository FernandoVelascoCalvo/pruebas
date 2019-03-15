<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="roles.titulo"/></title>
	</head>
	<body>
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %> 

		<p class="azul"><fmt:message key="gestion.subtitulo"/></p>
		<p class="info"><fmt:message key="gestion.comentario"/></p>

		<!-- Pestañas -->			
		<c:set var="tabRoles" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasGestion.jsp"/>

		<p class="azul"><fmt:message key="roles.subtitulo"/></p>
		<p class="info"><fmt:message key="roles.comentario"/></p>

        <html-el:form action="/listadoRoles.do">
        	<input type="hidden" name="show" value="true" />
			
			<!-- Enlace a la creación de un nuevo rol -->
			<% if(modoEdicion){%>
			<c:url var="nuevoURL" value="/crearRol.do">
				<c:param name="d-6456657-p" value="${param['d-6456657-p']}"/>
				<c:param name="d-2760595-p" value="${param['d-2760595-p']}"/>
				<c:param name="filtro" value="${param.filtro}"/>				
			</c:url>
			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.nuevo"/>
			</html-el:link>
			<%} %>
			
			<!-- Filtro -->
			<fmt:message key="comun.filtro"/>
			<html:text property="filtro" />
			<html:submit styleClass="boton_submit">
				<fmt:message key="comun.boton.filtrar"/>
			</html:submit>
        </html-el:form>

		<div class="listado">		
			<display:table id="listadoRoles"
						   name="roles"
						   pagesize="10"
						   requestURI="listadoRoles.do"
						   excludedParams="nombre idRol accion org.apache.struts.taglib.html.CANCEL descripcion show idFuncionalidad"
						   decorator="es.ja.cice.pct.moad.webapp.decorators.RolesDecorator">
				<display:column property="nombreLink"
								titleKey="comun.campo.nombre"
								sortable="false"/>
				<display:column property="descripcionLink"
								titleKey="comun.campo.descripcion"
								sortable="false" maxLength="95" />
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

		<logic:present parameter="idRol">
    		<logic:notEqual parameter="idRol" value="">
	    		<logic:notEqual parameter="show" value="false">

					<hr/>
					<p class="azul"><fmt:message key="funcionalidades.subtitulo"/></p>
					<p class="info"><fmt:message key="funcionalidades.comentario"/></p>

					<% if(modoEdicion){%>
					<!-- Enlace a la asignación de funcionalidades -->
					<c:url var="nuevoURL" value="/asignarFuncionalidad.do">
						<c:param name="d-6456657-p" value="${param['d-6456657-p']}"/>
						<c:param name="d-2760595-p" value="${param['d-2760595-p']}"/>
						<c:param name="filtro" value="${param.filtro}"/>				
						<c:param name="idRol" value="${param.idRol}"/>				
					</c:url>
					<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
						<fmt:message key="comun.enlace.asignar"/>
					</html-el:link>
					<%} %>
		
					<div class="listado">
						<display:table id="listadoFuncionalidades"
									   name="funcionalidades"
									   pagesize="10"
									   requestURI="listadoRoles.do"
									   excludedParams="accion show descripcion tabla nombre idFuncionalidad org.apache.struts.taglib.html.CANCEL"
									   decorator="es.ja.cice.pct.moad.webapp.decorators.FuncionalidadesDecorator">
							<display:column property="nombre"
											titleKey="comun.campo.nombre"
											sortable="false"/>
							<display:column property="descripcion"
											titleKey="comun.campo.descripcion"
											sortable="false"/>
							<% if(modoEdicion){%>
							<display:column property="borrarLink"
		                    				class="col_1"
											title=""
											sortable="false"/>
							<%} %>
						</display:table>
					</div>
			
				</logic:notEqual>
			</logic:notEqual>
		</logic:present>
	</body>
</html>

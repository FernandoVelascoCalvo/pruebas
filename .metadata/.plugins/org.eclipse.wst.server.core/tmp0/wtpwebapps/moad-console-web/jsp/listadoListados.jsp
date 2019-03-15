<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="listados.titulo"/></title>
	</head>
	<body> 
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

		<p class="azul"><fmt:message key="gestion.subtitulo"/></p>
		<p class="info"><fmt:message key="gestion.comentario"/></p>

		<!-- Pestañas -->			
		<c:set var="tabListados" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasGestion.jsp"/>

		<p class="azul"><fmt:message key="listados.subtitulo"/></p>
		<p class="info"><fmt:message key="listados.comentario"/></p>

        <html-el:form action="/listadoListados.do">
        	<input type="hidden" name="show" value="true" />
			
			<!-- Enlace a la creación de un nuevo listado -->
			<% if(modoEdicion){%>
			<c:url var="nuevoURL" value="/crearListado.do">
				<c:param name="d-6543861-p" value="${param['d-6543861-p']}"/>
				<c:param name="d-2588205-p" value="${param['d-2588205-p']}"/>
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

			<div class="listado">		
				<display:table id="listadoListados"
							   name="listados"
							   pagesize="10"
							   requestURI="listadoListados.do"
							   excludedParams="idListado nombre accion org.apache.struts.taglib.html.CANCEL descripcion tabla 
							   				   d-2588205-p show idCampoListado busqueda titulo campo visible"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.ListadosDecorator">
					<display:column property="nombreLink"
									titleKey="comun.campo.nombre"
									sortable="false"/>
					<display:column property="descripcionLink"
									titleKey="comun.campo.descripcion"
									sortable="false" maxLength="50" />
					<display:column property="tablaLink"
									titleKey="listado.campo.tabla"
									sortable="false"/>
					<%if(modoEdicion){%>
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

			<logic:present parameter="idListado">
	    		<logic:notEqual parameter="idListado" value="">
		    		<logic:notEqual parameter="show" value="false">

						<hr/>
						<p class="azul"><fmt:message key="campos.subtitulo"/></p>
						<p class="info"><fmt:message key="campos.comentario"/></p>
			
						<!-- Enlace a la creación de un nuevo campo -->
						
						<%if(modoEdicion){%>
						<c:url var="nuevoURL" value="/crearCampo.do">
							<c:param name="d-6543861-p" value="${param['d-6543861-p']}"/>
							<c:param name="d-2588205-p" value="${param['d-2588205-p']}"/>
							<c:param name="filtro" value="${param.filtro}"/>
							<c:param name="idListado" value="${param.idListado}"/>
						</c:url>
						<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
							<fmt:message key="comun.enlace.nuevo"/>
						</html-el:link>
						<%}%>
						
	
						<div class="listado">
							<display:table id="listadoCampos"
										   name="campos"
										   pagesize="10"
										   requestURI="listadoListados.do"
										   excludedParams="accion show descripcion tabla nombre idCampoListado 
										   				   campo org.apache.struts.taglib.html.CANCEL
										   				   titulo busqueda visible"
										   decorator="es.ja.cice.pct.moad.webapp.decorators.CamposDecorator">
								<display:column property="campo"
												titleKey="campo.campo.campo"
												sortable="false"/>
								<display:column property="descripcion"
												titleKey="comun.campo.descripcion"
												sortable="false" maxLength="60"/>
								<display:column property="titulo"
												titleKey="campo.campo.titulo"
												sortable="false"/>
								<%if(modoEdicion){%>
								<display:column property="editarLink"
			                    				class="col_1"
												title=""
												sortable="false"/>
								<display:column property="borrarLink"
			                    				class="col_1"
												title=""
												sortable="false"/>
								<%} else {%>
								<display:column property="mostrarLink"
                								title=""
				                				class="col_1"
				                				sortable="false"/>
				                <%} %>
							</display:table>
						</div>
					</logic:notEqual>
				</logic:notEqual>
			</logic:present>
        </html-el:form>
	</body>
</html>
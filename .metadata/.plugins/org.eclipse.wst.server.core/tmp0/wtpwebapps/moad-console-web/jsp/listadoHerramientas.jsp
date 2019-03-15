<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="herramientas.titulo"/></title>
	</head>
	<body>
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
	
		<p class="azul"><fmt:message key="gestion.subtitulo"/></p>
		<p class="info"><fmt:message key="gestion.comentario"/></p>
	
		<!-- Pestañas -->			
		<c:set var="tabHerramientas" value="seleccionada" scope="request"/>
		<jsp:include page="/common/subPestanasGestion.jsp"/>
	
		<p class="azul"><fmt:message key="herramientas.subtitulo"/></p>
		<p class="info"><fmt:message key="herramientas.comentario"/></p>

		<!-- Enlace a la creación de una nueva herramienta -->
		<% if(modoEdicion){%>
		<c:url var="nuevoURL" value="/crearHerramienta.do">
			<c:param name="d-601237-p" value="${param['d-601237-p']}"/>
		</c:url>
		<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
			<fmt:message key="comun.enlace.nuevo"/>
		</html-el:link>
		<%} %>
		
		<!-- Listado de herramientas -->
		<div class="listado">		
			<display:table id="listadoHerramientas"
						   name="herramientas"
						   pagesize="10"
						   requestURI="listadoHerramientas.do"
						   excludedParams="nombre accion org.apache.struts.taglib.html.CANCEL descripcion show idHerramienta idTipoHerramienta idParametro"
						   decorator="es.ja.cice.pct.moad.webapp.decorators.HerramientasDecorator">
				<display:column property="nombreLink"
								titleKey="comun.campo.nombre"
								sortable="false"/>
				<display:column property="descripcionLink"
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


		<!-- El listado de parámetros sólo se muestra si se selecciona una herramienta -->
		<logic:present parameter="idHerramienta">
    		<logic:notEqual parameter="idHerramienta" value="">
	    		<logic:notEqual parameter="show" value="false">

					<hr/>
					<p class="azul"><fmt:message key="parametros.subtitulo"/></p>
					<p class="info"><fmt:message key="parametros.comentario"/></p>

					<!-- Enlace a la creación de un nuevo parámetro -->
					<% if(modoEdicion){%>
					<c:url var="nuevoURL" value="/crearParametro.do">
						<c:param name="d-601237-p" value="${param['d-601237-p']}"/>
						<c:param name="d-188270-p" value="${param['d-188270-p']}"/>
						<c:param name="idHerramienta" value="${param.idHerramienta}"/>
					</c:url>
					<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
						<fmt:message key="comun.enlace.nuevo"/>
					</html-el:link>
					<%} %>
	
					<!-- Listado de parámetros de la herramienta seleccionada -->
					<div class="listado">
						<display:table id="listadoParametros"
									   name="parametros"
									   pagesize="10"
									   requestURI="listadoHerramientas.do"
									   excludedParams="nombre accion idParametro org.apache.struts.taglib.html.CANCEL descripcion show"
									   decorator="es.ja.cice.pct.moad.webapp.decorators.ParametrosDecorator">
							<display:column property="nombre"
											titleKey="comun.campo.nombre"
											sortable="false"/>
							<display:column property="descripcionCorta"
											titleKey="parametro.campo.descripcionCorta"
											sortable="false"/>
							<display:column property="descripcion"
											titleKey="comun.campo.descripcion"
											sortable="false" maxLength="75"/>
							<display:column property="tipoCifradoDesc"
											titleKey="parametro.campo.tipoCifrado"
											sortable="false"/>
							<% if(modoEdicion){%>
							<display:column property="editarLink"
		                    				class="col_1"
											title=""
											sortable="false"/>
							<display:column property="borrarLink"
		                    				class="col_1"
											title=""
											sortable="false"/>
						    <% } else{%>
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
	</body>
</html>
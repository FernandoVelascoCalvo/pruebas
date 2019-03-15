<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="plantillaVersionPresenta.titulo"/></title>
	</head>
	<body>
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %> 

		<p class="azul"><fmt:message key="plantillaVersionPresenta.subtitulo"/></p>
		<p class="info"><fmt:message key="plantillaVersionPresenta.comentario"/></p>

		<logic:present name="listaPlantillas">

			<!-- Información del procedimiento -->
			<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>

			<!-- Información de la version presenta -->
			<jsp:include page="/common/infoVersionPresentaCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabPlantillas" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasPresenta.jsp"/>

		
			<div class="listado">		
				<% if(modoEdicion){%>
				<!-- Enlace a la creación de una plantilla -->
				<c:url var="nuevoURL" value="/crearPlantilla.do">
					<c:param name="d-8045158-p" value="${param['d-8045158-p']}"/>						
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>				
				</c:url>
				<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.nueva"/>
				</html-el:link>
				<%} %>

				<!-- Lista de las plantillas asociadas a una version presenta y un procedimiento -->
				<display:table id="listadoVersionPresentaPlantillas"
							   name="listaPlantillas"
							   pagesize="15"
							   requestURI="listadoVersionPresentaPlantillas.do"
							   excludedParams="nombre accion org.apache.struts.taglib.html.CANCEL descripcion"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.PlantillasPresentaDecorator">
					<display:column property="obligatorio"
                   					class="col_1"
									titleKey="plantilla.campo.obligatoria"
									sortable="false"/>
					<display:column property="nombre"
									titleKey="comun.campo.nombre"
									sortable="false" maxLength="50"/>
					<display:column property="descripcion"
									titleKey="comun.campo.descripcion"
									sortable="false" maxLength="50"/>
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
			
		</logic:present>
	</body>
</html>
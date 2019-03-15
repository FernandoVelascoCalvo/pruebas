<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="anexoVersionPresenta.titulo"/></title>
	</head>
	<body>
	
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %> 

		<p class="azul"><fmt:message key="anexoVersionPresenta.subtitulo"/></p>
		<p class="info"><fmt:message key="anexoVersionPresenta.comentario"/></p>

		<logic:present name="listaAnexos">

			<!-- Información del procedimiento -->
			<jsp:include page="/common/infoProcedimientoCabecera.jsp"/>

			<!-- Información de la version presenta -->
			<jsp:include page="/common/infoVersionPresentaCabecera.jsp"/>
			<div class="cabeceraAbajo"></div>

			<!-- Pestañas -->			
			<c:set var="tabAnexos" value="seleccionada" scope="request"/>
			<jsp:include page="/common/subPestanasPresenta.jsp"/>

		
			<div class="listado">	
				
				<% if(modoEdicion){%>
				<!-- Enlace a la creación de un anexo -->
				<c:url var="nuevoURL" value="/crearAnexo.do">
					<c:param name="d-6931142-p" value="${param['d-6931142-p']}"/>						
					<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>				
				</c:url>
				<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
					<fmt:message key="comun.enlace.nuevo"/>
				</html-el:link>
				<%} %>

				<!-- Lista de anexos asociados a una version presenta y un procedimiento -->
				<display:table id="listadoVersionPresentaAnexos"
							   name="listaAnexos"
							   pagesize="15"
							   requestURI="listadoVersionPresentaAnexos.do"
							   excludedParams="nombre accion org.apache.struts.taglib.html.CANCEL descripcion"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.AnexosPresentaDecorator">
					<display:column property="obligatorio"
                   					class="col_1"
									titleKey="anexo.campo.obligatorio"
									sortable="false"/>
					<display:column property="nombre"
									titleKey="comun.campo.nombre"
									sortable="false" maxLength="40"/>
					<display:column property="descripcion"
									titleKey="comun.campo.descripcion"
									sortable="false" maxLength="40"/>
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
			
		</logic:present>
	</body>
</html>
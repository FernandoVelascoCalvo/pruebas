<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarConfiguracion.titulo"/></title>
	</head>
	<body>
	
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

		<p class="azul"><fmt:message key="editarConfiguracion.subtitulo"/></p>
		<p class="info"><fmt:message key="editarConfiguracion.comentario"/></p>

		<c:set var="formAction" value="/crearConfiguracion.do"/>
		<logic:greaterEqual name="editarConfiguracionForm" property="idConfiguracion" value="1">
			<c:set var="formAction" value="/editarConfiguracion.do"/>
		</logic:greaterEqual>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-4460053-p" value="<c:out value="${param['d-4460053-p']}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<html:hidden property="idConfiguracion"/>

	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="30" maxlength="20" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="configuracion.campo.habilitada"/></td>
					<td>
						<logic:greaterEqual name="editarConfiguracionForm" property="idConfiguracion" value="1">
							<html:checkbox property="habilitada" disabled="<%=!modoEdicion %>"/>
						</logic:greaterEqual>
						<logic:lessThan name="editarConfiguracionForm" property="idConfiguracion" value="1">
							<html:checkbox property="habilitada" value="false" disabled="true"/>
						</logic:lessThan>
						<fmt:message key="editarConfiguracion.nota.habilitada"/>
					</td>
				</tr>
			</table>
	
			<div class="confirmar">
				<% if(modoEdicion){%>
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.guardar"/>
				</html:submit>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				</html:cancel>
				<%} else{ %>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.volver"/>
				</html:cancel>
				<%} %>
			</div>
    
		</html-el:form>
	</body>
</html>
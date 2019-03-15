<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarHerramienta.titulo"/></title>
	</head>
	<body>
	
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

		<p class="azul"><fmt:message key="editarHerramienta.subtitulo"/></p>
		<p class="info"><fmt:message key="editarHerramienta.comentario"/></p>

		<c:set var="formAction" value="/crearHerramienta.do"/>
		<logic:greaterEqual name="editarHerramientaForm" property="idHerramienta" value="1">
			<c:set var="formAction" value="/editarHerramienta.do"/>
		</logic:greaterEqual>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="show" value="true" />
			<input type="hidden" name="d-601237-p" value="<c:out value="${param['d-601237-p']}"/>" />
			<html-el:hidden property="idHerramienta"/>

		
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
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
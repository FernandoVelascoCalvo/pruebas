<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarParametro.titulo"/></title>
	</head>
	<body>
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

		<p class="azul"><fmt:message key="editarParametro.subtitulo"/></p>
		<p class="info"><fmt:message key="editarParametro.comentario"/></p>

		<c:set var="formAction" value="/crearParametro.do"/>
		<logic:present name="editarParametroForm">
			<logic:greaterEqual name="editarParametroForm" property="idParametro" value="1">
				<c:set var="formAction" value="/editarParametro.do"/>
			</logic:greaterEqual>
		</logic:present>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="show" value="true" />
			<input type="hidden" name="d-601237-p" value="<c:out value="${param['d-601237-p']}"/>" />
			<input type="hidden" name="d-188270-p" value="<c:out value="${param['d-188270-p']}"/>" />
			<input type="hidden" name="idHerramienta" value="<c:out value="${param.idHerramienta}"/>" />		
			<input type="hidden" name="idParametro" value="<c:out value="${param.idParametro}"/>" />		
			
	
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="30" maxlength="70" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre"/></td>
				</tr>
				<tr>
					<td></td>
					<td><fmt:message key="parametro.nota.nombre"/></td>
				</tr>	
				<tr>
					<td><fmt:message key="parametro.campo.descripcionCorta"/></td>
					<td><html:text property="descripcionCorta" size="30" maxlength="70" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcionCorta"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion"/></td>
				</tr>
				<tr>
					<td><fmt:message key="parametro.campo.tipoCifrado"/></td>
					<td>S&iacute; <html:radio property="tipoCifrado" value="S" disabled="<%=!modoEdicion %>"/> No <html:radio property="tipoCifrado" value="N" disabled="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="tipoCifrado"/></td>
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
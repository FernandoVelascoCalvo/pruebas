<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
<head>
<title><fmt:message key="subMenu.titulo" /></title>
</head>
<body>

	<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
	<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

	<p class="azul">
		<fmt:message key="editarSubMenu.subtitulo" />
	</p>
	<p class="info">
		<fmt:message key="editarSubMenu.comentario" />
	</p>

	<c:set var="formAction" value="/crearSubMenus.do" />
	<logic:present name="editarSubMenusForm">
		<logic:greaterEqual name="editarSubMenusForm" property="idSubMenu" value="1">
			<c:set var="formAction" value="/editarSubMenus.do" />
		</logic:greaterEqual>
	</logic:present>

	<html-el:form action="${formAction}">
		<input type="hidden" name="accion" value="guardarSubMenu" />
		<input type="hidden" name="d-7776532-p" value="<c:out value="${param['d-7776532-p']}"/>" />
		<input type="hidden" name="idSubMenu" value="<c:out value="${param.idSubMenu}"/>" />
		<input type="hidden" name="idMenu" value="<c:out value="${param.idMenu}"/>" />

		<table class="formulario_menusubmenu">
			<thead>
				<tr>
					<td></td>
				</tr>
			</thead>
			<tr>
				<td><fmt:message key="subMenu.campo.nombre" /></td>
				<td><html:text property="nombre" size="50" maxlength="150" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="nombre" /></td>
			</tr>
			<tr>
				<td><fmt:message key="subMenu.campo.descripcion" /></td>
				<td><html:text property="descripcion" size="100" maxlength="999" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="descripcion" /></td>
			</tr>

			<tr>
				<td><fmt:message key="subMenu.campo.url" /></td>
				<td><html:text property="url" size="100" maxlength="999" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="url" /></td>
			</tr>

			<tr>
				<td><fmt:message key="subMenu.campo.enOtraVentana" /></td>
				<td><html:checkbox property="enOtraVentana" disabled="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="enOtraVentana" /></td>
			</tr>

			<tr>
				<td><fmt:message key="subMenu.campo.orden" /></td>
				<td><html:text property="orden" size="3" maxlength="3" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="orden" /></td>
			</tr>
			<tr>
				<td><fmt:message key="subMenu.campo.activado" /></td>
				<td><html:checkbox property="activado" disabled="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="activado" /></td>
			</tr>
		</table>

		<div class="confirmar">
			<% if(modoEdicion){%>
			<html:submit styleClass="boton_submit">
				<fmt:message key="comun.boton.guardar" />
			</html:submit>
			<html:cancel styleClass="boton_submit">
				<fmt:message key="comun.boton.cancelar" />
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
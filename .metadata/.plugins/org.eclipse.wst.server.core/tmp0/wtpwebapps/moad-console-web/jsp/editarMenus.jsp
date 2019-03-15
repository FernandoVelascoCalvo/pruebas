<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
<head>
<title><fmt:message key="menu.titulo" /></title>
</head>
<body>

	<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
	<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

	<p class="azul">
		<fmt:message key="editarMenu.subtitulo" />
	</p>
	<p class="info">
		<fmt:message key="editarMenu.comentario" />
	</p>

	<c:set var="formAction" value="/crearMenus.do" />
	<logic:present name="editarMenusForm">
		<logic:greaterEqual name="editarMenusForm" property="idMenu" value="1">
			<c:set var="formAction" value="/editarMenus.do" />
		</logic:greaterEqual>
	</logic:present>

	<html-el:form action="${formAction}">
		<input type="hidden" name="accion" value="guardar" />
		<input type="hidden" name="d-7776532-p" value="<c:out value="${param['d-7776532-p']}"/>" />
		<input type="hidden" name="idMenu" value="<c:out value="${param.idMenu}"/>" />


		<table class="formulario_menusubmenu">
			<thead>
				<tr>
					<td></td>
				</tr>
			</thead>
			<tr>
				<td><fmt:message key="menu.campo.nombre" /></td>
				<td><html:text property="nombre" size="50" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="nombre" /></td>
			</tr>
			<tr>
				<td><fmt:message key="menu.campo.descripcion" /></td>
				<td><html:text property="descripcion" size="100" maxlength="999" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="descripcion" /></td>
			</tr>

			<tr>
				<td><fmt:message key="menu.campo.url" /></td>
				<td><html:text property="url" size="100" maxlength="999" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="url" /></td>
			</tr>

			<tr>
				<td><fmt:message key="menu.campo.enOtraVentana" /></td>
				<td><html:checkbox property="enOtraVentana" disabled="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="enOtraVentana" /></td>
			</tr>

			<tr>
				<td><fmt:message key="menu.campo.orden" /></td>
				<td><html:text property="orden" size="3" maxlength="3" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
				<td class="msgError"><html:errors property="orden" /></td>
			</tr>
			<tr>
				<td><fmt:message key="menu.campo.activado" /></td>
				<td><html:checkbox property="activado" disabled="<%=!modoEdicion %>" /></td>
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
		<!-- Si entramos en modo editar un menú saldrá la opción de incorporar un submenú, ya que debe primero dar de alta un menú -->
		<logic:notEmpty name="editarMenusForm" property="idMenu">
			<p class="azul">
				<fmt:message key="subMenus.subtitulo" />
			</p>
			<p class="info">
				<fmt:message key="subMenus.comentario" />
			</p>
			<% if(modoEdicion){%>
			<!-- Enlace a la creación de un nuevo submenú -->
			<c:url var="nuevoURL" value="/crearSubMenus.do">
				<c:param name="d-6544692-p" value="${param['d-6544692-p']}" />
				<c:param name="idMenu" value="${param.idMenu}" />
			</c:url>

			<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
				<fmt:message key="comun.enlace.nueva" />
			</html-el:link>
			<%} %>

			<!-- Listado de submenus -->
			<div class="listado">
				<display:table id="listadoSubMenus" name="editarMenusForm.subMenu" pagesize="15" requestURI="listadoSubMenus.do" excludedParams="codigo descripcion entidad tipo accion"
					decorator="es.ja.cice.pct.moad.webapp.decorators.SubMenuBeanDecorator">
					<display:column property="nombreLink" titleKey="menu.campo.nombre" sortable="false" maxLength="14" />
					<display:column property="descripcionLink" titleKey="menu.campo.descripcion" sortable="false" maxLength="42" />
					<display:column property="urlLink" titleKey="menu.campo.url" sortable="false" maxLength="32" />
					<display:column property="ordenLink" titleKey="menu.campo.orden" sortable="false" maxLength="3" />
					<%-- <display:column property="activadoLink"
									titleKey="menu.campo.activado"
									sortable="false" maxLength="5" />	 --%>
					<%if(modoEdicion){%>
					<display:column property="editarLink" title="" class="col_1" sortable="false" />
					<display:column property="borrarLink" title="" class="col_1" sortable="false" />
					<%} else {%>
					<display:column property="mostrarLink" title="" class="col_1" sortable="false"/>
					<%} %>
				</display:table>
			</div>
		</logic:notEmpty>
	</html-el:form>
</body>
</html>
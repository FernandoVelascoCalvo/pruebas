<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarListado.titulo"/></title>    
	</head>
	<body>
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

		<p class="azul"><fmt:message key="editarListado.subtitulo"/></p>
		<p class="info"><fmt:message key="editarListado.comentario"/></p>

		<c:set var="formAction" value="/crearListado.do"/>
		<logic:present name="editarListadoForm">
			<logic:greaterEqual name="editarListadoForm" property="idListado" value="1">
				<c:set var="formAction" value="/editarListado.do"/>
			</logic:greaterEqual>
		</logic:present>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="show" value="false" />
			<input type="hidden" name="d-6543861-p" value="<c:out value="${param['d-6543861-p']}"/>" />
			<input type="hidden" name="d-2588205-p" value="<c:out value="${param['d-2588205-p']}"/>" />
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />
  			<input type="hidden" name="idListado" value="<c:out value="${param.idListado}"/>" />
  			
 			
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="50" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre" /></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="listado.campo.tabla"/></td>
					<td><html:text property="tabla" size="50" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td><html:errors property="tabla" /></td>
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
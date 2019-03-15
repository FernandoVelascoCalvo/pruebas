<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarCampo.titulo"/></title>    
	</head>
	<body>
	
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

		<p class="azul"><fmt:message key="editarCampo.subtitulo"/></p>
		<p class="info"><fmt:message key="editarCampo.comentario"/></p>

		<c:set var="formAction" value="/crearCampo.do"/>
		<logic:present name="editarCampoForm">
			<logic:greaterEqual name="editarCampoForm" property="idCampoListado" value="1">
				<c:set var="formAction" value="/editarCampo.do"/>
			</logic:greaterEqual>
		</logic:present>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="show" value="true" />
			<input type="hidden" name="d-6543861-p" value="<c:out value="${param['d-6543861-p']}"/>" />
			<input type="hidden" name="d-2588205-p" value="<c:out value="${param['d-2588205-p']}"/>" />
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />
  			<input type="hidden" name="idListado" value="<c:out value="${param.idListado}"/>" />
  			<input type="hidden" name="idCampoListado" value="<c:out value="${param.idCampoListado}"/>" />

 			
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td><fmt:message key="campo.campo.campo"/></td>
					<td><html:text property="campo" maxlength="40" size="50" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="campo"/></td>
				</tr>
				<tr>
					<td><fmt:message key="campo.campo.titulo"/></td>
					<td><html:text property="titulo" maxlength="40" size="50"  styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="titulo"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion"/></td>
				</tr>
				<tr>
					<td><fmt:message key="campo.campo.listado"/></td>
					<td><html:checkbox property="visible" value="true" disabled="<%=!modoEdicion %>"/>
						<fmt:message key="editarCampo.nota.visible"/></td>
				</tr>
				<tr>
					<td><fmt:message key="campo.campo.busqueda"/></td>
					<td><html:checkbox property="busqueda" value="true" disabled="<%=!modoEdicion %>"/>
						<fmt:message key="editarCampo.nota.busqueda"/></td>
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
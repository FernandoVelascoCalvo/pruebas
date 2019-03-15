<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarRol.titulo"/></title>    
	</head>
	<body>
	
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

		<p class="azul"><fmt:message key="editarRol.subtitulo"/></p>
		<p class="info"><fmt:message key="editarRol.comentario"/></p>
  
		<c:set var="formAction" value="/crearRol.do"/>
		<logic:present name="editarRolForm">
			<logic:greaterEqual name="editarRolForm" property="idRol" value="1">
				<c:set var="formAction" value="/editarRol.do"/>
			</logic:greaterEqual>
		</logic:present>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="show" value="false" />
			<input type="hidden" name="d-6456657-p" value="<c:out value="${param['d-6456657-p']}"/>" />
			<input type="hidden" name="d-2760595-p" value="<c:out value="${param['d-2760595-p']}"/>" />
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />		
			<input type="hidden" name="idRol" value="<c:out value="${param.idRol}"/>" />		
 			
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="50" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion"/></td>
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

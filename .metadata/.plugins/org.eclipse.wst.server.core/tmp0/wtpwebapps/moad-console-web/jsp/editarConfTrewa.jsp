<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="confTrewa.titulo"/></title>
	</head>
	<body>
	
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

		<p class="azul"><fmt:message key="confTrewa.subtitulo"/></p>
		<p class="info"><fmt:message key="confTrewa.comentario"/></p>

		<c:set var="formAction" value="/crearConfiguracionTrewa.do"/>
        <logic:present name="editarConfiguracionTrewaForm">
			<logic:greaterEqual name="editarConfiguracionTrewaForm" property="idConfTrewa" value="1">
				<c:set var="formAction" value="/editarConfiguracionTrewa.do"/>
			</logic:greaterEqual>
        </logic:present>
        
		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-7776532-p" value="<c:out value="${param['d-7776532-p']}"/>" />
  			<input type="hidden" name="idConfTrewa" value="<c:out value="${param.idConfTrewa}"/>" />

	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td><fmt:message key="confTrewa.campo.nombre"/></td>
					<td><html:text property="nombre" size="80" maxlength="999" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre" /></td>
				</tr>
				<tr>
					<td><fmt:message key="confTrewa.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="999" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="confTrewa.campo.usuario"/></td>
					<td><html:text property="usuario" size="80" maxlength="999" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="usuario" /></td>
				</tr>
				<!-- Si es nuevo -->
				<logic:empty name="editarConfiguracionTrewaForm" property="idConfTrewa">
					<tr>
						<td><fmt:message key="confTrewa.campo.password"/></td>
						<td><html:password property="password" size="80" maxlength="1000" /></td>
						<td class="msgError"><html:errors property="password" /></td>
					</tr>
				</logic:empty>
				<!-- Es edicion -->
				<logic:notEmpty name="editarConfiguracionTrewaForm" property="idConfTrewa">
					<%-- Editando clave --%>
					<logic:notEmpty name="editarConfiguracionTrewaForm" property="permisoCambioPassword">
						 <html:hidden property="permisoCambioPassword"/>
						  <logic:equal name="editarConfiguracionTrewaForm" property="permisoCambioPassword" value="true">
							  <!-- Si la clave en bd es nula -->
							  <logic:equal name="editarConfiguracionTrewaForm" property="mostrarBotones" value="false">
							  	<tr>
									<td><fmt:message key="confTrewa.campo.password"/></td>
									<td><html:password property="password" size="80" maxlength="1000" /></td>
									<td class="msgError"><html:errors property="password" /></td>
								</tr>
							  </logic:equal>
							  <!-- Si tiene clave en BD-->
							  <logic:equal name="editarConfiguracionTrewaForm" property="mostrarBotones" value="true">
								  <tr>
									<td><fmt:message key="confTrewa.campo.password"/></td>
									<td>
										<html:hidden property="password"/>
										<html:submit styleId="cambiarContrasena" onclick="document.forms['editarConfiguracionTrewaForm']['accion'].value = 'cambiarPassword';">
											<fmt:message key="campo.enlace.cambiarContrasena"/>
										</html:submit>
										<html:submit styleId="cambiarContrasena" onclick="document.forms['editarConfiguracionTrewaForm']['accion'].value = 'limpiarPassword';">
											<fmt:message key="campo.enlace.limpiarContrasena"/>
										</html:submit>
									</td>
									<td>&nbsp;</td>
								</tr>
							</logic:equal>
						  </logic:equal>
						  <logic:equal name="editarConfiguracionTrewaForm" property="permisoCambioPassword" value="false">
						  	<tr>
								<td><fmt:message key="confTrewa.campo.password"/></td>
								<td><html:password property="password" size="40" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="true" /></td>
								<td class="msgError"><html:errors property="password" /></td>
							</tr>
						</logic:equal>
					</logic:notEmpty>
				</logic:notEmpty>
				<tr>
					<td><fmt:message key="confTrewa.campo.conexion"/></td>
					<td><html:text property="conexion" size="80" maxlength="999" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="conexion" /></td>
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
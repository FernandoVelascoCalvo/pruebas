<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarAnexo.titulo"/></title>
	</head>
	<body>

		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		
		<p class="azul"><fmt:message key="editarAnexo.subtitulo"/></p>
		<p class="info"><fmt:message key="editarAnexo.comentario"/></p>

		<c:set var="formAction" value="/crearAnexo.do"/>
		<logic:present name="editarAnexoForm">
			<logic:greaterEqual name="editarAnexoForm" property="idAnexo" value="1">
				<c:set var="formAction" value="/editarAnexo.do"/>
			</logic:greaterEqual>
		</logic:present>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
  			<input type="hidden" name="d-6931142-p" value="<c:out value="${param['d-6931142-p']}"/>" />
  			<input type="hidden" name="idAnexo" value="<c:out value="${param.idAnexo}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idVersionPresenta" value="<c:out value="${param.idVersionPresenta}"/>" />

			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td class="nombreCampo"><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="40" maxlength="100" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre" /></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="60" maxlength="200" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="anexo.campo.orden"/></td>
					<td><html:text property="orden" size="5" maxlength="5" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td><html:errors property="orden" /></td>
				</tr>
				<tr>
					<td><fmt:message key="anexo.campo.tamMaximo"/></td>
					<td><html:text property="tamMaximo" size="5" maxlength="8" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td><html:errors property="tamMaximo" /></td>
				</tr>
				<tr>
					<td><fmt:message key="anexo.campo.nombreFase"/></td>
					<td><html:text property="nombreFase" size="40" maxlength="50"  styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombreFase" /></td>
				</tr>
				<tr>
					<td><fmt:message key="anexo.campo.obligatorio"/></td>
					<td>
						<html:checkbox property="obligatorio" value="true" disabled="<%=!modoEdicion %>"/>
						 <fmt:message key="editarAnexo.nota.obligatorio"/>
					</td>
				</tr>
				<tr>
					<td><fmt:message key="anexo.campo.compulsable"/></td>
					<td>
						<html:checkbox property="compulsable" value="true" disabled="<%=!modoEdicion %>"/>
						 <fmt:message key="editarAnexo.nota.compulsable"/>
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
<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarOrden.titulo"/></title>
	</head>
	<body>
	
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		

		<p class="azul"><fmt:message key="editarOrden.subtitulo"/></p>
		<p class="info"><fmt:message key="editarOrden.comentario"/></p>

		<c:set var="formAction" value="/crearOrden.do"/>
        <logic:present name="editarOrdenForm">
			<logic:greaterEqual name="editarOrdenForm" property="idOrden" value="1">
				<c:set var="formAction" value="/editarOrden.do"/>
			</logic:greaterEqual>
        </logic:present>
        
		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-7776532-p" value="<c:out value="${param['d-7776532-p']}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idOrden" value="<c:out value="${param.idOrden}"/>" />

	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td class="nombreCampo"><fmt:message key="orden.campo.titulo"/></td>
					<td><html:text property="titulo" size="40" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="titulo"/></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="orden.campo.fecha"/></td>
					<td><html:text property="fecha" size="10" maxlength="10" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="fecha" /></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="orden.campo.tipoTrewa"/></td>
					<td>
                       <html:select property="cdTipoExpTrewa" disabled="<%=!modoEdicion %>">
                          <html:option value=""><fmt:message key="editarOrden.campo.textotrewa"/></html:option>
                          <logic:present name="tiposexp">
                              <html:optionsCollection name="tiposexp"
                                                      label="descripcionExtendida" 
                                                      value="cdTipoExpediente"/>
                          </logic:present>
                      </html:select>

				    </td>
					<td class="msgError"><html:errors property="cdTipoExpTrewa" /></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="orden.campo.convocante"/></td>
					<td><html:text property="convocante" size="40" maxlength="250" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="convocante" /></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="orden.campo.beneficiario"/></td>
					<td><html:text property="beneficiario" size="40" maxlength="250" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="beneficiario" /></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="orden.campo.referenciaBoja"/></td>
					<td><html:text property="referenciaBoja" size="40" maxlength="250" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="referenciaBoja" /></td>
				</tr>
				<tr>
					<td><fmt:message key="orden.campo.visible"/></td>
					<td>
						<html:checkbox property="visible" value="true" disabled="<%=!modoEdicion %>"/>
						 <fmt:message key="orden.nota.visible"/>
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
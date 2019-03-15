<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarDocumento.titulo"/></title>    
	</head>
	<body>
	
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>	

		<p class="azul"><fmt:message key="editarDocumento.subtitulo"/></p>
		<p class="info"><fmt:message key="editarDocumento.comentario"/></p>

		<c:set var="formAction" value="/crearDocumento.do"/>
		<logic:present name="editarDocumentoForm">
			<logic:greaterEqual name="editarDocumentoForm" property="idDocumento" value="1">
				<c:set var="formAction" value="/editarDocumento.do"/>
			</logic:greaterEqual>
		</logic:present>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
  			<input type="hidden" name="d-3550647-p" value="<c:out value="${param['d-3550647-p']}"/>" />
  			<input type="hidden" name="idDocumento" value="<c:out value="${param.idDocumento}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="40" maxlength="70"  styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre" /></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="documento.campo.estadoObligatorio"/></td>
					<td>
                       <html:select property="cdEstadoObligatorio" styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>">
                          <logic:present name="tipoEstado">
                              <html:optionsCollection name="tipoEstado"
                                                      label="nombre" 
                                                      value="cdEstadoObligatorio"/>
                          </logic:present>
                      </html:select>

				    </td>
					<td class="msgError"><html:errors property="cdEstadoObligatorio" /></td>
				</tr>
				
				<tr>
					<td><fmt:message key="documento.campo.orden"/></td>
					<td><html:text property="orden" size="5" maxlength="5" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td><html:errors property="orden" /></td>
				</tr>
				<tr>
					<td><fmt:message key="documento.campo.compulsable"/></td>
					<td>
						<html:checkbox property="compulsable" value="true" disabled="<%=!modoEdicion %>"/>
						 <fmt:message key="editarDocumento.nota.compulsable"/>
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
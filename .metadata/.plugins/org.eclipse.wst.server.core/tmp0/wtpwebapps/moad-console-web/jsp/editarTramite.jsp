<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarTramites.titulo"/></title>
	</head>
	<body>
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
	

		<p class="azul"><fmt:message key="editarTramites.subtitulo"/></p>
		<p class="info"><fmt:message key="editarTramites.comentario"/></p>

		<c:set var="formAction" value="/crearTramite.do"/>
        <logic:present name="editarTramiteForm">
			<logic:greaterEqual name="editarTramiteForm" property="idTramite" value="1">
				<c:set var="formAction" value="/editarTramite.do"/>
			</logic:greaterEqual>
        </logic:present>
        
		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-7776532-p" value="<c:out value="${param['d-7776532-p']}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idTramite" value="<c:out value="${param.idTramite}"/>" />

	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td><fmt:message key="tramite.campo.codigo"/></td>
					<td><html:text property="codigo" size="20" maxlength="20" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="codigo"/></td>
				</tr>
				<tr>
					<td><fmt:message key="tramite.campo.nombre"/></td>
					<td><html:text property="nombre" size="40" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre" /></td>
				</tr>
		
				<tr>
					<td><fmt:message key="tramite.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="100" maxlength="999"  styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
                <tr>
                    <td><fmt:message key="tramite.campo.url"/></td>
                    <td><html:text property="urlTramite" size="100" maxlength="256" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
                    <td class="msgError"><html:errors property="urlTramite" /></td>
                </tr>
                <tr>
                    <td><fmt:message key="tramite.campo.visible"/></td>
                    <td><html:checkbox property="visible" value="true" disabled="<%=!modoEdicion %>"/></td>
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
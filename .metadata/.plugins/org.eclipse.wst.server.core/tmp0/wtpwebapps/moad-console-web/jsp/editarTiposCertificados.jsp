<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="tipoCertificados.titulo"/></title>
	</head>
	<body>
		
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>

		<p class="azul"><fmt:message key="editarTramites.subtitulo"/></p>
		<p class="info"><fmt:message key="editarTramites.comentario"/></p>

		<c:set var="formAction" value="/crearTiposCertificados.do"/>
        <logic:present name="editarTiposCertificadosForm">
			<logic:greaterEqual name="editarTiposCertificadosForm" property="idTipoCertificado" value="1">
				<c:set var="formAction" value="/editarTiposCertificados.do"/>
			</logic:greaterEqual>
        </logic:present>
        
		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-7776532-p" value="<c:out value="${param['d-7776532-p']}"/>" />
  			<input type="hidden" name="idTipoCertificado" value="<c:out value="${param.idTipoCertificado}"/>" />

	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td><fmt:message key="tipoCertificado.campo.entidad"/></td>
					<td><html:text property="entidad" size="70" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="codigo"/></td>
				</tr>
				<tr>
					<td><fmt:message key="tipoCertificado.campo.tipo"/></td>
					<td><html:text property="tipo" size="70" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre" /></td>
				</tr>
		
				<tr>
					<td>descripcion</td>
					<td><html:text property="descripcion" size="80" maxlength="999" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion"/></td>
				</tr>
				
				<tr>
					<td>Codigo afirma</td>
					<td><html:text property="idCodigoFirma" size="3" maxlength="3" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="idCodigoFirma" /></td>
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
<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarVersionPresenta.titulo"/></title>
	</head>
	<body>
	
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>

		<p class="azul"><fmt:message key="editarVersionPresenta.subtitulo"/></p>
		<p class="info"><fmt:message key="editarVersionPresenta.comentario"/></p>

		<c:set var="formAction" value="/crearVersionPresenta.do"/>
		<logic:present name="editarVersionPresentaForm">
			<logic:greaterEqual name="editarVersionPresentaForm" property="idVersionPresenta" value="1">
				<c:set var="formAction" value="/editarVersionPresenta.do"/>
			</logic:greaterEqual>
		</logic:present>

		<html-el:form action="${formAction}" enctype="multipart/form-data">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-5725043-p" value="<c:out value="${param['d-5725043-p']}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<html:hidden property="idVersionPresenta"/>
  			<html:hidden property="nombreFichero"/>

			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td class="nombreCampo"><fmt:message key="comun.campo.codigo"/></td>
					<td><html:text property="codigo" size="30" maxlength="20" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="codigo"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="60" maxlength="100" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<logic:empty name="editarVersionPresentaForm">
					<tr>
						<td><fmt:message key="versionPresenta.campo.fichero"/></td>
						<td><html:file property="fichero" size="50%" styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
						<td class="msgError"><html:errors property="fichero"/></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="editarVersionPresentaForm">

					<!-- Enlace para descargar el fichero -->
					<c:url var="download" value="/descargarVersionPresenta.do">
						<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>
					</c:url>
					<% if(modoEdicion){%>
					<!-- Enlace para borrar el fichero -->
					<c:url var="borrarFichero" value="/editarVersionPresenta.do">
						<c:param name="accion" value="borrarFichero"/>
						<c:param name="d-5725043-p" value="${param['d-5725043-p']}"/>
						<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>
						<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					</c:url>
					<%} %>

					<logic:empty name="editarVersionPresentaForm" property="nombreFichero">
						<tr>
							<td><fmt:message key="versionPresenta.campo.fichero"/></td>
							<td><html:file property="fichero" size="50%" styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
							<td class="msgError"><html:errors property="fichero"/></td>
						</tr>
					</logic:empty>
					<logic:notEmpty name="editarVersionPresentaForm" property="nombreFichero">
						<tr>
							<td><fmt:message key="versionPresenta.campo.fichero"/></td>
							<td>
								<html-el:link href="${download}" styleClass="bajar">
									<bean:write name="editarVersionPresentaForm" property="nombreFichero"/>
								</html-el:link>
								<% if(modoEdicion){%>
								<html-el:link href="${borrarFichero}">
									<html:img src="images/borrar.gif" alt="Borrar fichero de versión presenta"/>
								</html-el:link>
								<%} %>
							</td>
							<td class="msgError"><html:errors property="nombreFichero"/></td>
						</tr>
					</logic:notEmpty>
				</logic:notEmpty>

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
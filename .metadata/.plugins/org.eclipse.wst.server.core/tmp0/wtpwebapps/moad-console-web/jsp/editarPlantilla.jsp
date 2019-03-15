<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarPlantilla.titulo"/></title>
	</head>
	<body>
	
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>

		<p class="azul"><fmt:message key="editarPlantilla.subtitulo"/></p>
		<p class="info"><fmt:message key="editarPlantilla.comentario"/></p>

		<c:set var="formAction" value="/crearPlantilla.do"/>
		<logic:present name="editarPlantillaForm">
			<logic:greaterEqual name="editarPlantillaForm" property="idPlantilla" value="1">
				<c:set var="formAction" value="/editarPlantilla.do"/>
			</logic:greaterEqual>
		</logic:present>

		<html-el:form action="${formAction}" enctype="multipart/form-data">
			<input type="hidden" name="accion" value="guardar" />
  			<input type="hidden" name="d-8045158-p" value="<c:out value="${param['d-8045158-p']}"/>" />
  			<input type="hidden" name="idPlantilla" value="<c:out value="${param.idPlantilla}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idVersionPresenta" value="<c:out value="${param.idVersionPresenta}"/>" />
  			<html:hidden property="nombreFichero"/>
			<html:hidden property="nombreFicheroImp"/>
			<html:hidden property="nombreFicheroAnon"/>

			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td class="nombreCampo"><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="40" maxlength="100" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre" /></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="70" maxlength="200" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="plantilla.campo.orden"/></td>
					<td><html:text property="orden" size="5" maxlength="5" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="orden" /></td>
				</tr>
				<tr>
					<td><fmt:message key="plantilla.campo.obligatoria"/></td>
					<td>
						<html:checkbox property="obligatorio" value="true" disabled="<%=!modoEdicion %>"/>
						<fmt:message key="editarPlantilla.nota.obligatoria"/>
					</td>
				</tr>
				<tr>
					<td><fmt:message key="plantilla.campo.nombreFase"/></td>
					<td><html:text property="nombreFase" size="40" maxlength="50" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombreFase" /></td>
				</tr>

				<logic:empty name="editarPlantillaForm">
					<tr>
						<td><fmt:message key="plantilla.campo.plantilla"/></td>
						<td><html:file property="plantilla" size="50%" styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
						<td class="msgError"><html:errors property="plantilla"/></td>
					</tr>
					<tr>
						<td><fmt:message key="plantilla.campo.plantillaImp"/></td>
						<td><html:file property="plantillaImp" size="50%" styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
						<td class="msgError"><html:errors property="plantillaImp"/></td>
					</tr>
					<tr>
						<td><fmt:message key="plantilla.campo.plantillaAnon"/></td>
						<td><html:file property="plantillaAnon" size="50%" styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
						<td class="msgError"><html:errors property="plantillaAnon"/></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="editarPlantillaForm">

					<!-- Enlace para descargar el fichero -->
					<c:url var="downloadAdjunto" value="/descargarPlantilla.do">
						<c:param name="idPlantilla" value="${param.idPlantilla}"/>
						<c:param name="descargar" value="adjunto"/>
					</c:url>

					<!-- Enlace para descargar el fichero adjunto anónimo -->
					<c:url var="downloadAnon" value="/descargarPlantilla.do">
						<c:param name="idPlantilla" value="${param.idPlantilla}"/>
						<c:param name="descargar" value="adjuntoAnonimo"/>
					</c:url>

					<!-- Enlace para descargar el fichero adjunto imprimible -->
					<c:url var="downloadImpl" value="/descargarPlantilla.do">
						<c:param name="idPlantilla" value="${param.idPlantilla}"/>
						<c:param name="descargar" value="adjuntoImprimible"/>
					</c:url>
					
					<% if(modoEdicion){%>
					<!-- Enlace para borrar el fichero adjunto-->
					<c:url var="borrarAdjunto" value="/editarPlantilla.do">
						<c:param name="accion" value="borrarAdjunto"/>
						<c:param name="d-8045158-p" value="${param['d-8045158-p']}"/>
						<c:param name="idPlantilla" value="${param.idPlantilla}"/>
						<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>
						<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					</c:url>

					<!-- Enlace para borrar el fichero para imprimir-->
					<c:url var="borrarImp" value="/editarPlantilla.do">
						<c:param name="accion" value="borrarImp"/>
						<c:param name="d-8045158-p" value="${param['d-8045158-p']}"/>
						<c:param name="idPlantilla" value="${param.idPlantilla}"/>
						<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>
						<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					</c:url>

					<!-- Enlace para borrar el fichero para imprimir-->
					<c:url var="borrarAnon" value="/editarPlantilla.do">
						<c:param name="accion" value="borrarAnon"/>
						<c:param name="d-8045158-p" value="${param['d-8045158-p']}"/>
						<c:param name="idPlantilla" value="${param.idPlantilla}"/>
						<c:param name="idVersionPresenta" value="${param.idVersionPresenta}"/>
						<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
					</c:url>
					<%} %>

					<logic:empty name="editarPlantillaForm" property="nombreFichero">
						<tr>
							<td><fmt:message key="plantilla.campo.plantilla"/></td>
							<td><html:file property="plantilla" size="50%" styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
							<td class="msgError"><html:errors property="plantilla"/></td>
						</tr>
					</logic:empty>
					<logic:notEmpty name="editarPlantillaForm" property="nombreFichero">
						<tr>
							<td><fmt:message key="plantilla.campo.plantilla"/></td>
							<td>
								<html-el:link href="${downloadAdjunto}">
									<bean:write name="editarPlantillaForm" property="nombreFichero"/>
								</html-el:link>
								<% if(modoEdicion){%>
								<html-el:link href="${borrarAdjunto}">
									<html:img src="images/borrar.gif" alt="Borrar plantilla"/>
								</html-el:link>
								<%} %>
							</td>
							<td class="msgError"><html:errors property="nombreFichero"/></td>
						</tr>
					</logic:notEmpty>

					<logic:empty name="editarPlantillaForm" property="nombreFicheroImp">
						<tr>
							<td><fmt:message key="plantilla.campo.plantillaImp"/></td>
							<td><html:file property="plantillaImp" size="50%" styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
							<td class="msgError"><html:errors property="plantillaImp"/></td>
						</tr>
					</logic:empty>
					<logic:notEmpty name="editarPlantillaForm" property="nombreFicheroImp">
						<tr>
							<td><fmt:message key="plantilla.campo.plantillaImp"/></td>
							<td>
								<html-el:link href="${downloadImpl}">
									<bean:write name="editarPlantillaForm" property="nombreFicheroImp"/>
								</html-el:link>
								<% if(modoEdicion){%>
								<html-el:link href="${borrarImp}">
									<html:img src="images/borrar.gif" alt="Borrar plantilla para imprimir"/>
								</html-el:link>
								<%} %>
							</td>
							<td class="msgError"><html:errors property="nombreFicheroImp"/></td>
						</tr>
					</logic:notEmpty>
					<logic:empty name="editarPlantillaForm" property="nombreFicheroAnon">
						<tr>
							<td><fmt:message key="plantilla.campo.plantillaAnon"/></td>
							<td><html:file property="plantillaAnon" size="50%" styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
							<td class="msgError"><html:errors property="plantillaAnon"/></td>
						</tr>
					</logic:empty>
					<logic:notEmpty name="editarPlantillaForm" property="nombreFicheroAnon">
						<tr>
							<td><fmt:message key="plantilla.campo.plantillaAnon"/></td>
							<td>
								<html-el:link href="${downloadAnon}">
									<bean:write name="editarPlantillaForm" property="nombreFicheroAnon"/>
								</html-el:link>
								<% if(modoEdicion){%>
								<html-el:link href="${borrarAnon}">
									<html:img src="images/borrar.gif" alt="Borrar plantilla anónima"/>
								</html-el:link>
								<%} %>
							</td>
							<td class="msgError"><html:errors property="nombreFicheroAnon"/></td>
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
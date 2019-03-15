<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>


<html>
	<head>
		<title><fmt:message key="editarConvocatoria.titulo"/></title>
	</head>
	<body>
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		
		<p class="azul"><fmt:message key="editarConvocatoria.subtitulo"/></p>
		<p class="info"><fmt:message key="editarConvocatoria.comentario"/></p>

		<c:set var="formAction" value="/crearConvocatoria.do"/>
		<logic:notEmpty name="editarConvocatoriaForm" property="idConvocatoria">
			<c:set var="formAction" value="/editarConvocatoria.do"/>
		</logic:notEmpty>

		<html-el:form action="${formAction}" enctype="multipart/form-data">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-828469-p" value="<c:out value="${param['d-828469-p']}"/>" />
			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idOrden" value="<c:out value="${param.idOrden}"/>" />
  			<logic:notEmpty name="editarConvocatoriaForm" property="idConvocatoria">
  				<html:hidden property="idConvocatoria"/>
  			</logic:notEmpty>	
	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td class="nombreCampo"><fmt:message key="convocatoria.campo.fechaComienzo"/></td>
					<td><html:text property="fechaComienzo" size="10" maxlength="10" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="fechaComienzo"/></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="convocatoria.campo.fechaFin"/></td>
					<td><html:text property="fechaFin" size="10" maxlength="10" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="fechaFin"/></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="convocatoria.campo.cdProcTrewa"/></td>
					<td>
						<html:select property="cdProcTrewa" disabled="<%=!modoEdicion %>">
                          <logic:present name="trewaVersion">
                              <html:optionsCollection name="trewaVersion"
                                                      label="descripcionExtendida" 
                                                      value="cdProcedimiento"/>
                          </logic:present>
                    	</html:select>					
					</td>
					<td class="msgError"><html:errors property="cdProcTrewa"/></td>
				</tr>
				<%-- El campo tipo de expediente trewa va a ser oculto porque ya lo tenemos en la orden asociada --%>
				<html:hidden name="editarConvocatoriaForm" property="cdTipoExpTrewa"/>
				<tr>
					<td class="nombreCampo"><fmt:message key="convocatoria.campo.titulo"/></td>
					<td><html:text property="titulo" size="80" maxlength="70" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="titulo"/></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="fechaPresConv.campo.fechaComienzo"/></td>
					<td><html:text property="fechaInicioPresentacion" size="16" maxlength="16" title="DD/MM/AAAA hh:mm" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/> (dd/mm/aaaa hh:mm)</td>
					<td class="msgError"><html:errors property="fechaInicioPresentacion"/></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="fechaPresConv.campo.fechaFin"/></td>
					<td><html:text property="fechaFinPresentacion" size="16" maxlength="16" title="DD/MM/AAAA hh:mm" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/> (dd/mm/aaaa hh:mm)</td>
					<td class="msgError"><html:errors property="fechaFinPresentacion"/></td>
				</tr>
				<logic:empty name="editarConvocatoriaForm" property="nombreFichero">
					<tr>
						<td><fmt:message key="convocatoria.campo.fichero"/></td>
						<td><html:file property="fichero" size="75%"  styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
						<td class="msgError"><html:errors property="fichero"/></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="editarConvocatoriaForm" property="nombreFichero">
					
					<!-- Enlace para descargar el fichero -->
					<c:url var="download" value="/descargarAdjuntoConvocatoria.do">
						<c:param name="idConvocatoria" value="${param.idConvocatoria}"/>				
					</c:url>
					
					<!-- Enlace para borrar el fichero -->
					<% if(modoEdicion){%>
					<c:url var="borrar" value="/editarConvocatoria.do">
						<c:param name="accion" value="borrar"/>
						<c:param name="d-828469-p" value="${param['d-828469-p']}"/>						
						<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
						<c:param name="idOrden" value="${param.idOrden}"/>
						<c:param name="idConvocatoria" value="${param.idConvocatoria}"/>
					</c:url>
					<%} %>
					
					<tr>
						<td><fmt:message key="convocatoria.campo.fichero"/></td>
						<td>
							<html:hidden property="nombreFichero"/>
							<html-el:link href="${download}" styleClass="bajar">
								<bean:write name="editarConvocatoriaForm" property="nombreFichero"/>
							</html-el:link>
							<% if(modoEdicion){%>
							<html-el:link href="${borrar}">
								<html:img src="images/borrar.gif" alt="Borrar adjunto"/>
							</html-el:link>
							<%} %>
						</td>
						<td class="msgError"><html:errors property="nombreFichero"/></td>
					</tr>
				</logic:notEmpty>				
				
				<tr>
					<td><fmt:message key="convocatoria.campo.visible"/></td>
					<td>
						<html:checkbox property="visible" value="true" disabled="<%=!modoEdicion %>"/>
						 <fmt:message key="convocatoria.nota.visible"/>
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
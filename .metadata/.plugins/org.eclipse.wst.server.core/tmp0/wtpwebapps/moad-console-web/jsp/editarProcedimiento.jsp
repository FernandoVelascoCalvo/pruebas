<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>


<html>
	<head>
		<title><fmt:message key="editarProcedimiento.titulo"/></title>
	</head>
	<body>

		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>

		<p class="azul"><fmt:message key="editarProcedimiento.subtitulo"/></p>
		<p class="info"><fmt:message key="editarProcedimiento.comentario"/></p>

        <c:set var="formAction" value="/crearProcedimiento.do"/>
        <logic:present name="editarProcedimientoForm">
            <logic:greaterEqual name="editarProcedimientoForm" property="idProcedimiento" value="1">
                <c:set var="formAction" value="/editarProcedimiento.do"/>
            </logic:greaterEqual>
        </logic:present>

		<html-el:form action="${formAction}" enctype="multipart/form-data">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-6903951-p" value="<c:out value="${param['d-6903951-p']}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />

			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td class="nombreCampo"><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="50" maxlength="40"  styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre"/></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000"  styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="editarProcedimiento.campo.ayudaAcceso"/></td>
					<td><html:textarea property="ayudaAcceso" cols="80" rows="3" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="ayudaAcceso" /></td>
				</tr>
				<tr>
					<td><fmt:message key="editarProcedimiento.campo.mensajeBienvenida"/></td>
					<td><html:textarea property="mensajeBienvenida" cols="80" rows="3" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="mensajeBienvenida" /></td>
				</tr>
				<tr>
                    <td class="nombreCampo"><fmt:message key="editarProcedimiento.campo.sistemastrewa"/></td>
                    <td>
                        <!-- Al crear el procedimiento, no se consulta trew@ para obtener la lista  -->
                        <!-- de sistemas a seleccionar, ya que no hay configuración asociada.       -->
                        <logic:present name="editarProcedimientoForm">
                            <logic:lessThan name="editarProcedimientoForm" property="idProcedimiento" value="1">
                                <html:select property="cdSistemaTrewa" disabled="true">
                                    <html:option value=""><fmt:message key="editarProcedimiento.campo.trewapendiente"/></html:option>
                                </html:select>
                            </logic:lessThan>
                        </logic:present>
                        <!-- Al editar el procedimiento se consulta si hay sistemas asociados y se muestra -->
                        <!-- un error en caso contrario                                                    -->
						<logic:present name="editarProcedimientoForm">
						    <logic:greaterEqual name="editarProcedimientoForm" property="idProcedimiento" value="1">
		                        <html:select property="cdSistemaTrewa" disabled="<%=!modoEdicion %>">
		                            <html:option value=""><fmt:message key="editarProcedimiento.campo.selecciontrewa"/></html:option>
		                            <logic:present name="sistemas">
	                                    <html:optionsCollection name="sistemas"
	                                                            label="descripcionExtendida"
	                                                            value="cdSistema"/>
                                    </logic:present>
		                        </html:select>
                            </logic:greaterEqual>
						</logic:present>
						<!-- Si el procedimiento no es administrable, y el rol de usuario no lo permite,   -->
						<!-- no se puede modificar el valor del sistema trew@ asociado inicialmente        -->
						<!-- //TODO: -->
                        </td>
                    <td class="msgError">
                    </td>
                </tr>

				<tr>
					<td class="nombreCampo"><fmt:message key="editarProcedimiento.campo.aplicaciones"/></td>
					<td>
                       <html:select property="idAplicacion" disabled="<%=!modoEdicion %>">
                          <logic:present name="listaAplicaciones">
                              <html:option value="-1"><fmt:message key="editarProcedimiento.campo.seleccionAplicacion"/></html:option>
		                      <html:optionsCollection name="listaAplicaciones"
                                                      label="descripcionExtendida"
                                                      value="id"/>
                          </logic:present>
                      </html:select>

				    </td>
					<td class="msgError"><html:errors property="cdEstadoObligatorio" /></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="editarProcedimiento.campo.tiposProcedimiento"/></td>
					<td>
                       <html:select property="idTipoProcedimiento" disabled="<%=!modoEdicion %>">
                          <logic:present name="tiposProcedimiento">
                              <html:option value=""><fmt:message key="editarProcedimiento.campo.seleccionTipoProcedimiento"/></html:option>
		                      <html:optionsCollection name="tiposProcedimiento"
                                                      label="descripcion"
                                                      value="id"/>
                          </logic:present>
                      </html:select>

				    </td>
					<td class="msgError"><html:errors property="idTipoProcedimiento" /></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="editarProcedimiento.campo.url"/></td>
					<td><html:text property="url" size="80" maxlength="250" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="url" /></td>
				</tr>
				<tr>
					<td><fmt:message key="procedimiento.campo.visible"/></td>
					<td>
						<html:checkbox property="visible" value="true" disabled="<%=!modoEdicion %>"/>
						 <fmt:message key="editarProcedimiento.nota.visible"/>
					</td>
				</tr>
				<tr>
					<td><fmt:message key="procedimiento.campo.presentable"/></td>
					<td>
						<html:checkbox property="presentable" value="true" disabled="<%=!modoEdicion %>"/>
						 <fmt:message key="editarProcedimiento.nota.presentable"/>
					</td>
				</tr>
				<logic:empty name="editarProcedimientoForm" property="nombreFichero">
					<tr>
						<td><fmt:message key="procedimiento.campo.fichero"/></td>
						<td><html:file property="fichero" size="75%"  styleClass="<%=estiloSoloLectura %>" disabled="<%=!modoEdicion %>"/></td>
						<td class="msgError"><html:errors property="fichero"/></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="editarProcedimientoForm" property="nombreFichero">
						<logic:equal name="editarProcedimientoForm" property="descargarFichero" value="true">
							<!-- Enlace para descargar el fichero -->
							<c:url var="download" value="/descargarAdjuntoProcedimiento.do">
								<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>
							</c:url>	
							<tr>
								<td><fmt:message key="procedimiento.campo.fichero"/></td>
								<td>
									<html:hidden property="nombreFichero"/>
									<html-el:link href="${download}" styleClass="bajar">
										<bean:write name="editarProcedimientoForm" property="nombreFichero"/>
									</html-el:link>
									<% if(modoEdicion){%>
										<html:submit alt="Borrar adjunto"  styleClass="btn_borrarArchivoAdjunto"  
											onclick="document.forms['editarProcedimientoForm']['accion'].value = 'borrar';" >
											&nbsp;
										</html:submit>
									<%} %>
									
								</td>
								<td class="msgError"><html:errors property="nombreFichero"/></td>
							</tr>
						</logic:equal>
						<logic:equal name="editarProcedimientoForm" property="descargarFichero" value="false">
							<!-- Enlace para borrar el fichero de sesion-->
							<!-- Si es creando o modificando un procedimiento -->
								<tr>
									<td><fmt:message key="procedimiento.campo.fichero"/></td>
									<td>
										<html:hidden property="nombreFichero"/>
										<bean:write name="editarProcedimientoForm" property="nombreFichero"/>
										<% if(modoEdicion){%>
											<html:submit alt="Borrar adjunto" styleClass="btn_borrarArchivoAdjunto" 
												onclick="document.forms['editarProcedimientoForm']['accion'].value = 'borrar';" >
												&nbsp;
											</html:submit>
										<%} %>
									</td>
									<td class="msgError"><html:errors property="nombreFichero"/></td>
								</tr>
						</logic:equal>
					</logic:notEmpty>
				<!-- Si es nuevo -->
				<logic:empty name="editarProcedimientoForm" property="idProcedimiento">
					<tr>
						<td class="nombreCampo"><fmt:message key="editarProcedimiento.campo.claveCifrado"/></td>
						<td><html:password property="claveCifrado" size="40" maxlength="32" /></td>
						<!-- <td><input type="password" name="claveCifrado" size="40" maxlength="32" autocomplete="off"></td> -->
						<td class="msgError"><html:errors property="claveCifrado"/></td>
					</tr>
				</logic:empty>
				<!-- Es edicion -->
				<logic:notEmpty name="editarProcedimientoForm" property="idProcedimiento">
					<%-- Editando clave --%>
					<logic:notEmpty name="editarProcedimientoForm" property="permisoCambioClave">
						 <html:hidden property="permisoCambioClave"/>
						  <logic:equal name="editarProcedimientoForm" property="permisoCambioClave" value="true">
							  <!-- Si la clave es nula -->
							  <logic:empty name="editarProcedimientoForm" property="claveCifrado">
							  	<tr>
									<td class="nombreCampo"><fmt:message key="editarProcedimiento.campo.claveCifrado"/></td>
									<td><html:password property="claveCifrado" size="40" maxlength="32" /></td>
									<td class="msgError"><html:errors property="claveCifrado"/></td>
								</tr>
							  </logic:empty>
							  <!-- Si tiene clave -->
							  <logic:notEmpty name="editarProcedimientoForm" property="claveCifrado">
								<tr>
									<td class="nombreCampo"><fmt:message key="editarProcedimiento.campo.claveCifrado"/></td>
									<td>
										<html:hidden property="claveCifrado"/>
										<html:submit styleId="cambiarContrasena" onclick="document.forms['editarProcedimientoForm']['accion'].value = 'cambiarClave';">
											<fmt:message key="campo.enlace.cambiarContrasena"/>
										</html:submit>
										<html:submit styleId="cambiarContrasena" onclick="document.forms['editarProcedimientoForm']['accion'].value = 'resetearClave';">
											<fmt:message key="campo.enlace.resetearContrasena"/>
										</html:submit>
									</td>
									<td>&nbsp;</td>
								</tr>
								</logic:notEmpty>
						  </logic:equal>
						  <logic:equal name="editarProcedimientoForm" property="permisoCambioClave" value="false">
						  	<tr>
								<td class="nombreCampo"><fmt:message key="editarProcedimiento.campo.claveCifrado"/></td>
								<td><html:password property="claveCifrado" size="40" maxlength="32" styleClass="<%=estiloSoloLectura %>" readonly="true" /></td>
								<!-- <td><input type="password" name="claveCifrado" size="40" maxlength="32" autocomplete="off"></td> -->
								<td class="msgError"><html:errors property="claveCifrado"/></td>
							</tr>
						  </logic:equal>
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
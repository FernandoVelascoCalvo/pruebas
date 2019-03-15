<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>


<html>
	<head>
		<title><fmt:message key="editarPerfil.titulo"/></title>
	</head>
	
	<body>
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_PROC_EDICION); %>
		
		<script type="text/javascript">
		    function checkPublico() {		    
		    	var publico = document.getElementsByName("publico")[0].checked;
		    	var defecto = document.getElementsByName("defecto")[0];
		    	defecto.disabled = !publico;
		    }
		</script>

		<p class="azul"><fmt:message key="editarPerfil.subtitulo"/></p>
		<p class="info"><fmt:message key="editarPerfil.comentario"/></p>

		<c:set var="formAction" value="/crearPerfil.do"/>
		<logic:notEmpty name="editarPerfilForm" property="idPerfil">
			<c:set var="formAction" value="/editarPerfil.do"/>
		</logic:notEmpty>	
	
		<html-el:form action="${formAction}" >
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-6548574-p" value="<c:out value="${param['d-6548574-p']}"/>" />
			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
  			<input type="hidden" name="idOrden" value="<c:out value="${param.idOrden}"/>" />
  			<input type="hidden" name="idConvocatoria" value="<c:out value="${param.idConvocatoria}"/>" />
  			<logic:notEmpty name="editarPerfilForm" property="idPerfil">
  				<html:hidden property="idPerfil"/>
  			</logic:notEmpty>	
	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>				
					<td class="nombreCampo"><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="50" maxlength="40"  styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="perfil.campo.cdNombreTrewa"/></td>
					<td>
						<logic:notEmpty name="editarPerfilForm" property="idPerfil">
						<%-- Editar Perfil --%>
							<html:select property="cdNombreTrewa" disabled="true">
								<html:option value="cdNombreTrewa">
									<bean:write name="editarPerfilForm" property="cdNombreTrewa"/>
								</html:option>
	                        </html:select>
	                        <html:hidden name="editarPerfilForm" property="cdNombreTrewa"/>
                       </logic:notEmpty>
                       <logic:empty name="editarPerfilForm" property="idPerfil">
						<%-- Nuevo Perfil --%>
							<html:select property="cdNombreTrewa">
	                                  <html:optionsCollection name="perfilesTrewa"
	                                                          label="cdNombreTrewa" 
	                                                          value="cdNombreTrewa" />
	                        </html:select>
                       </logic:empty>
					</td>
					<td class="msgError"><html:errors property="cdNombreTrewa"/></td>
				</tr>
				<tr>
					<td class="nombreCampo"><fmt:message key="perfil.campo.publico"/></td>
					<td><html:checkbox property="publico" value="true" onclick="javascript:checkPublico();" disabled="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="publico"/></td>
				</tr>	
				<logic:equal name="editarPerfilForm" property="publico" value="true">
					<tr>
						<td class="nombreCampo"><fmt:message key="perfil.campo.defecto"/></td>
						<td colspan="2"><html:checkbox property="defecto" value="true" disabled="<%=!modoEdicion %>" />
							<fmt:message key="editarPerfil.nota.perfilDefecto"/>
						</td>
					</tr>
				</logic:equal>
				<logic:notEqual name="editarPerfilForm" property="publico" value="true">
					<tr>
						<td class="nombreCampo"><fmt:message key="perfil.campo.defecto"/></td>
						<td colspan="2"><html:checkbox property="defecto" disabled="true"/>
							<fmt:message key="editarPerfil.nota.perfilDefecto"/>
						</td>
					</tr>
				</logic:notEqual>
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
			
			<logic:notEmpty name="editarPerfilForm" property="idPerfil">
				
				<p class="azul"><fmt:message key="tiposIdentificacion.subtitulo"/></p>
				<p class="info"><fmt:message key="tiposIdentificacion.comentario"/></p>
				<div class="cabeceraAbajo"></div>
		
				<div class="listado">		
	
					<!-- Enlace a la asignación de un Tipo de Identificacion a un perfil -->
					<% if(modoEdicion){%>
					<c:url var="nuevoURL" value="/asignarTipoIdentificacionPerfil.do">
						<c:param name="d-2206782-p" value="${param['d-2206782-p']}"/>						
						<c:param name="idPerfil" value="${param.idPerfil}"/>				
						<c:param name="idProcedimiento" value="${param.idProcedimiento}"/>				
						<c:param name="idOrden" value="${param.idOrden}"/>				
						<c:param name="idConvocatoria" value="${param.idConvocatoria}"/>
						<c:param name="pordefecto">
							<bean:write name="editarPerfilForm" property="defecto"/>
						</c:param>				
					</c:url>
					<html-el:link href="${nuevoURL}" styleClass="enlace_boton">
						<fmt:message key="comun.enlace.asignar"/>
					</html-el:link>
					<%} %>
	
					<!-- Lista de procedimientos -->
					<display:table id="listadoTiposIdentificacion"
								   name="tiposIdentificacion"
								   pagesize="5"
								   requestURI="editarPerfil.do"
								   excludedParams="accion org.apache.struts.taglib.html.CANCEL d-1288982-p"
								   decorator="es.ja.cice.pct.moad.webapp.decorators.AsignarPerfilesDecorator">
						<display:column property="nombre"
										titleKey="comun.campo.nombre"
										sortable="false"/>
						<display:column property="descripcion"
										titleKey="comun.campo.descripcion"
										sortable="false" maxLength="75"/>
						<% if(modoEdicion){%>										
		                <display:column property="borrarLink"
		                                title=""
		                                class="col_1"
		                                sortable="false"/>
		                <%} %>
			      		</display:table>
				</div>
			</logic:notEmpty>

		</html-el:form>
		
	</body>
</html>
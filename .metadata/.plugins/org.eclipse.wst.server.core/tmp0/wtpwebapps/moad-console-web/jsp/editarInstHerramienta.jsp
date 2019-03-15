<%@ include file="/common/taglibs.jsp"%>
<%@ page import ="es.ja.cice.pct.moad.model.InstParametroImpl" %>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarInstHerramienta.titulo"/></title>
		<script type="text/javascript">
		
		 function setActionChangePassword(idInstParametro) {
	   		 var accion = document.getElementsByName("accion");
	         accion[0].value = "cambioContrasena";
	         
	         var instParam = document.getElementsByName("idInstParametro");
	         instParam[0].value = idInstParametro;
	    }

	    function setActionResetPassword(idInstParametro) {
	   		 var accion = document.getElementsByName("accion");
	         accion[0].value = "resetContrasena";
	         
	         var instParam = document.getElementsByName("idInstParametro");
	         instParam[0].value = idInstParametro;
	         
	    }
		
		</script>
	</head>
	<body>
		
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		
		<p class="azul"><fmt:message key="editarInstHerramienta.subtitulo"/></p>
		<p class="info"><fmt:message key="editarInstHerramienta.comentario"/></p>

		<html-el:form action="/editarInstHerramienta.do">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-4460053-p" value="<c:out value="${param['d-4460053-p']}"/>" />
			<input type="hidden" name="d-3449996-p" value="<c:out value="${param['d-3449996-p']}"/>" />
			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
			<input type="hidden" name="idConfiguracion" value="<c:out value="${param.idConfiguracion}"/>" />
			<html:hidden property="idInstHerramienta"/>
			<input type="hidden" name="idInstParametro"  />
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="30" maxlength="20" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="60" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="parametro.campo.herramienta"/></td>
					<td>
						<html:select property="idHerramienta" disabled="true">
				            <html:optionsCollection name="herramientas"
				            						label="nombre"
				            						value="id"/>
				        </html:select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<p class="azul"><fmt:message key="instParametros.subtitulo"/></p>
					</td>
					<td><html:errors property="parametros" /></td>
				</tr>
				<logic:iterate id="parametros"
				               indexId="idx"
				               name="editarInstHerramientaForm"
				               property="parametros"
				               type="InstParametroImpl">
					<tr>
						<td>
						  <logic:notEmpty name="parametros" property="parametro.descripcion" >
						 	<bean:define id="descripcion" name="parametros" property="parametro.descripcion"/>
							
						 	<div class="info" title="<c:out value="${descripcion}"/>">

							 	<logic:equal name="parametros" property="parametro.obligatorio" value="true">
									<div id="obligatorio"><bean:write name="parametros" property="descripcionCortaParametro"/></div>
								</logic:equal>
								<logic:equal name="parametros" property="parametro.obligatorio" value="false">
									<bean:write name="parametros" property="descripcionCortaParametro" />
								</logic:equal>
						  	</div>
						  </logic:notEmpty>
						  <logic:empty name="parametros" property="parametro.descripcion" >
						 		<logic:equal name="parametros" property="parametro.obligatorio" value="true">
									<div id="obligatorio"><bean:write name="parametros" property="descripcionCortaParametro"/></div>
								</logic:equal>
								<logic:equal name="parametros" property="parametro.obligatorio" value="false">
									<bean:write name="parametros" property="descripcionCortaParametro" />
								</logic:equal>
						  </logic:empty>
						</td>
						<td>
						<logic:equal name="parametros" property="parametro.tipoCifrado" value="S">
								<logic:notEmpty name="parametros" property="valor">
									<%if(modoEdicion) {%>
											<logic:equal name="parametros" property="permisoCambioClave" value="true">
					    						<input type="submit" id="cambiarContrasena" value="<fmt:message key="campo.enlace.cambiarContrasena"/>" onclick="javascript:setActionChangePassword('<bean:write name="parametros" property="id"/>');" >
					    						<input type="submit" id="cambiarContrasena" value="<fmt:message key="campo.enlace.limpiarContrasena"/>" onclick="javascript:setActionResetPassword('<bean:write name="parametros" property="id"/>');" >
											</logic:equal>
											<logic:notEqual name="parametros" property="permisoCambioClave" value="true">
												<html:password name="parametros" property="valor" indexed="true" size="60" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/>
												<html:hidden styleId="guardar" name="parametros" property="id" />
											</logic:notEqual>
									<%}else{ %>
										<html:password name="parametros" property="valor" indexed="true" size="60" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/>
									<%} %>
								</logic:notEmpty>
								<logic:empty name="parametros" property="valor">
									<html:password name="parametros" property="valor" indexed="true" size="60" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/>
									<html:hidden styleId="guardar" name="parametros" property="id" />
								</logic:empty>
						</logic:equal>
						<logic:notEqual name="parametros" property="parametro.tipoCifrado" value="S">
								<html:text name="parametros" property="valor" indexed="true" size="60" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/>
						</logic:notEqual>
						</td>
						<td class="msgError"></td>
					</tr>
				</logic:iterate>
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
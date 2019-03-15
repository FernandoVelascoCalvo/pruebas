<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="editarUsuario.titulo"/></title>
	</head>
	<body>
	<script type="text/javascript">
	    function cargarMunicipios(form){
	    	var accion = document.getElementsByName("accion");
	    	accion[0].value = "cambiarProvincia";
	    	form.submit();
	    }

	</script>

		<c:set var="formAction" value="/crearUsuario.do"/>
		<logic:notEmpty name="editarUsuarioForm" property="id">
			<c:set var="formAction" value="/editarUsuario.do"/>
		</logic:notEmpty>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="show" value="false" />
			<input type="hidden" name="cdPais"/>
			<input type="hidden" name="fallosLogin" value="<c:out value="${param.fallosLogin}"/>"/>

			<input type="hidden" name="d-6570285-p" value="<c:out value="${param['d-6570285-p']}"/>" />
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />
			<html:hidden property="activar"/>
			<html:hidden property="id"/>
			<logic:equal name="editarUsuarioForm" property="activar" value="SI">
					<html:hidden property="dni"/>
			</logic:equal>

  			<%-- Datos del usuario --%>
			<p class="azul"><fmt:message key="editarUsuario.subtitulo"/></p>

			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tbody>
					<logic:equal name="editarUsuarioForm" property="activar" value="SI">
						<tr>
							<td class="nombreCampo"><fmt:message key="usuario.campo.dni"/></td>
							<td><html:text property="dni" size="12" maxlength="9"  disabled="true"/></td>
							<td class="msgError"><html:errors property="dni"/></td>
						</tr>
					</logic:equal>
					<logic:notEqual name="editarUsuarioForm" property="activar" value="SI">
						<tr>
							<td class="nombreCampo"><fmt:message key="usuario.campo.dni"/></td>
							<td><html:text property="dni" size="12" maxlength="9"/></td>
							<td class="msgError"><html:errors property="dni"/></td>
						</tr>
					</logic:notEqual>
					<tr>
						<td class="nombreCampo"><fmt:message key="comun.campo.nombre"/></td>
						<td><html:text property="nombre" size="40" maxlength="32"/></td>
						<td class="msgError"><html:errors property="nombre"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.apellido1"/></td>
						<td><html:text property="apellido1" size="40" maxlength="32"/></td>
						<td class="msgError"><html:errors property="apellido1"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.apellido2"/></td>
						<td><html:text property="apellido2" size="40" maxlength="32"/></td>
						<td class="msgError"><html:errors property="apellido2"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.usuario"/></td>
						<td><html:text property="usuario" size="30" maxlength="20"/></td>
						<td class="msgError"><html:errors property="usuario"/></td>
					</tr>
					<logic:empty name="editarUsuarioForm" property="id">
					<%-- Creando usuario --%>
						<tr>
							<td class="nombreCampo"><fmt:message key="usuario.campo.contrasena"/></td>
							<td><html:text property="contrasena" size="40" maxlength="40"/></td>
							<td class="msgError"><html:errors property="contrasena"/></td>
						</tr>
					</logic:empty>
					<logic:notEmpty name="editarUsuarioForm" property="id">
					<%-- Editando usuario --%>
						<logic:notEmpty name="editarUsuarioForm" property="permisoCambioContrasena">
						 <html:hidden property="permisoCambioContrasena"/>
						  <logic:equal name="editarUsuarioForm" property="permisoCambioContrasena" value="true">
							<c:url var="cambiarURL" value="/cambiarContrasena.do">
								<pctmoad:param nombre="cdUsuario"/>
								<pctmoad:param nombre="d-6570285-p"/>
								<pctmoad:param nombre="filtro"/>
							</c:url>
							<c:url var="resetearURL" value="/cambiarContrasena.do">
								<pctmoad:param nombre="cdUsuario"/>
								<pctmoad:param nombre="d-6570285-p"/>
								<pctmoad:param nombre="filtro"/>
								<pctmoad:param nombre="resetear"/>
							</c:url>
							<tr>
								<td class="nombreCampo"><fmt:message key="usuario.campo.contrasena"/></td>
								<td>
									<html:hidden property="contrasena"/>
									<html-el:link href="${cambiarURL}" styleId="cambiarContrasena">
										<fmt:message key="usuario.enlace.cambiarContrasena"/>
									</html-el:link>
									<html-el:link href="${resetearURL}" styleId="cambiarContrasena">
										<fmt:message key="usuario.enlace.resetearContrasena"/>
									</html-el:link>
								</td>
								<td>&nbsp;</td>
							</tr>
						  </logic:equal>
						</logic:notEmpty>
					</logic:notEmpty>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.sexo"/></td>
						<td>
							<fmt:message key="usuario.campo.hombre"/><html:radio property="sexo" value="V" />
							<fmt:message key="usuario.campo.mujer"/><html:radio property="sexo" value="M"/>
						</td>
						<td class="msgError"><html:errors property="sexo"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.estado"/></td>
						<td>
							<html:select property="cdEstadoUsuario">
				  				<html:optionsCollection name="estados" label="nombre" value="cdEstadoUsuario"/>
							</html:select>
						</td>
						<td class="msgError"></td>
					</tr>
					<tr>
					    <td class="nombreCampo"><fmt:message key="usuario.campo.tipoVia"/></td>
						<td>
							<html:select property="cdTipoVia">
								<html:option value=""></html:option>
				  				<html:optionsCollection name="tiposVia" label="descripcion" value="cdTipoVia"/>
							</html:select>
						</td>
						<td class="msgError"></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.nombreVia"/></td>
						<td><html:text property="nombreVia" size="70" maxlength="70"/></td>
						<td class="msgError"><html:errors property="nombreVia"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.numero"/></td>
						<td><html:text property="numero" size="5" maxlength="5"/></td>
						<td class="msgError"><html:errors property="numero"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.escalera"/></td>
						<td><html:text property="escalera" size="3" maxlength="2"/></td>
						<td class="msgError"><html:errors property="escalera"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.piso"/></td>
						<td><html:text property="piso" size="5" maxlength="5"/></td>
						<td class="msgError"><html:errors property="piso"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.letra"/></td>
						<td><html:text property="letra" size="3" maxlength="2"/></td>
						<td class="msgError"><html:errors property="letra"/></td>
					</tr>
					<tr>
					    <td class="nombreCampo"><fmt:message key="usuario.campo.puerta"/></td>
						<td><html:text property="puerta" size="7" maxlength="5"/></td>
						<td class="msgError"><html:errors property="puerta"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.cp"/></td>
						<td><html:text property="codigoPostal" size="12" maxlength="10"/></td>
						<td class="msgError"><html:errors property="codigoPostal"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.provincia"/></td>
						<td>
							<html:select property="cdProvincia" onchange="javascript:cargarMunicipios(this.form);">
							    <html:option value=""></html:option>
				  				<html:optionsCollection name="provincias" label="descripcionBreve" value="cdProvincia"/>
							</html:select>
						</td>
						<td class="msgError"></td>
					</tr>
					<logic:notEmpty name="municipios">
						<tr>
							<td class="nombreCampo"><fmt:message key="usuario.campo.municipio"/></td>
							<td>
								<html:select property="cdMunicipio">
									<html:option value=""></html:option>
					  				<html:optionsCollection name="municipios" label="descripcionBreve" value="cdMunicipio"/>
								</html:select>
							</td>
							<td class="msgError"></td>
						</tr>
					</logic:notEmpty>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.telefono"/></td>
						<td><html:text property="telefono" size="40" maxlength="40"/></td>
						<td class="msgError"><html:errors property="telefono"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.movil"/></td>
						<td><html:text property="movil" size="40" maxlength="40"/></td>
						<td class="msgError"><html:errors property="movil"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.fax"/></td>
						<td><html:text property="fax" size="40" maxlength="40"/></td>
						<td class="msgError"><html:errors property="fax"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.email"/></td>
						<td><html:text property="email" size="40" maxlength="128"/></td>
						<td class="msgError"><html:errors property="email"/></td>
					</tr>
				</tbody>
			</table>

			<div class="confirmar">
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.guardar"/>
				</html:submit>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				</html:cancel>
			</div>

		</html-el:form>
	</body>
</html>
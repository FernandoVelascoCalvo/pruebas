<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarOficina.titulo"/></title>
        <script type="text/javascript" src="<c:url value='/scripts/mktree.js'/>"></script>
	</head>
	
	<body>
		
		<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		
		<script type="text/javascript">
		
		  function setActionModificarContrasena() {
		   		 var accion = document.getElementsByName("accion");
		         accion[0].value = "modificarContrasena";
		    }

		    function setActionLimpiarContrasena() {
		   		 var accion = document.getElementsByName("accion");
		         accion[0].value = "limpiarContrasena";
		    }
		</script>
		
		
		<p class="azul"><fmt:message key="editarOficina.subtitulo"/></p>
		<p class="info"><fmt:message key="editarOficina.comentario"/></p>
		
		<c:set var="formAction" value="/crearOficina.do"/>
		<logic:greaterEqual name="editarOficinaForm" property="idOficina" value="1">
			<c:set var="formAction" value="/editarOficina.do"/>
		</logic:greaterEqual>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-6544692-p" value="<c:out value="${param['d-6544692-p']}"/>" />
  			<html:hidden property="idOficina"/>
  			<html:hidden property="idUO"/>
  			<html:hidden property="mostrarCampoContrasena" /></td>

			<p class="azul"><fmt:message key="editarOficina.tituloUO"/> <html:errors property="idUO"/></p>

			
			<div class="arbol">
				<bean:write name="arbol" filter="false"/>
				<script>convertTrees();expandToItem('arbolUO','<%=request.getParameter("idUO")%>');</script>
			</div>


			<p class="azul"><fmt:message key="editarOficina.titulo"/>		

			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>				
				<tr>
					<td><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="50" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="oficina.campo.codigo"/></td>
					<td><html:text property="codigo" size="30" maxlength="20" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="codigo" /></td>
				</tr>
				<tr>
					<td><fmt:message key="oficina.campo.usuarioAries"/></td>
					<td><html:text property="usuarioAries" size="50" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="usuarioAries" /></td>
				</tr>
				
				<% if(modoEdicion){%>
				<logic:empty property="contrasenaAries" name="editarOficinaForm">
				<tr>
					<td><fmt:message key="oficina.campo.contrasenaAries"/></td>
					<td><html:password property="contrasenaAries" size="50" maxlength="40"/></td>
					<td class="msgError"><html:errors property="contrasenaAries" /></td>
				</tr>
				</logic:empty>
				<logic:notEmpty property="contrasenaAries" name="editarOficinaForm">
					<logic:equal property="mostrarCampoContrasena" value="false" name="editarOficinaForm">
					<html:hidden property="contrasenaAries" /></td>
					<c:url var="cambiarURL" value="/cambiarContrasenaOficina.do">
						<pctmoad:param nombre="d-6903951-p"/>
						<pctmoad:param nombre="filtro"/>
						<c:param name="idOficina" value="${param.idOficina}"></c:param>
						<c:param name="idUO" value="${param.idUO}"></c:param>
						
					</c:url>
					<c:url var="limpiarURL" value="/cambiarContrasenaOficina.do">
						<pctmoad:param nombre="d-6903951-p"/>
						<pctmoad:param nombre="filtro"/>
						<pctmoad:param nombre="resetear"/>
						<c:param name="idOficina" value="${param.idOficina}"></c:param>
						<c:param name="idUO" value="${param.idUO}"></c:param>
					</c:url>
					<tr>
						<td class="nombreCampo"><fmt:message key="oficina.campo.contrasenaAries"/></td>
						<td>
							<%-- <html-el:link href="${cambiarURL}" styleId="cambiarContrasena">
								<fmt:message key="oficina.enlace.modificarContrasena"/>
							</html-el:link>
							<html-el:link href="${limpiarURL}" styleId="cambiarContrasena">
								<fmt:message key="oficina.enlace.limpiarContrasena"/>
							</html-el:link> --%>
							<html:submit styleClass="boton_submit" property="accion" onclick="javascript:setActionModificarContrasena();">
								<fmt:message key="campo.enlace.cambiarContrasena"/>
							</html:submit>
							
							<html:submit styleClass="boton_submit" property="accion" onclick="javascript:setActionLimpiarContrasena();">
								<fmt:message key="campo.enlace.limpiarContrasena"/>
							</html:submit>
						</td>
						<td>&nbsp;</td>
					</tr>
					</logic:equal>
					<logic:equal property="mostrarCampoContrasena" value="true" name="editarOficinaForm">
						<tr>
							<td><fmt:message key="oficina.campo.contrasenaAries"/></td>
							<td><html:password property="contrasenaAries" size="50" maxlength="40"/></td>
							<td class="msgError"><html:errors property="contrasenaAries" /></td>
						</tr>
					</logic:equal>
				</logic:notEmpty>
				<%} else{%>
				<tr>
					<td><fmt:message key="oficina.campo.contrasenaAries"/></td>
					<td><html:password property="contrasenaAries" size="50" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="contrasenaAries" /></td>
				</tr>
				<%} %>
				
				<tr>
					<td><fmt:message key="oficina.campo.provincia"/></td>
					<td>
						<html:select property="cdProvincia" disabled="<%=!modoEdicion %>">
						    <html:option value=""></html:option>
			  				<html:optionsCollection name="provincias" label="descripcionBreve" value="cdProvincia"/>
						</html:select>
					</td>
					<td class="msgError"><html:errors property="cdProvincia" /></td>
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
						
			<%-- Si "idUO" está en la request, entonces expandimos el árbol con ese valor --%>
			<logic:present parameter="idUO">
				<script>expandToItem('arbolUO','<%=request.getParameter("idUO")%>');</script>
			</logic:present>
			
			<%-- Si "idUO" no está en la request, entonces expandimos el árbol con el valor
			     del campo del formulario --%>
			<logic:notPresent parameter="idUO">
				<bean:define id="idUO" name="editarOficinaForm" property="idUO"/>
				
				<script>expandToItem('arbolUO','<c:out value="${idUO}"/>');</script>
			</logic:notPresent>			
			
    	</html-el:form>	
	</body>
</html>

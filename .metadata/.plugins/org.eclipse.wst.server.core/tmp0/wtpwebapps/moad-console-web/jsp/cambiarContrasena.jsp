<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="cambiarContrasena.titulo"/></title>    
	</head>
	<body>

		<p class="azul"><fmt:message key="cambiarContrasena.subtitulo"/></p>
		<logic:present name="contrasena">
			<p class="info">			
				<fmt:message key="cambiarContrasena.reseteada">
				    <bean:define id="contrasenia" name="contrasena"/>
					<fmt:param value="${contrasenia}"/>
				</fmt:message>
			</p>
			
			<bean:define id="cdUsuario" name="cdUsuario"/>
			<%-- Enlace para volver a la página de edición del usuario --%>
			
			<logic:present name="retorno">
			    <c:url var="retornoUrl" value="${retorno}"></c:url>
			    <html-el:link href="${retornoUrl}" styleClass="btn_volver_center">
					<fmt:message key="comun.enlace.volver"/>
				</html-el:link>
			</logic:present>
			<logic:notPresent name="retorno">
			    <c:url var="volverURL" value="/editarUsuario.do">
					<c:param name="d-6570285-p" value="${param['d-6570285-p']}"/>
					<c:param name="cdUsuario" value="${cdUsuario}"/>
				</c:url>
			    <html-el:link href="${volverURL}" styleClass="btn_volver_center">
					<fmt:message key="comun.enlace.volver"/>
				</html-el:link>
			</logic:notPresent>
			
			
		</logic:present>
		<logic:notPresent name="contrasena">
		<p class="info"><fmt:message key="cambiarContrasena.comentario"/></p>


		<html-el:form action="/cambiarContrasena.do">
			<input type="hidden" name="accion" value="guardar" />
			<html:hidden property="cdUsuario"/>
            <input type="hidden" name="retorno" value="<c:out value="${retorno}"/>"/>
            
			
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tbody>				
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.contrasenaActual"/></td>
						<td><html:password property="contrasena" size="50" maxlength="40"/></td>
						<td class="msgError"><html:errors property="contrasena"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.contrasenaNueva1"/></td>
						<td><html:password property="nueva" size="50" maxlength="40"/></td>
						<td class="msgError"><html:errors property="nueva"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="usuario.campo.contrasenaNueva2"/></td>
						<td><html:password property="confirmacion" size="50" maxlength="40"/></td>
						<td class="msgError"><html:errors property="confirmacion"/></td>
					</tr>
				</tbody>		
			</table>

			<div class="confirmar">
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.guardar"/>
				</html:submit>
				<logic:present name="retorno">
				    <c:url var="retornoUrl" value="${retorno}"></c:url>
					<html-el:link href="${retornoUrl}" styleClass="boton_submit">
						<fmt:message key="comun.boton.cancelar"/>
					</html-el:link>
				</logic:present>
				<logic:notPresent name="retorno">
				   <html:link action="/paginaPrincipal.do" styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				   </html:link>
				</logic:notPresent>
			
			</div>
			
			
  			
		</html-el:form>
		</logic:notPresent>
	</body>
</html>		
	
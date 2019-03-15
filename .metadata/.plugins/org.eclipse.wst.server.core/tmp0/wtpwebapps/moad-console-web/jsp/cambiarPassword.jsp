<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="cambiarPassword.titulo"/></title>    
	</head>
	<body>

		<p class="azul"><fmt:message key="cambiarPassword.subtitulo"/></p>
		<logic:present name="password">
			<p class="info">			
				<fmt:message key="cambiarPassword.reseteada">
				    <bean:define id="clave" name="password"/>
					<fmt:param value="${clave}"/>
				</fmt:message>
			</p>
			
			<bean:define id="idConfTrewa" name="cambiarPasswordForm" property="idConfTrewa"/>
			<%-- Enlace para volver a la página de edición de la configuración de trewa --%>
			
			<logic:present name="retorno">
			    <c:url var="retornoUrl" value="${retorno}"></c:url>
			    <html-el:link href="${retornoUrl}" styleClass="btn_volver_center">
					<fmt:message key="comun.enlace.volver"/>
				</html-el:link>
			</logic:present>
			<logic:notPresent name="retorno">
			    <c:url var="volverURL" value="/editarConfiguracionTrewa.do">
					<c:param name="d-7776532-p" value="${param['d-7776532-p']}"/>
					<c:param name="idConfTrewa" value="${idConfTrewa}"/>
				</c:url>
			    <html-el:link href="${volverURL}" styleClass="btn_volver_center">
					<fmt:message key="comun.enlace.volver"/>
				</html-el:link>
			</logic:notPresent>
			
			
		</logic:present>
		<logic:notPresent name="password">
		<p class="info"><fmt:message key="cambiarPassword.comentario"/></p>


		<html-el:form action="/cambiarPassword.do">
			<input type="hidden" name="accion" value="guardar" />
			<html:hidden property="idConfTrewa"/>
            <input type="hidden" name="retorno" value="<c:out value="${retorno}"/>"/>
			
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tbody>				
					<tr>
						<td class="nombreCampo"><fmt:message key="cambiarPassword.campo.passwordActual"/></td>
						<td><html:password property="password" size="40" maxlength="1000"/></td>
						<td class="msgError"><html:errors property="password"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="cambiarPassword.campo.passwordNueva1"/></td>
						<td><html:password property="nuevo" size="40" maxlength="1000"/></td>
						<td class="msgError"><html:errors property="nuevo"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="cambiarPassword.campo.passwordNueva2"/></td>
						<td><html:password property="confirmacion" size="40" maxlength="1000"/></td>
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
	
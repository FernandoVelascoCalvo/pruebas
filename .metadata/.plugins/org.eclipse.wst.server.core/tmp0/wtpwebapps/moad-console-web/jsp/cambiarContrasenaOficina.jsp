<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="cambiarContrasenaOficina.titulo"/></title>    
	</head>
	<body>

		<p class="azul"><fmt:message key="cambiarContrasenaOficina.subtitulo"/></p>
		<p class="info"><fmt:message key="cambiarContrasenaOficina.comentario"/></p>


		<html-el:form action="/cambiarContrasenaOficina.do">
			<input type="hidden" name="accion" value="guardar" />
			<html:hidden property="idOficina"/>
			<html:hidden property="idUO"/>
            <input type="hidden" name="retorno" value="<c:out value="${retorno}"/>"/>
			
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tbody>				
					<tr>
						<td class="nombreCampo"><fmt:message key="cambiarContrasenaOficina.campo.claveActual"/></td>
						<td><html:password property="clave" size="40" maxlength="40"/></td>
						<td class="msgError"><html:errors property="clave"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="cambiarContrasenaOficina.campo.claveNueva1"/></td>
						<td><html:password property="nueva" size="40" maxlength="40"/></td>
						<td class="msgError"><html:errors property="nueva"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="cambiarContrasenaOficina.campo.claveNueva2"/></td>
						<td><html:password property="confirmacion" size="40" maxlength="40"/></td>
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
	</body>
</html>		
	
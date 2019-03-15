<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="cambiarClaveInstHerramienta.titulo"/></title>    
	</head>
	<body>

		<p class="azul"><fmt:message key="cambiarClaveInstHerramienta.subtitulo"/></p>
		<p class="info"><fmt:message key="cambiarClaveInstHerramienta.comentario"/></p>


		<html-el:form action="/cambiarClaveInstParametro.do">
			<input type="hidden" name="accion" value="guardar" />
			<html:hidden property="idInstHerramienta"/>
			<html:hidden property="idInstParam"/>
            <input type="hidden" name="retorno" value="<c:out value="${retorno}"/>"/>
			
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tbody>				
					<tr>
						<td class="nombreCampo"><fmt:message key="cambiarClaveInstHerramienta.campo.claveActual"/></td>
						<td><html:password property="clave" size="40" maxlength="1000"/></td>
						<!-- <td><input type="password" name="claveCifrado" size="40" maxlength="32" autocomplete="off"></td> -->
						<td class="msgError"><html:errors property="clave"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="cambiarClaveInstHerramienta.campo.claveNueva1"/></td>
						<td><html:password property="nueva" size="40" maxlength="1000"/></td>
						<td class="msgError"><html:errors property="nueva"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="cambiarClaveInstHerramienta.campo.claveNueva2"/></td>
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
	</body>
</html>		
	
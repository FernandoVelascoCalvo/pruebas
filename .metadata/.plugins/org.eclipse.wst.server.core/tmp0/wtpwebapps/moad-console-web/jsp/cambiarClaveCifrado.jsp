<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="cambiarClaveCifrado.titulo"/></title>    
	</head>
	<body>

		<p class="azul"><fmt:message key="cambiarClaveCifrado.subtitulo"/></p>
		<logic:present name="claveCifrado">
			<p class="info">			
				<fmt:message key="cambiarClaveCifrado.reseteada">
				    <bean:define id="clave" name="claveCifrado"/>
					<fmt:param value="${clave}"/>
				</fmt:message>
			</p>
			
			<bean:define id="idProcedimiento" name="cambiarClaveCifradoForm" property="idProcedimiento"/>
			<%-- Enlace para volver a la página de edición del procedimiento --%>
			
			<logic:present name="retorno">
			    <c:url var="retornoUrl" value="${retorno}"></c:url>
			    <html-el:link href="${retornoUrl}" styleClass="btn_volver_center">
					<fmt:message key="comun.enlace.volver"/>
				</html-el:link>
			</logic:present>
			<logic:notPresent name="retorno">
			    <c:url var="volverURL" value="/editarProcedimiento.do">
					<c:param name="d-6903951-p" value="${param['d-6903951-p']}"/>
					<c:param name="idProcedimiento" value="${idProcedimiento}"/>
				</c:url>
			    <html-el:link href="${volverURL}" styleClass="btn_volver_center">
					<fmt:message key="comun.enlace.volver"/>
				</html-el:link>
			</logic:notPresent>
			
			
		</logic:present>
		<logic:notPresent name="claveCifrado">
		<p class="info"><fmt:message key="cambiarClaveCifrado.comentario"/></p>


		<html-el:form action="/cambiarClaveCifrado.do">
			<input type="hidden" name="accion" value="guardar" />
			<html:hidden property="idProcedimiento"/>
            <input type="hidden" name="retorno" value="<c:out value="${retorno}"/>"/>
			
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tbody>				
					<tr>
						<td class="nombreCampo"><fmt:message key="procedimiento.campo.claveActual"/></td>
						<td><html:password property="claveCifrado" size="40" maxlength="32"/></td>
						<!-- <td><input type="password" name="claveCifrado" size="40" maxlength="32" autocomplete="off"></td> -->
						<td class="msgError"><html:errors property="claveCifrado"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="procedimiento.campo.claveNueva1"/></td>
						<td><html:password property="nueva" size="40" maxlength="32"/></td>
						<td class="msgError"><html:errors property="nueva"/></td>
					</tr>
					<tr>
						<td class="nombreCampo"><fmt:message key="procedimiento.campo.claveNueva2"/></td>
						<td><html:password property="confirmacion" size="40" maxlength="32"/></td>
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
	
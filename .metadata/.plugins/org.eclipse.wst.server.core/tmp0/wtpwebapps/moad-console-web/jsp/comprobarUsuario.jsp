<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="comprobarUsuario.titulo"/></title>
	</head>
	<body>
		<c:set var="formAction" value="/comprobarUsuario.do"/>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="comprobar" />
			<input type="hidden" name="d-6570285-p" value="<c:out value="${param['d-6570285-p']}"/>" />
			<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />

  			<%-- Datos del usuario --%>
			<p class="azul"><fmt:message key="comprobarUsuario.subtitulo"/></p>
			<p class="info"><fmt:message key="comprobarUsuario.comentario"/></p>

			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tbody>
					<tr>
						<td><fmt:message key="usuario.campo.dni"/></td>
						<td><html:text property="dni" size="12" maxlength="9"/></td>
						<td class="msgError"><html:errors property="dni"/></td>
					</tr>
				</tbody>
			</table>

			<div class="confirmar">
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.comprobar"/>
				</html:submit>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				</html:cancel>
			</div>

		</html-el:form>
	</body>
</html>
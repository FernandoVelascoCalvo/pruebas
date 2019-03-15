<%@ include file="/common/taglibs.jsp"%>


<html>
	<head>
		<title><fmt:message key="confTrewa.titulo"/></title>
	</head>
	<body>

		<p class="azul"><fmt:message key="confTrewa.subtitulo"/></p>
		<p class="info"><fmt:message key="confTrewa.comentario"/></p>

		<html:form action="/validarConfiguracionTrewa.do">
		
			<input type="hidden" name="accion" value="comprobar" />
			<input type="hidden" name="d-7776532-p" value="<c:out value="${param['d-7776532-p']}"/>" />
  			<input type="hidden" name="idConfTrewa" value="<c:out value="${param.idConfTrewa}"/>" />

	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td><fmt:message key="confTrewa.campo.nombre"/></td>
					<td><html:text property="nombre" size="80" maxlength="999" disabled="true"/></td>
					<td class="msgError"><html:errors property="nombre" /></td>
				</tr>
				<tr>
					<td><fmt:message key="confTrewa.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="999" disabled="true"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="confTrewa.campo.usuario"/></td>
					<td><html:text property="usuario" size="80" maxlength="999" disabled="true"/></td>
					<td class="msgError"><html:errors property="usuario" /></td>
				</tr>
				<tr>
					<td><fmt:message key="confTrewa.campo.password"/></td>
					<td><html:password property="password" size="80" maxlength="32" disabled="true"/></td>
					<td class="msgError"><html:errors property="password" /></td>
				</tr>
				<tr>
					<td><fmt:message key="confTrewa.campo.conexion"/></td>
					<td><html:text property="conexion" size="80" maxlength="999" disabled="true"/></td>
					<td class="msgError"><html:errors property="conexion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="confTrewa.campo.mensaje"/></td>
					<td><html:text property="mensaje" size="80" maxlength="999" disabled="true"/></td>
					<td class="msgError"><html:errors property="mensaje" /></td>
				</tr>
			</table>
	
			<div class="confirmar">
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.comprobar"/>
				</html:submit>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				</html:cancel>
			</div>
			
    	</html:form>
	</body>
</html>
<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><fmt:message key="asignarPerfilMoad.titulo" /></title>
</head>
<body>

	<html:form action="/asignarPerfilMoad.do">
		<input type="hidden" name="accion" value="asignar" />
		<input type="hidden" name="d-7953672-p" value="<c:out value="${param['d-7953672-p']}"/>" />
		<input type="hidden" name="d-3655079-p" value="<c:out value="${param['d-3655079-p']}"/>" />

		<html:hidden property="cdUsuario" />
		<html:hidden property="idUsuarios" />
		<html:hidden property="idPerfilMoad" />



		<p class="azul">
			<fmt:message key="asignarPerfilMoad.tituloPerfiles" />
			<html:errors property="idPerfilMoad" />
		</p>
		<p class="info">
			<fmt:message key="asignarPerfilMoad.comentario" />
		</p>

		<div class="listado">
			<display:table id="listadoPerfilesMoadAsignar" name="listadoPerfilesMoadAsignarPaginada" pagesize="10" requestURI="asignarPerfilMoad.do" excludedParams=""
				decorator="es.ja.cice.pct.moad.webapp.decorators.PerfilesMoadAsignarDecorator">
				<display:column property="codigoLink" titleKey="perfilMoad.campo.codigo" sortable="false" />
				<display:column property="descripcionLink" titleKey="perfilMoad.campo.descripcion" sortable="false" />
			</display:table>
		</div>

		<div class="confirmar">
			<html:submit styleClass="boton_submit">
				<fmt:message key="comun.boton.asignar" />
			</html:submit>
			<html:cancel styleClass="boton_submit">
				<fmt:message key="comun.boton.cancelar" />
			</html:cancel>
		</div>

	</html:form>
</body>
</html>

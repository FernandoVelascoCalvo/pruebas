<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><fmt:message key="asignarConfTrewa.titulo" /></title>
</head>
<body>

	<html:form action="/asignarConfiguracionTrewa.do">
		<input type="hidden" name="accion" value="asignar" />

		<html:hidden property="idConfTrewa" />
		<html:hidden property="cdUsuario" />
		<html:hidden property="idUsuarios" />

		<p class="azul">
			<fmt:message key="asignarConfTrewa.titulo" />
			<html:errors property="idConfTrewa" />
		</p>
		<p class="info">
			<fmt:message key="asignarConfTrewa.comentario" />
		</p>

		<div class="listado">
			<display:table id="listadoConfiguracionTrewaAsignar" name="confTrewa"
				pagesize="10" requestURI="asignarConfiguracionTrewa.do"
				excludedParams=""
				decorator="es.ja.cice.pct.moad.webapp.decorators.AsignarUsuConfTrewaDecorator">
				<display:column property="nombreLink"
					titleKey="confTrewa.campo.nombre" sortable="false" />
				<display:column property="descripcionLink"
					titleKey="confTrewa.campo.descripcion" sortable="false" />
			</display:table>
		</div>

		<div class="confirmar">
			<logic:notEmpty name="listadoConfiguracionTrewaAsignar">
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.asignar" />
				</html:submit>
			</logic:notEmpty>

			<html:cancel styleClass="boton_submit">
				<fmt:message key="comun.boton.cancelar" />
			</html:cancel>
		</div>

	</html:form>
</body>
</html>

<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title><fmt:message key="asignarRol.titulo" /></title>
</head>
<body>

	<html:form action="/asignarPerfil.do">
		<input type="hidden" name="accion" value="asignar" />
		<input type="hidden" name="d-7953672-p"
			value="<c:out value="${param['d-7953672-p']}"/>" />
		<input type="hidden" name="d-3655079-p"
			value="<c:out value="${param['d-3655079-p']}"/>" />
		<html:hidden property="idOrden" />
		<html:hidden property="idPerfil" />
		<html:hidden property="cdUsuario" />
		<html:hidden property="idUsuConfTrewa" />
		<html:hidden property="idUsuarios" />

		<p class="azul">
			<fmt:message key="asignarPerfil.tituloOrdenes" />
			<html:errors property="idOrden" />
		</p>
		<p class="info">
			<fmt:message key="asignarPerfil.comentario" />
		</p>

		<div class="listado">
			<display:table id="listadoOrdenesAsignar" name="ordenes"
				pagesize="10" requestURI="asignarPerfil.do" excludedParams=""
				decorator="es.ja.cice.pct.moad.webapp.decorators.ProcedimientosOrdenesDecorator">
				<display:column property="procedimientoLink"
					titleKey="procedimiento.campo.procedimiento" sortable="false" />
				<display:column property="ordenLink" titleKey="orden.campo.orden"
					sortable="false" />
			</display:table>
		</div>

		<logic:present parameter="idOrden">
			<logic:notEqual parameter="idOrden" value="">

				<p class="azul">
					<fmt:message key="asignarPerfil.tituloPerfiles" />
					<html:errors property="idPerfil" />
				</p>
				<p class="info">
					<fmt:message key="asignarPerfilOrden.comentario" />
				</p>

				<div class="listado">
					<display:table id="listadoPerfilesAsignar" name="perfiles"
						pagesize="10" requestURI="asignarPerfil.do" excludedParams=""
						decorator="es.ja.cice.pct.moad.webapp.decorators.ConvocatoriasPerfilesAsignarDecorator">
						<display:column property="convocatoriaLink"
							titleKey="convocatoria.campo.convocatoria" sortable="false" />
						<display:column property="perfilLink"
							titleKey="perfil.campo.perfil" sortable="false" />
					</display:table>
				</div>

			</logic:notEqual>
		</logic:present>

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

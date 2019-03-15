<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="asignarConvocatoriaVersionPresenta.titulo"/></title>
	</head>
	<body> 

		<html:form action="/asignarConvocatoriaVersionPresenta.do">
			<input type="hidden" name="accion" value="asignar" />
			<input type="hidden" name="d-332532-p" value="<c:out value="${param['d-332532-p']}"/>" />
			<input type="hidden" name="d-2002331-p" value="<c:out value="${param['d-2002331-p']}"/>" />
  			<html:hidden property="idVersionPresenta"/>
			<html:hidden property="idConvocatoria"/>
			<html:hidden property="idProcedimiento"/>

			<p class="azul"><fmt:message key="asignarConvocatoriaVersionPresenta.subtitulo"/> <html:errors property="idConvocatoria"/></p>
			<p class="info"><fmt:message key="asignarConvocatoriaVersionPresenta.comentario"/></p>
			<logic:present parameter="idConvocatoria">
			<logic:notEmpty name="asignarConvocatoriaVersionPresentaForm" property="idConvocatoria">
				<div>
					<table class="formulario">
						<thead><tr><td colspan="3"></td></tr></thead>
						<tr>
							<td><fmt:message key="asignarConvocatoriaVersionPresenta.campo.titulo"/></td>
							<td><html:text property="titulo" size="40" maxlength="70"/></td>
							<td class="msgError"><html:errors property="titulo" /></td>
						</tr>
				    </table>
				</div>
				</logic:notEmpty>
			</logic:present>
			<div class="listado">
				<display:table id="listadoVersionPresentaConvocatoriasAsignar"
							   name="listadoConvocatorias"
							   pagesize="15"
							   requestURI="asignarConvocatoriaVersionPresenta.do"
							   excludedParams="accion"
							   decorator="es.ja.cice.pct.moad.webapp.decorators.ConvocatoriasPresentaDecorator">
					<display:column property="tituloMarcarLink"
									titleKey="convocatoria.campo.titulo"
									sortable="false"/>
					<display:column property="descripcionMarcarLink"
									titleKey="comun.campo.descripcion"
									sortable="false"/>
	       		</display:table>
			</div>
			
			<div class="confirmar">
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.asignar"/>
				</html:submit>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				</html:cancel>
			</div>
			
    	</html:form>
	</body>
</html>
	
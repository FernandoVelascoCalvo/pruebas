<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="asignarTipoCertificado.titulo"/></title>
	</head>
	<body> 

		<html:form action="/asignarTipoCertificado.do">
			<input type="hidden" name="accion" value="asignar" />
			<input type="hidden" name="d-3954682-p" value="<c:out value="${param['d-3954682-p']}"/>" />
  			<html:hidden property="idProcedimiento"/>
			<html:hidden property="idTipoCertificado"/>

			<p class="azul"><fmt:message key="asignarTipoCertificado.tituloTipoCertificado"/> <html:errors property="idTipoCertificado"/></p>
			<p class="info"><fmt:message key="asignarTipoCertificado.comentario"/></p>
			
			<div class="listado">		
				<display:table id="listadoProcedimientoTiposCertificado"
							   name="tiposCertificado"
							   pagesize="15"
							   requestURI="asignarTipoCertificado.do"
							   excludedParams=""
							   decorator="es.ja.cice.pct.moad.webapp.decorators.TiposCertificadoDecorator">
					<display:column property="entidadMarcarLink"
									titleKey="tipoCertificado.campo.entidad"
									sortable="false"/>
					<display:column property="tipoMarcarLink"
									titleKey="tipoCertificado.campo.tipo"
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
	
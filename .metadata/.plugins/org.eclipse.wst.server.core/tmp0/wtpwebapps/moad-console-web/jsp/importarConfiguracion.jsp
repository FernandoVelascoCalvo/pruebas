<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="configuracionesGenericas.titulo"/></title>
	</head>
	<body> 

		<p class="azul"><fmt:message key="importarConfiguracion.subtitulo"/></p>
		<p class="info"><fmt:message key="importarConfiguracion.comentario"/></p>

		<html-el:form action="importarConfiguracion.do" enctype="multipart/form-data">
			<input type="hidden" name="accion" value="importar" />
			<input type="hidden" name="d-4460053-p" value="<c:out value="${param['d-4460053-p']}"/>" />
  			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />

	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td><fmt:message key="configuracion.campo.fichero"/></td>
					<td><html:file property="fichero" size="75%"/></td>
					<td class="msgError"><html:errors property="fichero"/></td>
				</tr>
			</table> 	
	
			<div class="confirmar">
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.guardar"/>
				</html:submit>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				</html:cancel>
			</div>
    
		</html-el:form>
	</body>
</html>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="importarProcedimiento.titulo"/></title>
	</head>
	<body> 

		<p class="azul"><fmt:message key="importarProcedimiento.subtitulo"/></p>
		<p class="info"><fmt:message key="importarProcedimiento.comentario"/></p>

		<html-el:form action="importarProcedimiento.do" enctype="multipart/form-data">
			<input type="hidden" name="accion" value="importar" />
			<input type="hidden" name="d-6903951-p" value="<c:out value="${param['d-6903951-p']}"/>" />

	
			<table class="formulario">
				<thead><tr><td></td></tr></thead>
				<tr>
					<td><fmt:message key="procedimiento.campo.nombreFichero"/></td>
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
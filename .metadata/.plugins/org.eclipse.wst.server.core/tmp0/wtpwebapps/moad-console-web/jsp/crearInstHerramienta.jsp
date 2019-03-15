<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="crearInstHerramienta.titulo"/></title>
	</head>
	<body>

		<p class="azul"><fmt:message key="crearInstHerramienta.subtitulo"/></p>
		<p class="info"><fmt:message key="crearInstHerramienta.comentario"/></p>
	
		<html-el:form action="/crearInstHerramienta.do">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-4460053-p" value="<c:out value="${param['d-4460053-p']}"/>" />
			<input type="hidden" name="d-3449996-p" value="<c:out value="${param['d-3449996-p']}"/>" />
			<input type="hidden" name="idProcedimiento" value="<c:out value="${param.idProcedimiento}"/>" />
			<input type="hidden" name="idConfiguracion" value="<c:out value="${param.idConfiguracion}"/>" />
		
			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="30" maxlength="30"/></td>
					<td class="msgError"><html:errors property="nombre"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="parametro.campo.herramienta"/></td>
					<td>
						<html:select property="idHerramienta">
				            <html:optionsCollection name="herramientas"
				            						label="nombre" 
				            						value="id"/>
				        </html:select>					
					</td>
				</tr>
			</table>
	
			<div class="confirmar">
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.crear"/>
				</html:submit>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				</html:cancel>
			</div>
		</html-el:form>
	</body>
</html>
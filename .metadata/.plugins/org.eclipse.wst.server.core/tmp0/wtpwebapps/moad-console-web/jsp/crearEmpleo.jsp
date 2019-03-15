<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="crearEmpleo.titulo"/></title>
        <script type="text/javascript" src="<c:url value='/scripts/mktree.js'/>"></script>
	</head>
	
	<body>

		<c:set var="formAction" value="/crearEmpleo.do"/>
		<logic:greaterEqual name="editarEmpleoForm" property="id" value="1">
			<c:set var="formAction" value="/editarEmpleo.do"/>
		</logic:greaterEqual>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="d-7769137-p" value="<c:out value="${param['d-7769137-p']}"/>" />
  			<html:hidden property="id"/>
  			<html:hidden property="cdUsuario"/>
  			<html:hidden property="idUO"/>
  			<html:hidden property="cdPuestoTrabajo"/>
  			<html:hidden property="idUsuConfTrewa"/>
  			<html:hidden property="idUsuarios"/>

			<p class="azul"><fmt:message key="crearEmpleo.tituloUO"/> <html:errors property="idUO"/></p>

			
			<div class="arbol">
				<bean:write name="arbol" filter="false"/>
				<script>convertTrees();expandToItem('arbolUO','<%=request.getParameter("idUO")%>');</script>
			</div>

			<p class="azul"><fmt:message key="crearEmpleo.tituloPuestos"/> <html:errors property="cdPuestoTrabajo"/></p>
			<logic:present name="puestos" scope="request">
				<div class="listado">		
					<display-el:table id="listadoPuestos"
								   name="puestos"
								   pagesize="10"
								   requestURI="/crearEmpleo.do?accion=editar"
								   excludedParams="accion"
								   decorator="es.ja.cice.pct.moad.webapp.decorators.PuestosDecorator">
						<display-el:column property="dsBreveLink"
										titleKey="comun.campo.nombre"
										sortable="false"/>
						<display-el:column property="dsExtendidaLink"
										titleKey="comun.campo.descripcion"
										sortable="false"/>
		       		</display-el:table>
				
				</div>
			</logic:present>


			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td><fmt:message key="empleo.campo.fechaNombramiento"/></td>
					<td><html:text property="fechaNombramiento" size="10" maxlength="10"/></td>
					<td class="msgError"><html:errors property="fechaNombramiento"/></td>
				</tr>
				<tr>
					<td><fmt:message key="empleo.campo.fechaCese"/></td>
					<td><html:text property="fechaCese" size="10" maxlength="10"/></td>
					<td class="msgError"><html:errors property="fechaCese"/></td>
				</tr>
				<tr>
					<td><fmt:message key="empleo.campo.tratamiento"/></td>
					<td><html:text property="tratamiento" size="80" maxlength="70"/></td>
					<td class="msgError"><html:errors property="tratamiento" /></td>
				</tr>
				<tr>
					<td><fmt:message key="empleo.campo.referencia"/></td>
					<td><html:text property="referencia" size="30" maxlength="20"/></td>
					<td class="msgError"><html:errors property="referencia" /></td>
				</tr>
				<tr>
					<td><fmt:message key="empleo.campo.tipo"/></td>
					<td>
						<fmt:message key="empleo.campo.tipo.funcionario"/>
						<html:radio property="tipo" value="F"/>
						<fmt:message key="empleo.campo.tipo.laboral"/>
						<html:radio property="tipo" value="X"/>
					</td>
					<td class="msgError"><html:errors property="tipo"/></td>
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

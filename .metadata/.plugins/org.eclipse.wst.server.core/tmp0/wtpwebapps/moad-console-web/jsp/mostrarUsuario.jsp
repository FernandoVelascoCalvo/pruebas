<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="mostrarUsuario.titulo"/></title>
	</head>
	<body> 
		<p class="azul"><fmt:message key="mostrarUsuario.subtitulo"/></p>
		<p class="info"><fmt:message key="mostrarUsuario.comentario"/></p>
		
		<table class="formulario">
			<thead><tr><td colspan="2"></td></tr></thead>
			<tbody>
				<tr class="trimpar">
				     <td><fmt:message key="usuario.campo.codigo"/></td>
				     <td><bean:write property="codigo" name="usuario"/></td>
				</tr>
				<tr class="trpar">
				     <td><fmt:message key="usuario.campo.usuario"/></td>
				     <td><bean:write property="usuario" name="usuario"/></td>
				</tr>
				<tr class="trimpar">
				     <td><fmt:message key="usuario.campo.dni"/></td>
				     <td><bean:write property="dni" name="usuario"/></td>
				</tr>
				<tr class="trpar">    
				     <td><fmt:message key="usuario.campo.nombre"/></td>
				     <td><bean:write property="nombre" name="usuario"/></td>
				</tr>   
				<tr class="trimpar"> 
				     <td><fmt:message key="usuario.campo.apellido1"/></td>
				     <td><bean:write property="apellido1" name="usuario"/></td>
				</tr>  
				<tr class="trpar"> 
				     <td><fmt:message key="usuario.campo.apellido2"/></td>
				     <td><bean:write property="apellido2" name="usuario"/></td>
				</tr>
				<tr class="trimpar">     
				     <td><fmt:message key="usuario.campo.sexo"/></td>
				     <td><bean:write property="sexo" name="usuario"/></td>
				</tr>  
				<tr class="trpar">
			 		<td><fmt:message key="usuario.campo.fechaAlta"/></td>
				    <td><bean:write property="fechaAlta" name="usuario" format="dd/MM/yyyy"/></td>
				</tr>
				<tr class="trimpar">
				     <td><fmt:message key="usuario.campo.fechaBaja"/></td>
				     <td><bean:write property="fechaBaja" name="usuario" format="dd/MM/yyyy"/></td>
				</tr>
				<tr class="trpar">
				     <td><fmt:message key="usuario.campo.estado"/></td>
				     <td><bean:write property="estadoUsuario.nombre" name="usuario"/></td>
				</tr>
				<tr class="trimpar">
				     <td><fmt:message key="usuario.campo.publico"/></td>
				     <td>
					     <logic:equal name="usuario" property="publico" value="true">
					     	<c:out value="Si"/>
					     </logic:equal>
					     <logic:equal name="usuario" property="publico" value="false">
					     	<c:out value="No"/>
					     </logic:equal>
				     </td>
				</tr>
				<tr class="trpar">
					<td><fmt:message key="usuario.campo.tipoVia"/></td>
					<td>
						<logic:present name="usuario" property="tipoVia">
							<bean:write property="tipoVia.descripcion" name="usuario"/>
						</logic:present>
					</td>
				</tr>
				<tr class="trimpar">
				     <td><fmt:message key="usuario.campo.nombreVia"/></td>
				     <td><bean:write property="nombreVia" name="usuario"/></td>
				</tr>
				<tr class="trpar">
				     <td><fmt:message key="usuario.campo.numero"/></td>
				     <td><bean:write property="numero" name="usuario"/></td>
				</tr>
				<tr class="trimpar">
				     <td><fmt:message key="usuario.campo.letra"/></td>
				     <td><bean:write property="letra" name="usuario"/></td>
				</tr>
				<tr class="trpar">
				     <td><fmt:message key="usuario.campo.escalera"/></td>
				     <td><bean:write property="escalera" name="usuario"/></td>
				</tr>
				<tr class="trimpar">
				     <td><fmt:message key="usuario.campo.piso"/></td>
				     <td><bean:write property="piso" name="usuario"/></td>
				</tr>
				<tr class="trpar">
				     <td><fmt:message key="usuario.campo.puerta"/></td>
				     <td><bean:write property="puerta" name="usuario"/></td>
				</tr>
				<tr class="trimpar">
				     <td><fmt:message key="usuario.campo.municipio"/></td>
					<td>				     
						<logic:present name="usuario" property="municipio">
							<bean:write property="municipio.descripcionBreve" name="usuario"/>
						</logic:present>
					</td>
				</tr>
				<tr class="trpar">
				     <td><fmt:message key="usuario.campo.provincia"/></td>
					<td>				     
						<logic:present name="usuario" property="provincia">
							<bean:write property="provincia.descripcionBreve" name="usuario"/>
						</logic:present>
					</td>
				</tr>
				<tr class="trimpar">
				     <td><fmt:message key="usuario.campo.telefono"/></td>
				     <td><bean:write property="telefono" name="usuario"/></td>
				</tr>
				<tr class="trpar">
					<td><fmt:message key="usuario.campo.movil"/></td>
				     <td><bean:write property="movil" name="usuario"/></td>
				</tr>
				<tr class="trimpar">
					<td><fmt:message key="usuario.campo.fax"/></td>
				     <td><bean:write property="fax" name="usuario"/></td>
				</tr>
				<tr class="trpar">
				     <td><fmt:message key="usuario.campo.email"/></td>
				     <td><bean:write property="email" name="usuario"/></td>
				</tr>
			</tbody>    
		</table>

		<div class="confirmar">
			<html-el:form action="listadoUsuarios.do">
				<input type="hidden" name="d-6570285-p" value="<c:out value="${param['d-6570285-p']}"/>" />
				<input type="hidden" name="filtro" value="<c:out value="${param.filtro}"/>" />
				<html:submit styleClass="boton_submit">
					<fmt:message key="comun.boton.volver"/>
				</html:submit>
	        </html-el:form>
	    </div>
	</body>
</html>
		
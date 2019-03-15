<%@ include file="/common/taglibs.jsp"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.spring.SecurityContextHelper"%>
<%@page import="es.ja.cice.pct.moad.webapp.security.ConstantesSecurity"%>

<html>
	<head>
		<title><fmt:message key="editarAplicacion.titulo"/></title>
	</head>
	<body>
	
	<% String estiloSoloLectura = SecurityContextHelper.obtenerEstiloSoloLectura(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
	<% boolean modoEdicion = SecurityContextHelper.tienePrivilegio(ConstantesSecurity.MOAD_PV_GESTAB_EDICION); %>
		
    <script type="text/javascript">

	    function showButtonsChangePassword(){

	    	if (document.getElementsByName("username")[0].disabled == true) {
	    	    document.getElementById("usuario").style.visibility = "visible";
                document.getElementById("usuario").style.display = "block";
	    	    
	    	  	document.getElementsByName("username")[0].disabled = false;
	    	} else {
	    	    document.getElementById("usuario").style.visibility = "hidden";
                document.getElementById("usuario").style.display = "none";
	    	    
	    	    document.getElementsByName("username")[0].disabled = true;
	    	}
	    }

	    function setActionChangePassword() {
	   		 var accion = document.getElementsByName("accion");
	         accion[0].value = "cambioContrasena";
	    }

	    function setActionResetPassword() {
	   		 var accion = document.getElementsByName("accion");
	         accion[0].value = "resetContrasena";
	    }


	</script>


		<p class="azul"><fmt:message key="editarAplicacion.subtitulo"/></p>
		<p class="info"><fmt:message key="editarAplicacion.comentario"/></p>

		<c:set var="formAction" value="/crearAplicacion.do"/>
		<logic:greaterEqual name="editarAplicacionForm" property="idAplicacion" value="1">
			<c:set var="formAction" value="/editarAplicacion.do"/>
		</logic:greaterEqual>

		<html-el:form action="${formAction}">
			<input type="hidden" name="accion" value="guardar" />
			<input type="hidden" name="show" value="true" />
			<input type="hidden" name="d-8216685-p" value="<c:out value="${param['d-8216685-p']}"/>" />
			<html:hidden property="cdUsuarios"/>
			<html:hidden property="contrasenaSinEncriptar"/>
			<html-el:hidden property="idAplicacion"/>


			<table class="formulario">
				<thead><tr><td colspan="3"></td></tr></thead>
				<tr>
					<td><fmt:message key="aplicacion.campo.codigo"/></td>
					<td><html:text property="codigo"         size="30" maxlength="20" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="codigo"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.nombre"/></td>
					<td><html:text property="nombre" size="40" maxlength="40" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="nombre"/></td>
				</tr>
				<tr>
					<td><fmt:message key="comun.campo.descripcion"/></td>
					<td><html:text property="descripcion" size="80" maxlength="1000" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					<td class="msgError"><html:errors property="descripcion" /></td>
				</tr>
				<tr>
					<td><fmt:message key="aplicacion.campo.presentable"/></td>
					<td>
						<html:checkbox property="presentable" disabled="<%=!modoEdicion %>"/>
						<fmt:message key="editarAplicacion.nota.presentable"/>
					</td>

				</tr>
			</table>

			<table>       
				<tr>
					<td width="2%">
						<html:checkbox property="accesoServioWeb" onclick="javascript:showButtonsChangePassword();" disabled="<%=!modoEdicion %>"/>
					</td width="50%">
					<td width="48%"><fmt:message key="comun.campo.descripcion.accesowebservice"/></td>
				</tr>
			</table>
            <bean:define id="habilitarAcceso" name="editarAplicacionForm" property="accesoServioWeb"/>
            <c:choose>
                <c:when test="${habilitarAcceso == true}">            
                    <div id="usuario" style="visibility: visible; display: block">
                </c:when>
            <c:otherwise>
                <div id="usuario" style="visibility: hidden; display: none">
            </c:otherwise>
            </c:choose>
            
            
			<table class="ventana">
                <tr>
                    <td colspan="3">
                        <p class="info"><fmt:message key="editarAplicacion.comentario.username"/></p>
                    </td>
                </tr>
				<tr>
					<td width="10%">&nbsp;</td>
					<td width="45%">&nbsp;</td>
					<td width="45%">&nbsp;</td>
				</tr>
				<tr>
					<td width="10%"><fmt:message key="comun.campo.descripcion.username"/></td>
					<td width="45%">
                    <c:choose>
                        <c:when test="${habilitarAcceso == true}">            
                            <html:text property="username" size="20" maxlength="20" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/>
                        </c:when>
                        <c:otherwise>
                            <html:text property="username" size="20" maxlength="20" disabled="true"/>
                        </c:otherwise>
                    </c:choose>
					</td>
					<td width="45%" class="msgError"><html:errors property="username"/></td>
				</tr>
				<logic:equal name="editarAplicacionForm" property="mostrarContrasena" value="true">
		   		    <tr>
						<td width="10%" colspan="3"><fmt:message key="comun.campo.descripcion.contrasena" >
						    <fmt:param value="${contrasenaSinEncriptar}"/>	</fmt:message>
						</td>
					</tr>
				</logic:equal>
				<% if(modoEdicion){%>
				<tr>
				   <td>&nbsp;</td>
				</tr>
				<tr>
				   <td>&nbsp;</td>
				   <td>
				   
					 <logic:equal name="editarAplicacionForm" property="mostrarBotonesCambioContrasena" value="true">
                        <div class="confirmar">                     
         	  			    <input type="hidden" name="accion" value="cambiarContrasena" />
    						<html:submit styleId="cambiarContrasena" onclick="javascript:setActionChangePassword()">
    							<fmt:message key="usuario.enlace.cambiarContrasena"/>
    						</html:submit>
    					    <html:submit styleId="cambiarContrasena" onclick="javascript:setActionResetPassword()">
    							<fmt:message key="usuario.enlace.resetearContrasena"/>
    						</html:submit>
					
                        </div>
					 </logic:equal>
					</td>
				</tr>
				 <%} else{ %>
					<tr>
						<td><fmt:message key="aplicacion.campo.contrasena"/></td>
						<td><html:password property="contrasenaSoloLectura" styleClass="<%=estiloSoloLectura %>" readonly="<%=!modoEdicion %>"/></td>
					</tr>
				
				 <%} %>
			</table>
            </div>
        
			<div class="confirmar">
				<% if(modoEdicion){%>
				<html:submit styleClass="boton_submit" >
					<fmt:message key="comun.boton.guardar"/>
				</html:submit>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.cancelar"/>
				</html:cancel>
				<%} else{ %>
				<html:cancel styleClass="boton_submit">
					<fmt:message key="comun.boton.volver"/>
				</html:cancel>
				<%} %>
			</div>


		</html-el:form>
	</body>
</html>
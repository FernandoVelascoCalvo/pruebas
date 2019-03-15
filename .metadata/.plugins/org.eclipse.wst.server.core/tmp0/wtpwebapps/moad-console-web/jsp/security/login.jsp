<%@page import="es.juntadeandalucia.cmi.pct.componentes.afirma.core.beans.autenticacion.DefinicionAutenticacionMiniApplet"%>
<%@ include file="/common/taglibs.jsp"%>

<html>
	<head>
		<title><fmt:message key="login.titulo"/></title>
		
		<c:if test="${MOAD_AUTH_MODEL == 'cd'}">
			<script type="text/javascript" src="<c:url value='/miniapplet/miniapplet.js'/>"></script>
			<script type="text/javascript" src="<c:url value='/scripts/firmar.js'/>"></script>
		</c:if>
		
		<script type="text/javascript">
		function autocompletarPasswordOff() {
			if (document.getElementsByTagName) {
				var inputElements = document.getElementsByTagName("input");
				for (i=0; inputElements[i]; i++) {
					inputElements[i].setAttribute("autocomplete","off");
				}
			}
		}
		</script>
	</head>
	<body class="login">
	
		<c:if test="${MOAD_AUTH_MODEL == 'cd'}">
			<script type="text/javascript">
				MiniApplet.cargarMiniApplet('<%=request.getContextPath()%>/miniapplet/');
				MiniApplet.setLocale('es_ES');
				MiniApplet.checkTime(MiniApplet.CHECKTIME_RECOMMENDED, 60000, '<%=request.getContextPath()%>/miniapplet/archivo_chico.png');
				//MiniApplet.setStickySignatory(true);
			</script>
		</c:if>

		<c:choose>
			<c:when test="${!empty param.errorLogin and MOAD_AUTH_MODEL == 'lp'}">
		 		<logic:notEqual value="1" parameter="errorLogin">
		 			<logic:notEqual value="7" parameter="errorLogin">
		 				<h1><fmt:message key="login.cambio.subtitulo"/></h1>
		 			</logic:notEqual>
		 		</logic:notEqual>
		 		<logic:equal value="1" parameter="errorLogin">
		 			<h1><fmt:message key="login.subtitulo"/></h1>
		 		</logic:equal>
		 		<logic:equal value="7" parameter="errorLogin">
		 			<h1><fmt:message key="login.subtitulo"/></h1>
		 		</logic:equal>
		 	</c:when>
		 	<c:otherwise>
		 		<h1><fmt:message key="login.subtitulo"/></h1>
		 	</c:otherwise>
	 	</c:choose>
		<p class="info"><fmt:message key="login.comentario"/></p>

        <c:if test="${MOAD_AUTH_MODEL == 'lp'}">
		<form action="j_spring_security_check" method="POST">
			<jsp:include page="/common/mensajeError.jsp" />
			<table>
				<tr>
					<th>
						<label for="j_username"><fmt:message key="login.campo.usuario"/></label>
					</th>
					<td>
						<input type="text" id="j_username" name="j_username" />
					</td>
				</tr>
				<tr>
					<th>
						<label for="j_password"><fmt:message key="login.campo.contrasena"/></label>
					</th>
					<td>
						<input type="password" id="j_password" name="j_password" />
					</td>
	 			</tr>
	 			<logic:present parameter="errorLogin">
	 				<logic:notEqual value="1" parameter="errorLogin">
	 				<logic:notEqual value="7" parameter="errorLogin">
	 				<tr>
	 					<th>
	 						<label for="j_newpassword"><fmt:message key="login.campo.nuevacontrasena"/></label>
	 					</th>
	 					<td>
	 						<input type="password" id="j_new_password" name="j_new_password"/>
	 					</td>
	 				</tr>

	 				<tr>
		 				<th>
		 					<label for="j_newpasswordrep"><fmt:message key="login.campo.nuevacontrasenarep"/></label>
		 				</th>
		 				<td>
		 					<input type="password" id="j_new_password_rep" name="j_new_password_rep"/>
		 				</td>
	 				</tr>

	 				</logic:notEqual>
	 				</logic:notEqual>
	 			</logic:present>

	 			<tr>
	 				<td colspan="2">
						<div class="confirmar">
							<html:submit styleClass="btn_aceptar">
								<fmt:message key="comun.boton.imagen.aceptar" />
							</html:submit>
						</div>
					</td>
				</tr>
			</table>
		</form>
        </c:if>
        
        <c:if test="${MOAD_AUTH_MODEL == 'cd'}">
        <form name="autenticacionFormWeb" action="j_spring_security_check" method="POST">
            <jsp:include page="/common/mensajeError.jsp" />
            <input type="hidden" id="j_username" name="j_username" value="certificadoDigital" />
            <input type="hidden" id="j_password" name="j_password" value="certificadoDigital" />
            
            <%
            	DefinicionAutenticacionMiniApplet def = (DefinicionAutenticacionMiniApplet)session.getAttribute(DefinicionAutenticacionMiniApplet.NOMBRE_IDENTIFICADOR_SESION);
            	boolean hayDatosFirma = false;
            	String datosFirmaDef = "";
            	String formatoFirmaDef = "";
            	String algoritmoResumenDef = "";
            	if (null != def)
            	{
            		datosFirmaDef = def.getDatoFirmaHash();
            		formatoFirmaDef = def.getFormatoFirmaApplet();
            		algoritmoResumenDef = def.getAlgoritmoResumenApplet();
            		hayDatosFirma = (null != datosFirmaDef && !datosFirmaDef.isEmpty());
            	}
            %>
            
            <html:hidden property="datosFirma" value="<%= datosFirmaDef%>"/>
			<html:hidden property="formatoFirma" value="<%= formatoFirmaDef%>"/>
			<html:hidden property="algoritmoResumen" value="<%= algoritmoResumenDef%>"/>
			<html:hidden property="datosFirmados" value=""/>
            
            <table>
                <tr>
                	<% 
                		if (hayDatosFirma)
                		{
                	%>
	                    <td>
	                        <div class="confirmar">
	                            <fmt:message key="login.nota.certificadoDigital"/><br/>
	                            <img alt="Entrada con Certificado" title="Entrada con Certificado" 
	                                src="images/entrar_A.gif"/><br/>
	                            <div class="btn_aceptar" onclick="firmar(document.forms['autenticacionFormWeb'].datosFirma.value, document.forms['autenticacionFormWeb'].formatoFirma.value, document.forms['autenticacionFormWeb'].algoritmoResumen.value);"/>
	                        </div>
	              </tr>
	              <tr>          
	                        <div id="mensaje_firmando" class="confirmar" style="border-style: dashed; border-width: 1px; background-color: #FFFFE1; border-color: #087021; display: none;">
								<div class="campo">
									<span>Se est&#225;n recopilando los datos para poder finalizar el proceso de autenticación.</span>
								</div>
							</div>
							
							<div id="mensaje_enviando" class="confirmar" style="border-style: dashed; border-width: 1px; background-color: #C4D79B; border-color: #087021; display: none;">
								<div class="campo">
									<span>Se ha finalizado con &#233;xito la recuperaci&#243;n de los datos y est&#225;n siendo procesados por parte del servidor. Este proceso puede demorarse en el tiempo, sea paciente.</span>
								</div>
							</div>
	                    </td>
	              </tr>
	              <tr>
	                    <td>
	                    	<hr>
	                    	<br>
	                    	<div class="confirmar">
								<span>Con el siguiente enlace podr&#225; comprobar si su equipo es compatible con el sistema para poder finalizar el proceso de autenticaci&#243;n, adem&#225;s de comprobar si su equipo es compatible para la realizaci&#243;n de firma de documentaci&#243;n en la plataforma.</span>
								<br>
								<a href="https://ws024.juntadeandalucia.es/afirma-validator/validator.action?clientVersion=miniapplet_1.4&signatureFormat=CADES&signatureMode=EXPLICIT&callbackUrl=<%=request.getRequestURL()%>"
									target="_blank">Compruebe aqu&#237; si su equipo es compatible</a>
							</div>
	                    </td>
	                <% 
                		}
                		else
                		{
                	%>
						<td>
							<div class="confirmar">
								<span>No se encuentran definidos los datos para poder finalizar el proceso de autenticaci&#243;n por medio de certificado digital. Proceda a cerrar el navegador y vuelva a intentar el proceso de autenticaci&#243;n.</span>
							</div>
						</td>
					<% 
                		}
                	%>
                </tr>
            </table>
        </form>
        </c:if>
		<script type="text/javascript">
			document.getElementById('j_username').focus();
			autocompletarPasswordOff();
		</script>
</html>

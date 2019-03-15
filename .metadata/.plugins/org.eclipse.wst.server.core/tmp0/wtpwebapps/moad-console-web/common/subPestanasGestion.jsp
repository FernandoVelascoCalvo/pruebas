<%@ include file="/common/taglibs.jsp"%>

			<div id="pestanas_listadoScroll">
				<ul>
					<li>
						<html-el:link href="listadoListados.do" styleClass="${tabListados}">
							<fmt:message key="listado.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<html-el:link href="listadoRoles.do" styleClass="${tabRoles}">
							<fmt:message key="rol.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<html-el:link href="listadoHerramientas.do" styleClass="${tabHerramientas}">
							<fmt:message key="herramienta.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<c:url var="enlace" value="/listadoConfiguraciones.do">
							<c:param name="idProcedimiento" value="0"/>				
						</c:url>
						<html-el:link href="${enlace}" styleClass="${tabConfiguraciones}">
							<fmt:message key="configuracion.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<html-el:link href="listadoAplicaciones.do" styleClass="${tabAplicaciones}">
							<fmt:message key="aplicacion.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<html-el:link href="listadoOficinas.do" styleClass="${tabOficinas}">
							<fmt:message key="oficina.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<html-el:link href="listadoTiposCertificados.do" styleClass="${tabTiposCertificados}">
							<fmt:message key="tiposCertificados.subpestana"/>
						</html-el:link>
					</li>
					<li>
						<html-el:link href="listadoMenus.do" styleClass="${tabMenus}">
							<fmt:message key="menus.subpestana"/>
						</html-el:link>
					</li>
					<!-- AMSR - I -->
					<li>
						<html-el:link href="listadoConfiguracionTrewa.do" styleClass="${tabConfiguracionTrewa}">
							<fmt:message key="confTrewa.subpestana"/>
						</html-el:link>
					</li>
					<!-- AMSR - F -->
				</ul>
			</div>

<%@ include file="/common/taglibs.jsp"%>

		<logic:messagesPresent message="true" property="MOADERROR">
			<span class="msj_error">
				<html:messages id="MOADERROR" message="true" name="MOADERROR">
					<bean:write name="MOADERROR"/>
				</html:messages>
			</span>
		</logic:messagesPresent>
			
		<logic:messagesPresent message="true" property="MOADWARN">
			<span class="msj_warning">
				<html:messages id="MOADWARN" message="true" name="MOADWARN">
					<bean:write name="MOADWARN"/>
				</html:messages>
			</span>
		</logic:messagesPresent>

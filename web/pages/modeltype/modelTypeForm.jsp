<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<app:pageHeading entityName="${modelType.modelTypeName}" entityHeadingKey="modelTypeDetail.heading" />
<content tag="buttons">
	<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoSave(this);" />
	<%--
	<cartmatic:cartmaticBtn btnType="saveAndNext" onclick="return fnDoSaveAndNext(this);" />
	--%>
    <c:if test="${modelType.modelTypeId!=null}">
		<cartmatic:cartmaticBtn btnType="delete" onclick="return fnDoDelete(this);" />
	</c:if>
	<cartmatic:cartmaticBtn btnType="cancel" onclick="return fnDoCancelForm(this);" />
</content>
<app:showBindErrors bindPath="modelType.*" />
	<form:form method="post" cssClass="mainForm" id="modelType" commandName="modelType"
			action="${ctxPath}/modeltype/modelType.html" onsubmit="return validateModelType(this);">
		<input type="hidden" name="modelTypeId" value="${modelType.modelTypeId}"/> 
		<table class="table-content" cellSpacing="0" cellPadding="0" width="100%" border="0">
		<app:input property="name" />
 		<tr>
			<td class="FieldLabel">
				创建者：
			</td>
			<td>
				${modelType.writer}
			</td>
	    </tr>
	    <app:formText label="common.message.createTime" value="${modelType.createTime}" />
 		<app:input property="remarks" /><%--
 		<app:input property="barOne" />
 		<app:input property="barTwo" />
 		<app:input property="barThree" />
  	--%></table>
</form:form>

<v:javascript formName="modelType" staticJavascript="false" />
<script type="text/javascript">
    document.forms["modelType"].elements["name"].focus();
</script>

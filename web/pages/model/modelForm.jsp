<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<app:pageHeading entityName="${model.modelName}" entityHeadingKey="modelDetail.heading" />
<content tag="buttons">
	<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoSave(this);" />
	<%--
	<cartmatic:cartmaticBtn btnType="saveAndNext" onclick="return fnDoSaveAndNext(this);" />
	--%>
    <c:if test="${model.modelId!=null}">
		<cartmatic:cartmaticBtn btnType="delete" onclick="return fnDoDelete(this);" />
	</c:if>
	<cartmatic:cartmaticBtn btnType="cancel" onclick="return fnDoCancelForm(this);" />
</content>
<app:showBindErrors bindPath="model.*" />
	<form:form method="post" cssClass="mainForm" id="model" commandName="model"
			action="${ctxPath}/model/model.html" onsubmit="return validateModel(this);">
		<input type="hidden" name="modelId" value="${model.modelId}"/> 
		<table class="table-content" cellSpacing="0" cellPadding="0" width="100%" border="0">
		<app:input property="name" />
		<tr>
			<td class="FieldLabel">
				状态：
			</td>
			<td>
				激活
				<input type="radio" value="0" name="state"
					<c:if test="${model.state==0||model.state==null}" >checked</c:if>>
				&nbsp;&nbsp;&nbsp; 非激活
				<input type="radio" value="1" name="state"
					<c:if test="${model.state==1}" >checked</c:if>>
			</td>
		</tr>
 		<tr>
			<td class="FieldLabel">
				已被用次数 (*):
			</td>
			<td>
				${model.choiceNum}
			</td>
	    </tr>
	    
 		  <tr>
			<td class="FieldLabel">
				文案：
			</td>
			<td>
				<textarea id="remarks" name="remarks" rows="4" cols="80" class="Field400">${model.remarks}</textarea>
			</td>
	    </tr>
 		<app:formText label="common.message.createTime" value="${model.createTime}" />
 		
 		 <tr>
			<td class="FieldLabel">
				创建者：
			</td>
			<td>
				${model.writer}
			</td>
	    </tr>
	    
	    		<tr>
			<td class="FieldLabel">
			  模板截图介绍一:
			</td>
				<c:if test="${!empty  model.imga}">
			<td>
			  <img src="${mediaPath}other/${model.imga}" width="450px" height="530px"/>
			</td>
			</c:if>
			<td>
				<div style="float: left;">
					<cartmatic:img url="${model.imga}"
						mediaType="other" id="logoImagea" height="100" width="100"></cartmatic:img>
				</div>
				<div style="float: left; margin: 20px;">
					<span id="logoImageBtnPlaceHolderId"></span>
					<input type="hidden" id="imga" name="imga"
						value="${model.imga}" />
					<cartmatic:iconBtn icon="cross" extraCss="negative" text="清空图片"
						onclick="$('logoImagea').src='${ctxPath}/images/default/00.jpg';$j('#imga').val('');" />
				</div>
				<cartmatic:swf_upload btnPlaceHolderId="logoImageBtnPlaceHolderId"
					uploadCategory="other" uploadFileTypes="*.jpg; *.jpeg; *.png; *.gif" fileInputId="imga"
					previewImg="logoImagea"></cartmatic:swf_upload>
			</td>
			
		</tr>
		
				<tr>
			<td class="FieldLabel">
				${model.imgb}模板截图介绍二:
			</td>
			<c:if test="${! empty model.imgb}">
			<td>
			  <img src="${mediaPath}other/${model.imgb}" width="450px" height="530px"/>
			</td>
			</c:if>
			<td>
				<div style="float: left;">
					<cartmatic:img url="${model.imgb}"
						mediaType="other" id="logoImageb" height="100" width="100"></cartmatic:img>
				</div>
				<div style="float: left; margin: 20px;">
					<span id="logoImageBtnPlaceHolderId"></span>
					<input type="hidden" id="imgb" name="imgb"
						value="${model.imgb}" />
					<cartmatic:iconBtn icon="cross" extraCss="negative" text="清空图片"
						onclick="$('logoImageb').src='${ctxPath}/images/default/00.jpg';$j('#imgb').val('');" />
						
				</div>
				<cartmatic:swf_upload btnPlaceHolderId="logoImageBtnPlaceHolderId"
					uploadCategory="other" uploadFileTypes="*.jpg; *.jpeg; *.png; *.gif" fileInputId="imgb"
					previewImg="logoImageb"></cartmatic:swf_upload>
			</td>
		</tr>
		
				<tr>
			<td class="FieldLabel">
				模板截图介绍三:
			</td>
				<c:if test="${!empty model.imgc}">
			<td>
			  <img src="${mediaPath}other/${model.imgc}" width="450px" height="530px"/>
			</td>
			</c:if>
			<td>
				<div style="float: left;">
					<cartmatic:img url="${model.imgc}"
						mediaType="other" id="logoImagec" height="100" width="100"></cartmatic:img>
				</div>
				<div style="float: left; margin: 20px;">
					<span id="logoImageBtnPlaceHolderId"></span>
					<input type="hidden" id="imgc" name="imgc"
						value="${model.imgc}" />
					<cartmatic:iconBtn icon="cross" extraCss="negative" text="清空图片"
						onclick="$('logoImagec').src='${ctxPath}/images/default/00.jpg';$j('#imgc').val('');" />
				</div>
				<cartmatic:swf_upload btnPlaceHolderId="logoImageBtnPlaceHolderId"
					uploadCategory="other" uploadFileTypes="*.jpg; *.jpeg; *.png; *.gif" fileInputId="imgc"
					previewImg="logoImagec"></cartmatic:swf_upload>
			</td>
		</tr>
	    
	    <%--
 		<app:input property="barOne" />
 		<app:input property="barTwo" />
 		<app:input property="barThree" />
  	--%></table>
</form:form>

<v:javascript formName="model" staticJavascript="false" />
<script type="text/javascript">
    document.forms["model"].elements["name"].focus();
</script>

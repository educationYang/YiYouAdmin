<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<app:pageHeading entityName="${modelOrder.modelOrderName}" entityHeadingKey="modelOrderDetail.heading" />
<content tag="buttons">
	<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoSave(this);" />
	<%--
	<cartmatic:cartmaticBtn btnType="saveAndNext" onclick="return fnDoSaveAndNext(this);" />
	--%>
    <c:if test="${modelOrder.modelOrderId!=null}">
		<cartmatic:cartmaticBtn btnType="delete" onclick="return fnDoDelete(this);" />
	</c:if>
	<cartmatic:cartmaticBtn btnType="cancel" onclick="return fnDoCancelForm(this);" />
</content>
<app:showBindErrors bindPath="modelOrder.*" />
	<form:form method="post" cssClass="mainForm" id="modelOrder" commandName="modelOrder"
			action="${ctxPath}/modelorder/modelOrder.html" onsubmit="return validateModelOrder(this);">
		<input type="hidden" name="modelOrderId" value="${modelOrder.modelOrderId}"/> 
		<table class="table-content" cellSpacing="0" cellPadding="0" width="100%" border="0">
		<app:input property="ordernum" />
 		<app:formText label="common.message.createTime" value="${modelOrder.createTime}" />
  		
  		<tr>
			<td class="FieldLabel">
				订单状态：
			</td>
			<td>
			  <c:choose >
				  <c:when test="${modelOrder.orderState==0}"><font color="orange">完成</font></c:when>
				  <c:when test="${modelOrder.orderState==1}"><font color="blue">未完成</font></c:when>
				  <c:when test="${modelOrder.orderState==2}"><font color="red">紧急且未完！</font></c:when>
				  <c:otherwise>   
   					<font color="red">有异常，请联系管理员<font>
  				</c:otherwise> 
				</c:choose>
			</td>
	    </tr>
 			<tr>
			<td class="FieldLabel">
				审单状态：
			</td>
			<td>
			<c:choose >
				  <c:when test="${modelOrder.checkState==0}"><font color="green">已审</font></c:when>
				  <c:when test="${modelOrder.checkState==1}"><font color="red">未审</font></c:when>
				  <c:otherwise>   
   					<font color="red">有异常，请联系管理员<font>
  				</c:otherwise> 
				</c:choose>
			</td>
	    </tr>
	    
	    <app:input property="modelId" />
 		<app:input property="remarks" />
 		  <tr>
			<td class="FieldLabel">
			<font color="red">注意:</font>
			</td>
			<td>
			<font color="red">客户填充信息自上而下，从左到右填写！</font>    
			</td>
	    </tr>
	    <tr>
			<td class="FieldLabel">
				客户信息一：
			</td>
			<td>
			   <textarea id="bara" name="bara" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.bara}</textarea>
			   	<app:ui_htmlEditor textareaIds="bara" />
			</td>
	    </tr>
    <tr>
			<td class="FieldLabel">
				客户信息二：
			</td>
			<td>
			   <textarea id="barb" name="barb" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barb}</textarea>
			   	<app:ui_htmlEditor textareaIds="barb" />
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息三：
			</td>
			<td>
			   <textarea id="barc" name="barc" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barc}</textarea>
			   	<app:ui_htmlEditor textareaIds="barc" />
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息四：
			</td>
			<td>
			   <textarea id="bard" name="bard" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.bard}</textarea>
			   	<app:ui_htmlEditor textareaIds="bard" />
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息五：
			</td>
			<td>
			   <textarea id="bare" name="bare" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.bare}</textarea>
			   	<app:ui_htmlEditor textareaIds="bare" />
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息六：
			</td>
			<td>
			   <textarea id="barf" name="barf" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barf}</textarea>
			   	<app:ui_htmlEditor textareaIds="barf" />
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息七：
			</td>
			<td>
			   <textarea id="barg" name="barg" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barg}</textarea>
			   	<app:ui_htmlEditor textareaIds="barg" />
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息八：
			</td>
			<td>
			   <textarea id="barh" name="barh" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barh}</textarea>
			   	<app:ui_htmlEditor textareaIds="barh" />
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息九：
			</td>
			<td>
			   <textarea id="barl" name="barl" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barl}</textarea>
			   	<app:ui_htmlEditor textareaIds="barl" />
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息十：
			</td>
			<td>
			   <textarea id="bari" name="bari" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.bari}</textarea>
			   	<app:ui_htmlEditor textareaIds="bari" />
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息十一：
			</td>
			<td>
			   <textarea id="barj" name="barj" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barj}</textarea>
			   	<app:ui_htmlEditor textareaIds="barj" />
			</td>
	    </tr>
	     <tr>
			<td class="FieldLabel">
				客户信息十二：
			</td>
			<td>
			   <textarea id="bark" name="bark" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.bark}</textarea>
			   	<app:ui_htmlEditor textareaIds="bark" />
			</td>
	    </tr>

  	</table>
</form:form>

<v:javascript formName="modelOrder" staticJavascript="false" />
<script type="text/javascript">
    document.forms["modelOrder"].elements["ordernum"].focus();
</script>

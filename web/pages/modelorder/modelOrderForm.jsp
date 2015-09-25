<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="model" tagdir="/WEB-INF/tags/model"%>


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
			action="${ctxPath}/modelorder/modelOrder.html" onsubmit="return validateModelOrderSubmit();">
		<input type="hidden" name="modelOrderId" value="${modelOrder.modelOrderId}"/> 
		<table class="table-content" cellSpacing="0" cellPadding="0" width="100%" border="0">
		
		<app:input property="ordernum" />
		
		<tr>
			<td class="FieldLabel">
				网页后缀名(注意不用加.html)：
			</td>
			<td>
			 <input type="text" id="domainName" name="domainName" value="${modelOrder.domainName}" onblur="checkExit(${modelOrder.domainName})"/>
			</td>
	    </tr>
	
	<c:if test="${modelOrder.modelOrderId!=null}">
 		<app:formText label="common.message.createTime" value="${modelOrder.createTime}" />
 		
  		<tr>
			<td class="FieldLabel">
				网页状态(需由淘宝人员更改)：
			</td>
			<td>
			  <c:choose >
				  <c:when test="${modelOrder.orderState==0}"><font color="orange">完成</font></c:when>
				  <c:when test="${modelOrder.orderState==1}"><font color="blue">未完成</font></c:when>
				  <c:when test="${modelOrder.orderState==2}"><font color="red">紧急且未完！</font></c:when>
				</c:choose>
			</td>
	    </tr>
	    
 		<tr>
			<td class="FieldLabel">
				是否已静态化页面：
			</td>
			<td>
			<c:choose >
				  <c:when test="${modelOrder.checkState==0}"><font color="green">已静态化</font></c:when>
				  <c:when test="${modelOrder.checkState==1}"><font color="red">未静态化</font></c:when>
				</c:choose>
			</td>
	    </tr>
	   
	   <c:if test="${modelOrder.checkState==0}">
	     <tr>
			<td class="FieldLabel">
				静态化访问路径：
			</td>
			<td>
		       <a href="${modelOrder.domainPath}">${modelOrder.domainPath}</a>
			</td>
	    </tr>
	   </c:if>
	 </c:if>
	      
	      <c:if test="${modelOrder.modelOrderId==null}">
	    		  <input type="hidden" name="orderState" value="1" />
	    		  <input type="hidden" name="checkState" value="1" />
	      </c:if>
	<tr>
			<td class="FieldLabel">
			选择网页模板:
			</td>
			<td>
				<input id="b1" type="button" class="admin-btn" value="网页模板"
					onclick="multiSupplierSelector_show('kkk_DIV')" />
					
				<input id="b2" type="button" class="admin-btn" value="清空"
					onclick="Reset(1)" />
					
				<model:modelSelector  title="网页模板选择"
					id="multiSupplierSelector" autoClose="true"
					ondblclick="fnTestSelectMultiCulSku" multiSelect="false"></model:modelSelector>
					
				新已选网页模板：
				<span id="arrayproductName"> </span>
				<br>
				原来网页模板：
				<span id="arrayproductNameOld">
				    ${modelOrder.model.name}
				</span>
				<input type="hidden" id="arrayculId" name="arrayculId"
					value="${modelOrder.model.modelId}" />
			</td>
    </tr>
    
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
			</td>
	    </tr>
    <tr>
			<td class="FieldLabel">
				客户信息二：
			</td>
			<td>
			   <textarea id="barb" name="barb" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barb}</textarea>
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息三：
			</td>
			<td>
			   <textarea id="barc" name="barc" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barc}</textarea>
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息四：
			</td>
			<td>
			   <textarea id="bard" name="bard" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.bard}</textarea>
			   	<%--<app:ui_htmlEditor textareaIds="bard" />
			--%></td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息五：
			</td>
			<td>
			   <textarea id="bare" name="bare" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.bare}</textarea>
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息六：
			</td>
			<td>
			   <textarea id="barf" name="barf" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barf}</textarea>
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息七：
			</td>
			<td>
			   <textarea id="barg" name="barg" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barg}</textarea><%--
			   	<app:ui_htmlEditor textareaIds="barg" />
			--%></td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息八：
			</td>
			<td>
			   <textarea id="barh" name="barh" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barh}</textarea>
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息九：
			</td>
			<td>
			   <textarea id="barl" name="barl" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barl}</textarea>
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息十：
			</td>
			<td>
			   <textarea id="bari" name="bari" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.bari}</textarea>
			</td>
	    </tr>    <tr>
			<td class="FieldLabel">
				客户信息十一：
			</td>
			<td>
			   <textarea id="barj" name="barj" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.barj}</textarea>
			</td>
	    </tr>
	     <tr>
			<td class="FieldLabel">
				客户信息十二：
			</td>
			<td>
			   <textarea id="bark" name="bark" rows="6" cols="20" style="width: 50%; height: 230px;">${modelOrder.bark}</textarea>
			</td>
	    </tr>

  	</table>
</form:form>

<v:javascript formName="modelOrder" staticJavascript="false" />
<script type="text/javascript">
    document.forms["modelOrder"].elements["ordernum"].focus();
</script>

<script type="text/javascript" defer="defer">
function validateModelOrderSubmit(){
	 var falg = true;
	if($j("#domainName").val().trim()==""){
          alert("网页后缀名不能为空");
          flag =false;
		}
	else if($j("#arrayculId").val().trim()==""){
		  alert("请选择相关模板");
		  flag =false;
		}
	//alert("flag:"+flag);
	return flag;
}


//选择器表单值重置
function Reset(type){
   if(type==1){
	    $j("#arrayculId").val("");
		$j("#arrayproductName").html("");
	   }	
}

//域名多名字检测
function checkExit(value){
   	var domainName=$j("#domainName").val();
   	if(domainName!=value){
   	 	$j.post(__ctxPath+"/modelorder/modelOrder.html?doAction=checkDomainNameExit",{
   	 		domainName : domainName
   		}, function(result) {
   			   // alert("result:"+result.status);
   				if (result.status == 0) {
   					alert("网页后缀名已经存在");
   					$j("#domainName").val("");
   				} else {
   				}
   			}, "json");
   	   	}

}



//选择器值设置表单准备提交
function senData(arrayproductId, arrayproductName,type) {
//	alert("senData:"+type+":"+arrayproductId+":"+arrayproductName);
	Reset(type);
	if(type==1){
		 arrayproductIdvalue=$j("#arrayculId").val();
		 arrayproductNamevalue=$j("#arrayproductName").html();
		}
	 if(type==1){
		 $j("#arrayculId").val(arrayproductIdvalue+arrayproductId);
			$j("#arrayproductName").html(arrayproductNamevalue+arrayproductName);
		}
}

//选择器值函数回调（文化）
function fnTestSelectMultiCulSku(productSku) {
	var arrayproductId ="";
	var arrayproductName = "";
	arrayproductId = productSku.modelId;
	arrayproductName = productSku.name;
	senData(arrayproductId, arrayproductName,1);
}


</script>

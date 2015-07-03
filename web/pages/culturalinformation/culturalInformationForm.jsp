<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cultural" tagdir="/WEB-INF/tags/cultural"%>

<app:pageHeading entityName="${culturalInformation.culturalInformationName}" entityHeadingKey="culturalInformationDetail.heading" />

<content tag="buttons">
	<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoSave(this);" />
	<%--
	<cartmatic:cartmaticBtn btnType="saveAndNext" onclick="return fnDoSaveAndNext(this);" />
	--%>
    <c:if test="${culturalInformation.culturalInformationId!=null}">
		<cartmatic:cartmaticBtn btnType="delete" onclick="return fnDoDelete(this);" />
	</c:if>
	<cartmatic:cartmaticBtn btnType="cancel" onclick="return fnDoCancelForm(this);" />
</content>


<app:showBindErrors bindPath="culturalInformation.*" />

<form:form method="post" cssClass="mainForm" id="culturalInformation" commandName="culturalInformation"
			action="${ctxPath}/culturalinformation/culturalInformation.html" onsubmit="return validateCulturalInformation(this);">
		<input type="hidden" name="culturalInformationId" value="${culturalInformation.culturalInformationId}"/> 
		<table class="table-content" cellSpacing="0" cellPadding="0" width="100%" border="0">
		<app:input property="title" />
 		<app:input property="commentNumber" />
 		<tr>
			<td class="FieldLabel">
				发布状态：
			</td>
			<td>
				正常<input type="radio" value="0" name="state" <c:if test="${culturalInformation.state==0||culturalInformation.state==null}" >checked</c:if>>
				&nbsp;&nbsp;&nbsp; 
				取消<input type="radio" value="1" name="state" <c:if test="${culturalInformation.state==1}" >checked</c:if>>
			</td>
		</tr>
 	<!-- 	<app:input property="releaseTime" /> -->
 		<tr>
			<td class="FieldLabel">
				发布时间：
			</td>
			<td>
			<input name="releaseTime" id="releaseTime" type="text" readonly="true" value="<fmt:formatDate value="${culturalInformation.releaseTime}" pattern="yyyy-MM-dd" />" />
				<app:ui_datePicker outPut="releaseTime" />
			</td>
		</tr>
 		<app:input property="readNumber" />
 		<app:input property="writer" />
 	<tr>
 		<td class="FieldLabel">类型</td>
 		<td><select name="type" id="type" style="width:150px"   >
			<option value="0" <c:if test="${culturalInformation.type ==0}">selected="selected" </c:if>>秀场</option>
			<option value="1" <c:if test="${culturalInformation.type ==1}">selected="selected" </c:if>>访谈</option>
			<option value="2" <c:if test="${culturalInformation.type ==2}">selected="selected" </c:if>>行业动态</option>
			<option value="3" <c:if test="${culturalInformation.type ==3}">selected="selected" </c:if>>线下主题活动</option>
			<option  onClick="getMonthShow()"  value="4" <c:if test="${culturalInformation.type ==4}">selected="selected" </c:if>>月刊</option>
		</select>
		</td>
	</tr>
	
	<tr id="monthdiv" >
 		<td class="FieldLabel"><a onClick="MonthImg()">点击添加月刊</a></td>
 		<td id="addImg">
		</td>
	</tr>
  	<tr>
			<td class="FieldLabel">
				LOGO:
			</td>
			<td>
				<div style="float: left;">
					<cartmatic:img url="${culturalInformation.logoImg}" mediaType="other" id="logoImage" height="100" width="100"></cartmatic:img>
				</div>
				<div style="float: left; margin: 20px;">
					<span id="logoImageBtnPlaceHolderId"></span>
					<input type="hidden" id="logo" name="logoImg" value="${culturalInformation.logoImg}" />
					<br/>
					(<fmt:message key="brand.logo.desc" />)
					<cartmatic:iconBtn icon="cross" extraCss="negative" text="清空图片" onclick="$('logoImage').src='${ctxPath}/images/default/00.jpg';$j('#logo').val('');" />
				</div>
				<cartmatic:swf_upload btnPlaceHolderId="logoImageBtnPlaceHolderId" uploadCategory="other" uploadFileTypes="*.jpg" fileInputId="logo" previewImg="logoImage" ></cartmatic:swf_upload>
			</td>
	    </tr>
	    <tr>
			<td class="FieldLabel">
				大图一：
			</td>
			<td>
				<div style="float: left;">
					<cartmatic:img url="${culturalInformation.imgOne}" mediaType="other" id="picImage" height="100" width="100"></cartmatic:img>
				</div>
				<div style="float: left; margin: 20px;">
					<span id="picImageBtnPlaceHolderId"></span>
					<input type="hidden" id="pic" name="imgOne" value="${culturalInformation.imgOne}" />
					<br/>
					<cartmatic:iconBtn icon="cross" extraCss="negative" text="清空图片" onclick="$('picImage').src='${ctxPath}/images/default/00.jpg';$j('#pic').val('');" />
				</div>
				<cartmatic:swf_upload btnPlaceHolderId="picImageBtnPlaceHolderId" uploadCategory="other" uploadFileTypes="*.jpg" fileInputId="pic" previewImg="picImage" ></cartmatic:swf_upload>
			</td>
	    </tr>
	    <tr>
			<td class="FieldLabel">
				大图二:
			</td>
			<td>
				<div style="float: left;">
					<cartmatic:img url="${culturalInformation.imgTwo}" mediaType="other" id="pic2Image" height="100" width="100"></cartmatic:img>
				</div>
				<div style="float: left; margin: 20px;">
					<span id="pic2ImageBtnPlaceHolderId"></span>
					<input type="hidden" id="pic2" name="imgTwo" value="${culturalInformation.imgTwo}" />
					<br/>
					<cartmatic:iconBtn icon="cross" extraCss="negative" text="清空图片" onclick="$('pic2Image').src='${ctxPath}/images/default/00.jpg';$j('#pic2').val('');" />
				</div>
				<cartmatic:swf_upload btnPlaceHolderId="pic2ImageBtnPlaceHolderId" uploadCategory="other" uploadFileTypes="*.jpg" fileInputId="pic2" previewImg="pic2Image" ></cartmatic:swf_upload>
			</td>
	    </tr>
	    
	        <tr>
			<td class="FieldLabel">
				推荐资询(支持多选，前台只展示前三个):
			</td>
			<td>
			    <input id="b1" type="button" class="admin-btn" value="文化资讯" onclick="multiSupplierSelector_show('kkk_DIV')"/>
	    <cultural:culturalSelector title="推荐资询选择"   id="multiSupplierSelector"  autoClose="true" ondblclick="fnTestSelectMultiProductSku"  multiSelect="true"></cultural:culturalSelector>
	            <span id="arrayproductName"></span>
	            <input type="hidden" id="arrayproductId" name="recommendArrayId"
					value="${culturalInformation.recommendArrayId}" />
			</td>
	    </tr>
	    <app:input property="metaKeywork" />
 		<app:input property="sortOrder" />
      <tr>
			<td class="FieldLabel">
			</td>
			<td>
			   编辑发布文章如果有视屏，支持rm,rmv,flash,mov,swf,wmv格式
			</td>
	 </tr>
 	    <app:input property="textIntroduction" />
		<app:ui_htmlEditor textareaIds="textIntroduction"/>
		<app:formText label="common.message.createTime" value="${culturalInformation.createTime}" />
		<!--	<app:input property="videoAddress" />-->
 		<app:input property="backOne" />
    <!-- 	<app:input property="backTwo" /> -->
  	</table>
</form:form>




<v:javascript formName="culturalInformation" staticJavascript="false" />
<script type="text/javascript">
    $j("#monthdiv").hide();
    document.forms["culturalInformation"].elements["title"].focus();
</script>


<script type="text/javascript" defer="defer">
function getMonthShow(){
	alert("hello");
	$j("#monthdiv").show();
}

function MonthImg(){
	alert("addMonthImg");
	var html ="<input type='file' id='' name='' >";
	$j("#addImg").append(html);  
}


function senData(arrayproductId, arrayproductName) {
	 arrayproductIdvalue=$j("#arrayproductId").val();
	 arrayproductNamevalue=$j("#arrayproductName").html();
	 
	 if(arrayproductIdvalue==""){
		 arrayproductIdvalue="";
		 }else{
			 arrayproductIdvalue+=",";
			 }
	 if(arrayproductNamevalue==""){
		 arrayproductNamevalue="";
		 }else{
			 arrayproductNamevalue+=",";
			 }
	$j("#arrayproductId").val(arrayproductIdvalue+arrayproductId);
	$j("#arrayproductName").html(arrayproductNamevalue+arrayproductName);
}

function fnTestSelectMultiProductSku(productSkuList) {
	//alert("fnTestSelectMultiProductSku")
	var data = "";
	var arrayproductId = new Array();
	var arrayproductName = new Array();
	for ( var i = 0; i < productSkuList.length; i++) {
		var productSku = productSkuList[i];
		data += "culturalInformationId:" + productSku.culturalInformationId + "\n";
		data += "title:" + productSku.title+ "\n";
		data += "writer:" + productSku.writer + "\n";
		arrayproductId[i] = productSku.culturalInformationId;
		arrayproductName[i] = productSku.title;
	}
    alert(arrayproductId.join());
	alert(arrayproductName.join());
	senData(arrayproductId.join(), arrayproductName.join());

}

</script>

<%@ include file="/common/taglibs.jsp"%>
<!-- ========== 列表内容开始 ========= -->
<display:table name="${supplierList}" cellspacing="0" cellpadding="0" uid="supplierItem" class="table-list" export="false" requestURI="">
	<c:if test="${param.multiSelect}">
	<display:column style="width: 1%"  media="html">
		<input type="checkbox" name="multiIds" id="sel_ch_${param.id}_${supplierItem.modelId}" value="${supplierItem.modelId}" class="checkbox" title="${supplierItem.title}" onclick="fuSelectSupplier${param.id}(${supplierItem.modelId},this)"/>
	</display:column>
	</c:if> 
	                                      
	<display:column sortable="false" decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" title="模板名字" >
		<a href="javascript:void%200" ondblclick='fuSelectSupplier${param.id}(${supplierItem.modelId})'>${supplierItem.modelName}</a>
	</display:column>
	
	<display:column sortable="true" 
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" title="模板状态">
				<c:choose >
				  <c:when test="${supplierItem.state==0}"><font color="orange">已激活</font></c:when>
				  <c:when test="${supplierItem.state==1}"><font color="grey">非激活</font></c:when>
				  <c:otherwise>   
   					<font color="red">有异常，请联系管理员<font>
  				</c:otherwise> 
				</c:choose>
			</display:column><%--
			
	<display:column sortable="false" decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="model.createTime" >
                 ${supplierItem.createTime}
	</display:column>
	
	<display:column sortable="false" decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="model.remarks" >
                 ${supplierItem.remarks}
	</display:column> 
    --%>  		
        		
     <display:column sortable="false" paramId="modelId" paramProperty="modelId" title="模板截图"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="">
				<cartmatic:img isUrlOnly="false" url="${supplierItem.imga}" mediaType="other" id="imga" height="180" width="140"></cartmatic:img>
	</display:column>
	
</display:table>

<input type="hidden" name="multiSelect" value="${param.multiSelect}">
<input type="hidden" name="id" value="${param.id}">

<div style="display:none">
	<c:forEach items="${supplierList}" var="supplierItem">
	<span id="jsonDataList_${param.id}_${supplierItem.modelId}">${supplierItem.jsonObject}</span>
	</c:forEach>
</div>
<!-- ========== 列表内容结束 ========= -->
<div class="blank10"></div>
<c:if test="${not empty supplierList}">
	<!-- ========== 分页开始 ========= -->
	<div class="box-paging">
		<%@include file="/common/pagingOnlyNew.jsp"%>
	</div>
	<!-- ========== 分页结束 ========= -->
</c:if>
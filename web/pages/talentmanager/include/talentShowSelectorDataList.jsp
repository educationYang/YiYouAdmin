<%@ include file="/common/taglibs.jsp"%>
<!-- ========== 列表内容开始 ========= -->
<display:table name="${supplierList}" cellspacing="0" cellpadding="0" uid="supplierItem" class="table-list" export="false" requestURI="">

	<c:if test="${param.multiSelect}">
	<display:column style="width: 1%"  media="html">
		<input type="checkbox" name="multiIds" id="sel_ch_${param.id}_${supplierItem.talentShowId}" value="${supplierItem.talentShowId}" class="checkbox" title="${supplierItem.content}" onclick="fuSelectSupplier${param.id}(${supplierItem.talentShowId},this)"/>
	</display:column>
	</c:if>           
	                            
	<display:column sortable="false" decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" title="作者">
		<a href="javascript:void%200" ondblclick='fuSelectSupplier${param.id}(${supplierItem.talentShowId})'>${supplierItem.content}</a>
	</display:column>
	
	<display:column sortable="false" decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" title="发布时间">
		${supplierItem.releaseTime}
	</display:column>
	
	<display:column sortable="false"  title="图片"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="talentShow.img">
				<cartmatic:img isUrlOnly="false" url="${supplierItem.img}" mediaType="other" id="img" height="100" width="100"></cartmatic:img>
	</display:column>
	
</display:table>

<input type="hidden" name="multiSelect" value="${param.multiSelect}">
<input type="hidden" name="id" value="${param.id}">

<div style="display:none">
	<c:forEach items="${supplierList}" var="supplierItem">
	<span id="jsonDataList_${param.id}_${supplierItem.talentShowId}">${supplierItem.jsonObject}</span>
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
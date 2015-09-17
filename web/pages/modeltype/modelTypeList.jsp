<%@ include file="/common/taglibs.jsp"%>
<app:pageHeading pageHeadingKey="modelTypeList.heading" />

<content tag="buttons">
	<cartmatic:cartmaticBtn btnType="create" inputType="button" onclick="return fnDoAdd(this);" />
	<!--<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoMultiSave(this);" />-->
	<cartmatic:cartmaticBtn btnType="delete" onclick="return fnDoMultiDelete(this);" />
</content>
<app:ui_leftMenu>
	<div class="sidebar-left">
	    <form method="post" action="${ctxPath}/modeltype/modelType.html">
			<app:ui_tabs tabsId="left_menu_tabs"/>
		    <div class="tab" id="left_menu_tabs">
			    <ul>
					<li><a href="#listSelectContent"><fmt:message key="yourposition.search"/></a></li>
				</ul>
				<div class="content" id="listSelectContent">
					<search:searchBox>
						<search:input attrPath="s.name" attrNameKey="modelType.name" datatype="String"
							operator="LIKE" classes="form-inputbox" />
					</search:searchBox>
				</div>
			</div>
		</form>
	</div>
</app:ui_leftMenu>
<form class="mainForm" name="modelTypeListForm" method="post" action="${ctxPath}/modeltype/modelType.html">
	<!--listing box start-->
	<!--editURLPath is used in TblDecorator-->
	<c:set var="editURLPath" value="/modeltype/modelType.html?doAction=edit&from=list" scope="page" />
		<c:set var="checkAll"><input type="checkbox" name="allbox" onclick="checkAll(this.form)" class="checkbox"/></c:set>
		<display:table name="${modelTypeList}" cellspacing="0" cellpadding="0" uid="modelTypeItem"
			class="table-list" export="false" requestURI="">
			<display:column style="width: 3%" title="${checkAll}" media="html">
				<input type="checkbox" name="multiIds" value="${modelTypeItem.modelTypeId}" class="checkbox" title="${modelTypeItem.modelTypeName}"/>
			</display:column>
			<display:column sortable="false" url="${editURLPath}" paramId="modelTypeId" paramProperty="modelTypeId"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelType.name">
				${modelTypeItem.modelTypeName}
			</display:column>
			<display:column property="createTime" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelType.createTime"/>
		    <display:column property="name" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelType.name"/>
		    <display:column property="writer" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelType.writer"/>
		    <%--<display:column property="modelId" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelType.modelId"/>
		    --%><display:column property="remarks" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelType.remarks"/><%--
		    <display:column property="barOne" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelType.barOne"/>
		    <display:column property="barTwo" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelType.barTwo"/>
		    <display:column property="barThree" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelType.barThree"/>
		--%></display:table>
		<%@include file="/common/pagingOnlyNew.jsp"%>
</form>
<script type="text/javascript">
highlightTableRows("modelTypeItem");
</script>
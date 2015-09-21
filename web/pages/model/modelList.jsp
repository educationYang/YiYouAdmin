<%@ include file="/common/taglibs.jsp"%>
<app:pageHeading pageHeadingKey="modelList.heading" />


<content tag="buttons">
	<cartmatic:cartmaticBtn btnType="create" inputType="button" onclick="return fnDoAdd(this);" />
	<!--<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoMultiSave(this);" />-->
	<cartmatic:cartmaticBtn btnType="delete" onclick="return fnDoMultiDelete(this);" />
</content>
<app:ui_leftMenu>
	<div class="sidebar-left">
	    <form method="post" action="${ctxPath}/model/model.html">
			<app:ui_tabs tabsId="left_menu_tabs"/>
		    <div class="tab" id="left_menu_tabs">
			    <ul>
					<li><a href="#listSelectContent"><fmt:message key="yourposition.search"/></a></li>
				</ul>
				<div class="content" id="listSelectContent">
					<search:searchBox>
						<search:input attrPath="s.name" attrNameKey="model.name" datatype="String"
							operator="LIKE" classes="form-inputbox" /><%--
						<search:orderby showOrderDirection="true">
							<option value="modelId">
								<fmt:message key="search.order.by.default" />
							</option>
						</search:orderby>
					--%>
					<div class="title">模板使用状态</div>
					<div>
						<select name="COL@s.state@Integer@EQ" id="state" style="width:150px" >
							<option value="">所有</option>
							<option value="0" <c:if test="${param['COL@s.state@Integer@EQ'] ==0}">selected="selected" </c:if>>已激活</option>
							<option value="1" <c:if test="${param['COL@s.state@Integer@EQ'] ==1}">selected="selected" </c:if>>非激活</option>
						</select>
					</div>
					
					
		<div class="title">模板类型查询</div>
			<div>
				 <select name="COL@s.modelType.modelTypeId@Integer@EQ" >
				     <option value="">所有</option>
					 <c:forEach items="${modelTypeList}" var="modelType" varStatus="status">
					   <option value="${modelType.modelTypeId}" <c:if test="${modelType.modelTypeId ==param['COL@s.modelType.modelTypeId@Integer@EQ'] }">selected="selected"</c:if>>${modelType.name}</option>
					 </c:forEach>
				 </select>
			</div>
					
				<div class="title">创建时间</div>
					<div>
						从
						<input name="COL@s.createTime@Date_Begin@GTE" id="createTimeGTE" type="text" readonly="true" value=""/>
						<app:ui_datePicker outPut="createTimeGTE" />
						<br/>
						到
						<input name="COL@s.createTime@Date_End@LTE" id="createTimeLTE" type="text" readonly="true" value=""/>
						<app:ui_datePicker outPut="createTimeLTE" />
				</div>	
				</search:searchBox>
				</div>
			</div>
		</form>
	</div>
</app:ui_leftMenu>
<form class="mainForm" name="modelListForm" method="post" action="${ctxPath}/model/model.html">
	<!--listing box start-->
	<!--editURLPath is used in TblDecorator-->
	<c:set var="editURLPath" value="/model/model.html?doAction=edit&from=list" scope="page" />
		<c:set var="checkAll"><input type="checkbox" name="allbox" onclick="checkAll(this.form)" class="checkbox"/></c:set>
		<display:table name="${modelList}" cellspacing="0" cellpadding="0" uid="modelItem"
			class="table-list" export="false" requestURI="">
			<display:column style="width: 3%"  url="${editURLPath}" title="${checkAll}" media="html" >
				<input type="checkbox" name="multiIds" value="${modelItem.modelId}" class="checkbox" title="${modelItem.modelName}"/>
			</display:column>
			<display:column sortable="false" url="${editURLPath}" paramId="modelId" paramProperty="modelId"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="model.name">
				${modelItem.modelName}
			</display:column>
		    <%--<display:column property="name" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="model.name"/>
        		
        	--%><display:column sortable="true" 
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="model.state">
				<c:choose >
				  <c:when test="${modelItem.state==0}"><font color="orange">已激活</font></c:when>
				  <c:when test="${modelItem.state==1}"><font color="grey">非激活</font></c:when>
				  <c:otherwise>   
   					<font color="red">有异常，请联系管理员<font>
  				</c:otherwise> 
				</c:choose>
			</display:column>
			
			<display:column sortable="false" 
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" title="模板类型">
				${modelItem.modelType.name}
			</display:column>
			
		    <display:column property="choiceNum" sortable="true" headerClass="data-table-title" 
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="model.choiceNum"/>
        	<display:column property="createTime" sortable="true" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="model.createTime" />
		    <display:column property="writer" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="model.writer"/>
            
            <display:column sortable="false" 
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" title="备注(鼠标移上去可看见全部)">
				<span title="${modelItem.remarks}"><c:out value="${fn:substring(modelItem.remarks, 0, 20)}......" /> </span>
			</display:column>
	
            <display:column sortable="false" url="${editURLPath}" paramId="modelId" paramProperty="modelId" title="最终成效图"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="">
				<cartmatic:img isUrlOnly="false" url="${modelItem.imga}" mediaType="other" id="imga" height="200" width="150"></cartmatic:img>
			</display:column>
	</display:table>
		<%@include file="/common/pagingOnlyNew.jsp"%>
</form>
<script type="text/javascript">
highlightTableRows("modelItem");
</script>
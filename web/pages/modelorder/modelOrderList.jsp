<%@ include file="/common/taglibs.jsp"%>
<app:pageHeading pageHeadingKey="modelOrderList.heading" />

<content tag="buttons">
	<cartmatic:cartmaticBtn btnType="create" inputType="button" onclick="return fnDoAdd(this);" />
	<!--<cartmatic:cartmaticBtn btnType="save" onclick="return fnDoMultiSave(this);" />-->
	<cartmatic:cartmaticBtn btnType="delete" onclick="return fnDoMultiDelete(this);" />
</content>
<app:ui_leftMenu>
	<div class="sidebar-left">
	    <form method="post" action="${ctxPath}/modelorder/modelOrder.html">
			<app:ui_tabs tabsId="left_menu_tabs"/>
		    <div class="tab" id="left_menu_tabs">
			    <ul>
					<li><a href="#listSelectContent"><fmt:message key="yourposition.search"/></a></li>
				</ul>
				<div class="content" id="listSelectContent">
					<search:searchBox>
						<search:input attrPath="s.ordernum" attrNameKey="modelOrder.ordernum" datatype="String"
							operator="LIKE" classes="form-inputbox" />
					<div class="title">订单状态</div>
					<div>
						<select name="COL@s.orderState@Integer@EQ" id="orderState" style="width:150px" >
							<option value="">所有</option>
							<option value="0" <c:if test="${param['COL@s.orderState@Integer@EQ'] ==0}">selected="selected" </c:if>>完成</option>
							<option value="1" <c:if test="${param['COL@s.orderState@Integer@EQ'] ==1}">selected="selected" </c:if>>未完成</option>
							<option value="2" <c:if test="${param['COL@s.orderState@Integer@EQ'] ==2}">selected="selected" </c:if>>紧急且未完！(1天时间上线)</option>
						</select>
					</div>
						<div class="title">审单状态</div>
					<div>
						<select name="COL@s.checkState@Integer@EQ" id="checkState" style="width:150px" >
							<option value="">所有</option>
							<option value="0" <c:if test="${param['COL@s.checkState@Integer@EQ'] ==0}">selected="selected" </c:if>>已审</option>
							<option value="1" <c:if test="${param['COL@s.checkState@Integer@EQ'] ==1}">selected="selected" </c:if>>未审</option>
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
<form class="mainForm" name="modelOrderListForm" method="post" action="${ctxPath}/modelorder/modelOrder.html">
	<!--listing box start-->
	<!--editURLPath is used in TblDecorator-->
	<c:set var="editURLPath" value="/modelorder/modelOrder.html?doAction=edit&from=list" scope="page" />
		<c:set var="checkAll"><input type="checkbox" name="allbox" onclick="checkAll(this.form)" class="checkbox"/></c:set>
		<display:table name="${modelOrderList}" cellspacing="0" cellpadding="0" uid="modelOrderItem"
			class="table-list" export="false" requestURI="">
			<display:column style="width: 3%" title="${checkAll}"   media="html">
				<input type="checkbox" name="multiIds" value="${modelOrderItem.modelOrderId}" class="checkbox" title="${modelOrderItem.modelOrderName}"/>
			</display:column>
			<display:column sortable="false" url="${editURLPath}" paramId="modelOrderId" paramProperty="modelOrderId"
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.ordernum">
				${modelOrderItem.modelOrderName}
			</display:column>
		    <display:column property="createTime" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.createTime"/>
		    <display:column property="modelId" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.modelId"/>
		    <display:column property="remarks" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.remarks"/>
        		
       
        		<display:column sortable="true" 
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.orderState">
				<c:choose >
				  <c:when test="${modelOrderItem.orderState==0}"><font color="orange">完成</font></c:when>
				  <c:when test="${modelOrderItem.orderState==1}"><font color="blue">未完成</font></c:when>
				  <c:when test="${modelOrderItem.orderState==2}"><font color="red">紧急且未完！</font></c:when>
				  <c:otherwise>   
   					<font color="red">有异常，请联系管理员<font>
  				</c:otherwise> 
				</c:choose>
			</display:column>
        		
        		<display:column sortable="true" 
				decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.checkState">
				<c:choose >
				  <c:when test="${modelOrderItem.checkState==0}"><font color="green">已审</font></c:when>
				  <c:when test="${modelOrderItem.checkState==1}"><font color="red">未审</font></c:when>
				  <c:otherwise>   
   					<font color="red">有异常，请联系管理员<font>
  				</c:otherwise> 
				</c:choose>
			</display:column>
			
			
        		<%--
		    <display:column property="bara" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.bara"/>
		    <display:column property="barb" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.barb"/>
		    <display:column property="barc" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.barc"/>
		    <display:column property="bard" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.bard"/>
		    <display:column property="bare" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.bare"/>
		    <display:column property="barf" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.barf"/>
		    <display:column property="barg" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.barg"/>
		    <display:column property="barh" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.barh"/>
		    <display:column property="bari" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.bari"/>
		    <display:column property="barj" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.barj"/>
		    <display:column property="bark" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.bark"/>
		    <display:column property="barl" sortable="false" headerClass="data-table-title"
        		decorator="com.cartmatic.estore.core.decorator.TblColumnDecorator" titleKey="modelOrder.barl"/>
		--%>

		</display:table>
		<%@include file="/common/pagingOnlyNew.jsp"%>
</form>
<script type="text/javascript">
highlightTableRows("modelOrderItem");
</script>
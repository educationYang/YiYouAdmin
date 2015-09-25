<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="cartmatic" tagdir="/WEB-INF/tags/cartmatic"%>
<c:if test="${param.multiSelect}">
已选择的网页模板：
<span id="selectedSupplier_multiSupplierSelector">

</span>

<div><a onclick="fnRemoveAll${param.id}();">移除所有已选择</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="fnConfirmSelectedSupplier${param.id}();">确认</a></div>
</c:if>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="font-size: 12px;">
	<tr>
		<td valign="top" width="25%">
			<div class="content" id="supplierSelectorSearch_${param.id}">
				<div class="title">
					模板名字：
				</div>
				<input name="COL@s.name@String@LIKE" type="text" style="width: 200px" />
				<div class="blank10"></div>
				
				<div class="title">
					模板使用状态
				</div>
			   <select name="COL@s.state@Integer@EQ" id="state" style="width:150px" >
							<option value="">所有</option>
							<option value="0" <c:if test="${param['COL@s.state@Integer@EQ'] ==0}">selected="selected" </c:if>>已激活</option>
							<option value="1" <c:if test="${param['COL@s.state@Integer@EQ'] ==1}">selected="selected" </c:if>>非激活</option>
			     </select>
				<div class="blank10"></div>
				<br>
				<div class="title">模板创建时间</div>
					<div>
						从
						<input name="COL@s.createTime@Date_Begin@GTE" id="createTimeGTE" type="text" readonly="true" value=""/>
						<app:ui_datePicker outPut="createTimeGTE" />
						<br/>
						到
						<input name="COL@s.createTime@Date_End@LTE" id="createTimeLTE" type="text" readonly="true" value=""/>
						<app:ui_datePicker outPut="createTimeLTE" />
				</div>	
				
				<input type="button" id="SearchButton" name="SearchButton" onclick="fn${param.id}GetData();" value="<fmt:message key="button.search"/>" class="btn-search"/>
				<div class="blank10"></div>
				需选择的请搜索后在右侧列表双击相应模板名字！
				<input type="hidden" name="multiSelect" id="multiSelect" value="${param.multiSelect}">
				<input type="hidden" name="id" value="${param.id}">
			</div>
		</td>
		<td valign="top" >
			<div id="supplierSelectorDataList_${param.id}">
				<%--@ include file="include/supplierSelectorDataList.jsp"--%>
			</div>
		</td>
	</tr>
</table>
package com.cartmatic.estoresa.modeltype.web.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.validation.BindException;

import com.cartmatic.estore.core.controller.GenericController;
import com.cartmatic.estore.common.model.modeltype.ModelType;
import com.cartmatic.estore.modeltype.service.ModelTypeManager;
import com.cartmatic.estore.webapp.util.RequestContext;

public class ModelTypeController extends GenericController<ModelType> {
    private ModelTypeManager modelTypeManager = null;

    public void setModelTypeManager(ModelTypeManager inMgr) {
        this.modelTypeManager = inMgr;
    }

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController getEntityName(java.lang.Object)
	 */
	@Override
	protected String getEntityName(ModelType entity) {
		return entity.getModelTypeName();
	}

	/**
	 * 构造批量更新所需的model。
	 * <P>
	 * 本来这方法对大部分情况也是可以自动分析和转换的，但考虑到比较复杂和难以灵活（验证、缺省值、I18N等、Status转换等），暂时要求各模块自己实现。要求数据要先转换为正确的类型。
	 * 
	 * @param request
	 * @return
	 */
	@Override
	protected Map<Integer, Map<String, Object>> getMultiSaveModel(HttpServletRequest request) {
		//FIXME
		throw new RuntimeException("Not implemented yet!");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.BaseController#initController()
	 */
	@Override
	protected void initController() throws Exception {
		mgr = modelTypeManager;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController onSave(javax.servlet.http.HttpServletRequest,
	 *      java.lang.Object, org.springframework.validation.BindException)
	 */
	protected void onSave(HttpServletRequest request, ModelType entity, BindException errors) {
		//System.out.println(RequestContext.getCurrentUserNameDefaultSystem());
		entity.setWriter(RequestContext.getCurrentUserNameDefaultSystem());
	}

}

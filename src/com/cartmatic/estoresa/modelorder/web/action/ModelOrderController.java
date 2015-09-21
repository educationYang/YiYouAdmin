package com.cartmatic.estoresa.modelorder.web.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.validation.BindException;

import com.cartmatic.estore.common.model.model.Model;
import com.cartmatic.estore.common.model.modelorder.ModelOrder;
import com.cartmatic.estore.core.controller.GenericController;
import com.cartmatic.estore.model.service.ModelManager;
import com.cartmatic.estore.modelorder.service.ModelOrderManager;

public class ModelOrderController extends GenericController<ModelOrder> {
    
	private ModelOrderManager modelOrderManager = null;
	
    private ModelManager modelManager =null;
    
	public ModelManager getModelManager() {
		return modelManager;
	}


	public void setModelManager(ModelManager modelManager) {
		this.modelManager = modelManager;
	}

	
    public void setModelOrderManager(ModelOrderManager inMgr) {
        this.modelOrderManager = inMgr;
    }

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController getEntityName(java.lang.Object)
	 */
	@Override
	protected String getEntityName(ModelOrder entity) {
		return entity.getModelOrderName();
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
		mgr = modelOrderManager;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController onSave(javax.servlet.http.HttpServletRequest,
	 *      java.lang.Object, org.springframework.validation.BindException)
	 */
	protected void onSave(HttpServletRequest request, ModelOrder entity, BindException errors) {
		try{
			String  modelId =request.getParameter("arrayculId");
			System.out.println("modelId:"+modelId);
			Model model = modelManager.getById(Integer.parseInt(modelId));
			entity.setModel(model);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("wrong");
		}
	}

}

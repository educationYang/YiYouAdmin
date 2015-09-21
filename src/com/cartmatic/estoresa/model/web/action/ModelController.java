package com.cartmatic.estoresa.model.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;

import com.cartmatic.estore.common.model.culturalinformation.CulturalInformation;
import com.cartmatic.estore.common.model.model.Model;
import com.cartmatic.estore.common.model.modeltype.ModelType;
import com.cartmatic.estore.common.model.monthlycultural.MonthlyCultural;
import com.cartmatic.estore.core.controller.GenericController;
import com.cartmatic.estore.model.service.ModelManager;
import com.cartmatic.estore.modeltype.service.ModelTypeManager;
import com.cartmatic.estore.webapp.util.RequestContext;

public class ModelController extends GenericController<Model> {
	
    private ModelManager modelManager = null;
    
    private ModelTypeManager modelTypeManager = null;


    public ModelTypeManager getModelTypeManager() {
		return modelTypeManager;
	}

	public void setModelTypeManager(ModelTypeManager modelTypeManager) {
		this.modelTypeManager = modelTypeManager;
	}

	public ModelManager getModelManager() {
		return modelManager;
	}

	public void setModelManager(ModelManager inMgr) {
        this.modelManager = inMgr;
    }

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController getEntityName(java.lang.Object)
	 */
	@Override
	protected String getEntityName(Model entity) {
		return entity.getModelName();
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

	
	/**
	 * 缺省Action,列出缺省搜索条件的搜索结果列表。必须转给search处理。
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws ServletException
	 */
	public ModelAndView defaultAction(HttpServletRequest request,
			HttpServletResponse response) {
		try{
			List<ModelType>modelTypeList =new ArrayList(modelTypeManager.getAll());
			request.setAttribute("modelTypeList", modelTypeList);
		}
		catch(Exception e){
			System.out.println("获取模板类型数据！");
		}
		return search(request, response);
	}

	
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.BaseController#initController()
	 */
	@Override
	protected void initController() throws Exception {
		mgr = modelManager;
	}
	
	/**
	 * showFrom时调用,可以重载这个方法在mv上加入一些新的元素，补充重写进入表单的方法,例如编辑，
	 * 主要获取推荐资讯的数据还有该文化资讯的月刊
	 * @param request
	 * @param mv
	 */
	protected void onShowForm(HttpServletRequest request, ModelAndView mv)
	{
		try{
			List<ModelType>modelTypeList =new ArrayList(modelTypeManager.getAll());
			mv.addObject("modelTypeList", modelTypeList);
		}
		catch(Exception e){
			System.out.println("获取模板类型数据！");
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController onSave(javax.servlet.http.HttpServletRequest,
	 *      java.lang.Object, org.springframework.validation.BindException)
	 */
	protected void onSave(HttpServletRequest request, Model entity, BindException errors) {
		try{
			String id = request.getParameter("modelTypeId");
			ModelType modelType = modelTypeManager.getById(Integer.parseInt(id));
			entity.setModelType(modelType);
			entity.setWriter(RequestContext.getCurrentUserNameDefaultSystem());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

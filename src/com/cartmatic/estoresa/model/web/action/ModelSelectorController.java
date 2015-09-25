package com.cartmatic.estoresa.model.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;

import com.cartmatic.estore.common.model.model.Model;
import com.cartmatic.estore.common.model.modelorder.ModelOrder;
import com.cartmatic.estore.core.controller.GenericController;
import com.cartmatic.estore.core.search.SearchCriteria;
import com.cartmatic.estore.model.service.ModelManager;
import com.cartmatic.estore.modelorder.service.ModelOrderManager;

/**
 * 文化资讯弹出窗选择 <code>CulturalSelectorController.java</code>
 * <p>
 * <p>
 * Copyright 2015 All right reserved.
 * 
 * @author admin 时间 2015-7-1 上午10:56:08
 * @version 1.0 </br>最后修改人 无
 */
public class ModelSelectorController extends GenericController<Model>
{
	
	private ModelManager modelManager =null;

	
	@Override
	protected void initController() throws Exception {
		mgr = modelManager;
	}
	
	
	@SuppressWarnings("unchecked")
	public ModelAndView defaultAction(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		if (request.getRequestURI().indexOf("modelSelectorDataList.html") != -1)
		{
			return getData(request, response);
		}
		return new ModelAndView("model/modelSelector" );

	}

	
	@SuppressWarnings("unchecked")
	private ModelAndView getData(HttpServletRequest request, HttpServletResponse response) {
		SearchCriteria searchCriteria = createSearchCriteria(request);
		List results = searchByCriteria(searchCriteria);
		request.setAttribute("supplierList", results);
		request.setAttribute("pagingId", request.getParameter("pagingId"));
		
		return new ModelAndView("model/include/modelSelectorDataList");

	}
	 

	public ModelManager getModelManager() {
		return modelManager;
	}


	public void setModelManager(ModelManager modelManager) {
		this.modelManager = modelManager;
	}


	@Override
	protected Map<Integer, Map<String, Object>> getMultiSaveModel(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	protected String getEntityName(Model entity) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	protected void onSave(HttpServletRequest request, Model entity, BindException errors) {
		// TODO Auto-generated method stub
		
	}


}

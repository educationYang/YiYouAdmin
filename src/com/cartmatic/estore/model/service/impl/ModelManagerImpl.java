package com.cartmatic.estore.model.service.impl;

import com.cartmatic.estore.common.model.model.Model;
import com.cartmatic.estore.core.service.impl.GenericManagerImpl;
import com.cartmatic.estore.model.service.ModelManager;
import com.cartmatic.estore.model.dao.ModelDao;


/**
 * Manager implementation for Model, responsible for business processing, and communicate between web and persistence layer.
 */
public class ModelManagerImpl extends GenericManagerImpl<Model> implements ModelManager {

	private ModelDao modelDao = null;

	/**
	 * @param modelDao
	 *            the modelDao to set
	 */
	public void setModelDao(ModelDao modelDao) {
		this.modelDao = modelDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#init()
	 */
	@Override
	protected void initManager() {
		dao = modelDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#onDelete()
	 */
	@Override
	protected void onDelete(Model entity) {

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#onSave()
	 */
	@Override
	protected void onSave(Model entity) {

	}

}

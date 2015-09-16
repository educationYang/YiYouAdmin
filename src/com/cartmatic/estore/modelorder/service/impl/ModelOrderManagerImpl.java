package com.cartmatic.estore.modelorder.service.impl;

import com.cartmatic.estore.common.model.modelorder.ModelOrder;
import com.cartmatic.estore.core.service.impl.GenericManagerImpl;
import com.cartmatic.estore.modelorder.service.ModelOrderManager;
import com.cartmatic.estore.modelorder.dao.ModelOrderDao;


/**
 * Manager implementation for ModelOrder, responsible for business processing, and communicate between web and persistence layer.
 */
public class ModelOrderManagerImpl extends GenericManagerImpl<ModelOrder> implements ModelOrderManager {

	private ModelOrderDao modelOrderDao = null;

	/**
	 * @param modelOrderDao
	 *            the modelOrderDao to set
	 */
	public void setModelOrderDao(ModelOrderDao modelOrderDao) {
		this.modelOrderDao = modelOrderDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#init()
	 */
	@Override
	protected void initManager() {
		dao = modelOrderDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#onDelete()
	 */
	@Override
	protected void onDelete(ModelOrder entity) {

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#onSave()
	 */
	@Override
	protected void onSave(ModelOrder entity) {

	}

}

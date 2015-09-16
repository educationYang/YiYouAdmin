package com.cartmatic.estore.modeltype.service.impl;

import com.cartmatic.estore.common.model.modeltype.ModelType;
import com.cartmatic.estore.core.service.impl.GenericManagerImpl;
import com.cartmatic.estore.modeltype.service.ModelTypeManager;
import com.cartmatic.estore.modeltype.dao.ModelTypeDao;


/**
 * Manager implementation for ModelType, responsible for business processing, and communicate between web and persistence layer.
 */
public class ModelTypeManagerImpl extends GenericManagerImpl<ModelType> implements ModelTypeManager {

	private ModelTypeDao modelTypeDao = null;

	/**
	 * @param modelTypeDao
	 *            the modelTypeDao to set
	 */
	public void setModelTypeDao(ModelTypeDao modelTypeDao) {
		this.modelTypeDao = modelTypeDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#init()
	 */
	@Override
	protected void initManager() {
		dao = modelTypeDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#onDelete()
	 */
	@Override
	protected void onDelete(ModelType entity) {

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.service.impl.GenericManagerImpl#onSave()
	 */
	@Override
	protected void onSave(ModelType entity) {

	}

}

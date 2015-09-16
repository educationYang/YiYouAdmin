package com.cartmatic.estore.common.model.modeltype;

import com.cartmatic.estore.common.model.modeltype.base.ModelTypeTbl;

/**
 * Model class for ModelType. Add not database mapped fileds in this class.
 */
public class ModelType extends ModelTypeTbl {

  	/**
	 * Default Empty Constructor for class ModelType
	 */
	public ModelType () {
		super();
	}
	
	/**
	 * 定义实体的业务名取值； modelTypeName
	 * 必须手工完成这个部分，否则编译不通过。
	 */
	public String getModelTypeName () {
		if (name == null)
	        return "";
	    else
			//返回一个指定有业务意义的属性值;
			//如：product的VO就用product.productName
	        return this.name;
	}
	
	/**
	 * Default Key Fields Constructor for class ModelType
	 */
	public ModelType (
		 Integer in_modelTypeId
		) {
		super (
		  in_modelTypeId
		);
	}

}

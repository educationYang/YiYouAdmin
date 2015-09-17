package com.cartmatic.estore.common.model.model;

import com.cartmatic.estore.common.model.model.base.ModelTbl;

/**
 * Model class for Model. Add not database mapped fileds in this class.
 */
public class Model extends ModelTbl {

  	/**
	 * Default Empty Constructor for class Model
	 */
	public Model () {
		super();
	}
	
	/**
	 * 定义实体的业务名取值； modelName
	 * 必须手工完成这个部分，否则编译不通过。
	 */
	public String getModelName () {
		if (name == null)
	        return "";
	    else
			//返回一个指定有业务意义的属性值;
			//如：product的VO就用product.productName
	        return this.name;
	}
	
	/**
	 * Default Key Fields Constructor for class Model
	 */
	public Model (
		 Integer in_modelId
		) {
		super (
		     in_modelId
		);
	}

}

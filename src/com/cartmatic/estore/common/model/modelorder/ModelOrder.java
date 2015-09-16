package com.cartmatic.estore.common.model.modelorder;

import com.cartmatic.estore.common.model.modelorder.base.ModelOrderTbl;

/**
 * Model class for ModelOrder. Add not database mapped fileds in this class.
 */
public class ModelOrder extends ModelOrderTbl {

  	/**
	 * Default Empty Constructor for class ModelOrder
	 */
	public ModelOrder () {
		super();
	}
	
	/**
	 * 定义实体的业务名取值； modelOrderName
	 * 必须手工完成这个部分，否则编译不通过。
	 */
	public String getModelOrderName () {
		if (ordernum == null)
	        return "";
	    else
			//返回一个指定有业务意义的属性值;
			//如：product的VO就用product.productName
	        return this.ordernum;
	}
	
	/**
	 * Default Key Fields Constructor for class ModelOrder
	 */
	public ModelOrder (
		 Integer in_modelOrderId
		) {
		super (
		  in_modelOrderId
		);
	}

}

package com.cartmatic.estore.common.model.catalog;

import com.cartmatic.estore.common.model.catalog.base.ProductCategoryTbl;

/**
 * Model class for ProductCategory. Add not database mapped fileds in this class.
 */
public class ProductCategory extends ProductCategoryTbl {

  	/**
	 * Default Empty Constructor for class ProductCategory
	 */
	public ProductCategory () {
		super();
	}
	
	/**
	 * 定义实体的业务名取值； productCategoryName
	 * 必须手工完成这个部分，否则编译不通过。
	 */
	public String getProductCategoryName () {
		if (productCategoryId == null)
	        return "";
	    else
			//返回一个指定有业务意义的属性值;
			//如：product的VO就用product.productName
	        return this.productCategoryId.toString();
	}
	
	/**
	 * Default Key Fields Constructor for class ProductCategory
	 */
	public ProductCategory (
		 Integer in_productCategoryId
		) {
		super (
		  in_productCategoryId
		);
	}

}

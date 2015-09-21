package com.cartmatic.estore.common.model.model;

import net.sf.json.JSONObject;

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
	 * 构建简单的Json对象主要用于选择器
	 * @return
	 */
	public String getJsonObject(){
		JSONObject jsonSupplier=new JSONObject();
	//	jsonSupplier.put("culturalInformationId",this.culturalInformationId);
		jsonSupplier.put("modelId",this.modelId);
		jsonSupplier.put("name",this.name);
		jsonSupplier.put("remarks", this.remarks);
		jsonSupplier.put("imga", this.imga);
		return jsonSupplier.toString();
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

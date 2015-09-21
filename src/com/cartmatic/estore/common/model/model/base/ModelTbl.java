package com.cartmatic.estore.common.model.model.base;

import java.io.Serializable;
import com.cartmatic.estore.Constants;
import com.cartmatic.estore.core.model.BaseObject;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.EqualsBuilder;

/**
 * Model Base Java Bean, base class for the model, mapped directly to database table
 * 
 * Avoid changing this file if not necessary, will be overwritten. 
 *
 * TODO: add class/table comments
 */
public class ModelTbl extends BaseObject implements Serializable {

    protected Integer modelId;
	protected String name;
	protected Integer state;
	protected Integer choiceNum;
	protected java.util.Date createTime;
	protected String writer;
	protected String remarks;
	protected String barOne;
	protected String barTwo;
	protected String barThree;
	protected String imga;
	protected String imgb;
	protected String imgc;
	protected com.cartmatic.estore.common.model.modeltype.ModelType modelType;

	protected java.util.Set modelOrders = new java.util.HashSet();

	/**
	 * Default Empty Constructor for class Model
	 */
	public ModelTbl () {
		super();
	}
	
	/**
	 * Default Key Fields Constructor for class Model
	 */
	public ModelTbl (
		 Integer in_modelId
        ) {
		this.setModelId(in_modelId);
    }

	
	public com.cartmatic.estore.common.model.modeltype.ModelType getModelType () {
		return modelType;
	}	
	
	public void setModelType (com.cartmatic.estore.common.model.modeltype.ModelType in_modelType) {
		this.modelType = in_modelType;
	}

	public java.util.Set getModelOrders () {
		return modelOrders;
	}	
	
	public void setModelOrders (java.util.Set in_modelOrders) {
		this.modelOrders = in_modelOrders;
	}
    

	/**
	 * 模板编号	 * @return Integer
     * @hibernate.id column="modelId" type="java.lang.Integer" generator-class="native"
	 */
	public Integer getModelId() {
		return this.modelId;
	}
	
	/**
	 * Set the modelId
	 */	
	public void setModelId(Integer aValue) {
		this.modelId = aValue;
	}	

	/**
	 * 模板别名	 * @return String
	 * @hibernate.property column="name" type="java.lang.String" length="64" not-null="false" unique="false"
	 */
	public String getName() {
		return this.name;
	}
	
	/**
	 * Set the name
	 */	
	public void setName(String aValue) {
		this.name = aValue;
	}	

	/**
	 * 0激活，1非激活	 * @return Integer
	 * @hibernate.property column="state" type="java.lang.Integer" length="10" not-null="true" unique="false"
	 */
	public Integer getState() {
		return this.state;
	}
	
	/**
	 * Set the state
	 * @spring.validator type="required"
	 */	
	public void setState(Integer aValue) {
		this.state = aValue;
	}	

	/**
	 * 已被选择次数	 * @return Integer
	 * @hibernate.property column="choiceNum" type="java.lang.Integer" length="10" not-null="false" unique="false"
	 */
	public Integer getChoiceNum() {
		return this.choiceNum;
	}
	
	/**
	 * Set the choiceNum
	 */	
	public void setChoiceNum(Integer aValue) {
		this.choiceNum = aValue;
	}	

	/**
	 * 创建时间	 * @return java.util.Date
	 * @hibernate.property column="createTime" type="java.util.Date" length="0" not-null="false" unique="false"
	 */
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	
	/**
	 * Set the createTime
	 */	
	public void setCreateTime(java.util.Date aValue) {
		this.createTime = aValue;
	}	

	/**
	 * 创建者	 * @return String
	 * @hibernate.property column="writer" type="java.lang.String" length="32" not-null="false" unique="false"
	 */
	public String getWriter() {
		return this.writer;
	}
	
	/**
	 * Set the writer
	 */	
	public void setWriter(String aValue) {
		this.writer = aValue;
	}	

	/**
	 * 备注（文案）	 * @return String
	 * @hibernate.property column="remarks" type="java.lang.String" length="220" not-null="false" unique="false"
	 */
	public String getRemarks() {
		return this.remarks;
	}
	
	/**
	 * Set the remarks
	 */	
	public void setRemarks(String aValue) {
		this.remarks = aValue;
	}	

	/**
	 * 备用字段1	 * @return String
	 * @hibernate.property column="barOne" type="java.lang.String" length="32" not-null="false" unique="false"
	 */
	public String getBarOne() {
		return this.barOne;
	}
	
	/**
	 * Set the barOne
	 */	
	public void setBarOne(String aValue) {
		this.barOne = aValue;
	}	

	/**
	 * 备用字段2	 * @return String
	 * @hibernate.property column="barTwo" type="java.lang.String" length="32" not-null="false" unique="false"
	 */
	public String getBarTwo() {
		return this.barTwo;
	}
	
	/**
	 * Set the barTwo
	 */	
	public void setBarTwo(String aValue) {
		this.barTwo = aValue;
	}	

	/**
	 * 备用字段3	 * @return String
	 * @hibernate.property column="barThree" type="java.lang.String" length="321" not-null="false" unique="false"
	 */
	public String getBarThree() {
		return this.barThree;
	}
	
	/**
	 * Set the barThree
	 */	
	public void setBarThree(String aValue) {
		this.barThree = aValue;
	}	

	/**
	 * 图片1	 * @return String
	 * @hibernate.property column="imga" type="java.lang.String" length="255" not-null="false" unique="false"
	 */
	public String getImga() {
		return this.imga;
	}
	
	/**
	 * Set the imga
	 */	
	public void setImga(String aValue) {
		this.imga = aValue;
	}	

	/**
	 * 图片2	 * @return String
	 * @hibernate.property column="imgb" type="java.lang.String" length="255" not-null="false" unique="false"
	 */
	public String getImgb() {
		return this.imgb;
	}
	
	/**
	 * Set the imgb
	 */	
	public void setImgb(String aValue) {
		this.imgb = aValue;
	}	

	/**
	 * 图片3	 * @return String
	 * @hibernate.property column="imgc" type="java.lang.String" length="255" not-null="false" unique="false"
	 */
	public String getImgc() {
		return this.imgc;
	}
	
	/**
	 * Set the imgc
	 */	
	public void setImgc(String aValue) {
		this.imgc = aValue;
	}	

	/**
	 * 模板类型Id	 * @return Integer
	 */
	public Integer getModelTypeId() {
		return this.getModelType()==null?null:this.getModelType().getModelTypeId();
	}
	
	/**
	 * Set the modelTypeId
	 */	
	public void setModelTypeId(Integer aValue) {
	    if (aValue==null) {
	    	modelType = null;
	    } else {
	        modelType = new com.cartmatic.estore.common.model.modeltype.ModelType(aValue);
	        modelType.setVersion(new Integer(0));//set a version to cheat hibernate only
	    }
	}	

	/**
	 * @see java.lang.Object#equals(Object)
	 */
	public boolean equals(Object object) {
		if (!(object instanceof ModelTbl)) {
			return false;
		}
		ModelTbl rhs = (ModelTbl) object;
		return new EqualsBuilder()
				.append(this.modelId, rhs.modelId)
				.append(this.name, rhs.name)
				.append(this.state, rhs.state)
				.append(this.choiceNum, rhs.choiceNum)
				.append(this.createTime, rhs.createTime)
				.append(this.writer, rhs.writer)
				.append(this.remarks, rhs.remarks)
				.append(this.barOne, rhs.barOne)
				.append(this.barTwo, rhs.barTwo)
				.append(this.barThree, rhs.barThree)
				.append(this.imga, rhs.imga)
				.append(this.imgb, rhs.imgb)
				.append(this.imgc, rhs.imgc)
						.isEquals();
	}

	/**
	 * @see java.lang.Object#hashCode()
	 */
	public int hashCode() {
		return new HashCodeBuilder(-82280557, -700257973)
				.append(this.modelId) 
				.append(this.name) 
				.append(this.state) 
				.append(this.choiceNum) 
				.append(this.createTime) 
				.append(this.writer) 
				.append(this.remarks) 
				.append(this.barOne) 
				.append(this.barTwo) 
				.append(this.barThree) 
				.append(this.imga) 
				.append(this.imgb) 
				.append(this.imgc) 
						.toHashCode();
	}

	/**
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return new ToStringBuilder(this)
				.append("modelId", this.modelId) 
				.append("name", this.name) 
				.append("state", this.state) 
				.append("choiceNum", this.choiceNum) 
				.append("createTime", this.createTime) 
				.append("writer", this.writer) 
				.append("remarks", this.remarks) 
				.append("barOne", this.barOne) 
				.append("barTwo", this.barTwo) 
				.append("barThree", this.barThree) 
				.append("imga", this.imga) 
				.append("imgb", this.imgb) 
				.append("imgc", this.imgc) 
						.toString();
	}

	/**
	 * Return the name of the first key column
	 */
	public String getFirstKeyColumnName() {
		return "modelId";
	}
	
	/**
	 * Return the Id (pk) of the entity, must be Integer
	 */
	public Integer getId() {
		return modelId;
	}

}
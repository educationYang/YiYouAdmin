package com.cartmatic.estore.common.model.model.base;

import java.io.Serializable;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.cartmatic.estore.common.model.modeltype.ModelType;
import com.cartmatic.estore.core.model.BaseObject;

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
	protected String writer;
	protected String remarks;
	protected String barOne;
	protected String barTwo;
	protected String barThree;
	protected java.util.Date createTime;
	protected String imga;
	protected String imgb;
	protected String imgc;
	
	protected ModelType modeltype;
	
	protected java.util.Set modelOrders = new java.util.HashSet();
	

	public java.util.Set getModelOrders() {
		return modelOrders;
	}

	public void setModelOrders(java.util.Set modelOrders) {
		this.modelOrders = modelOrders;
	}

	public ModelType getModeltype() {
		return modeltype;
	}

	public void setModeltype(ModelType modeltype) {
		this.modeltype = modeltype;
	}

	public String getImga() {
		return imga;
	}

	public void setImga(String imga) {
		this.imga = imga;
	}

	public String getImgb() {
		return imgb;
	}

	public void setImgb(String imgb) {
		this.imgb = imgb;
	}

	public String getImgc() {
		return imgc;
	}

	public void setImgc(String imgc) {
		this.imgc = imgc;
	}

	public java.util.Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

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

    

	/**
	 * 模板自增长ID（编号）	 * @return Integer
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
	 * @hibernate.property column="choiceNum" type="java.lang.Integer" length="10" not-null="true" unique="false"
	 */
	public Integer getChoiceNum() {
		return this.choiceNum;
	}
	
	/**
	 * Set the choiceNum
	 * @spring.validator type="required"
	 */	
	public void setChoiceNum(Integer aValue) {
		this.choiceNum = aValue;
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
	 * 备注	 * @return String
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
				.append(this.writer, rhs.writer)
				.append(this.remarks, rhs.remarks)
				.append(this.barOne, rhs.barOne)
				.append(this.barTwo, rhs.barTwo)
				.append(this.barThree, rhs.barThree)
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
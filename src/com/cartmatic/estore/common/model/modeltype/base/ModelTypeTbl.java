package com.cartmatic.estore.common.model.modeltype.base;

import java.io.Serializable;
import com.cartmatic.estore.Constants;
import com.cartmatic.estore.core.model.BaseObject;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.EqualsBuilder;

/**
 * ModelType Base Java Bean, base class for the model, mapped directly to database table
 * 
 * Avoid changing this file if not necessary, will be overwritten. 
 *
 * TODO: add class/table comments
 */
public class ModelTypeTbl extends BaseObject implements Serializable {

    protected Integer modelTypeId;
	protected String name;
	protected String writer;
	protected java.util.Date createTime;
	protected String remarks;
	protected String barOne;
	protected String barTwo;
	protected String barThree;
	
	protected java.util.Set models = new java.util.HashSet();
	

	public java.util.Set getModels() {
		return models;
	}

	public void setModels(java.util.Set models) {
		this.models = models;
	}

	public java.util.Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * Default Empty Constructor for class ModelType
	 */
	public ModelTypeTbl () {
		super();
	}
	
	/**
	 * Default Key Fields Constructor for class ModelType
	 */
	public ModelTypeTbl (
		 Integer in_modelTypeId
        ) {
		this.setModelTypeId(in_modelTypeId);
    }


	/**
	 * 模板类别Id	 * @return Integer
     * @hibernate.id column="modelTypeId" type="java.lang.Integer" generator-class="native"
	 */


	/**
	 * 模板名字	 * @return String
	 * @hibernate.property column="name" type="java.lang.String" length="32" not-null="false" unique="false"
	 */
	public String getName() {
		return this.name;
	}
	
	public Integer getModelTypeId() {
		return modelTypeId;
	}

	public void setModelTypeId(Integer modelTypeId) {
		this.modelTypeId = modelTypeId;
	}

	/**
	 * Set the name
	 */	
	public void setName(String aValue) {
		this.name = aValue;
	}	

	/**
	 * 创建人	 * @return String
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
	 * @hibernate.property column="barOne" type="java.lang.String" length="220" not-null="false" unique="false"
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
	 * @hibernate.property column="barTwo" type="java.lang.String" length="220" not-null="false" unique="false"
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
	 * @hibernate.property column="barThree" type="java.lang.String" length="220" not-null="false" unique="false"
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
		if (!(object instanceof ModelTypeTbl)) {
			return false;
		}
		ModelTypeTbl rhs = (ModelTypeTbl) object;
		return new EqualsBuilder()
				.append(this.modelTypeId, rhs.modelTypeId)
				.append(this.name, rhs.name)
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
				.append(this.modelTypeId) 
				.append(this.name) 
				.append(this.writer) 
						.append(this.remarks) 
				.append(this.barOne) 
				.append(this.barTwo) 
				.append(this.barThree) 
				.toHashCode();
	}

	/**
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return new ToStringBuilder(this)
				.append("modelTypeId", this.modelTypeId) 
				.append("name", this.name) 
				.append("writer", this.writer) 
						.append("remarks", this.remarks) 
				.append("barOne", this.barOne) 
				.append("barTwo", this.barTwo) 
				.append("barThree", this.barThree) 
				.toString();
	}

	/**
	 * Return the name of the first key column
	 */
	public String getFirstKeyColumnName() {
		return "modelTypeId";
	}
	
	/**
	 * Return the Id (pk) of the entity, must be Integer
	 */
	public Integer getId() {
		return modelTypeId;
	}

}
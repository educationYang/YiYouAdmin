package com.cartmatic.estore.common.model.modelorder.base;

import java.io.Serializable;
import com.cartmatic.estore.Constants;
import com.cartmatic.estore.core.model.BaseObject;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.EqualsBuilder;

/**
 * ModelOrder Base Java Bean, base class for the model, mapped directly to database table
 * 
 * Avoid changing this file if not necessary, will be overwritten. 
 *
 * TODO: add class/table comments
 */
public class ModelOrderTbl extends BaseObject implements Serializable {

    protected Integer modelOrderId;
	protected String ordernum;
	protected java.util.Date createTime;
	protected Integer orderState;
	protected Integer checkState;
	protected String remarks;
	protected String bara;
	protected String barb;
	protected String barc;
	protected String bard;
	protected String bare;
	protected String barf;
	protected String barg;
	protected String barh;
	protected String bari;
	protected String barj;
	protected String bark;
	protected String barl;
	protected com.cartmatic.estore.common.model.model.Model model;


	/**
	 * Default Empty Constructor for class ModelOrder
	 */
	public ModelOrderTbl () {
		super();
	}
	
	/**
	 * Default Key Fields Constructor for class ModelOrder
	 */
	public ModelOrderTbl (
		 Integer in_modelOrderId
        ) {
		this.setModelOrderId(in_modelOrderId);
    }

	
	public com.cartmatic.estore.common.model.model.Model getModel () {
		return model;
	}	
	
	public void setModel (com.cartmatic.estore.common.model.model.Model in_model) {
		this.model = in_model;
	}
    

	/**
	 * 模板订单ID	 * @return Integer
     * @hibernate.id column="modelOrderId" type="java.lang.Integer" generator-class="native"
	 */
	public Integer getModelOrderId() {
		return this.modelOrderId;
	}
	
	/**
	 * Set the modelOrderId
	 */	
	public void setModelOrderId(Integer aValue) {
		this.modelOrderId = aValue;
	}	

	/**
	 * 淘宝订单	 * @return String
	 * @hibernate.property column="ordernum" type="java.lang.String" length="50" not-null="false" unique="false"
	 */
	public String getOrdernum() {
		return this.ordernum;
	}
	
	/**
	 * Set the ordernum
	 */	
	public void setOrdernum(String aValue) {
		this.ordernum = aValue;
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
	 * 模板订单状态：0未发布，1已发布，2紧急且未完成（顾客要求时间1天内上距当前时间）	 * @return Integer
	 * @hibernate.property column="orderState" type="java.lang.Integer" length="10" not-null="false" unique="false"
	 */
	public Integer getOrderState() {
		return this.orderState;
	}
	
	/**
	 * Set the orderState
	 */	
	public void setOrderState(Integer aValue) {
		this.orderState = aValue;
	}	

	/**
	 * 模板审单状态：0已审，1未审，2有问题	 * @return Integer
	 * @hibernate.property column="checkState" type="java.lang.Integer" length="10" not-null="false" unique="false"
	 */
	public Integer getCheckState() {
		return this.checkState;
	}
	
	/**
	 * Set the checkState
	 */	
	public void setCheckState(Integer aValue) {
		this.checkState = aValue;
	}	

	/**
	 * 	 * @return Integer
	 */
	public Integer getModelId() {
		return this.getModel()==null?null:this.getModel().getModelId();
	}
	
	/**
	 * Set the modelId
	 */	
	public void setModelId(Integer aValue) {
	    if (aValue==null) {
	    	model = null;
	    } else {
	        model = new com.cartmatic.estore.common.model.model.Model(aValue);
	        model.setVersion(new Integer(0));//set a version to cheat hibernate only
	    }
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
	 * 	 * @return String
	 * @hibernate.property column="bara" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBara() {
		return this.bara;
	}
	
	/**
	 * Set the bara
	 */	
	public void setBara(String aValue) {
		this.bara = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="barb" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBarb() {
		return this.barb;
	}
	
	/**
	 * Set the barb
	 */	
	public void setBarb(String aValue) {
		this.barb = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="barc" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBarc() {
		return this.barc;
	}
	
	/**
	 * Set the barc
	 */	
	public void setBarc(String aValue) {
		this.barc = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="bard" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBard() {
		return this.bard;
	}
	
	/**
	 * Set the bard
	 */	
	public void setBard(String aValue) {
		this.bard = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="bare" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBare() {
		return this.bare;
	}
	
	/**
	 * Set the bare
	 */	
	public void setBare(String aValue) {
		this.bare = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="barf" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBarf() {
		return this.barf;
	}
	
	/**
	 * Set the barf
	 */	
	public void setBarf(String aValue) {
		this.barf = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="barg" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBarg() {
		return this.barg;
	}
	
	/**
	 * Set the barg
	 */	
	public void setBarg(String aValue) {
		this.barg = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="barh" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBarh() {
		return this.barh;
	}
	
	/**
	 * Set the barh
	 */	
	public void setBarh(String aValue) {
		this.barh = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="bari" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBari() {
		return this.bari;
	}
	
	/**
	 * Set the bari
	 */	
	public void setBari(String aValue) {
		this.bari = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="barj" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBarj() {
		return this.barj;
	}
	
	/**
	 * Set the barj
	 */	
	public void setBarj(String aValue) {
		this.barj = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="bark" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBark() {
		return this.bark;
	}
	
	/**
	 * Set the bark
	 */	
	public void setBark(String aValue) {
		this.bark = aValue;
	}	

	/**
	 * 	 * @return String
	 * @hibernate.property column="barl" type="java.lang.String" length="65535" not-null="false" unique="false"
	 */
	public String getBarl() {
		return this.barl;
	}
	
	/**
	 * Set the barl
	 */	
	public void setBarl(String aValue) {
		this.barl = aValue;
	}	

	/**
	 * @see java.lang.Object#equals(Object)
	 */
	public boolean equals(Object object) {
		if (!(object instanceof ModelOrderTbl)) {
			return false;
		}
		ModelOrderTbl rhs = (ModelOrderTbl) object;
		return new EqualsBuilder()
				.append(this.modelOrderId, rhs.modelOrderId)
				.append(this.ordernum, rhs.ordernum)
				.append(this.createTime, rhs.createTime)
				.append(this.orderState, rhs.orderState)
				.append(this.checkState, rhs.checkState)
						.append(this.remarks, rhs.remarks)
				.append(this.bara, rhs.bara)
				.append(this.barb, rhs.barb)
				.append(this.barc, rhs.barc)
				.append(this.bard, rhs.bard)
				.append(this.bare, rhs.bare)
				.append(this.barf, rhs.barf)
				.append(this.barg, rhs.barg)
				.append(this.barh, rhs.barh)
				.append(this.bari, rhs.bari)
				.append(this.barj, rhs.barj)
				.append(this.bark, rhs.bark)
				.append(this.barl, rhs.barl)
				.isEquals();
	}

	/**
	 * @see java.lang.Object#hashCode()
	 */
	public int hashCode() {
		return new HashCodeBuilder(-82280557, -700257973)
				.append(this.modelOrderId) 
				.append(this.ordernum) 
				.append(this.createTime) 
				.append(this.orderState) 
				.append(this.checkState) 
						.append(this.remarks) 
				.append(this.bara) 
				.append(this.barb) 
				.append(this.barc) 
				.append(this.bard) 
				.append(this.bare) 
				.append(this.barf) 
				.append(this.barg) 
				.append(this.barh) 
				.append(this.bari) 
				.append(this.barj) 
				.append(this.bark) 
				.append(this.barl) 
				.toHashCode();
	}

	/**
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return new ToStringBuilder(this)
				.append("modelOrderId", this.modelOrderId) 
				.append("ordernum", this.ordernum) 
				.append("createTime", this.createTime) 
				.append("orderState", this.orderState) 
				.append("checkState", this.checkState) 
						.append("remarks", this.remarks) 
				.append("bara", this.bara) 
				.append("barb", this.barb) 
				.append("barc", this.barc) 
				.append("bard", this.bard) 
				.append("bare", this.bare) 
				.append("barf", this.barf) 
				.append("barg", this.barg) 
				.append("barh", this.barh) 
				.append("bari", this.bari) 
				.append("barj", this.barj) 
				.append("bark", this.bark) 
				.append("barl", this.barl) 
				.toString();
	}

	/**
	 * Return the name of the first key column
	 */
	public String getFirstKeyColumnName() {
		return "modelOrderId";
	}
	
	/**
	 * Return the Id (pk) of the entity, must be Integer
	 */
	public Integer getId() {
		return modelOrderId;
	}

}
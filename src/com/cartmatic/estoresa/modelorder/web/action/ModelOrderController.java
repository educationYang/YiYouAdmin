package com.cartmatic.estoresa.modelorder.web.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;

import com.cartmatic.estore.common.model.model.Model;
import com.cartmatic.estore.common.model.modelorder.ModelOrder;
import com.cartmatic.estore.core.controller.GenericController;
import com.cartmatic.estore.core.util.CollectionUtil;
import com.cartmatic.estore.core.view.AjaxView;
import com.cartmatic.estore.model.service.ModelManager;
import com.cartmatic.estore.modelorder.service.ModelOrderManager;
import com.cartmatic.extend.freemark.util.FreeMarkertUtil;

public class ModelOrderController extends GenericController<ModelOrder> {
    
	private ModelOrderManager modelOrderManager = null;
	
    private ModelManager modelManager =null;
    
	public ModelManager getModelManager() {
		return modelManager;
	}


	public void setModelManager(ModelManager modelManager) {
		this.modelManager = modelManager;
	}

	
    public void setModelOrderManager(ModelOrderManager inMgr) {
        this.modelOrderManager = inMgr;
    }

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController getEntityName(java.lang.Object)
	 */
	@Override
	protected String getEntityName(ModelOrder entity) {
		return entity.getModelOrderName();
	}

	/**
	 * 构造批量更新所需的model。
	 * <P>
	 * 本来这方法对大部分情况也是可以自动分析和转换的，但考虑到比较复杂和难以灵活（验证、缺省值、I18N等、Status转换等），暂时要求各模块自己实现。要求数据要先转换为正确的类型。
	 * 
	 * @param request
	 * @return
	 */
	@Override
	protected Map<Integer, Map<String, Object>> getMultiSaveModel(HttpServletRequest request) {
		//FIXME
		throw new RuntimeException("Not implemented yet!");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.BaseController#initController()
	 */
	@Override
	protected void initController() throws Exception {
		mgr = modelOrderManager;
	}

	
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.cartmatic.estore.core.controller.GenericController onSave(javax.servlet.http.HttpServletRequest,
	 *      java.lang.Object, org.springframework.validation.BindException)
	 */
	protected void onSave(HttpServletRequest request, ModelOrder entity, BindException errors) {
		try{
			String  modelId =request.getParameter("arrayculId");
			Model model = modelManager.getById(Integer.parseInt(modelId));
			model.setChoiceNum(model.getChoiceNum()+1);
			entity.setModel(model);
			//entity.setWriter(RequestContext.getCurrentUserNameDefaultSystem());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	

	
	/**
	 * 功能:审单获取静态化页面,返回静态化后页面路径
	 * <p>作者 杨荣忠 2015-9-23 上午10:16:51
	 * @param request
	 * @param response
	 * @return
	 * doAction="getWebPage"
	 */
	public ModelAndView getWebPage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        AjaxView ajaxView = new AjaxView(response);
        Short flag = 0;
        String msg ="";
    	Integer id = Integer.parseInt(request.getParameter("id"));
		ModelOrder entity = modelOrderManager.getById(id);
        try{
    		new FreeMarkertUtil().analysisTemplateModelOrder(entity);
        	flag =1;
        	msg =entity.getDomainName()+".html";
    		//模板审单状态：0已审，1未审，2有问题
    		entity.setCheckState(0);
    		//模板订单状态：0完成，1未完成，2紧急且未完成（顾客要求时间1天内上距当前时间）
    		entity.setOrderState(1);
    		entity.setDomainPath("http://www.yiyou.space/"+entity.getDomainName()+".html");
    		modelOrderManager.save(entity);
        }
          catch(Exception e)
        {
        	flag =0;
        }
          ajaxView.setStatus(flag);
          ajaxView.setMsg(msg);
          return ajaxView;
	}
	
	
	/**
	 * 功能:判断新生成的域名是否已存在
	 * <p>作者 杨荣忠 2015-9-23 上午10:16:51
	 * @param request
	 * @param response
	 * @return
	 * doAction="checkDomainNameExit"
	 */
	public ModelAndView checkDomainNameExit(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        AjaxView ajaxView = new AjaxView(response);
        Short flag = 0;
    	String  domainName = request.getParameter("domainName");
    	List<ModelOrder> entityList = modelOrderManager.findByProperty("domainName",domainName);
    	
    	if(CollectionUtils.isEmpty(entityList))
    		//为空，可以存在
    	  flag =1;
    	else
    		//不为空，已存在
    	 flag = 0;
         ajaxView.setStatus(flag);
         return ajaxView;
	}

}

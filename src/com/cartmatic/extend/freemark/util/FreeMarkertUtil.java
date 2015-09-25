package com.cartmatic.extend.freemark.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import com.cartmatic.estore.common.model.modelorder.ModelOrder;
import com.cartmatic.extend.sqlhelp.util.SQLProperties;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;


/**
 * @author hailang
 * @date 2009-7-9 上午09:55:43
 * @param templateName 模板文件名称 
 * @param root 数据模型根对象
 * @param templateEncoding 模板文件的编码方式
 */
public class FreeMarkertUtil {
	
	public FreeMarkertUtil(){
		
	}
	
	public  void analysisTemplate(String templateName,String templateEncoding,Map<?,?> root){
		try {
			Configuration config=new Configuration();
			File file=new File("src/templates");
			//设置要解析的模板所在的目录，并加载模板文件
			config.setDirectoryForTemplateLoading(file);
			//设置包装器，并将对象包装为数据模型
			config.setObjectWrapper(new DefaultObjectWrapper());
			
			//获取模板,并设置编码方式，这个编码必须要与页面中的编码格式一致
			Template template=config.getTemplate(templateName,templateEncoding);
			
			//合并数据模型与模板
			Writer out = new OutputStreamWriter(System.out);  //或者用StringWriter stringWriter = new StringWriter();  以便得到一个字符串
		  template.process(root, out);
		  out.flush();
		  out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}catch (TemplateException e) {
			e.printStackTrace();
		}
	} 
	
	
	
	
	/**
	 * 功能:审单获取静态化页面,返回静态化后页面路径
	 * <p>作者 杨荣忠 2015-9-23 上午10:35:29
	 * @param entity
	 * @return
	 */
	public  void analysisTemplateModelOrder(ModelOrder entity){
		String templateName=entity.getModel().getModelId().toString()+".ftl";
		String templateEncoding = "UTF-8";
		
		String toFile ="E:\\apache-tomcat-6.0.36\\webapps\\yiyou\\"+entity.getDomainName()+".html";
		//String toFile ="/data/mindo/tomcat-live/webapps/ROOT/"+entity.getDomainName()+".html";
		Map<String,ModelOrder> root = new HashMap();
		root.put("entity", entity);
		analysisTemplateYang( templateName, templateEncoding, toFile, root);
	}
	
   public void deleteOrign(String name){
	   
   }
	
	
	
	/**
	 * 功能:freemar生成静态页面
	 * <p>作者 杨荣忠 2015-6-24 上午10:33:29
	 * @param templateName
	 * @param templateEncoding
	 * @param toFile
	 * @param root
	 */
	public   void analysisTemplateYang(String templateName,String templateEncoding,String toFile,Map<?,?> root){
		try {
			Configuration config=new Configuration();
			String path = new FreeMarkertUtil().getClass().getClassLoader().getResource("").getPath()+File.separator+"templatesPage";
			File file=new File(path);
			//设置要解析的模板所在的目录，并加载模板文件
			config.setDirectoryForTemplateLoading(file);
			//设置包装器，并将对象包装为数据模型
			config.setObjectWrapper(new DefaultObjectWrapper());
			
			//获取模板,并设置编码方式，这个编码必须要与页面中的编码格式一致
			Template template=config.getTemplate(templateName,templateEncoding);
			
			//合并数据模型与模板  
			   FileOutputStream fos = new FileOutputStream(toFile);  
			   Writer out = new OutputStreamWriter(fos,templateEncoding);  
			//合并数据模型与模板
			//Writer out = new OutputStreamWriter(System.out);  //或者用StringWriter stringWriter = new StringWriter();  以便得到一个字符串
		  template.process(root, out);
		  out.flush();
		  out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}catch (TemplateException e) {
			e.printStackTrace();
		}
	} 
	
	
	/**
	 * 功能:action层触发会调用
	 * <p>作者 杨荣忠 2015-6-24 上午10:37:47
	 * @param file
	 * @param templateName
	 * @param templateEncoding
	 * @param root
	 * @param out
	 */
	public  void analysisTemplateTwo(File file, String templateName,String templateEncoding,Map<?,?> root ,Writer out){
    try {
      Configuration config=new Configuration();
    
      //设置要解析的模板所在的目录，并加载模板文件
      config.setDirectoryForTemplateLoading(file);
      //设置包装器，并将对象包装为数据模型
      config.setObjectWrapper(new DefaultObjectWrapper());
      config.setDefaultEncoding(templateEncoding);
      //获取模板,并设置编码方式，这个编码必须要与页面中的编码格式一致
      Template template=config.getTemplate(templateName,templateEncoding);
      template.setEncoding(templateEncoding);
      //合并数据模型与模板
      //Writer out = new OutputStreamWriter(System.out);
      template.process(root, out);
      out.flush();
      out.close();
    } catch (IOException e) {
      e.printStackTrace();
    }catch (TemplateException e) {
      e.printStackTrace();
    }
  
  } 
	
}

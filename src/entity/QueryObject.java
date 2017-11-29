package entity;

import java.util.ArrayList;
import java.util.List;

public class QueryObject {
	//存放参数的集合
		private List<Object> params = new ArrayList<Object>();
	//放sql语句的集合
		private List<Object> conditions = new ArrayList<Object>();
	//页面大小
		 Integer pageSize=3;
	//当前页面	
		 Integer currentPage=1;
	//获取参数
		public List<Object> getParams(){
			return params;
		}
	//完整拼接SQl语句
		public String querySQL(){
			//每次都new一个新的，保证sql语句不重复
			 params = new ArrayList<Object>();
				//放sql语句的集合
			 conditions = new ArrayList<Object>();
			//拼接SQL
			customQuery();
			StringBuilder sql=new StringBuilder();
			if(conditions.size()>0){
				sql.append(" WHERE");
				sql.append(org.apache.commons.lang3.StringUtils.join(conditions, " AND"));
			}

			return sql.toString();
		}
		//该方法把子类参数传过来
		public void add(String condition,Object param) {
			conditions.add(condition);
			params.add(param);
			
		}
		//钩子方法
		protected void customQuery(){
			
		}
		public Integer getPageSize() {
			return pageSize;
		}
		public void setPageSize(Integer pageSize) {
			this.pageSize = pageSize;
		}
		public Integer getCurrentPage() {
			return currentPage;
		}
		public void setCurrentPage(Integer currentPage) {
			this.currentPage = currentPage;
		}
		
}

package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.JDBCUtils;
import entity.CommodityType;
import entity.Product;




/**
 * @author Administrator
 *商品类型的数据库处理类
 * 对应数据库COMMODITYTYPE表
 */
public class CommodityTypeDao {
	//创建一个JDBC
			private JDBCUtils util = new JDBCUtils();

			public CommodityTypeDao() {
				util.getConnection();
			}
	DBconn conn = new DBconn();
	//在数据库中添加商品类型
	public boolean add(CommodityType com){
		return conn.update("insert into CommodityType(PARENTTYPEID,TYPENAME) values(?,?)", 
				new String[]{String.valueOf(com.getParentTypeId()),com.getTypeName()})>0;
	} 
	//根据商品id来删除商品类型
	public boolean deleteById(int typeId){
		return conn.update("delete from CommodityType where typeId=?", 
				new String[]{String.valueOf(typeId)})>0;
	}
	//根据商品对象来更新商品类型
	public boolean updateByCommodityType(CommodityType com){
		return conn.update("update CommodityType set PARENTTYPEID=?,TYPENAME=? where typeId=?", 
				new String[]{String.valueOf(com.getParentTypeId()),
				             com.getTypeName(),
				             String.valueOf(com.getTypeId())})>0;
	}
	/**
	 * @param typeId
	 * @return根据ID获取商品类型的数据
	 */
	public CommodityType queryById(int typeId){
		CommodityType com=new CommodityType();
		ResultSet rs=conn.query("select * from CommodityType where typeId=?", new String[]{String.valueOf(typeId)});
		try {
			while(rs.next()){
				com.setTypeId(rs.getInt("typeId"));		//类别编号
				com.setTypeName(rs.getString("typeName"));	//类别名称
				com.setParentTypeId(rs.getInt("parentTypeId"));	//父类ID
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return com;
	}/**
	 * @param typeId
	 * @return根据父类ID获取商品类型的数据
	 */
	public ArrayList<CommodityType> queryByPid(int parentTypeId){
		ArrayList<CommodityType> list=new ArrayList<CommodityType>();
		ResultSet rs=conn.query("select * from CommodityType where parentTypeId=? order by typeId ", new String[]{String.valueOf(parentTypeId)});
		try {
			while(rs.next()){
				CommodityType com=new CommodityType(rs.getInt("typeId"),
                        rs.getString("typeName"),
                        rs.getInt("parentTypeId"));
					list.add(com);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return list;
	}
	/**
	 * @return
	 * 返回所有的商品类型数据
	 */
	public ArrayList<CommodityType> queryAll(){
		ArrayList<CommodityType> list=new ArrayList<CommodityType>();
		ResultSet rs=conn.query("select * from CommodityType order by parentTypeId,typeId  ", null);
		try {
			while(rs.next()){
				CommodityType com=new CommodityType(rs.getInt("typeId"),
						                            rs.getString("typeName"),
						                            rs.getInt("parentTypeId"));
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	
	/**
	 * @param typeName类型名称
	 * @return根据类型名查询类型id
	 */
	public int queryTypeId(String typeName){
		int typeId=-1;
		String sql = "select typeid from commodityType where typename=?";
		ResultSet rs=conn.query(sql, new String[]{typeName});
		try {
			if(rs.next()){
				typeId = rs.getInt("typeid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return typeId;
	}
	
	/**
	 * @return所有子类型
	 */
	public ArrayList<CommodityType> querySubType(){
		ArrayList<CommodityType> list = new ArrayList<CommodityType>();
		String sql = "select * from commodityType where PARENTTYPEID<>0 order by typeId";
		ResultSet rs=conn.query(sql, null);
		try {
			while(rs.next()){
				CommodityType type = new CommodityType();
				type.setTypeId(rs.getInt(1));
				type.setParentTypeId(rs.getInt(2));
				type.setTypeName(rs.getString(3));
				list.add(type);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	
	/**
	 * 分页和高级查询
	 * @param currentPage 当前页
	 * @param pageSize 页面大小
	 * @return list
	 * @throws Exception
	 */
/*	public PageResult queryPage(ProductObject po) throws Exception{
		String sql = "SELECT * FROM product "+po.querySQL()+" LIMIT ?,?";
		System.out.println("sql"+sql);
		List<Object> params  = new ArrayList<Object>();
		System.out.println("po.getParams()"+po.getParams());
		if(po.getParams().size()!=0){
		params.addAll(po.getParams());  
		}
		params.add((po.getCurrentPage()-1)*po.getPageSize());
		params.add(po.getPageSize());
		
		System.out.println(params);
		List<Product> list = util.findMoreRefResult(sql, params, Product.class);
		System.out.println("list"+list);
		//
		Integer page = (int)totalPage(po);
		PageResult pr = new PageResult(list, page, po.getCurrentPage(), po.getPageSize());
		return pr;
	}*/
//	/**
//	 * 分页
//	 * @param currentPage
//	 * @param pageSize
//	 * @return list
//	 * @throws Exception
//	 */
//	public List<Product> queryPage(Integer currentPage, Integer pageSize) throws Exception{
//		String sql = "SELECT * FROM product LIMIT ?,?";
//		List<Object> params  = new ArrayList<Object>();
//		params.add((currentPage-1)*pageSize);
//		params.add(pageSize);
//		List<Product> list = util.findMoreRefResult(sql, params, Product.class);
//		return list;
//	}
/**
 * 查找有几条
 * @return result
 */
	public long totalPage(){
		
		String sql="SELECT COUNT(*) FROM commodityType ";
		long result=0;
		ResultSet resultSet = conn.query(sql, null);
		try {
			if(resultSet.next()){
				//总条数只有一个所以为1
				 result = resultSet.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
	public List queryPage(Integer pageSize, Integer currentPage) throws Exception{
		String sql = "select * from ( select row_.*, rownum rownum_ from (select * from commodityType ) row_ where ? >= rownum )where rownum_ > ?";
		System.out.println("11111111");
		List<Object> params  = new ArrayList<Object>();
		System.out.println("11111111");
		params.add(pageSize);
		System.out.println("11111111");
		params.add((currentPage-1)*pageSize);
		System.out.println(params);
		List list = util.findMoreRefResult(sql, params, Product.class);
		System.out.println("list"+list);
		return list;
	}
}
	


package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Article;
import entity.Commodity;



/**
 * 商品的数据库处理类
 * 对应数据库COMMODITY表
 * @author Administrator
 *
 */
public class CommodityDao {
	DBconn conn = new DBconn();
	//在数据库中添加一个商品
	public boolean add(Commodity cmd){
		return conn.update("insert into COMMODITY(COMMODITYNAME,TYPEID,COMMODITYMATERIAL,COMMODITYPCAK,COMMODITYLANGUAGE,COMMODITYDESCRIPTION,COMMODITYMARKETPRICE,COMMODITYPRESENTPRICE,COMMODITYPICTURE,COMMODITYDETAIL,COMMODITYKEYWORD,COMMODITYADDEDTIME,ISTOP) values(?,?,?,?,?,?,?,?,?,?,?,sysdate,?)", 
				new String[]{
					cmd.getCommodityName(),
					String.valueOf(cmd.getTypeId()),
					cmd.getCommodityMaterial(),
					cmd.getCommodityPcak(),
					cmd.getCommodityLanguage(),
					cmd.getCommodityDescription(),
					String.valueOf(cmd.getCommodityMarketPrice()),
					String.valueOf(cmd.getCommodityPresentPrice()),
					cmd.getCommodityPicture(),cmd.getCommodityDetail(),
					cmd.getCommodityKeyword(),
					//cmd.getCommodityAddedtime(),
					cmd.getIsTop()
				})>0;
	}
	//根据商品id来删除商品
	public boolean deleteById(int cmdId){
		return conn.update("delete from COMMODITY where COMMODITYID=?", 
				new String[]{String.valueOf(cmdId)})>0;
	}
	//根据商品对象来更新商品
	public boolean updateByCommodity(Commodity cmd){
		return conn.update("update COMMODITY set COMMODITYNAME=?,TYPEID=?,COMMODITYMATERIAL=?, COMMODITYPCAK=?,COMMODITYLANGUAGE=?,COMMODITYDESCRIPTION=?,COMMODITYMARKETPRICE=?,COMMODITYPRESENTPRICE=?,COMMODITYPICTURE=?,COMMODITYDETAIL=?,COMMODITYKEYWORD=?,COMMODITYADDEDTIME=to_date(?,'yyyy-mm-dd hh24:mi:ss'),ISTOP=?,COMMODITYCLICKNUM=? where COMMODITYID=?", 
				new String[]{
					cmd.getCommodityName(),
					String.valueOf(cmd.getTypeId()),
					cmd.getCommodityMaterial(),
					cmd.getCommodityPcak(),
					cmd.getCommodityLanguage(),
					cmd.getCommodityDescription(),
					String.valueOf(cmd.getCommodityMarketPrice()),
					String.valueOf(cmd.getCommodityPresentPrice()),
					cmd.getCommodityPicture(),
					cmd.getCommodityDetail(),
					cmd.getCommodityKeyword(),
					cmd.getCommodityAddedtime(),
					cmd.getIsTop(),
					String.valueOf(cmd.getCommodityClickNum()),
					String.valueOf(cmd.getCommodityId())
				})>0;
	}
	
	/**
	 * @param price
	 * @return 根据价格查询数据
	 */
	public ArrayList<Commodity> queryAllByPrice(String price){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		String str="select * from COMMODITY where 1=1 ";
		str=str+price;
		
		ResultSet rs=conn.query(str,null);
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				list.add(cmd);
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
	 * @param keyword
	 * @return 根据商品的关键字来从商品名字中查询商品信息
	 */
	public ArrayList<Commodity> queryByKeywordFromName(String keyword){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select a.*,b.TYPENAME from COMMODITY a inner join COMMODITYTYPE b on(a.TYPEID=b.TYPEID) where a.COMMODITYKEYWORD like '%"+keyword+"%'",null);
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				cmd.setTypeName(rs.getString("TYPENAME"));
				list.add(cmd);
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
	 * @param keyword
	 * @return 根据商品的关键字来模糊查询完整关键字
	 */
	public ArrayList<String> queryByKeyword2(String keyword){
		ArrayList<String> list = new  ArrayList<String>();
		ResultSet rs=conn.query("select COMMODITYKEYWORD from COMMODITY where COMMODITYKEYWORD like '%"+keyword+"%'",null);
		
		try {
			while(rs.next()){
				list.add(rs.getString("COMMODITYKEYWORD"));
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
	 * @param keyword
	 * @return 根据商品的关键字来模糊查询完整关键字
	 */
	public ArrayList<String> queryNameByKeyword(String keyword){
		ArrayList<String> list = new  ArrayList<String>();
		ResultSet rs=conn.query("select COMMODITYNAME from COMMODITY where COMMODITYNAME like '%"+keyword+"%'",null);
		
		try {
			while(rs.next()){
				list.add(rs.getString("COMMODITYNAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	
	//根据商品的类型ID来查询商品信息8个
	/**
	 * @param parentid
	 * @return 根据父ID查询销量前8的鲜花产品
	 */
	public ArrayList<Commodity> queryAllByTypeId(String parentid){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select a.*,rownum,b.TYPENAME from (select * from commodity where typeid in(select typeid from COMMODITYtype where parentTYPEID=?) order by commoditySale desc)a inner join COMMODITYTYPE b on(a.TYPEID=b.TYPEID) where rownum<=8 order by rownum", new String[]{parentid});
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				cmd.setTypeName(rs.getString("TYPENAME"));
				list.add(cmd);
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
	 * @param parentid
	 * @return根据父ID按销量查询4个商品
	 */
	public ArrayList<Commodity> queryAllByTypeId1(String parentid){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select a.*,rownum,b.TYPENAME from (select * from commodity where typeid in(select typeid from COMMODITYtype where parentTYPEID=?) order by commoditySale desc)a inner join COMMODITYTYPE b on(a.TYPEID=b.TYPEID) where rownum<=4 order by rownum", new String[]{parentid});
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				cmd.setTypeName(rs.getString("TYPENAME"));
				list.add(cmd);
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
	 * @return 返回所有商品中销量最高的4件商品
	 */
	public ArrayList<Commodity> queryAllHotCommoditys(){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select a.*,rownum from (select * from commodity where typeid in(select typeid from COMMODITYtype) order by commoditySale desc)a where rownum<=4 order by rownum",null);
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				list.add(cmd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	
	//
	/**根据父ID查询商品的价格最低的3个
	 * @return
	 */
	public ArrayList<Commodity> queryByPrice(){
		
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select a.*,rownum,b.TYPENAME from (select * from commodity where typeid in(select typeid from COMMODITYtype where parentTYPEID=1) order by commodityPresentPrice ASC)a inner join COMMODITYTYPE b on(a.TYPEID=b.TYPEID) where rownum<=3 order by rownum",null);
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				cmd.setTypeName(rs.getString("TYPENAME"));
				list.add(cmd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	
	
	//
	/**
	 * @param PARENTID
	 * @return根据商品的类型ID来查询前三个商品信息
	 */
	public ArrayList<Commodity> queryThreeByTypeId(String PARENTID){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select * from COMMODITY where TYPEID=? and rownum<=3 order by commoditySale ASC ", new String[]{PARENTID});
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				list.add(cmd);
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
	 * @param PARENTID
	 * @return根据父类Id查询前三个鲜花
	 */
	public ArrayList<Commodity> queryAll(String PARENTID){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select a.*,rownum from (select * from commodity where typeid in(select typeid from COMMODITYtype where parentTYPEID="+PARENTID+")  order by COMMODITYID ASC)a where rownum<=3 ", null);
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				list.add(cmd);
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
	 * @param PARENTID
	 * @return根据商品Id查询全部信息
	 */
	public ArrayList<Commodity> queryByTypeId(String PARENTID){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select * from COMMODITY where TYPEID=? ", new String[]{PARENTID});
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				list.add(cmd);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	
	/**根据商品父类型id查询销量最高的5件商品
	 * @param PARENTID 父类型id
	 * @return商品集合
	 */
	public ArrayList<Commodity> querySalesRanking(String PARENTID){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select * from(select a.*,rownum from commodity a where typeid in( select typeId from commoditytype where parenttypeid=?) order by commoditysale desc) where rownum<=4", new String[]{PARENTID});
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				list.add(cmd);
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
	 * @param str
	 * @param page
	 * @param size查询分类的分页
	 * @return
	 */
	public ArrayList<Commodity> queryByTypeIdSql(String str,int page,int size) {
		ArrayList<Commodity> list = new ArrayList<Commodity>();
		Commodity com=null;
		String sql = "select b.* from (select a.*,rownum rn from(select * from commodity where 1=1 "+str+"  order by commodityid desc)a  where rownum<="+page*size+" )b where b.rn>"+(page-1)*size;
		ResultSet rs = conn.query(sql,null);
		try {
			while (rs.next()) {
				com = new Commodity();
				com.setCommodityId(rs.getInt(1));
				com.setCommodityName(rs.getString(2));
				com.setTypeId(rs.getInt(3));
				com.setCommodityMaterial(rs.getString(4));
				com.setCommodityPcak(rs.getString(5));
				com.setCommodityLanguage(rs.getString(6));
				com.setCommodityDescription(rs.getString(7));
				com.setCommodityMarketPrice(rs.getInt(8));
				com.setCommodityPresentPrice(rs.getInt(9));
				com.setCommodityPicture(rs.getString(10));
				com.setCommodityDetail(rs.getString(11));
				com.setCommoditySale(rs.getInt(12));
				com.setCommodityKeyword(rs.getString(13));
				com.setCommodityAddedtime(rs.getString(14).substring(0,rs.getString("COMMODITYADDEDTIME").length()-2));
				com.setIsTop(rs.getString(15));
				com.setCommodityClickNum(rs.getInt(16));
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	
	/**
	 * @param str
	 * @param page
	 * @param size查询全部鲜花分页
	 * @return
	 */
	public ArrayList<Commodity> queryAllByTypeIdSql(String PARENTID,int page,int size) {
		ArrayList<Commodity> list = new ArrayList<Commodity>();
		Commodity com=null;
		String sql = "select b.* from (select a.*,rownum rn from(select * from commodity where typeid in(select typeid from COMMODITYtype where parentTYPEID="+PARENTID+") order by COMMODITYID ASC)a where rownum<="+page*size+" )b where b.rn>"+(page-1)*size;
		ResultSet rs = conn.query(sql,null);
		try {
			while (rs.next()) {
				com = new Commodity();
				com.setCommodityId(rs.getInt(1));
				com.setCommodityName(rs.getString(2));
				com.setTypeId(rs.getInt(3));
				com.setCommodityMaterial(rs.getString(4));
				com.setCommodityPcak(rs.getString(5));
				com.setCommodityLanguage(rs.getString(6));
				com.setCommodityDescription(rs.getString(7));
				com.setCommodityMarketPrice(rs.getInt(8));
				com.setCommodityPresentPrice(rs.getInt(9));
				com.setCommodityPicture(rs.getString(10));
				com.setCommodityDetail(rs.getString(11));
				com.setCommoditySale(rs.getInt(12));
				com.setCommodityKeyword(rs.getString(13));
				com.setCommodityAddedtime(rs.getString(14).substring(0,rs.getString("COMMODITYADDEDTIME").length()-2));
				com.setIsTop(rs.getString(15));
				com.setCommodityClickNum(rs.getInt(16));
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	
	/**
	 * @param str
	 * @param page
	 * @param size查询特价商品的分类查询
	 * @return
	 */
	public ArrayList<Commodity> queryByTJSql(String str,int page,int size) {
		ArrayList<Commodity> list = new ArrayList<Commodity>();
		Commodity com=null;
		String sql = "select b.* from (select a.*,rownum rn from(select * from commodity where 1=1 "+str+" )a  where rownum<="+page*size+" )b where b.rn>"+(page-1)*size;
		ResultSet rs = conn.query(sql,null);
		try {
			while (rs.next()) {
				com = new Commodity();
				com.setCommodityId(rs.getInt(1));
				com.setCommodityName(rs.getString(2));
				com.setTypeId(rs.getInt(3));
				com.setCommodityMaterial(rs.getString(4));
				com.setCommodityPcak(rs.getString(5));
				com.setCommodityLanguage(rs.getString(6));
				com.setCommodityDescription(rs.getString(7));
				com.setCommodityMarketPrice(rs.getInt(8));
				com.setCommodityPresentPrice(rs.getInt(9));
				com.setCommodityPicture(rs.getString(10));
				com.setCommodityDetail(rs.getString(11));
				com.setCommoditySale(rs.getInt(12));
				com.setCommodityKeyword(rs.getString(13));
				com.setCommodityAddedtime(rs.getString(14).substring(0,rs.getString("COMMODITYADDEDTIME").length()-2));
				com.setIsTop(rs.getString(15));
				com.setCommodityClickNum(rs.getInt(16));
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	
	
	
	/**
	 * @param floral
	 * @return根据花材名称来查询商品信息
	 */
	public ArrayList<Commodity> queryAllByFloral(String floral){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select * from COMMODITY where COMMODITYMATERIAL like '%"+floral+"%'",null);
		
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				list.add(cmd);
				
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
	 * @param keyword
	 * @return 根据商品的关键字来查询商品信息
	 */
	public ArrayList<Commodity> queryByKeyword(String keyword){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select a.*,b.TYPENAME from COMMODITY a inner join COMMODITYTYPE b on(a.TYPEID=b.TYPEID) where a.COMMODITYNAME like '%"+keyword+"%'",null);
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				cmd.setTypeName(rs.getString("TYPENAME"));
				list.add(cmd);
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
	 * @param cmdId
	 * @return根据商品的id来在查找出这个商品对象
	 */
	public Commodity queryByCommodityId(String cmdId){
		Commodity cmd = new Commodity();
		
		ResultSet rs=conn.query("select * from COMMODITY where COMMODITYID=?", new String[]{cmdId});
		try {
			while(rs.next()){
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME").substring(0,rs.getString("COMMODITYADDEDTIME").length()-2));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return cmd;
	}
	
	
	/**
	 * @param mate
	 * @return 根据商品的花类来查询商品信息
	 */
	public ArrayList<Commodity> queryByMate(String mate){
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select * from COMMODITY where COMMODITYMATERIAL like '%"+mate+"%'",null);
		try {
			while(rs.next()){
				Commodity cmd = new Commodity();
				cmd.setCommodityId(rs.getInt("COMMODITYID"));
				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
				cmd.setTypeId(rs.getInt("TYPEID"));
				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
				cmd.setIsTop(rs.getString("ISTOP"));
				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
				list.add(cmd);
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
	 * @param page页数
	 * @param size显示记录数
	 * @return根据分页获取数据记录
	 */
	public ArrayList<Commodity> queryByPage(int typeId,int page,int size) {
		ArrayList<Commodity> list = new ArrayList<Commodity>();
		Commodity com=null;
		String sql="select b.* from (select a.*,rownum rn from(select * from commodity where typeid=?  order by commodityid desc)a  where rownum<="+page*size+" )b where b.rn>"+(page-1)*size;
		String[] paras=new String[]{String.valueOf(typeId)};
		ResultSet rs = conn.query(sql,paras);
		try {
			while (rs.next()) {
				com = new Commodity();
				com.setCommodityId(rs.getInt(1));
				com.setCommodityName(rs.getString(2));
				com.setTypeId(rs.getInt(3));
				com.setCommodityMaterial(rs.getString(4));
				com.setCommodityPcak(rs.getString(5));
				com.setCommodityLanguage(rs.getString(6));
				com.setCommodityDescription(rs.getString(7));
				com.setCommodityMarketPrice(rs.getInt(8));
				com.setCommodityPresentPrice(rs.getInt(9));
				com.setCommodityPicture(rs.getString(10));
				com.setCommodityDetail(rs.getString(11));
				com.setCommoditySale(rs.getInt(12));
				com.setCommodityKeyword(rs.getString(13));
				com.setCommodityAddedtime(rs.getString(14).substring(0,rs.getString(14).length()-2));
				com.setIsTop(rs.getString(15));
				com.setCommodityClickNum(rs.getInt(16));
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	
	/**
	 * @param typeId
	 * @return 获取总的数据记录个数
	 */
	public int getRecordCount(int typeId){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from commodity where typeId=?",new String[]{String.valueOf(typeId)});
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	
	/**
	 * @param str
	 * @param page
	 * @param size
	 * @return 根据语句分页查询数据
	 */
	public ArrayList<Commodity> queryByPageSql(String str,int page,int size) {
		ArrayList<Commodity> list = new ArrayList<Commodity>();
		Commodity com=null;
		String sql = "select b.* from (select a.*,rownum rn from(select * from commodity where 1=1 "+str+"  order by commodityid desc)a  where rownum<="+page*size+" )b where b.rn>"+(page-1)*size;
		ResultSet rs = conn.query(sql,null);
		try {
			while (rs.next()) {
				com = new Commodity();
				com.setCommodityId(rs.getInt(1));
				com.setCommodityName(rs.getString(2));
				com.setTypeId(rs.getInt(3));
				com.setCommodityMaterial(rs.getString(4));
				com.setCommodityPcak(rs.getString(5));
				com.setCommodityLanguage(rs.getString(6));
				com.setCommodityDescription(rs.getString(7));
				com.setCommodityMarketPrice(rs.getInt(8));
				com.setCommodityPresentPrice(rs.getInt(9));
				com.setCommodityPicture(rs.getString(10));
				com.setCommodityDetail(rs.getString(11));
				com.setCommoditySale(rs.getInt(12));
				com.setCommodityKeyword(rs.getString(13));
				com.setCommodityAddedtime(rs.getString(14).substring(0,rs.getString("COMMODITYADDEDTIME").length()-2));
				com.setIsTop(rs.getString(15));
				com.setCommodityClickNum(rs.getInt(16));
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	
	/**
	 * @param str
	 * @return 获取总的记录数
	 */
	public int getRecordCountSql(String str){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from commodity where 1=1 "+str+"",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	
	/**
	 * @param str
	 * @return 根据父类ID获取总的记录数
	 */
	public int getRecordCountSqlByID(String PARENTID){
		int count=0;
		ResultSet rs=conn.query("select COUNT(*) as rcount from commodity where typeid in (select typeid FROM commoditytype where parenttypeid="+PARENTID+") ",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	
	
	public ArrayList<Commodity> queryBySql(String sql){
		ArrayList<Commodity> list = new ArrayList<Commodity>();
		ResultSet rs = conn.query(sql, null);
		try {
			while(rs.next()){
				Commodity com = new Commodity();
				com = new Commodity();
				com.setCommodityId(rs.getInt(1));
				com.setCommodityName(rs.getString(2));
				com.setTypeId(rs.getInt(3));
				com.setCommodityMaterial(rs.getString(4));
				com.setCommodityPcak(rs.getString(5));
				com.setCommodityLanguage(rs.getString(6));
				com.setCommodityDescription(rs.getString(7));
				com.setCommodityMarketPrice(rs.getInt(8));
				com.setCommodityPresentPrice(rs.getInt(9));
				com.setCommodityPicture(rs.getString(10));
				com.setCommodityDetail(rs.getString(11));
				com.setCommoditySale(rs.getInt(12));
				com.setCommodityKeyword(rs.getString(13));
				com.setCommodityAddedtime(rs.getString(14).substring(0,rs.getString("COMMODITYADDEDTIME").length()-2));
				com.setIsTop(rs.getString(15));
				com.setCommodityClickNum(rs.getInt(16));
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
	public boolean updatesale(int commodityid){
		return conn.update("update commodity set commoditySale=commoditySale+1  where commodityid=? ", new String[]{String.valueOf(commodityid)})>0;	
	}
}

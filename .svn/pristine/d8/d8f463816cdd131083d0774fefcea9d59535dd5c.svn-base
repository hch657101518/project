package test;

import static org.junit.Assert.*;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import dao.CommodityTypeDao;
import entity.CommodityType;
import entity.Product;

public class Main {

	@Test
	public void test() throws Exception {
	CommodityTypeDao dao=new CommodityTypeDao();
//	long page = dao.totalPage();
//	System.out.println(page);
	List<Product> list = dao.queryPage(2, 1);
	for (Product product : list) {
		System.out.println(list+"11111111");
	}
	}

}

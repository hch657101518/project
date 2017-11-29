package util;

import java.io.File;
import java.io.IOException;

public class Test {
	public static void main(String[] args) {
		ResizeImg rs = new ResizeImg();
		File oldImg=new File("e:/1.jpg");
		File newImg=new File("e:/2.jpg");
		int w=170;
		float p=1.00f;
		try {
			rs.resize(oldImg, newImg, w, p);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

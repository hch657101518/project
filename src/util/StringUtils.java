package util;

public class StringUtils {
	private StringUtils(){
		
	}
//判断字符串是否为空
	public static boolean hasLength(String value){
		return value!=null && !"".equals(value.trim());
	}

}

package util;

import java.util.ArrayList;
import java.util.HashMap;

import dao.ConfigDao;

import entity.Config;

public class ConfigUtil {
	//存放所有系统配置的集合
	private static HashMap<String,ArrayList<Config>> allConfig = new HashMap<String,ArrayList<Config>>();
	static ConfigDao configDao = new ConfigDao();
	
	
	/**
	 * 得到系统配置
	 * @param key
	 * @return
	 */
	public static ArrayList<Config> getConfig(String key){
		return allConfig.get(key);
	}
	
	
	/**
	 * 初始化系统配置集合，在过滤器中进行初始化
	 */
	public static void initAllConfig(){
		//查询所有系统配置
		ArrayList<Config> list =  configDao.queryAll();
		//遍历所有系统配置
		for(Config config:list){
			String key = config.getConfigName();
			//如果所有系统配置中已经存在该key
			if(allConfig.containsKey(key)){
				allConfig.get(key).add(config);
			}else{
				//如果不存在
				//实例化保存数据的集合
				ArrayList<Config> newList = new ArrayList<Config>();
				newList.add(config);
				//保存到存放所有系统配置的集合
				allConfig.put(key, newList);
			}
		}
	}
}

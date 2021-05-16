package mask.main.dao;

import java.util.List;
import java.util.Map;
import mask.common.AbstractDAO;
import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO {	 
	
	public void mainaddCart(Map<String, Object> map) {
		insert("maina.mainaddCart", map);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSelectA(Map<String, Object> map) {
		return (List<Map<String,Object>>) selectList("maina.goodsSelectA", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> goodsCategorySelectA(Map<String,Object> map){
		return (List<Map<String,Object>>) selectList("maina.goodsCategorySelectA",map);
	}
		
     @SuppressWarnings("unchecked")
     public List<Map<String, Object>> goodsSelectB(Map<String, Object> map) {
	 return (List<Map<String,Object>>) selectList("maina.goodsSelectB", map);
		}
		
	 @SuppressWarnings("unchecked")
		public List<Map<String,Object>> goodsCategorySelectB(Map<String,Object> map){
			return (List<Map<String,Object>>) selectList("maina.goodsCategorySelectB",map);
		}
			@SuppressWarnings("unchecked")
			public List<Map<String, Object>> goodsSelectC(Map<String, Object> map) {
				return (List<Map<String,Object>>) selectList("maina.goodsSelectC", map);
			}
			
			@SuppressWarnings("unchecked")
			public List<Map<String,Object>> goodsCategorySelectC(Map<String,Object> map){
				return (List<Map<String,Object>>) selectList("maina.goodsCategorySelectC",map);
	
			}
				@SuppressWarnings("unchecked")
				public List<Map<String, Object>> goodsSelectD(Map<String, Object> map) {
					return (List<Map<String,Object>>) selectList("maina.goodsSelectD", map);
				}
				
				@SuppressWarnings("unchecked")
				public List<Map<String,Object>> goodsCategorySelectD(Map<String,Object> map){
					return (List<Map<String,Object>>) selectList("maina.goodsCategorySelectD",map);
}
}

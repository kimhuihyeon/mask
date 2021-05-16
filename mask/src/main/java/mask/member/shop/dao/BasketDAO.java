package mask.member.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;


@Repository("basketDAO")
public class BasketDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("basket.basketList", map);
	}
	
	public void basketModify(Map<String, Object> map) throws Exception{
		update("basket.basketModify", map);
	}
	
	public void basketDelete(Map<String, Object> map) throws Exception{
		delete("basket.basketDelete", map);
	}
	
	public void basket_num_delete(Map<String, Object> map) {
	      delete("basket.basket_num_delete",map);
	      
	   }

	   public void update_goods_amount(Map<String, Object> map) {
	      update("basket.update_goods_amount",map);
	   }

	public void addCart(Map<String, Object> map) {
		insert("basket.addCart", map);
		
	}
	   
	
}

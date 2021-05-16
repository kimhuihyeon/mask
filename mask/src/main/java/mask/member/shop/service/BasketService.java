package mask.member.shop.service;

import java.util.List;
import java.util.Map;

public interface BasketService {
	
	List<Map<String, Object>> basketList(Map<String, Object> map) throws Exception;
	
	void basketModify(Map<String, Object> map) throws Exception;
	
	void basketDelete(Map<String, Object> map) throws Exception;
	
	void basket_num_delete(Map<String, Object> map);

    void update_goods_amount(Map<String, Object> map);

	void addCart(Map<String, Object> map);
    
    
}

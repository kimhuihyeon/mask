package mask.main.service;

import java.util.List;
import java.util.Map;

public interface MainService {
	
	
	List<Map<String, Object>> goodsSelectA(Map<String, Object> map);

	List<Map<String, Object>> goodsCategorySelectA(Map<String, Object> map);

	
	List<Map<String, Object>> goodsSelectB(Map<String, Object> map);

	List<Map<String, Object>> goodsCategorySelectB(Map<String, Object> map);
	
	List<Map<String, Object>> goodsSelectC(Map<String, Object> map);

	List<Map<String, Object>> goodsCategorySelectC(Map<String, Object> map);
	
	List<Map<String, Object>> goodsSelectD(Map<String, Object> map);

	List<Map<String, Object>> goodsCategorySelectD(Map<String, Object> map);
	
	void mainaddCart(Map<String, Object> map);




}

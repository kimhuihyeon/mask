package mask.goods.Service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface GoodsService {
	
	Map<String, Object> goodDetailList(Map<String, Object> map, HttpServletRequest req) throws Exception;

	List<Map<String, Object>> goodsSelect(Map<String, Object> map);

	List<Map<String, Object>> goodsCategorySelect(Map<String, Object> map);

}

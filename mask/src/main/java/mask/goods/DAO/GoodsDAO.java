package mask.goods.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> goodDetailList(Map<String, Object> map)throws Exception {
		return (Map<String, Object>) selectOne("goods.goodsDetailList",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSelect(Map<String, Object> map) {
		return (List<Map<String,Object>>) selectList("goods.goodsSelect", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> goodsCategorySelect(Map<String,Object> map){
		return (List<Map<String,Object>>) selectList("goods.goodsCategorySelect",map);
	}
}

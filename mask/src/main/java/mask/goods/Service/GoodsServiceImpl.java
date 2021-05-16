package mask.goods.Service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import mask.goods.DAO.GoodsDAO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Resource(name="goodsDAO")
	GoodsDAO goodsDAO;
	
	@Override
	public Map<String, Object> goodDetailList(Map<String, Object> map, HttpServletRequest req) throws Exception {
		return goodsDAO.goodDetailList(map);
	}
	
	@Override
	public List<Map<String, Object>> goodsSelect(Map<String, Object> map) {
		
		return (List<Map<String,Object>>) goodsDAO.goodsSelect(map);
	}
	
	@Override
	public List<Map<String, Object>> goodsCategorySelect(Map<String, Object> map) {
	
		return (List<Map<String,Object>>) goodsDAO.goodsCategorySelect(map);
	}
	
}

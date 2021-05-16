package mask.member.shop.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import mask.member.shop.dao.BasketDAO;

@Service("basketService")
public class BasketServiceImpl implements BasketService {
	
	@Resource(name="basketDAO")
	private BasketDAO basketDAO;
	
	@Override
	public List<Map<String, Object>> basketList(Map<String, Object> map) throws Exception{
		return basketDAO.basketList(map);
	}
	
	@Override
	public void basketModify(Map<String, Object> map) throws Exception{
		basketDAO.basketModify(map);
	}
	
	@Override
	public void basketDelete(Map<String ,Object> map) throws Exception{
		basketDAO.basketDelete(map);
	}
	
	@Override
	   public void basket_num_delete(Map<String, Object> map) {
	      basketDAO.basket_num_delete(map);
	   }

	   @Override
	   public void update_goods_amount(Map<String, Object> map) {
	      basketDAO.update_goods_amount(map);
	   }

	@Override
	public void addCart(Map<String, Object> map) {
		basketDAO.addCart(map);
		
	}
	


}

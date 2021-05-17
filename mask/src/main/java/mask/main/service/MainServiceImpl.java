package mask.main.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import mask.main.dao.MainDAO;


@Service("mainService")
public class MainServiceImpl implements MainService{

	Logger log=Logger.getLogger(this.getClass());

@Resource(name="mainDAO")
MainDAO mainDAO;	
	
	
	@Override
	public List<Map<String, Object>> goodsSelectA(Map<String, Object> map) {
		
		return (List<Map<String,Object>>) mainDAO.goodsSelectA(map);
	}
	
	@Override
	public List<Map<String, Object>> goodsCategorySelectA(Map<String, Object> map) {
	
		return (List<Map<String,Object>>) mainDAO.goodsCategorySelectA(map);
	}
	
	
	@Override
	public List<Map<String, Object>> goodsSelectB(Map<String, Object> map) {
		
		return (List<Map<String,Object>>) mainDAO.goodsSelectB(map);
	}
	
	@Override
	public List<Map<String, Object>> goodsCategorySelectB(Map<String, Object> map) {
	
		return (List<Map<String,Object>>) mainDAO.goodsCategorySelectB(map);
	}
	
	
	@Override
	public List<Map<String, Object>> goodsSelectC(Map<String, Object> map) {
		
		return (List<Map<String,Object>>) mainDAO.goodsSelectC(map);
	}
	
	@Override
	public List<Map<String, Object>> goodsCategorySelectC(Map<String, Object> map) {
	
		return (List<Map<String,Object>>) mainDAO.goodsCategorySelectC(map);
	}

	
	@Override
	public List<Map<String, Object>> goodsSelectD(Map<String, Object> map) {
		
		return (List<Map<String,Object>>) mainDAO.goodsSelectD(map);
	}
	
	@Override
	public List<Map<String, Object>> goodsCategorySelectD(Map<String, Object> map) {
	
		return (List<Map<String,Object>>) mainDAO.goodsCategorySelectD(map);
	}
	
	@Override
	public void mainaddCart(Map<String, Object> map) {
		System.out.println("직전\n");
		if(!map.isEmpty()) {
			Iterator<Entry<String,Object>> iterator = map.entrySet().iterator();
			
			
			Entry<String, Object> entry =null;
			
			while(iterator.hasNext()) {
				entry=iterator.next();
				log.debug("key : "+entry.getKey()+" , "+"value : "+entry.getValue());
			}
		}
		
		mainDAO.mainaddCart(map);
		
	}
}

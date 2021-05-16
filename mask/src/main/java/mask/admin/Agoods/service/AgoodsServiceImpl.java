package mask.admin.Agoods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Delete;
import org.springframework.stereotype.Service;

import mask.admin.Agoods.dao.AgoodsDAO;
@Service("agoodsService")
public class AgoodsServiceImpl implements AgoodsService {
	@Resource(name="agoodsDAO")
	private AgoodsDAO agoodsDAO;
	//@Resource(name="goodsDAO")
	//private goodsDAO goodsDAO;
	
	//상품상세보기
	 @Override
		public Map<String, Object> agoodsDetail(Map<String, Object> map) throws Exception { 
		     agoodsDAO.agoodsDetail(map);
			Map<String, Object> resultMap = agoodsDAO.agoodsDetail(map);
			return resultMap;
		}
	
	@Override
	public List<Map<String, Object>> openAdminGoodsList(Map<String, Object> map) throws Exception {
		return agoodsDAO.adminGoodsList(map); 
	}
	
	  @Override
	    public void adminGoodsDelete(Map<String, Object> map) throws Exception {
	    agoodsDAO.adminGoodsDelete(map); agoodsDAO.attadminGoodsDelete(map);
	  
	  }
	 
	 
	@Override
	public void adminGoodsUpdate(Map<String, Object> map , HttpServletRequest request) throws Exception {
		agoodsDAO.adminGoodsUpdate(map); // 상품테이블 업데이트
		agoodsDAO.attributeDelete(map);

	}
	
	 @Override
	 public List<Map<String, Object>> adminGoodsAttList(Map<String, Object> map)throws Exception {
         return agoodsDAO.adminGoodsAttList(map);
          }
	
	@Override
	public void adminGoodsInsert(Map<String, Object> map, HttpServletRequest request) throws Exception { // 상품등록
				// 상품정보 등록
		agoodsDAO.adminGoodsInsert(map); agoodsDAO.goodsAttribute(map);
				
			}

	@Override
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String,Object> map1 = new HashMap<String,Object>();
		map1.put("GOODS_NUM", map.get("GOODS_NUM"));
		agoodsDAO.adminGoodsUpdate(map1);
		
		Map<String, Object> resultMap = agoodsDAO.adminGoodsList1(map1);
		return resultMap;
	}

	

	
	}
	

	

	

	
	



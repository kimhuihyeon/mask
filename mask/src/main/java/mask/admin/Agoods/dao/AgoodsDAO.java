package mask.admin.Agoods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;
@Repository("agoodsDAO")
public class AgoodsDAO extends AbstractDAO{
	
	//상품상세 보기
	   @SuppressWarnings("unchecked")
			public Map<String, Object> agoodsDetail(Map<String, Object> map) throws Exception{
				return (Map<String, Object>) selectOne("aGoods.aGoodsDetail", map);
			}
	
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminGoodsList(Map<String, Object>map)throws Exception{
		return (List<Map<String, Object>>)selectList("aGoods.adminGoodsList", map);
	}
	
	@SuppressWarnings("unchecked")
	   public List<Map<String, Object>>  adminGoodsAttList(Map<String, Object> map)throws Exception{
	      return  (List<Map<String, Object>>) selectList("aGoods.adminGoodsAttList", map);
	   }
	   
	
//상품삭제
	public void adminGoodsDelete(Map<String,Object> map)throws Exception{
		delete("aGoods.deleteAdminGoods", map);
		
	}
//상품삭제 속성
	public void attadminGoodsDelete(Map<String,Object> map)throws Exception{
		delete("aGoods.attdeleteAdminGoods", map);
		
	}
	
	
	public void adminGoodsUpdate(Map<String,Object> map) throws Exception{
		update("aGoods.adminGoodsUpdate", map);
	}
	
	
	public void attributeDelete(Map<String, Object> map) throws Exception { 
		update("aGoods.attributeDelete", map);
	}
	
	
	
	
	public void adminGoodsInsert(Map<String,Object> map) throws Exception{
		insert("aGoods.adminGoodsInsert", map);
	}
	
	public void goodsAttribute(Map<String, Object> map) throws Exception { // 상품옵션 등록
		insert("aGoods.attributeInsert", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminGoodsList1(Map<String, Object>map)throws Exception{
		return (Map<String, Object>)selectList("aGoods.adminGoodsList", map);
	} 
	
	}
	
	
	


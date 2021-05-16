package mask.admin.Agoods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Delete;

public interface AgoodsService {
//상품 상세보기
	Map<String, Object> agoodsDetail(Map<String, Object> map) throws Exception;
	
	
	List<Map<String, Object>> openAdminGoodsList(Map<String, Object> map)throws Exception;
	
	void adminGoodsUpdate(Map<String, Object> map,HttpServletRequest request)throws Exception;


	void adminGoodsDelete(Map<String, Object> map) throws Exception;



	void  adminGoodsInsert(Map<String, Object> map, HttpServletRequest request) throws Exception; 
    
	List<Map<String, Object>>  adminGoodsAttList(Map<String, Object> map)throws Exception;

	public Map<String, Object> selectGoodsDetail(Map<String, Object> map, HttpServletRequest request) throws Exception;
	


}

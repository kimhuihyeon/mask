package mask.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import mask.common.AbstractDAO;


@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO {
	

	 @SuppressWarnings("unchecked")
     public List<Map<String, Object>> selectMemberList(Map<String, Object> map)throws Exception{
        return (List<Map<String, Object>>)selectPagingList("amember.memberList", map); 
     }
	 
	 public void admindeletemem(Map<String, Object> map) throws Exception{
			update("amember.deletemem", map);     //삭제하기
		}
}

package mask.admin.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mask.admin.member.dao.AdminMemberDAO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	
	
	@Resource(name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;

	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception {
		return adminMemberDAO.selectMemberList(map);
	}
	
	
	@Override
	public void admindeletemem(Map<String, Object> map) throws Exception {
		adminMemberDAO.admindeletemem(map);
	}

	

}

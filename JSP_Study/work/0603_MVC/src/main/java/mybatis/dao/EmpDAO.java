package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;

public class EmpDAO {
	
	public static EmpVO[] getList() {
		EmpVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<EmpVO> list = ss.selectList("emp.all");
		
		if(list != null && !list.isEmpty()) {
			ar = new EmpVO[list.size()];
			
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	
	public static EmpVO[] searchList(Map<String, String> map) {
		EmpVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<EmpVO> list = ss.selectList("emp.search", map);
		
		if(list != null && !list.isEmpty()) {
			ar = new EmpVO[list.size()];
			
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
}

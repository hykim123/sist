package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.BookVO;
import mybatis.vo.DeptVO;

public class DeptDAO {
	
	public static DeptVO[] getList() {
		DeptVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<BookVO> list = ss.selectList("dept.all");
		
		if(list != null && !list.isEmpty()) {
			ar = new DeptVO[list.size()];
			
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
}

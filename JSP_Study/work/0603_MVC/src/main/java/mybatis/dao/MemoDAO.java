package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.BookVO;
import mybatis.vo.MemoVO;

public class MemoDAO {
	
	public static MemoVO[] getList() {
		MemoVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MemoVO> list = ss.selectList("memo.all");
		
		if(list != null && !list.isEmpty()) {
			ar = new MemoVO[list.size()];
			
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
}

package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.BookVO;

public class BookDAO {
	
	public static BookVO[] getList() {
		BookVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<BookVO> list = ss.selectList("book.all");
		
		if(list != null && !list.isEmpty()) {
			ar = new BookVO[list.size()];
			
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
}

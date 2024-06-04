package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.BbsVO;

public class BbsDAO {
	public static BbsVO[] getList(String bname, int begin, int end) {
		BbsVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("bname", bname);
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		List<BbsVO> list = ss.selectList("bbs.list", map);
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			
			list.toArray(ar); //list가 가지는 모든 요소들을 ar이라는 배열에 복사한
		}
		ss.close();
		return ar;
	}
}

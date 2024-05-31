package am.service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import jakarta.annotation.Resource;

public class FactoryService {
	// 팩토리가 딱 한번 만들어지게 하는 것
	private static SqlSessionFactory factory; //static 쓰는이유 : FactoryService를 여러개만들어도 한개만 만들어짐
	
	static {		//static으로 선언한 애들한테만 먹힘
		try {
			Reader r = Resources.getResourceAsReader("am/config/config.xml");
			
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() { //public이라 외부접근 가능
		return factory;
		// 외부에서 getFactory부르면 여기서 factory생성
	}
}

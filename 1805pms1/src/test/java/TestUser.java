import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDept;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUSer;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class) // 使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml") // 引入配置文件
public class TestUser {
@Autowired
UserService us;

public void testadd(){
	TUSer user=new TUSer();
	user.setBirthday(new Date());
	TDept dep=new TDept();
	dep.setId(6);
	user.setDept(dep);
	user.setLoginname("lvbu111");
	user.setEmail("qwe@qq.com");
	user.setPassword("123");
	user.setPicurl("aaa.jpg");
	user.setCreator(1000);
	user.setSex("男");
	user.setRealname("吕布");

	try {
		us.insert(user);
	} catch (AppException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
public void testQuery(){
	QueryUser query=new QueryUser();
	query.setLoginname("test21");
	query.setPassword("123");
	//query.setIsenabled(1);
	//query.setPage(2);
	us.queryByCon(query);
	
}
@Test
public void testLogin(){
	QueryUser query=new QueryUser();
	query.setLoginname("test21");
	query.setPassword("123");
	try {
		TUSer user=us.chklogin(query);
		System.out.println(user.getRealname()+"、"+user.getDept().getName());
		for(TPermission per:user.getPermission()){
			System.out.println(per.getPname());
		}
		System.out.println("===========整理后================");
		for(TPermission per1:user.getMenu()){
			System.out.println(per1.getPname());
			
			for(TPermission per2:per1.getChildren()){
				System.out.println("\t\t"+per2.getPname());
			}
		}
	} catch (AppException e) {
		// TODO Auto-generated catch block
		System.out.println(e.getErrMsg());
	}catch (Exception e1) {
		// TODO: handle exception
		e1.printStackTrace();
	}
}
}

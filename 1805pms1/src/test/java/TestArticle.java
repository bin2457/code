import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.Tarticle;
import com.zs.pms.po.Tchannel;
import com.zs.pms.service.TarticleService;
import com.zs.pms.vo.QueryArticle;

@RunWith(SpringJUnit4ClassRunner.class) // 使用spring测试框架
@ContextConfiguration("classpath:applicationcontext.xml") // 引入配置文件
public class TestArticle {
	@Autowired
	TarticleService as;
	@Test
	public void testPage(){
		QueryArticle query=new QueryArticle();
		System.out.println("当前总条数"+as.queryPageCount(query));
		for(Tarticle atr:as.queryByPage(query, 1)){
			System.out.println(atr.getTitle());
		}
	}
	public void testdels(){
		int ids[]={102,103};
		as.deleteById(ids);
	}
	public void testupdate(){
		Tarticle art=new Tarticle();
		art.setId(1);
		art.setAuthor("长歌");
		try {
			as.update(art);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void testadd(){
		Tarticle art=new Tarticle();
		
		Tchannel channel=new Tchannel();
		channel.setId(2);
		art.setChannel(channel);
		art.setTitle("静夜思");
		art.setContent("床前明月光，疑是地上霜。举头望明月，低头思故乡");
		art.setAuthor("李白");
		art.setCreator(1);
		art.setIsremod(1);
		art.setIshot(1);
		try {
			as.insert(art);
		} catch (AppException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

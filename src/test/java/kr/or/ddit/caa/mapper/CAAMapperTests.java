package kr.or.ddit.caa.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.caa.mapper.CAAMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CAAMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CAAMapper mapper;
	
	@Test
	public void testGet() {
		mapper.getCscodeList("1").forEach(e -> log.info(e));;
	}
	

	
}

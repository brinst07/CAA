package kr.or.ddit.ss.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SSMapperTests {

	@Setter(onMethod_ = @Autowired)
	private SSMapper mapper;
	
	@Test
	public void testSSGet() {
		mapper.getCscodeList("2").forEach(e -> log.info(e));
	}
}

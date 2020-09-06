package kr.or.ddit.member.service;

import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.member.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

    @Setter
    private MemberMapper mapper;

    @Transactional
    @Override
    public void insertMember(MemberVO vo) {
        mapper.insertMember(vo);
    }

    @Override
    public int idCheck(String member_id) {
        return mapper.idCheck(member_id);
    }

    @Override
    public int checkmail(String member_email) {
        return mapper.checkmail(member_email);
    }

    @Override
    public MemberVO loginCheck(MemberVO vo) {
        return mapper.loginCheck(vo);
    }

    @Override
    public void insertSocialMember(MemberVO memVo) {
        mapper.insertSocialMember(memVo);
    }

    @Override
    public void modifyMember(MemberVO vo) {
        mapper.modifyMember(vo);
    }


}

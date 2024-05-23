package com.remake.weplay.member.model.service;

import org.springframework.stereotype.Service;

import com.remake.weplay.member.model.dao.MemberMapper;
import com.remake.weplay.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	
	private final MemberMapper memberMapper;

	@Override
	public Member login(Member member) {
		return memberMapper.login( member);
	}

	@Override
	public int insert(Member member) {
		return memberMapper.insert( member);
	}

	@Override
	public int update(Member member) {
		return memberMapper.update( member);
	}

	@Override
	public int delete(Member member) {
		return memberMapper.delete( member);
	}
}

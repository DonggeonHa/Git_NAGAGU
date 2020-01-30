package com.spring.mapper;

import java.util.HashMap;

public interface MemberLikeMapper {
	int insertMemberLike(HashMap<String, Object> map);
	int deleteMemberLike(HashMap<String, Object> map);
	int selectMemberLike(HashMap<String, Object> map);
}

package com.spring.community;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CommunityMapper;
import com.spring.mapper.MemberLikeMapper;
import com.spring.mapper.memberMapper;
import com.spring.member.MemberVO;
@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<PicsVO> getPicsAll(HashMap<String, Object> map) {
		ArrayList<PicsVO> PicsAll = null;
		try {
			CommunityMapper communityMapper=sqlSession.getMapper(CommunityMapper.class);
			PicsAll=communityMapper.getPicsAll(map);
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return PicsAll;
	}

	@Override 
	public int getPicsCount(HashMap<String, Object> map) {
		int picsCount =0;
		try {
			CommunityMapper communityMapper=sqlSession.getMapper(CommunityMapper.class);
			picsCount= communityMapper.getPicsCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return picsCount;
	}

	@Override
	public PicsVO getPicsDetail(PicsVO picsVO) {
		PicsVO vo=null;
		try { 
			CommunityMapper communityMapper=sqlSession.getMapper(CommunityMapper.class);
			communityMapper.updatePicsReadCount(picsVO);			
			vo = communityMapper.getPicsDetail(picsVO);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	@Override
	public ArrayList<PicsVO> getPicsOfMemberUpload(PicsVO picsVO) {
		ArrayList<PicsVO> vo=null;
		try { 
			CommunityMapper communityMapper=sqlSession.getMapper(CommunityMapper.class);			
			vo = communityMapper.getPicsOfMemberUpload(picsVO);
			System.out.println("getPicsOfMemberUpload 매퍼결과"+vo);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	@Override
	public int insertPics(PicsVO picsVO) {
		int result=0;
		CommunityMapper communityMapper=sqlSession.getMapper(CommunityMapper.class);
		result = communityMapper.insertPics(picsVO);
		return result;
	}
	@Override
	public int deletePics(PicsVO picsVO) {
		int result=0;
		CommunityMapper communityMapper=sqlSession.getMapper(CommunityMapper.class);
		result = communityMapper.deletePics(picsVO);
		return result;
	}

	@Override
	public int updatePics(PicsVO picsVO) {
		int result=0;
		CommunityMapper communityMapper=sqlSession.getMapper(CommunityMapper.class);		
		result = communityMapper.updatePics(picsVO);
		return result;
	}
	@Override
	public int deletePicsFile(PicsVO picsVO){
		int result=0;
		CommunityMapper communityMapper=sqlSession.getMapper(CommunityMapper.class);		
		result = communityMapper.deletePicsFile(picsVO);
		return result;
	}
	@Override
	public HashMap<String, Object> insertMemberLike(HashMap<String, Object> map){
		HashMap<String, Object> returnInfo = new HashMap<String, Object>();
		int picsLikeCount = 0;
		int cnt = 0;
		try {
			CommunityMapper communityMapper= sqlSession.getMapper(CommunityMapper.class);
			MemberLikeMapper memberlikeMapper=sqlSession.getMapper(MemberLikeMapper.class);
			PicsVO picsVO = new PicsVO();
			picsVO.setPICS_NUM(Integer.valueOf((String)map.get("picsNum")));
			picsVO = communityMapper.getPicsDetail(picsVO);
			cnt = memberlikeMapper.selectMemberLike(map);
			if(cnt==0) {
				memberlikeMapper.insertMemberLike(map);
				map.put("count","plus");
				int re = communityMapper.updatePicsLike(map);
				picsLikeCount = picsVO.getPICS_LIKE();
				returnInfo.put("picsLikeCount", picsLikeCount);
				returnInfo.put("cnt", cnt);
				System.out.println("사진 좋아요 1증가="+re);
			}else {
				memberlikeMapper.deleteMemberLike(map);
				map.put("count", "minus");
				int re = communityMapper.updatePicsLike(map);
				picsLikeCount =  picsVO.getPICS_LIKE();
				returnInfo.put("picsLikeCount", picsLikeCount);
				returnInfo.put("cnt", cnt);
				System.out.println("사진 좋아요 1감소="+re);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnInfo;
	}

}

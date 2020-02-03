package com.spring.community;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CommunityMapper;
import com.spring.mapper.FollowMapper;
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
			
			
			cnt = memberlikeMapper.selectMemberLike(map);
			if(cnt==0) {
				memberlikeMapper.insertMemberLike(map);
				map.put("count","plus");
				System.out.println("사진 좋아요 1증가=");
			}else {
				memberlikeMapper.deleteMemberLike(map);
				map.put("count", "minus");
				System.out.println("사진 좋아요 1감소=");
			}
			PicsVO picsVO = new PicsVO();
			picsVO.setPICS_NUM(Integer.valueOf((String)map.get("picsNum")));
			int re = communityMapper.updatePicsLike(map);//count가 plus면 1증가  minus면 1 감소
			picsVO = communityMapper.getPicsDetail(picsVO);
			picsLikeCount = picsVO.getPICS_LIKE();
			returnInfo.put("picsLikeCount", picsLikeCount);
			returnInfo.put("cnt", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnInfo;
	}
	@Override 
	public ArrayList<PicsVO> getMemberLikePics(HashMap<String, Object> map) {
		ArrayList<PicsVO> vo = null; 
		try { 
			CommunityMapper communityMapper= sqlSession.getMapper(CommunityMapper.class);
			//memberMapper memberMapper= sqlSession.getMapper(memberMapper.class);
			vo = communityMapper.getMemberLikePics(map);
			System.out.println("RESULT="+vo);
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return vo;
	}
	
	@Override
	public HashMap<String, Object> followAction(HashMap<String, Object> map){
		HashMap<String, Object> returnInfo = new HashMap<String, Object>();
		int cnt = 0;
		int result = 0;
		try {
			FollowMapper followMapper = sqlSession.getMapper(FollowMapper.class);
			cnt = followMapper.selectFollow(map);
			System.out.println("cnt="+cnt);
			//테이블에 값이 없으면	
			if(cnt==0) {
				result = followMapper.insertFollow(map);//result는 성공하면 항상1(쓰이는 데 없음)
			}else {
				result = followMapper.deleteFollow(map);
			}
			returnInfo.put("cnt", cnt);//insert 는 0 , delete는 1
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnInfo;
	}
	@Override 
	public ArrayList<MemberVO> getFollowMembers(HashMap<String, Object> map){
		ArrayList<MemberVO> vo = null; 
		try { 
			FollowMapper followMapper = sqlSession.getMapper(FollowMapper.class);
			//memberMapper memberMapper= sqlSession.getMapper(memberMapper.class);
			vo = followMapper.getFollowMembers(map);
			System.out.println("RESULT="+vo);
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return vo;
	}
	@Override 
	public ArrayList<MemberVO> getFollowedMembers(HashMap<String, Object> map){
		ArrayList<MemberVO> vo = null; 
		try { 
			FollowMapper followMapper = sqlSession.getMapper(FollowMapper.class);
			//memberMapper memberMapper= sqlSession.getMapper(memberMapper.class);
			vo = followMapper.getFollowedMembers(map);
			System.out.println("RESULT="+vo);
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return vo;
	}
}

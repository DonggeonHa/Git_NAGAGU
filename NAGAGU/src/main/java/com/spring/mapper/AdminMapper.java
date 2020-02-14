package com.spring.mapper;

import java.util.List;

import com.spring.academy.ClassVO;
import com.spring.admin.AdminMemberVO;
import com.spring.community.PicsVO;
import com.spring.estimate.EstimateVO;
import com.spring.member.MemberVO;
import com.spring.store.ProductVO;
import com.spring.workshop.WorkShopMemberVO;

public interface AdminMapper {
	int insert_admin(AdminMemberVO adminVO);		//회원가입
	AdminMemberVO user_chk(AdminMemberVO adminVO);		//로그인

	/* 일반회원관리 */
	List<MemberVO> getMembers();
	int deleteMember(MemberVO vo);
	MemberVO detailMember(MemberVO vo);
	
	/* 공방회원관리 */
	List<WorkShopMemberVO> getWMembers();
	int deleteWMember(WorkShopMemberVO vo);
	int updateWMember(WorkShopMemberVO vo);
	WorkShopMemberVO detailWMember(WorkShopMemberVO vo);
	
	/* 커뮤니티관리 */
	List<PicsVO> getPICS();
	int deletePICS(PicsVO vo);
	PicsVO detailPICS(PicsVO vo);
	MemberVO memberPICS(PicsVO vo);
	
	/* 아카데미관리 */
	List<ClassVO> getAcademy();
	int deleteAcademy(ClassVO vo);
	ClassVO detailAcademy(ClassVO vo);
	
	/* 상품관리 */
	List<ProductVO> getProduct();
	int deleteProduct(ProductVO vo);
	ProductVO detailProduct(ProductVO vo);
	
	/* 견적관리 */
	List<EstimateVO> getEstimate();
	int deleteEstimate(EstimateVO vo);
	EstimateVO detailEstimate(EstimateVO vo);
}

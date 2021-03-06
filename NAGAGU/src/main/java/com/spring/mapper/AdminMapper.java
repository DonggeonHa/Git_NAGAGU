package com.spring.mapper;

import java.util.List;
import java.util.Map;

import com.spring.academy.ClassVO;
import com.spring.academy.Class_qnaVO;
import com.spring.academy.Class_reviewVO;
import com.spring.admin.AdminMemberVO;
import com.spring.community.PicsCommentDB;
import com.spring.community.PicsVO;
import com.spring.estimate.EstimateVO;
import com.spring.member.MemberVO;
import com.spring.store.ProductVO;
import com.spring.store.Product_qnaVO;
import com.spring.store.Product_reviewVO;
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
	
	List<PicsCommentDB> getPICSComment();
	int deletePICSComment(PicsCommentDB vo);
	
	/* 아카데미관리 */
	List<ClassVO> getAcademy();
	int deleteAcademy(ClassVO vo);
	ClassVO detailAcademy(ClassVO vo);
	
	List<Class_reviewVO> getAcademyReview();
	int deleteAcademyReview(Class_reviewVO vo);
	List<Class_qnaVO> getAcademyQnA();
	int deleteAcademyQnA(Class_qnaVO vo);
	
	/* 상품관리 */
	List<ProductVO> getProduct();
	int deleteProduct(ProductVO vo);
	ProductVO detailProduct(ProductVO vo);
	
	List<Product_reviewVO> getProductReview();
	int deleteProductReview(Product_reviewVO vo);
	List<Product_qnaVO> getProductQnA();
	int deleteProductQnA(Product_qnaVO vo);
	
	/* 견적관리 */
	List<EstimateVO> getEstimate();
	int deleteEstimate(EstimateVO vo);
	EstimateVO detailEstimate(EstimateVO vo);
}

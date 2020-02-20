package com.spring.admin;

import java.util.List;

import com.spring.academy.ClassVO;
import com.spring.academy.Class_qnaVO;
import com.spring.academy.Class_reviewVO;
import com.spring.community.PicsCommentDB;
import com.spring.community.PicsVO;
import com.spring.estimate.EstimateVO;
import com.spring.member.MemberVO;
import com.spring.store.ProductVO;
import com.spring.store.Product_qnaVO;
import com.spring.store.Product_reviewVO;
import com.spring.workshop.WorkShopMemberVO;

public interface AdminService {
	public int insert_admin(AdminMemberVO memberVO); //회원 가입 후 넣기
	public int user_chk(AdminMemberVO adminVO);
	
	/* 일반회원관리 */
	public List<MemberVO> getMembers();
	public int deleteMember(MemberVO vo);
	public MemberVO detailMember(MemberVO vo);
	
	/* 공방회원관리 */
	public List<WorkShopMemberVO> getWMembers();
	public int deleteWMember(WorkShopMemberVO vo);
	public int updateWMember(WorkShopMemberVO vo);
	public WorkShopMemberVO detailWMember(WorkShopMemberVO vo);
	
	/* 커뮤니티관리 */
	public List<PicsVO> getPICS();
	public int deletePICS(PicsVO vo);
	public PicsVO detailPICS(PicsVO vo);
	public MemberVO memberPICS(PicsVO vo);
	
	public List<PicsCommentDB> getPICSComment();
	public int deletePICSComment(PicsCommentDB vo);
	
	/* 아카데미관리 */
	public List<ClassVO> getAcademy();
	public int deleteAcademy(ClassVO vo);
	public ClassVO detailAcademy(ClassVO vo);
	
	public List<Class_reviewVO> getAcademyReview();
	public int deleteAcademyReview(Class_reviewVO vo);
	public List<Class_qnaVO> getAcademyQnA();
	public int deleteAcademyQnA(Class_qnaVO vo);
	
	/* 상품관리 */
	public List<ProductVO> getProduct();
	public int deleteProduct(ProductVO vo);
	public ProductVO detailProduct(ProductVO vo);
	
	public List<Product_reviewVO> getProductReview();
	public int deleteProductReview(Product_reviewVO vo);
	public List<Product_qnaVO> getProductQnA();
	public int deleteProductQnA(Product_qnaVO vo);
	
	/* 견적관리 */
	public List<EstimateVO> getEstimate();
	public int deleteEstimate(EstimateVO vo);
	public EstimateVO detailEstimate(EstimateVO vo);
}

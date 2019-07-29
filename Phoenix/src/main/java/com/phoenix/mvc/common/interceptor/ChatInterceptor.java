package com.phoenix.mvc.common.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.phoenix.mvc.common.Event;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.cafe.CafeMemberService;
import com.phoenix.mvc.service.cafe.CafePostService;
import com.phoenix.mvc.service.chatting.ChattingService;
import com.phoenix.mvc.service.domain.Board;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.Post;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.service.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Map;

@Component
public class ChatInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;

	@Autowired
	@Qualifier("cafeMemberServiceImpl")
	private CafeMemberService cafeMemberService;

	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;

	@Autowired
	@Qualifier("cafePostServiceImpl")
	private CafePostService cafePostService;

	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;

	public ChatInterceptor() {
		System.out.println("ChatInterceptor 생성했습니다.");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)	throws Exception {
		System.out.println("\n\n================================ ChatInterceptor > preHandle 시작 ================================");
		String requestURI = request.getRequestURI();
		System.out.println(">>>>>>>>>>> 요청URL : " + requestURI);

		// pathVariables 사용하기 위한 선언
		Map<String, String> pathVariables = (Map<String, String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);

		// 세션의 로그인 정보
		User user = (User) request.getSession().getAttribute("user");
		
		if (user==null) {
			return false;
		}
/*	
		// 카페 생성
		if (requestURI.contains("/cafe/addCafe") || requestURI.contains("/cafe/json/checkCafeNameDuplication") || requestURI.contains("/cafe/json/checkCafeURLDuplication")) {
			if(user != null) {
				
				//return true;				
			}else {
				System.out.println("CafeInterceptor >>> addCafe");
				response.sendRedirect("/user/loginView");
				return false;
			}
		} else {
			// cafeURL 추가 - controller에 PathVariable 처리 되있어야함
			String cafeURL = pathVariables.get("cafeURL");
			request.setAttribute("cafeURL", cafeURL);

			// cafe 정보 - 카페URL 사용
			Cafe cafe = cafeManageService.getCafeInfo(cafeURL);
			request.setAttribute("cafe", cafe);

			// 메뉴바용 게시판 목록 - 컨디션 "0"(구분선 가져옴 / 1일때 구분선 안가져옴), 카페URL 사용
			Search search = new Search();
			search.setSearchCondition("0");
			search.setCafeURL(cafeURL);
			List<Board> boardList = cafeManageService.getCafeBoardList(search);
			request.setAttribute("boardList", boardList);

			// 카페 내부의 모든 화면에서 체크
			CafeMember cafeMember = null;
			if (user != null) {
				// 로그인된 유저가 접근한 카페의 멤버 정보 - 카페URL, 유저번호 사용
				search.setCafeURL(cafeURL);
				search.setUserNo(user.getUserNo());
				cafeMember = cafeMemberService.getCafeMemberByURL(search);

				if (cafeMember != null) {
					// 출석체크
					// -출석체크 후 정보변경되면 cafeMember객체의 정보 변경할것
					//////////////////////////////////// 예림시작////////////////////////
					Event event = new Event();
					event.setEventUserNo(user.getUserNo());
					event.setCafeNo(cafe.getCafeNo());
					event.setEventType("et100");
					cafeManageService.checkAttendance(cafeMember, event);
					//////////////////////////////////// 예림끝/////////////////////////
					// 등업체크 지니지니지니
					// -등업체크 후 정보변경되면 cafeMember객체의 정보 변경할것
					int myGradeNo = cafeMember.getCafeMemberGradeNo();
					int nextGradeNo = 0;

					CafeGrade cafeGrade = new CafeGrade();

					CafeGrade myGrade = cafeManageDao.getNextGrade(myGradeNo);

					if (!myGrade.getMemberGradeCode().equals("cg100")
							&& !myGrade.getMemberGradeCode().equals("cg101")) {// 카페멤버만 자동등업 매니저,스탭제외

						List cafeGradeList = cafeManageDao.getCafeGrade(cafe.getCafeNo());

						for (int i = 0; i < cafeGradeList.size(); i++) {
							CafeGrade next = (CafeGrade) cafeGradeList.get(i);

							if (next.getCafeGradeNo() > myGradeNo) {// 다음등급번호찾기
								nextGradeNo = next.getCafeGradeNo();
								break;

							}

						}

						CafeGrade nextGrade = cafeManageDao.getNextGrade(nextGradeNo);

						if (nextGrade != null && nextGrade.isAutoUpgradeFlag()
								&& !nextGrade.getMemberGradeCode().equals("cg100")
								&& !nextGrade.getMemberGradeCode().equals("cg101")) {// 다음등급이 자동등업이고, 다음등급이 매니저 스탭이아닐때

							if (nextGrade.getRequiredPostCount() <= cafeMember.getPostCount()
									&& nextGrade.getRequiredReplyCount() <= cafeMember.getReplyCount()
									&& nextGrade.getRequiredVisitCount() <= cafeMember.getVisitCount()) {// 출석수,댓글,게시글수

								cafeMember.setCafeMemberGradeNo(nextGradeNo);
								cafeManageDao.updateCafeMemeberGrade(cafeMember);
							}
						}
					}
					//멤버가 아닐때 가입신청확인 여기에 하기
				}else {
					//가입신청정보
					search.setCafeNo(cafe.getCafeNo());
					search.setUserNo(user.getUserNo());
					CafeApplication cafeApplication = cafeManageDao.getCafeApplicationForMember(search);
					request.getSession().setAttribute("cafeApplication", cafeApplication);
					
				}

				// 출석체크 등업체크 이후의 멤버정보를 심음
				
				request.setAttribute("cafeMember", cafeMember);
			}

			// 카페 내부 기능 사용 여부 확인
			if (request.getRequestURI().matches("/cafe/" + cafeURL + "/.+")) {
				System.out.print(">>>>>>>>>>>>>>>>>>>>> 카페 내부 기능 사용");

				// 로그인 여부 확인
				if (user == null) {
					System.out.println(">>> User없음");
//					request.setAttribute("targetURL", request.getRequestURI());
					response.sendRedirect(
							request.getContextPath() + "/user/loginView?targetURL=" + request.getRequestURI());
					return false;
				}
				
				// 카페 멤버 여부 확인//지니
				else if (cafeMember == null || cafeMember.getMemberStatusCode().equals("cs102") ) {

					if (request.getRequestURI().contains("addCafeApplication")) {
						System.out.println(">>> 카페 회원가입 접근");
						return true;
					}
					System.out.println(">>> 카페 멤버 아님");
					response.sendRedirect(request.getContextPath() + "/WEB-INF/views/common/needAply.jsp");// 이거 수정 ㅠ.ㅠ
					return false;

				}
				// 정지 회원 접근 확인
				else if (cafeMember.getMemberStatusCode().equals("cs101")) {
					System.out.println(">>> 정지 회원접근");
					////////////////////////////// 기황시작//////////////////////////////
					// 정지가 만료되었는지 체크하는 부분
					boolean expired = cafeManageService.checkBlockExpired(cafeMember.getMemberNo());

					if (expired) {
						System.out.println("정지기간 만료로 해제되었음");
					}

					else if (!expired) {
						System.out.println("정지기간 진행중임");
						response.sendRedirect(request.getContextPath() + "/cafe/" + cafeURL + "/memberBlock");
						return false;
					}
					////////////////////////////// 기황끝//////////////////////////////

				}
				// 세부 권한 확인
				else {

					// 매니저 확인
					if (request.getRequestURI().contains("manage")) {
						System.out.println("CafeInterceptor >>> 매니저 메뉴 접근");

						if (cafe.getManageUserNo() == user.getUserNo()) {

						} else {
							response.sendRedirect(request.getContextPath() + "/cafe/" + cafeURL + "/");
							return false;
						}

					}

					// 게시판 조회
					if (request.getRequestURI().contains("getBoard")) {
						System.out.println("CafeInterceptor >>> 카페 메뉴 접근 >>> getBoard");

						// 기존 boardList에서 해당하는 board를 찾음
						Board board = null;
						int boardNo = Integer.parseInt(pathVariables.get("boardNo"));
						for (int i = 0; i < boardList.size(); i++) {
							if (boardList.get(i).getBoardNo() == boardNo) {
								board = boardList.get(i);
								request.setAttribute("board", board);
								break;
							}
						}

						// 접근 권한을 확인하기위한 데이터 정제
						int cafeMemberGrade = Integer.parseInt(cafeMember.getMemberGrade().substring(2));
						int boardGrade = Integer.parseInt(board.getMemberGradeCode().substring(2));

						// 게시판 접근권한이 모자랄 경우
						if (!user.getUserRoleCode().equals("ur100") && ( (cafeMemberGrade > 101 && cafeMemberGrade < boardGrade) || (cafeMemberGrade < 102 && cafeMemberGrade > boardGrade)) ) {
							
							System.out.println("CafeInterceptor >>> 권한 부족");
							response.sendRedirect(request.getContextPath() + "/cafe/" + cafeURL + "/accessDenied");
							return false;
						}
					}

					// 게시글 조회
					if (request.getRequestURI().contains("/getPost/")) {
						System.out.println("CafeInterceptor >>> 카페 메뉴 접근 >>> getPost");

						// 게시글 정보 가져옴
						Post post = cafePostService.getPost(Integer.parseInt(pathVariables.get("postNo")));
						request.setAttribute("post", post);

						// 기존 boardList에서 해당하는 board를 찾음
						Board board = null;
						int boardNo = post.getBoardNo();
						for (int i = 0; i < boardList.size(); i++) {
							if (boardList.get(i).getBoardNo() == boardNo) {
								board = boardList.get(i);
								break;
							}
						}

						// 접근 권한을 확인하기위한 데이터 정제
						int cafeMemberGrade = Integer.parseInt(cafeMember.getMemberGrade().substring(2));
						int boardGrade = Integer.parseInt(board.getMemberGradeCode().substring(2));

						// 게시글이 삭제된 경우
						if (post.isPostStatusFlag()) {
							System.out.println("CafeInterceptor >>>>>>>>>> 게시글 삭제됨!");
							response.sendRedirect(request.getContextPath() + "/cafe/" + cafeURL + "/deletedPost");
							return false;
						}

						// 해당 게시글이 있는 게시판의 접근권한이 모자랄 경우
						if (!user.getUserRoleCode().equals("ur100") && ( (cafeMemberGrade > 101 && cafeMemberGrade < boardGrade) || (cafeMemberGrade < 102 && cafeMemberGrade > boardGrade)) ) {
							System.out.println("CafeInterceptor >>>>>>>>>> 권한 부족");
							response.sendRedirect(request.getContextPath() + "/cafe/" + cafeURL + "/accessDenied");
							return false;
						}
					}
				} // 기본권한 확인 후 세부권한 사용 끝

			} // 내부기능 사용 끝

		} // preHandler 끝
*/
		// 모든 경우가 만족
		System.out.println("================================ ChatInterceptor > preHandle 끝 ===============================\n\n");
		return true;
	}

//    @Override
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//    	System.out.println("Interceptor > postHandle");
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception arg3) throws Exception {
//    	System.out.println("Interceptor > afterCompletion" );
//    }
}
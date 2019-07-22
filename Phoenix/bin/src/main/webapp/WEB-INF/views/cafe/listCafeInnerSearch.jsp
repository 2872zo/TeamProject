<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<header>
		<link rel="stylesheet" href="/css/advenced-search.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/e589319d43.js"></script>
		<script src="/js/cafeCommon.js"></script>
		
		<style>
			.postTitle, .boardName{
				text-decoration: underline;
			}
			.postTitle:hover, .boardName:hover{
				color: blue;
			}
		</style>
		
		<script>
			var cafeURL = '${search.cafeURL}';

			//세부검색 시작
			$(function(){
				$("#advSubmitButton").on("click", function(){
					$("[name=currentPage]").val(1);
				});
			});

			//세부검색 시작
			$(function(){
				$("#submitButton").on("click", function(){
					location.href = "/cafe/" + "${cafeURL}" + "/search?searchKeyword=" + $("#searchKeyword").val(); 
				});
			});

			//페이지 이동
			function fncGetInnerSearchList(idx){
				$("[name=currentPage]").val(idx);
				$("#searchForm").attr("method","GET").attr("action","/cafe/" + cafeURL + "/search").submit();	
			};

			//datePicker 생성
			$(function(){
				$( "#termStart" ).datepicker({dateFormat:'yy-mm-dd'});
			    $( "#termEnd" ).datepicker({dateFormat:'yy-mm-dd'});
			});
			
			//검색조건 유지
			$(function(){
				$("[name=currentPage]").val(${search.currentPage });
				$( "#termStart" ).val('${search.termStart}');
			    $( "#termEnd" ).val('${search.termEnd}');	
				$("[name=searchKeyword]").val('${search.searchKeyword}');
				
				$(".boardOption").each(function(){
				    if($(this).val()==${search.boardNo}){
				      $(this).attr("selected","selected");
				    }
				});
				
				$(".searchOption").each(function(){
				    if($(this).val()==${empty search.searchCondition? 0 : search.searchCondition}){
				      $(this).attr("selected","selected");
				    }
				});
			});

			//게시글 조회
			$(function(){
				$(".postTitle").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getPost/" + 	$(this).parent().find(".postNo").val();				
				});			
			});

			//게시판 조회
			$(function(){
				$(".boardName").on("click", function(){
					location.href = "/cafe/" + cafeURL + "/getBoard/" + $(this).parent().find(".boardNo").val();
				});
			});
		</script>
		
		<title>${search.cafeURL}</title>
	</header>
	
	<body>
		<div class="container">
			<h1>listCafeInnerSearch</h1>
			
			<div class="row">
				<div class="col-md-12">
		            <div class="input-group" id="adv-search">
		                <input type="text" class="form-control" name="searchKeyword" id="searchKeyword"/>
		                <div class="input-group-btn">
		                    <div class="btn-group" role="group">
		                        <div class="dropdown dropdown-lg">
		                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
		                            <div class="dropdown-menu dropdown-menu-right" role="menu">
										<form class="form-horizontal" role="form" id="searchForm">
											<input type="hidden" name="currentPage">
											<div class="form-group">
												<label for="termStart">기간 시작</label> 
												<input class="form-control" type="text" id="termStart" name="termStart" readonly="readonly">
											</div>
	
											<div class="form-group">
												<label for="termEnd">시작 끝</label> 
												<input class="form-control" type="text" id="termEnd" name="termEnd" readonly="readonly">
											</div>
	
											<div class="form-group">
												<label for="boardNo">게시판</label> 
												<select	class="form-control hideOption" name="boardNo">
													<option value="0" class="boardOption">전체</option>
													<c:forEach var="board" items="${boardOption }">
														<option value="${board.boardNo }" class="boardOption">${board.boardName }</option>
													</c:forEach>
												</select>
											</div>
											
											<div class="form-group">
												<label for="searchCondition">구분</label> 
												<select class="form-control hideOption" name="searchCondition">
													<option value="0" class="searchOption">전체</option>
													<option value="1" class="searchOption">호칭</option>
													<option value="2" class="searchOption">제목</option>
													<option value="3" class="searchOption">내용</option>
													<option value="4" class="searchOption">댓글</option>
												</select>
											</div>
											
											<div class="form-group">
												<label for="searchKeyword">키워드</label> 
			                            		<input type="text" class="form-control" name="searchKeyword" id="advSearchKeyword"> 
			                            	</div>
			                            	
			                            	<button type="submit" class="btn btn-primary" style="margin-left: 15px; margin-right: 15px;" id="advSubmitButton">
			                            		<span class="searchIcon" aria-hidden="true"></span>
			                            	</button>
			                        	</form>
		                            </div>
		                        </div>
		                        
		                        <button type="button" class="btn btn-primary"><span class="searchIcon" aria-hidden="true" id="submitButton"></span></button>
		                        
		                    </div>
		                </div>
		            </div>
		          </div>
		        </div>
			
			<div class="row">
				<div class="col-2">
					<c:import url="/WEB-INF/views/cafe/menubarCafe.jsp"></c:import>
				</div>
			
				<div class="col-10">
				<p>총 ${postTotalCount }개</p>
				<table class="table table-striped table-bordered">
					<tr>
		<!-- 				<td>게시글 번호</td> -->
		<!-- 				<td>게시판 번호</td> -->
		<!-- 				<td>memberNo</td> -->
						<td>게시판</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
						<td>추천수</td>
		<!-- 				<td>postStatusFlag</td> -->
		<!-- 				<td>postNoticeFlag;</td> -->
		<!-- 				<td>noticeIndex</td> -->
					</tr>
					
					<c:forEach items="${postList }" var="post">
						<tr>
							<input type="hidden" class="postNo" value="${post.postNo }"/>
							<input type="hidden" class="boardNo" value="${post.boardNo }"/>
							<input type="hidden" class="memberNo" value="${post.memberNo }"/>
							<td class="boardName">${post.boardName }</td>
							<td class="postTitle">${post.postTitle }</td>
							<td>${post.memberNickname }</td>
							<td>${post.regDate }</td>
							<td>${post.viewCount }</td>
							<td>${post.likeCount }</td>
		<%-- 					<td>${post.postStatusFlag }</td> --%>
		<%-- 					<td>${post.postNoticeFlag }</td> --%>
		<%-- 					<td>${post.noticeIndex }</td> --%>
						</tr>
					</c:forEach>
				</table>
				
				<table>
					<tr>
						<td align="center">
							<c:import url="/WEB-INF/views/common/pageNavigator.jsp">
								<c:param name="subject" value="InnerSearch"/>
							</c:import>
						</td>
					</tr>
				</table>
				
				</div><!-- 메인 content -->
				
			</div><!-- row End -->
			
		</div><!-- container End -->
	</body>
</html>
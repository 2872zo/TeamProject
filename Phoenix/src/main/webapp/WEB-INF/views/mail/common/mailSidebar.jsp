<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
	.badge.float-right.badge-sm{
		color:white;
	}
	
	.nk-sidebar .metismenu > li:hover span{
		color:white;
	}
	
</style>

<div class="nk-nav-scroll">
	<ul class="metismenu" id="menu">
		<li>
			<span class="nav-text">

				<div class="card">
					<div class="card-body">
							<select class="form-control mb-2" id="accountSelector" >
								<option class="accountSelectorOption" value="0">전체</option>
								<c:forEach items="${accountList }" var="account">
									<option class="accountSelectorOption" value="${account.accountNo }">${account.accountId }</option>
									<c:set var="i" value="${i+1 }"/>
								</c:forEach>								
							</select>
						
							<a href="javascript:fncSendMail()" class="btn btn-primary btn-block">메일 쓰기</a>
							
							<div class="mail-list mt-4">
								<c:set var="URL" value="${pageContext.request.requestURI}" />
								<a href="javascript:fncGetMailList(1)" class="list-group-item border-0 <c:if test="${fn:contains(URL, 'listMail') }">text-primary</c:if>  p-r-0"> 
									<i class="fa fa-inbox font-18 align-middle mr-2"></i> <b>Inbox</b> 
									<c:if test="${!empty inboxTotalCount && inboxTotalCount ne 0 }">
										<span class="badge badge-primary badge-sm float-right m-t-5">${inboxTotalCount }</span>
									</c:if>
								</a> 
								
								<a href="javascript:fncGetSentMailList(1)" class="list-group-item border-0 <c:if test="${fn:contains(URL, 'listSentMail') }">text-primary</c:if> p-r-0"> 
									<i class="fa fa-paper-plane font-18 align-middle mr-2"></i> <b>Sent</b>
									<c:if test="${!empty sentTotalCount && sentTotalCount ne 0 }">
										<span class="badge badge-success badge-sm float-right m-t-5">${sentTotalCount }</span>
									</c:if>
								</a> 
								
								<a href="javascript:fncGetImportantMailList(1)" class="list-group-item border-0 <c:if test="${fn:contains(URL, 'listFlagMail') }">text-primary</c:if> p-r-0"> 
									<i class="fa fa-star-o font-18 align-middle mr-2"></i><b>Important</b>
									<c:if test="${!empty importantTotalCount && importantTotalCount ne 0 }">
										<span class="badge badge-info badge-sm float-right m-t-5">${importantTotalCount }</span>
									</c:if> 
								</a> 
								
								<a href="javascript:fncGetTrashMailList(1)" class="list-group-item border-0 <c:if test="${fn:contains(URL, 'listDeletedMail') }">text-primary</c:if> p-r-0">
									<i class="fa fa-trash font-18 align-middle mr-2"></i><b>Trash</b>
									<c:if test="${!empty trashTotalCount && trashTotalCount ne 0 }">
										<span class="badge badge-danger badge-sm float-right m-t-5">${trashTotalCount }</span>
									</c:if> 
								</a>
							</div>
						
						
					</div>
				</div>
				
			</span>
		</li>
	</ul>
</div>
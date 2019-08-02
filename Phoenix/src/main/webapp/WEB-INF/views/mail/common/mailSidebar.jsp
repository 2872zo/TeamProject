

<div class="nk-nav-scroll">
	<ul class="metismenu" id="menu">
		<li>
			<span class="nav-text">
<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
								<a href="javascript:fncGetMailMain(${accountNo })" class="list-group-item border-0 text-primary p-r-0"> 
									<i class="fa fa-inbox font-18 align-middle mr-2"></i> <b>Inbox</b> 
									<span class="badge badge-primary badge-sm float-right m-t-5">198</span>
								</a> 
								
								<a href="javascript:fncGetSentMailList(${accountNo })" class="list-group-item border-0 p-r-0"> <i
									class="fa fa-paper-plane font-18 align-middle mr-2"></i>Sent
								</a> 
								
								<a href="javascript:fncGetImportantMailList(${accountNo })" class="list-group-item border-0 p-r-0"> 
									<i class="fa fa-star-o font-18 align-middle mr-2"></i>Important 
									<span class="badge badge-danger badge-sm float-right m-t-5">47</span>
								</a> 
								
								<a href="javascript:fncGetTrashMailList(${accountNo })" class="list-group-item border-0 p-r-0">
									<i class="fa fa-trash font-18 align-middle mr-2"></i>Trash
								</a>
							</div>
						
						
					</div>
				</div>
				
			</span>
		</li>
	</ul>
</div>
<%@page import="com.dev.doodle.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

User loginUser = (User)session.getAttribute("loginUser");

%>	
	<div id="header">
		<h1 class="screen_out">끄적끄적</h1>
		<h2 class="screen_out">주요 메뉴</h2>
		<nav id="menuBar">
			<a id="logo" href="indexMain.jsp">
				<img src="img/logo.jpg" alt="끄적끄적 로고 이미지" title="끄적끄적 로고 이미지" /> 
				<!-- <i class="fa fa-pencil"></i>끄적끄적-->
			</a>
			<div id="menu1">
					<a href="novelBoard.jsp">소설</a>
					<a href="training.jsp">창의력 트레이닝</a>
					<a id="shuffle" href="" title="랜덤 작품으로 이동"><i
						class="fa fa-random"></i></a>
					<form id="searchForm" action="search.jsp" method="get">
					<fieldset>
						<legend class="screen_out"> 통합검색 </legend>
						<input type="text" id="search" name="search" placeholder="검색" />
						<button class="btn" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</fieldset>
				</form>
			</div>
			<!-- menu1 end -->
			
			<div id="menu2">
				<%if(loginUser==null) { %>
			<div id="loginBefore">
				<button id="login" class="btn">로그인</button>
				<a id="join" href="joinForm.jsp">가입</a>
			</div><!-- loginBefore -->
			
			<div id="loginBox">
			<form action="login.jsp" method="post">
				<fieldset>
					<legend class="screen_out"> 로그인폼 </legend>
					<label class="screen_out" for="id">아이디</label> <input type="text"
						id="id" name="id" title="아이디 입력" placeholder="ID입력 id@abc.com" />
					<label class="screen_out" for="pwd">비밀번호</label> <input
						type="password" id="pwd" name="pwd" title="비밀번호 입력"
						placeholder="비밀번호 입력" /> <a href="help.jsp">ID,비밀번호 찾기</a>
					<button id="loginBtn" class="btn">로그인</button>
				</fieldset>
			</form>
		</div>
		<!-- loginBox end -->
			<% } else { %>
			<!--로그인 된 경우 -->
			<div id="loginAfter">
				<a href="userPage.jsp?no=<%=loginUser.getNo() %>"><img title="<%=loginUser.getNickname() %>님 프로필 사진" src="profile/<%=loginUser.getProfile() %>"/>
							<span><%=loginUser.getNickname() %>님</span></a>
				<button id="bar" class="btn">
					<i class="fa fa-bars"></i>
				</button>
				<div id="alarmBox">
					<span> <i class="fa fa-bell"></i>알림
						<button class="btn" type="delete">지우기</button>
					</span>
					<p>새로운 알림이 없습니다.</p>
					<div>
						<a href="userPage.jsp">마이페이지</a>
						<!--
								-->
						<a href="writeForm.jsp"><i class="fa fa-pencil"></i>글쓰기</a>
						<!--
								-->
						<a href="logout.jsp"><i class="fa fa-sign-out"></i>로그아웃</a>
					</div>
				</div>
				<!-- alarmBox end -->
			</div>
			<!-- loginAfter end -->
			<%} %>
			</div>
			<!-- menu2 end -->
		</nav>
		<!-- menubar end -->
	</div>
	<!--header end-->
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>MATCHAI</title>
		<link rel="stylesheet" type="text/css" href="/resource/css/gameanalysis.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/chart.js" defer></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="/resource/js/gameanalysis.js" defer></script>
	</head>
	<body>

	<input type="hidden" id="team1name" name="team1name" value="${aiData.team1name}"/>
	<input type="hidden" id="team2name" name="team2name" value="${aiData.team2name}"/>
	<input type="hidden" id="team1_winrate" name="team1_winrate" value="${aiData.team1_winrate}"/>
	<input type="hidden" id="team2_winrate" name="team2_winrate" value="${aiData.team2_winrate}"/>
	<input type="hidden" id="game_analysis" name="game_analysis" value="${aiData.game_analysis}"/>
	<input type="hidden" id="matchcode" name="matchcode" value="${aiData.matchcode}"/>

	<header>
			<div class="logo">
					<button type="button" class="btn-logo" id="btn-logo">
					<img src="/resource/images/mainlogo/MATCHAIBoard.png" alt="로고" class="logo-img">
				</button>
			</div>
			<nav>
				<div class="main_menu">
					<ul>
						<li><button type="button" class="menu-btn" id="game-menu">경기</button></li>
						<li><button type="button" class="menu-btn" id="data-menu">데이터센터</button></li>
						<li><button type="button" class="menu-btn" id="aipick-menu">AI'sPick</button></li>
						<li><button type="button" class="menu-btn" id="board-menu">게시판</button></li>
						<li><button type="button" class="menu-btn" id="minigame-menu">미니게임</button></li>
					</ul>
				</div>
			</nav>
			<div class="auth-buttons">
				<!-- 우측 상단에 로그인, 회원가입 버튼, 로그인 시에만 로그아웃이 보임 -->
				<c:if test="${!empty sessionScope.userInfo}">
					<div class="ment">
						*${sessionScope.userInfo.usernickname}님*
						<!-- 로그인 했을 때 사용자의 닉네임이 뜸 -->
					</div>
					<button type="button" id="btn-logout">로그아웃</button>
				</c:if>
				<c:if test="${empty sessionScope.userInfo}">
					<button type="button" id="btn-login">로그인</button>
					<button type="button" id="btn-signup">회원가입</button>
				</c:if>
			</div>
		</header>
		<aside class="sidebar">
			<!-- 좌측 사이드 바에 최근 조회한 경기 목록이 뜨도록 -->
			<div class="recent-views">
				<h3>최근 조회 경기</h3>
				<ul>
					<li>경기 1</li>
					<li>경기 2</li>
					<li>경기 3</li>
					<li>경기 4</li>
					<li>경기 5</li>
				</ul>
			</div>
		</aside>
		<main class="anal">
			<div class="allbox">
				<div class="analbox">
					<h2 class="analtitle" id="summaryanaltitle">경기 결과</h2>
					<div class="body_row">
						<div class="col-md-6">
							<canvas id="summaryChart" width="300" height="350"></canvas>
						</div>
						<div class="col-md-6">
							<img src="/resource/images/modal/modaltop.jpg" alt="모달"
								class="ment_top">
							<div></div>
						</div>
					</div>
				</div>
				<div class="replybox">
					<h2 class="replytitle" id="replytitle">야구 TALK</h2>
					<div class="reply" id="reply">
						<c:forEach var="cmt" items="${comment}">
							<c:choose>
								<c:when test="${cmt.user == sessionScope.userInfo.useremail}">
									<!-- 내가 쓴 댓글 -->
									<div class="mysamplereply"> ${cmt.memo} </div>
								</c:when>
								<c:otherwise>
									<!-- 다른 사람들이 쓴 댓글 -->
									<div class="yoursamplereply"> ${cmt.memo} </div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<div class="replyment">
							<input type="text" class="contents" id = "comment" name="content" placeholder="내용을 입력하세요." required>
							<button type="button" class="contentsbtn" id="onclick_reply" onclick=addComment()>↑</button>
					</div>
				</div>
			</div>
		</main>
		<footer class="analfooter">
			<!-- footer -->
			<div class="footer-items">
				<div>
					<div>
						<a href="https://www.naver.com">네이버</a>
					</div>
					<div>
						<a href="https://www.naver.com">네이버</a>
					</div>
					<div>
						<a href="https://www.naver.com">네이버</a>
					</div>
					<div>
						<a href="https://www.naver.com">네이버</a>
					</div>
				</div>
				<div>
					<div>
						<a href="https://www.youtube.com">youtube</a>
					</div>
					<div>
						<a href="https://www.youtube.com">youtube</a>
					</div>
					<div>
						<a href="https://www.youtube.com">youtube</a>
					</div>
					<div>
						<a href="https://www.youtube.com">youtube</a>
					</div>
				</div>
				<div>
					<div>
						<a href="https://www.google.com">google.com</a>
					</div>
					<div>
						<a href="https://www.google.com">google.com</a>
					</div>
					<div>
						<a href="https://www.google.com">google.com</a>
					</div>
					<div>
						<a href="https://www.google.com">google.com</a>
					</div>
				</div>
			</div>
		</footer>
	</body>
	</html>
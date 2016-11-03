
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">

		<title>searchForm</title>
		
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		
 		<style>
 		
 		html {
				overflow-y:scroll;
		}
 		
		#searchForm{
			width:1000px;
			margin:auto;
			font-family: bon, sans-serif;
		}
		
 		#search {
				width: 1000px;
				margin: 20px auto;
		}
		
		#search input{
				width: 980px;
				height: 50px;
				margin: auto;
				padding: 5px 10px;
				display: block;
				border: none;
				font: 300 20px/50px bon, sans-serif;
		}
		
		#writingItem, #commentItem, #writerItem {
			margin:auto;
			width:998px;
			padding-bottom: 30px;
			position: relative;
		}
		
		
		
		/* 탭 */
		input:nth-of-type(1) {display:none;}
		input:nth-of-type(1) ~ div:nth-of-type(1) {display:none;}
		input:nth-of-type(1):checked ~ div:nth-of-type(1) {display:block;}
		
		input:nth-of-type(2) {display:none;}
		input:nth-of-type(2) ~ div:nth-of-type(2) {display:none;}
		input:nth-of-type(2):checked ~ div:nth-of-type(2) {display:block;}
		
		input:nth-of-type(3) {display:none;}
		input:nth-of-type(3) ~ div:nth-of-type(3) {display:none;}
		input:nth-of-type(3):checked ~ div:nth-of-type(3) {display:block;}
		
		input:nth-of-type(4) {display:none;}
		input:nth-of-type(4) ~ div:nth-of-type(4) {display:none;}
		input:nth-of-type(4):checked ~ div:nth-of-type(4) {display:block;}
		
		section.buttons { 
			overflow:hidden;
		}
		
		section.buttons > label { 
			display:block;
			float:left;
			width:100px;
			height:30px;
			margin-bottom:10px;
			text-align: center;
			box-sizing: border-box;
			border-bottom: 1px solid black;
			line-height:30px;
			color:black;
			cursor: pointer;
		}
		
		input:nth-of-type(1):checked ~ section.buttons > label:nth-of-type(1) { 
			color:#00CDAE;
			border-bottom: 2px solid #00CDAE;
		}
		
		input:nth-of-type(2):checked ~ section.buttons > label:nth-of-type(2) { 
			color:#00CDAE;
			border-bottom: 2px solid #00CDAE;
		}
		
		input:nth-of-type(3):checked ~ section.buttons > label:nth-of-type(3) { 
			color:#00CDAE;
			border-bottom: 2px solid #00CDAE;	
		}
		
		input:nth-of-type(4):checked ~ section.buttons > label:nth-of-type(4) { 
			color:#00CDAE;
			border-bottom: 2px solid #00CDAE;	
		}
		
		.ex {
				width:940px;
				height:170px;
				line-height:50px;
				border-bottom: 1px solid #bdbdbd;
				margin:20px auto;
				position: relative;
				font: 200 15px/20px bon, sans-serif;
				color:#424242;
		}
			
			.profile {
			width:120px;
			height:130px;
			position:absolute;
			left:10px;
			top:15px;
			text-align: center;
		}
		
		.img {
			width:100px;
			height:100px;
			border-radius:50px;
			margin:15px auto 10px auto;
		}
		
		.nickname {
			width:100px;
			height:20px;
			margin:auto;
		}
		
		.title {
			width:650px;
			height:25px;
			margin:auto;
			position:absolute;
			left:130px;
			top:15px;
			display:inline-block;
			text-indent:10px;
			font: 400 20px/20px bon, sans-serif;
			color:#212121;
			text-align: left;
		}
		
		.icon {
			width:160px;
			height:25px;
			margin:auto;
			position:absolute;
			left:780px;
			top:15px;
			display:inline-block;
			text-indent:10px;
			font: 200 12px/20px bon, sans-serif;
		}
		
		.content {
			width:630px;
			height:60px;
			margin:auto;
			position:absolute;
			left:130px;
			top:40px;
			display:inline-block;
			text-indent:20px;
			white-space:nowrap;
			overflow:hidden;
			text-overflow:ellipsis;
			text-align: left;
			padding:10px;
		}
		
		.index {
			width:780px;
			height:25px;
			margin:auto;
			padding-right:20px;
			position:absolute;
			left:130px;
			top:120px;	
			display:inline-block;
			text-align:right;
			font: 200 12px/20px bon, sans-serif;
		}
		
		.icon2 {
			width:100px;
			height:160px;
			background:red;
			position:absolute;
			right:10px;
			top:0px;
		}
		
		span {
			display:block;
			padding:15px 0 0 30px;
		}
		
		hr {
			width:940px;
			box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24);
		}
		
		.tabItem > div{
			margin: 20px;
		}
		
		.more {
			position:absolute;
			right:30px;
			bottom:20px;
			font: 300 10px/15px bon, sans-serif;
		}
		
		a{
			
		}
		
		#commentItem .title {
			font: 400 12px/20px bon, sans-serif;
		}
		
		</style>
	</head>
	<body>
		<div id="searchForm">
			<div id="search">
					<input type="text" id="keyword" value="" name="searchWord" autofocus="autofocus" placeholder="검색어를 입력해주세요."/>
			</div><!-- //search -->
			
			<div id="result">
				<div id="tab">
					<input id="all" type="radio" name="tab" checked="checked" />
					<input id="writing" type="radio" name="tab" />
					<input id="comment" type="radio" name="tab" />
					<input id="writer" type="radio" name="tab" />
					<section class="buttons">
						<label for="all">전체</label>
						<label for="writing">글</label>
						<label for="comment">댓글</label>
						<label for="writer">작가</label>
					</section>
					<div class="tabItem">
							<span><em>글 검색결과</em></span>
							<hr />
							<div id="writingItem">


							
							</div><!-- //writingItem -->
						
						<!-- 통합 글 검색 -->
						<script type="text/template" id="CombineBoardTmp">
							<@ var i = 0 @>
							<@ $(boards).each(function() {@>
							<@ if(i < 3) {@>
							<@ i++ @>
							<a href="novelcont.jsp?no="<@=this.no @>>
								<div class="ex">
									<div class="profile">
										<@=this.profile@>
									</div><!-- //profile -->
									<div class="title">
										『<@=this.title @>』
									</div><!-- //title -->
									<div class="icon">
										<i class="fa fa-eye"></i> <@=this.hit @> <i class="fa fa-thumbs-o-up"></i> <@=this.like @> <i class="fa fa-star"></i> <@=this.bookmarkCount @>
									</div><!-- //icon -->
									<div class="content">
										<@=this.content @>
									</div><!-- //content -->
									<div class="index">
										<@=this.regdate @>
									</div><!-- //index -->
								</div><!-- //ex -->
							</a>
							<@ } @>
							<@ }) @>
							<a href="#writing" class="more">글 검색결과 더보기</a>
						</script>	
						
						
							<span>댓글 검색결과</span>
							<hr />
							<div id="commentItem">

							
							</div><!-- //commentItem -->
							
							
							<!-- 통합 댓글 검색 -->
							<script type="text/template" id="CombineReplyTmp">
								<@ var i = 0 @>
								<@ $(replies).each(function() {@>
								<@ if(i < 3) {@>
								<@ i++ @>

								<a href="novelcont.jsp?no="<@=this.no @>>
									<div class="ex">
									<div class="profile">
										<div class="img">
											<@=this.profile@>
										</div><!-- //img -->
										<div class="nickname">
											<@=this.nickname@>
										</div><!-- //nickname -->
									
									</div><!-- //profile -->
									<div class="title">
										<@=this.regdate @>
									</div><!-- //title -->
									<div class="icon">
										<i class="fa fa-thumbs-o-up"></i> 10  <i class="fa fa-thumbs-o-down"></i> 1
									</div><!-- //icon -->
									<div class="content">
										<@=this.content @>
									</div><!-- //content -->
									<div class="index">
										『<@=this.title @>』중에서..
									</div><!-- //index -->
								</div><!-- //ex -->
								</a>
								<@ } @>
								<@ }) @>
								<a href="#" class="more">댓글 검색결과 더보기</a>
							</script>	
						
						<span>작가 검색결과</span>
						<hr />
							
						<div id="writerItem">
							
							

						
						</div><!-- //writerItem -->
						
						
						<!-- 통합 작가 검색 -->
						<script type="text/template" id="CombineUserTmp">
							<@ var i = 0 @>
							<@ $(users).each(function() {@>
							<@ if(i < 3) {@>
							<@ i++ @>
							
							<a href="novelcont.jsp?no="<@=this.no @>>
							<div class="ex">
									<div class="profile">
									<div class="img">
										<img src="img/<@=this.profile@>" alt="프로필사진"/>
									</div><!-- //img -->
									<div class="nickname">
										<@=this.nickname@>
									</div><!-- //nickname -->
									
								</div><!-- //profile -->
								<div class="title">
								
								</div><!-- //title -->
								<div class="icon">
									<i class="fa fa-leanpub"></i> 1 <i class="fa fa-users"></i> 	1
								</div><!-- //icon -->
								<div class="content">
									<@=this.intro@>
								</div><!-- //content -->
								<div class="index">
									
								</div><!-- //index -->
							</div><!-- //ex -->
							</a>
						<@ } @>
						<@ }) @>
						<a href="#" class="more">작가 검색결과 더보기</a>
					</script>	
						
						
					</div><!-- //tabItem -->
					<div class="tabItem" id="BoardItem">
						
							
							
							
					</div>
					
					<!-- 글 검색 -->
					<script type="text/template" id="BoardTmp">
						<@ $(boards).each(function() {@>

							<a href="novelcont.jsp?no="<@=this.no @>>
								<div class="ex">
									<div class="profile">
										<@=this.profile@>
									</div><!-- //profile -->
									<div class="title">
										『<@=this.title @>』
									</div><!-- //title -->
									<div class="icon">
										<i class="fa fa-eye"></i> <@=this.hit @> <i class="fa fa-thumbs-o-up"></i> <@=this.like @> <i class="fa fa-star"></i> <@=this.bookmarkCount @>
									</div><!-- //icon -->
									<div class="content">
										<@=this.content @>
									</div><!-- //content -->
									<div class="index">
										<@=this.regdate @>
									</div><!-- //index -->
								</div><!-- //ex -->
							</a>
						<@ }) @>
					</script>		
							
							
					
					<div class="tabItem" id="ReplyItem">
						
						
								
						
					</div><!-- //tabItem -->
					
					
					<!-- 댓글 검색 -->
					<script type="text/template" id="ReplyTmp">
						<@ $(replies).each(function() {@>
							
							<a href="novelcont.jsp?no="<@=this.no @>>
									<div class="ex">
									<div class="profile">
										<div class="img">
											<@=this.profile@>
										</div><!-- //img -->
										<div class="nickname">
											<@=this.nickname@>
										</div><!-- //nickname -->
									
									</div><!-- //profile -->
									<div class="title">
										<@=this.regdate @>
									</div><!-- //title -->
									<div class="icon">
										<i class="fa fa-thumbs-o-up"></i> 10  <i class="fa fa-thumbs-o-down"></i> 1
									</div><!-- //icon -->
									<div class="content">
										<@=this.content @>
									</div><!-- //content -->
									<div class="index">
										『<@=this.title @>』중에서..
									</div><!-- //index -->
								</div><!-- //ex -->
								</a>
							
						<@ }) @>
					</script>	
					
					<div class="tabItem" id="UserItem">
						
						
						
							
					</div><!-- //tabItem -->
					
					<!-- 작가 검색 -->
					<script type="text/template" id="UserTmp">
						<@ $(users).each(function() {@>
							
							<a href="novelcont.jsp?no=<@=this.no @>">
							<div class="ex">
								<div class="profile">
									<div class="img">
										<img src="img/<@=this.profile@>" alt="프로필사진"/>
									</div><!-- //img -->
									<div class="nickname">
										<@=this.nickname@>
									</div><!-- //nickname -->
									
								</div><!-- //profile -->
								<div class="title">
								
								</div><!-- //title -->
								<div class="icon">
									<i class="fa fa-leanpub"></i> 1 <i class="fa fa-users"></i> 1	
								</div><!-- //icon -->
								<div class="content">
									<@=this.intro@>
								</div><!-- //content -->
								<div class="index">
									
								</div><!-- //index -->
							</div><!-- //ex -->
							</a>
						<@ }) @>
					</script>	
					
					
				</div><!-- //tab -->
			</div><!-- //result -->
		</div><!-- //searchForm -->
		
		<script src="js/jquery.js"></script>
		<script src="js/underscore-min.js"></script>
		<script>
		
		_.templateSettings = {
				   interpolate: /\<\@\=(.+?)\@\>/gim,
				   evaluate: /\<\@(.+?)\@\>/gim,
				   escape: /\<\@\-(.+?)\@\>/gim
				};
		
		//호출가능 함수명
		//displayBoardSearchList();
		//displayReplySearchList();
		//displayUserSearchList();
		
		var keyword;
		
		$('#keyword').keydown(function(e){
			
			//alert("test");
			
			if(e.keyCode == 13){
				
				//alert("test");
				
				keyword = $('#keyword').val().trim();
				
				if(keyword==""){
					
					alert("검색어를 입력해주세요.");
					
					$('#keyword').val("").focus();
					
					return;
					
				}
				
				displayBoardSearchList();
				displayReplySearchList();
				displayUserSearchList();
				
			}//keyCode if end
			
		}).focus();
		
		
		
		//통합검색에서 작품 검색
		function displayBoardSearchList() {
			
			$.ajax("getBoardSearch.jsp",{
				type:"get",
				dataType:"json",
				data:{
					//검색어 보내주기
					keyword:keyword
				},
				error:function(xhr,error,code){
					alert(code);
				},
				success:function(json){
					
					//alert("작품");
					var templateCode = $("#BoardTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ boards:json });
					
					$("#BoardItem").html(markup);
					
					
					var templateCode = $("#CombineBoardTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ boards:json });
					
					$("#writingItem").html(markup);
					
				}//success:function(json) end
			});//.ajax() end
			
		}//displayBoardSearchList() end
		
		
		//통합검색에서 댓글 검색
		function displayReplySearchList() {
		
			$.ajax("getReplySearch.jsp",{
				type:"get",
				dataType:"json",
				data:{
					//검색어 보내주기
					keyword:keyword
				},
				error:function(xhr,error,code){
					alert(code);
				},
				success:function(json){
					
					//alert(json);
					//alert("댓글");
					var templateCode = $("#ReplyTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ replies:json });
					
					$("#ReplyItem").html(markup);
					
					var templateCode = $("#CombineReplyTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ replies:json });
					
					$("#commentItem").html(markup);
				
				}//success:function(json) end
			});//.ajax() end
		
		}//displayReplySearchList() end
		
		
		//통합검색에서 작가 검색
		function displayUserSearchList() {
		
			$.ajax("getUserSearch.jsp",{
				type:"get",
				dataType:"json",
				data:{
					//검색어 보내주기
					keyword:keyword
				},
				error:function(xhr,error,code){
					alert(code);
				},
				success:function(json){
					//alert(json);
					//alert("작가");
					var templateCode = $("#UserTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ users:json });
					$("#UserItem").html(markup);
					
					var templateCode = $("#CombineUserTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ users:json });
					
					$("#writerItem").html(markup);
				
				}//success:function(json) end
			});//.ajax() end
		}//displayUserSearchList() end
		
		</script>
	</body>
</html>

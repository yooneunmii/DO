<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">

		<title>novelBoard</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/noto.sans.korea.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/dante-editor.css" />
		<link rel="stylesheet" href="css/header.css" />
		<style>
			

			
			#novelBoard {
				width:1000px;
				margin:auto;
				font-family: bon, sans-serif;
			}
			
			#category {
				width:1000px;
				margin: 100px auto 0 auto;
				border:1px solid #e0e0e0;
			}

			#category ul {
				list-style: none;
				box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
			}

			#category li {
				width: 198px;
				height: 60px;
				float: left;
				border:1px solid #e0e0e0;
				text-align: center;
				line-height: 60px;
				transition: .2s ease;
			}
			
			a:visited, a:link {
				color: black;
				text-decoration: none;
			}
			
			#category li:hover {
				background:#424242;
				font-size: 26px;
				color:#fff;
				box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 
				 		    0 6px 20px 0 rgba(0, 0, 0, 0.19);
				cursor: pointer;
			}
			
			#category ul::after {
				content:"";
				width:0;
				height:0;
				float:none;
				clear:both;
				display:block;
			}
			
			#contents{
				text-align: center;
			}
			
			#contents span{
				margin:20px;
				display:inline-block;
				font: 500 30px/50px bon, sans-serif;
				text-shadow: 0 16px 28px 0 rgba(0, 0, 0, 0.22), 
							 0 25px 55px 0 rgba(0, 0, 0, 0.21);
			}
			
			hr{
				width:1000px;
				margin:30px auto;
			}
			
			#bestContents {
				border: none;
			}
			
			#orderby {
				width:1000px;
				position: relative;
				text-align: right;
				
			}
			
			#orderby ul {
				margin-right:50px;
			}
			
			#orderby li {
				display: inline-block;
				padding-left:10px;
				
			}
			
			#orderby li a{
				text-align: center;
				color:#607d8b;
			}
			
			#orderby li a:hover {
				color:#bdbdbd;
				text-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 
							 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			}
			
			.paginate {
				margin-top:50px;
				text-align: center;
			}

			.paginate a, .paginate span, .paginate strong {
				display: inline-block;
				padding: 8px 12px;
				font-size: 21px;
				background: siver;
				color: #9e9e9e;
				text-decoration: none;
				font-weight: 500;
				vertical-align: middle;
				margin: 0 2px;
			}
				
			.paginate span {
				color: #9e9e9e;
				cursor: not-allowed;
			}

			.paginate strong {
				font-size: 19px;
				background: #9e9e9e;
				color: #fff;
				box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 
							0 2px 10px 0 rgba(0, 0, 0, 0.12);
				cursor: not-allowed;
			}

			.paginate a:hover {
				text-decoration: underline;
				background: #9e9e9e;
				color: #fff;
				box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 
							0 6px 20px 0rgba(0, 0, 0, 0.19);
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
				box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
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
		
		#best .ex{
			border: none;
		}
		
		
		</style>
	</head>
	<body>
		<%@include file="template/header.jsp"%>
		<div id="novelBoard">
	
			<div id="category">
				<ul>
					<li>전체</li>
					<li>판타지</li>
					<li>로맨스</li>
					<li>미스테리</li>
					<li>스릴러</li>
					<li>게임</li>
					<li>일상</li>
					<li>퓨전</li>
					<li>코미디</li>
					<li>순수문학</li>
				</ul>
			</div><!-- //category -->
			
			<div id="contents">
				<span>BEST</span>
				<div id="best">
					
					
					
					
				</div><!-- //best -->
				<!--  Best 작품 -->
				<script type="text/template" id="bestTmp">
					<@ var i = 0 @>
					<@ $(bestGenre).each(function() {@>
					<@ if(i < 1) {@>
					<@ i++ @>
						<a href="">
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
				</script>	
				
				<hr />
				
				<div id="orderby">
					<ul>
						<li id="regdate"><a href="#orderby">최신순</a></li>
						<li id="hit"><a href="#orderby">조회순</a></li>	
						<li id="recommend"><a href="#orderby">추천순</a></li>	
					</ul>
				</div><!-- //orderby -->
				
				<div id="list">
					
							
							
							
					
							
				</div><!-- //list -->
				<script type="text/template" id="listTmp">
					<@ $(genreList).each(function() {@>
						<a href="">
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
				<!-- 최신순 -->
				<script type="text/template" id="listRegdateTmp">
					<@ $(listRegdate).each(function() {@>
					<a href="">
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
				<!-- 조회순 -->
				<script type="text/template" id="listHitTmp">
					<@ $(listHit).each(function() {@>
						<a href="">
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
				<!-- 추천순 -->
				<script type="text/template" id="listRecommendTmp">
					<@ $(listRecommend).each(function() {@>
					<a href="">
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
			</div><!-- //contents -->
	
			<div class="paginate">
					<!-- 이전 페이지 이동 :  비활성 -->
					<span title="이전 페이지 없음"><i class="fa fa-chevron-left"></i></span>
					<!-- 이전 페이지 이동 :  활성 -->
					<a href="" title="이전 페이지로"><i class="fa fa-chevron-left"></i><span class="screen_out">이전 페이지</span></a>
					<!-- 페이지들 -->
					<strong title="현재 1페이지">1</strong>
					<a href="" title="2">2</a>
					<a href="" title="3">3</a>
					<a href="" title="4">4</a>
					<a href="" title="5">5</a>
					<!-- 다음 페이지 이동 :  활성 -->
					<a href="" title="다음 페이지로"><i class="fa fa-chevron-right"></i><span class="screen_out">다음 페이지</span></a>
					<!-- 다음 페이지 이동 :  비활성 -->
					<span title="다음 페이지 없음"><i class="fa fa-chevron-right"></i></span>
			</div><!-- //pagnate -->
		</div><!-- //novelBoard -->
		
		<script src="js/jquery.js"></script>
		<script src="js/underscore-min.js"></script>
		<script>
		
				_.templateSettings = {
				   interpolate: /\<\@\=(.+?)\@\>/gim,
				   evaluate: /\<\@(.+?)\@\>/gim,
				   escape: /\<\@\-(.+?)\@\>/gim
				};	
			
			//변수선언
			var $loader = $("#loader"),
				$li = $('#category li'),
				genre = "전체";
			
			displayGenreList();
			displayGenreBest();
			
			//그룹리스트를 갱신하는 함수
			function displayGenreList() {
				
				//로더 화면
				$loader.show();
				
				$.ajax("getGenreList.jsp",{
				type:"get",
				dataType:"json",
				data:{
					//클릭된 장르를 전송
					genre:genre
				},
				error:function(xhr,error,code){
					alert(code);
				},
				success:function(json){
					
					//alert(json);
			
					var templateCode = $("#listTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ genreList:json });
					
					$("#list").html(markup);
				
				}//success:function(json) end
				});//.ajax() end
				
				$loader.fadeOut(300);
				
			}//displayGenreList() end
			
			//베스트리스트를 갱신하는 함수
			function displayGenreBest() {
				
				//로더 화면
				$loader.show();
				
				$.ajax("getGenreBest.jsp",{
					type:"get",
					dataType:"json",
					data:{
						//클릭된 장르를 전송
						genre:genre
					},
					error:function(xhr,error,code){
						alert(code);
					},
					success:function(json){
						
						//alert(json);
				
						var templateCode = $("#bestTmp").html();
						var tmp = _.template(templateCode);
						
						var markup = tmp({ bestGenre:json });
						
						$("#best").html(markup);
					
					}//success:function(json) end
				});//.ajax() end
				
				$loader.fadeOut(300);
				
			}//displayGenreBest() end
			
			//카테고리 클릭했을 때 뿌려지는 ajax
			$li.on("click",function() {
				
				genre = $(this).text();
				
				//alert(genre);
				displayGenreList();
				displayGenreBest();
			
		});//click on end
			
		//최신순
		$('#regdate').on("click",function() {
				
				//로더 화면
				$loader.show();
				
				$.ajax("getGenreRegdateList.jsp",{
				type:"get",
				dataType:"json",
				data:{
					//클릭된 장르를 전송
					genre:genre
				},
				error:function(xhr,error,code){
					alert(code);
				},
				success:function(json){
					
					//alert(json);
			
					var templateCode = $("#listRegdateTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ listRegdate:json });
					
					$("#list").html(markup);
				
				}//success:function(json) end
			});//.ajax() end
				
			$loader.fadeOut(300);
			
		});//regdate click() end
		
		//조회순
		$('#hit').on("click",function() {
			
				//로더 화면
				$loader.show();
				
				$.ajax("getGenreHitList.jsp",{
				type:"get",
				dataType:"json",
				data:{
					//클릭된 장르를 전송
					genre:genre
				},
				error:function(xhr,error,code){
					alert(code);
				},
				success:function(json){
				
					//alert(json);
		
					var templateCode = $("#listHitTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ listHit:json });
					
					$("#list").html(markup);
				
				}//success:function(json) end
			});//.ajax() end
			
			$loader.fadeOut(300);
			
		});//hit click() end
	
		//추천순
		$('#recommend').on("click",function() {
		
				//로더 화면
				$loader.show();
		
				$.ajax("getGenreRecommendList.jsp",{
				type:"get",
				dataType:"json",
				data:{
				//클릭된 장르를 전송
				genre:genre
				},
				error:function(xhr,error,code){
					alert(code);
				},
				success:function(json){	
				
					//alert(json);
		
					var templateCode = $("#listRecommendTmp").html();
					var tmp = _.template(templateCode);
					
					var markup = tmp({ listRecommend:json });
				
					$("#list").html(markup);
			
				}//success:function(json) end
			});//.ajax() end
			
			$loader.fadeOut(300);
		
		});//hit click() end
			
					
		</script>
	</body>
</html>

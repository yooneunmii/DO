<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>끄적끄적</title>
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/noto.sans.korea.css" />
    <link rel="stylesheet" href="css/dante-editor.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <style>
        html{
            width:100%;
            height:100%;
        }
        body {
            width:100%;
            height:100%;
            font-family: bon, sans-serif;
        }
        #userPage {
            margin: auto;
            width: 1000px;
            margin-top:20px;
            height: 800px;
            padding-top:50px;
            position: relative;
    
        }
    
        #userPage #sideBar{
    
            width:250px;
            height:800px;
            position: absolute;
            top:46px;
            left:-250px;
        } 
        #sideBar #user{
            width:240px;
            height:300px;
            border:5px dotted #E1E1E1;
            border-radius:20px;
            text-align: center;
            margin-bottom:15px;
        }
        #user img{
            width:200px;
            height:200px;
            border-radius: 100px;
            margin:20px 0;
            
        }
        #user p{
            margin:10px;
            font-size:25px;
            font-weight: 700;
            color:#57AD68;
            transition: .2s ease;
            cursor: pointer;
        }
        #user p:hover{
            opacity: .6;
        }
        #sideBar #intro{
            width:220px;
            height:180px;
            border:5px dotted #5BD974;
            padding:10px;
            margin-bottom:20px;
            position: relative;
            
        }
        #intro::before{
            content: "인사말";
            font-size:15px;
            font-weight:500;
            color:#424242;
            opacity: .7;
            
        }
        #sideBar #neighbor{
            width:250px;
            height:50px;
    
        }
        #neighbor select{
            width:250px;
            height:40px;
            font-family: bon,sans-serif;
            font-size:20px;
            border:5px solid #5BD974;
        }
        #neighbor select:active{
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12); 
        }
        #intro #introBtn{
            font-family:bon,sans-serif;
            width:50px;
            height:25px;
            background:#FFAB40;
            border:none;
            border-radius: 25px;
            text-align: center;
            line-height:25px;
            position: absolute;
            bottom:10px;
            right:10px;
            
        }
        #userContent{
            border:1px dotted #BDBDBD;
            width:1000px;
            min-height:600px;
        }
        #userContent #list{
            width:300px;
            position: absolute;
            top:0px;
            right:0;
        }
        #userContent #list a{
            text-decoration: none;
            display:inline-block;
            width:100px;
            height:50px;
            line-height:50px;
            text-align:center;
            background:#FFAB40;
            border-radius:25px 25px 0 0;
            font-size:18px;
            color:white;
            transition:.2s ease;
            opacity: .2;
        }
        #userContent #list #check1{
            opacity:1;
            background:#FF5252;
        }
        #userContent #list #check2{
            background:#FFC107;
        
        }
        #userContent #list #check2:hover,
        #userContent #list #check3:hover{
            opacity: 1;
        }
        #userContent #list #check3{
            background: #3F51B5;
        
        }
        #userContent #reco{
            width:940px;
            height:300px;
            padding:20px 0;
            padding-left:60px;
    
        }
        #reco li{
            float:left;
            width:200px;
            margin-right:25px;
            height:250px;
            position: relative;
        }
        #reco img:hover{
            opacity: .2;
        }
        #reco img{
            position: absolute;    
                transition:.5s ease;
            top:0;
            left:0;
            width:200px;
            height:250px;
            
        }
        #reco li span{
            font-size:20px;
            font-weight: 700;
            line-height:125px;
        }
        #rec{
    
            position: relative;
        }
        #rec #leftBtn,#rec #rightBtn{
            width:60px;
            height:250px;
            font-size:50px;
            top:20px;
            background: transparent;
            border:none;
            position: absolute;
            opacity: .4;
            cursor: pointer;
        }
        #rec #leftBtn{
            left:0px;
        }
        #rec #rightBtn{
            width:65px;
            right:0px;
        }
        #rec #leftBtn:hover,#rec #rightBtn:hover{
            opacity: 1;
        }
        
        #userContent h2{
            font-size:20px;
            color:#251F39;
            font-weight: 700;
            margin:10px;
        }
        #userContent #newCom{
            padding: 10px;
            padding-left:50px;
            font-size:17px;
            margin-bottom:20px;
            position: relative;
        }
        #newCom li{
            margin-bottom:5px;
        }
        #newCom li a{
            text-decoration: none;
            color:#424242;
            opacity: .6;
        }
        #newCom li a:hover{
            text-decoration: underline;
            opacity: 1;
        }
        #newCom li:after{
            content: "New";
            font-size:10px;
            color:white;
            padding:3px;
            border-radius: 100px;
            background:#FFC107;
        }
        #guestList .guest{
            position: relative;
    
            height:50px;
        }
        .guest .fro{
            padding: 0px;
            display: inline-block;
            position: absolute;
            top: -5px;
        }
        .guest .frofileImg {
            background: white;
            margin: 5px;
            width: 40px;
            height: 40px;
            border: 1px solid #424242;
            border-radius: 51px;
            cursor: pointer;
        }
        .guest .novcon {
            padding-top: 15px;
            padding-left: 10px;
            width: 700px;
            display: inline-block;
            position: relative;
            left: 100px;
        }
        .guest .id {
            font-size: 10px;
            position: relative;
            top: -15px;
            color: gray;
        }
        #guestBook input{
            font-family:bon,sans-serif;
            margin-left:50px;
            width:800px;
            height:30px;
            line-height: 30px;
            text-indent: 10px;
            
            
        }
        #guestBook button{
            font-family:bon,sans-serif;
            width:100px;
            height:35px;
            line-height:30px;
            border:none;
        }
        #guestBook #guestList{
            margin:10px 50px;
            width:900px;
            min-height:50px;
        
        }
        #newCom #more{
            position: absolute;
            bottom:0;
            right:10px;
            text-decoration: none;
            font-size:30px;
            color: #424242;
            opacity: .5;
            transition: .2s ease;
        }
        #newCom #more:hover{
            opacity:1;
        }
        #introUpdate{
            display: none;
        }
        #introUpdate textarea{
            
            padding: 10px;
            width:220px;
            height:180px;
            border:5px dotted #5BD974;
            position: absolute;
            top:-4px;
            left:-4px;
            
        }
        #introUpdate #btn{
            position: absolute;
            bottom:5px;
            right:5px;
            
        }
        #introUpdate button{
            font-family:bon,sans-serif;
            width:50px;
            height:25px;
            background:#FFAB40;
            border:none;
            border-radius: 25px;
            text-align: center;
            line-height:25px;
        
        }
        
        </style>
    </head>

    <body>
        <div id="userPage">
            <div id="sideBar">
                <div id="user">
                    <img src="img/20150223_003742_1218183869.gif">
                    <p>
                    hen7705
                    <i class="fa fa-plus" title="이웃으로추가"></i>
                    </p>
                </div>
                <div id="intro">
                    <pre>저의 페이지에 와주셔서 정말감사해용 디오부인은미가</pre>
                    <button id="introBtn">수정</button>
                    <div id="introUpdate">
                    <form>
                    <textarea cols="32" rows="10"></textarea>
                    <div id="btn">
                    <button id="ok">확인</button>
                    <button id="no">취소</button>
                    </div>
                    </form>
                </div>
                </div>
                
                <div id="neighbor">
                    <select>
                        <option>이웃보기</option>
                        <option>김종인</option>
                        <option>오세훈</option>
                        <option>박찬열</option>
                        <option>김준면</option>
                        <option>변백현</option>
                    </select>
                </div>
                <a href="#">개인정보수정</a>
            </div>
            <div id="userContent">
                <div id="list">
                    <a href="#" id="check1">유저페이지</a><!--
                    --><a href="myWritten.html"id="check2">내가쓴글</a><!--
                    --><a href="#"id="check3">북마크</a><!--
                --></div>
                <h2>"hen7705"님 추천소설</h2>
                <div id="rec">
                    <button id="leftBtn"><i class="fa fa-caret-left" ></i></button>
                    <button id="rightBtn"><i class="fa fa-caret-right" ></i></button>
                <ul id="reco">
                    <li><div><img src="img/20150123_235703_-814277120.gif">
                        <span class="reason">추천이유:스릴 쩔쩔</span>
                    </div></li>
                    <li><div><img src="img/20150123_235703_-814277120.gif">
                        <span class="reason">추천이유:스릴 쩔쩔</span>
                    </div></li>
                    <li><div><img src="img/20150123_235703_-814277120.gif">
                        <span class="reason">추천이유:스릴 쩔쩔</span>
                    </div></li>
                    <li><div><img src="img/20150123_235703_-814277120.gif">
                        <span class="reason">추천이유:스릴 쩔쩔</span>
                    </div></li>
                </ul>
                </div>
                <h2>"emyoon1"님이 새로쓴글</h2>
                <ul id="newCom">
                    <li><i class="fa fa-quote-left"></i>
                        <a href="#">
                        울리는 전화도 받지마 조용히 두자</a>
                        <i class="fa fa-quote-right"></i>
                    </li>
                    <li><i class="fa fa-quote-left"></i>
                            <a href="#">
                        우리 둘 말곤 아무도 알려줄 필요도 없잖아</a>
                        <i class="fa fa-quote-right"></i>
                    </li>
                    <li><i class="fa fa-quote-left"></i>
                            <a href="#">
                        그대로 두자 왜 걱정하니 넌</a>
                        <i class="fa fa-quote-right"></i>
                    </li>
                    <li><i class="fa fa-quote-left"></i>
                            <a href="#">
                        괜찮아 괜찮아 네 마음 전부 알고 있어</a>
                        <i class="fa fa-quote-right"></i>
                    </li>
                    <li><i class="fa fa-quote-left"></i>
                            <a href="#">
                        괜찮아 괜찮아 괜찮아 보여줘 네 비밀을 다</a>
                        <i class="fa fa-quote-right"></i>
                    </li>
                    <a href="myWritten.html" id="more" title="더보러가기"><i class="fa fa-sign-in"></i></a>
                </ul>
                <div id="guestBook">
                    <form>
                        <input placeholder="방명록을 남겨주세요">
                        <button>확인</button>
                    </form>
                    <div id="guestList">
                        <div class="guest">
                        
                                <div class="fro">
                                    <img class="frofileImg"src="img/Ax6ucK0h.jpeg">
                                    <span class="id" >hen7705</span>
                                </div>
                                <span class="novcon">너무나 완벽한 내 여자라~</span>

                        </div><!--grust-->
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery.js"></script>
        <script src="js/underscore-min.js"></script>
        <script src="js/sanitize.js"></script>
        <script src="js/dante-editor.js"></script>
        <script>
        
            $("#introBtn").click(function(){
            
                $("#introUpdate").show();
            });
            $("#no").click(function(){
                $("#introUpdate").hide();
            });
            
        </script>
    </body>

</html>
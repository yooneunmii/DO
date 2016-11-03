<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="utf-8">
      <title>training</title>
      <link rel="stylesheet" href="css/reset.css" />
     <link rel="stylesheet" href="css/font-awesome.min.css" />
     <link rel="stylesheet" href="css/noto.sans.korea.css" />
     <link rel="stylesheet" href="css/header.css" />
      <style>
      
         body {
            font-family: "bon", sans-serif;
         }
         
         #wrap {
            width: 670px;
            height: 400px;
            padding: 110px;
            position: fixed;
            left: 50%;
            top: 50%;
            margin: -285px 0 0 -435px;
            box-shadow: 0 5px 10px #fff;
            background: rgb(247,251,252); /* Old browsers */
            background: -moz-linear-gradient(top,  rgba(247,251,252,1) 0%, rgba(217,237,242,1) 40%, rgba(173,217,228,1) 100%); /* FF3.6+ */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(247,251,252,1)), color-stop(40%,rgba(217,237,242,1)), color-stop(100%,rgba(173,217,228,1))); /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(top,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%); /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(top,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%); /* Opera 11.10+ */
            background: -ms-linear-gradient(top,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%); /* IE10+ */
            background: linear-gradient(to bottom,  rgba(247,251,252,1) 0%,rgba(217,237,242,1) 40%,rgba(173,217,228,1) 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f7fbfc', endColorstr='#add9e4',GradientType=0 ); /* IE6-9 */
         }
         
         #wrap  img {
            width: 250px;
            height: 400px;
            box-shadow: 0 6px 10px #333, 0 0px 24px #444;
            position: absolute;
            cursor: pointer;
            border: 4px solid #333;
            transition:.4s ease;
         }
         
          .p1 {
            transform:translateX(0) 
                      perspective(400px) 
                      rotateY(30deg)
                      scale(.6);
            transform-origin: 0% 75%;
            z-index: 1;          
         }
            
          .p2 {
            transform:translateX(180px) 
                      perspective(400px) 
                      rotateY(0deg)
                      scale(1);
            transform-origin: 50% 50%; 
            z-index: 3;         
         }
         
          .p3 {
            z-index:2;
            transform:translateX(360px) 
                      perspective(400px) 
                      rotateY(-30deg)
                      scale(.6);
            transform-origin: 100% 75%;
         }
         
         

      </style>
   </head>
   <body>
      <%@include file="template/header.jsp"%>
      <div id="wrap">
         <img src="img/intermediate.jpg" class="p1" alt="중급"/>
         <img src="img/elementary.jpg" class="p2" alt="초급"/>
         <img src="img/hard.jpg" class="p3" alt="고급"/>
      </div>
      <script src="js/jquery.js"></script>
      <script src="js/header.js"></script>
      <script>
      
      //애니메이션 도중에 
      //또 클릭을 해서 이상하게 
      //작동되는 것을 막는 변수
      var flag = true;
      
      
      //$(조상).on(이벤트명,선택자,콜백함수)
      
      //body의 자손들중에 클래스가 p1인 요소
      //를 선택하고 그 요소에
      //click이벤트리스너를 붙입니다.
      
      $("body").on("click",".p1",function(){
         
         if(flag) {
            
            flag = false;
         
            $(".p1").attr("class","p2")
                    .next()//다음요소를 선택
                    .attr("class","p3")
                    .next()//다음요소
                    .attr("class","p1")
                    .bind("transitionend",function(e){
                       
                       var evt = e.originalEvent;
                       
                       if(evt.propertyName="transform") {
                          console.log("test");
                          $(this).prependTo("#wrap");
                          //모든 동작이 끝났기 때문에
                          //이제 다시 움직일 수 있게
                          flag = true;
                          //alert("트랜지션 끝!!!");
                          $(this).unbind();   
                       }
                       
                    });
                           
         }//if end
         
      });//.p1 click end
      
      
      $("body").on("click",".p3",function(){
         
         if(flag){
            flag = false;
            
         $(this).attr("class","p2")
                .prev()//이전요소
                .attr("class","p1")
                .prev()//이전요소
                .attr("class","p3")
                .bind("transitionend",function(e){
                      
                      var evt = e.originalEvent;
                       
                    if(evt.propertyName="transform") {
                       console.log("test");
                       $(this).appendTo("#wrap");
                       //모든 동작이 끝났기 때문에
                       //이제 다시 움직일 수 있게
                       flag = true;
                       //alert("트랜지션 끝!!!");
                       $(this).unbind();   
                    }
                      
                });
                
         }//if end 
               
      });//.p3 click end
      
      
      
      $("body").on("click",".p2",function(){
         var name=$(this).attr("alt");
            if(name=="초급"){
               location.href="longAgo.jsp";
            }
            else if(name=="중급"){
               location.href="random.jsp";
            }else{
               location.href="bergerList.jsp";
            }
      });
      
      
      </script>
   </body>
</html>
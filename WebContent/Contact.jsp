<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>고객센터</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="./css/p_common.css">
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
        
    </head>
    <style>
        #wrapper{
            border:1px solid rgb(133, 127, 127);
            border-radius: 2px;;
            width: 700px;
            height:550px;
            margin: auto;
        }
        .title{
            margin-top: 20px;
            text-align: center;
            font-size: 30px;
            font-weight: bold;
           margin:20px 0px 20px 0px;
          
        }
        label{
            width:155px;
            display: inline-block;
            text-align: right;
            font-size: 20px;
           
        }
        input{
            margin:3px 5px;
            border-radius: 3px;
            background-color: transparent;
            border:1px solid darkgray;
            width: 350px;
            height:30px;
            outline:none;    
        }
        #mun{	
        	margin:3px 5px;
            border-radius: 3px;
            background-color: transparent;
            border:1px solid darkgray;
            width: 350px;
            height:150px;
            outline:none; 
        }
        #signup{
        text-align: center;
        margin:5px;
        }
        input[type=button],input[type=reset]{
            border:1px solid #333;
            border-radius: 3px;
            background-color: transparent;
            margin:0px;
            width: 100px;
            height:30px;
            color:black;
		}
        .regex{
            font-size: 12px;
            text-align: center;
        }
    </style>
    <body>
    <!-- 헤더 -->
<%@include file ="header.jsp" %>
  <hr>
        <h2 class="title">1:1 문의하기</h2>
    <form action="contactPro.jsp" method="POST" id="contactform" name="contactform">
        <div id="wrapper">
            <br>
            <label>아이디: </label><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"><br>
            <div class="id regex"></div>
            <br>
            <label>이름: </label><input type="text" name="name" id="name" placeholder="이름를 입력해주세요"><br>
            <div class="name regex"></div>
            <br>
            <label>전화번호 : </label><input type="text" name="phone" id="phone" placeholder="전화번호를 입력해주세요"><br>
            <div class="phone regex"></div>
            <br>
            <label>이메일 : </label><input type="text" name="email" id="email"placeholder="이메일를 입력해주세요"><br>
            <div class="email regex"></div>
            <br>
            <div class="mun">
            <label>문의 사항: </label><input type="text" name="mun" id="mun"placeholder="300자 이내로 입력해주세요"><br>
            <div class="mun regex"></div>
            </div>
            <br>
            <div id="signup">
            <input type="submit" name="send" value="보내기" id="send">
            <input type="reset" name="reset"value="다시입력" id="reset">
            </div>
        </div>
        
</form>
        <script>
           
         $(function(){            
            $("#duplcheck").on("click",function(){
                var id = $("#id").val();
                if(id == ""){
                	alert("아이디를 입력해주세요");
                	return;
                }

            });
            
                $("#name").on("input",function(){
                    var regex = /[가-힣]{2,}/;
                    var result = regex.exec($("#name").val());
                    
                    if(result != null){
                       $(".name.regex").html("");  
                    }else{
                        $(".name.regex").html("한글만 입력 가능합니다.");
                    }
                    
                })
            
                $("#phone").on("input",function(){
                     var regex = /^01\d\d{3,4}\d{4}$/;
                     var result = regex.exec($("#phone").val());
                    
                    if(result != null){
                       $(".phone.regex").html("");  
                    }else{
                        $(".phone.regex").html("올바른 번호가 아닙니다");
                    }
                    
                })
            

                $("#email").on("input",function(){
                     var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
                     var result = regex.exec($("#email").val());
                    
                    if(result != null){
                       $(".email.regex").html("");  
                    }else{
                        $(".email.regex").html("올바른 이메일이 아닙니다");
                    }
                }) 
           $("#signupbtn").on("click",function(){
        	   var id = $("#id").val();
        	   var name = $("#name").val();
        	   var phone = $("#phone").val();
        	   var email = $("#email").val();
        	   var mun = $("#mun").val();
        	   
        	   var idregex = /^[a-z][a-z\d]{4,11}$/;
        	   var nameregex = /[가-힣]{2,}/;
        	   var phoneregex = /^01\d\d{3,4}\d{4}$/;
        	   var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
        	   var mungex = /.^[1,300]$/;
        	   
        	   var idregex = idregex.exec(id);
        	   if(idregex == null){
        		   alert("아이디양식을 다시 확인해주세요");
        		   return;
        	   }
        	   var nameregex = nameregex.exec(name);
        	   if(nameregex == null){
        		   alert("이름양식을 다시 확인해주세요");
        		   retrun;
        	   }
        	   var phoneregex = phoneregex.exec(phone);
        	   if(phoneregex == null){
        		   alert("핸드폰번호양식을 다시 확인해주세요");
        		   retrun;
        	   }
        	   var emailregex = emailregex.exec(email);
        	   if(emailregex == null){
        		   alert("이메일양식을 다시 확인해주세요");
        		   retrun;
        	   }
        	   var munregex = munregex.exec(mun);
        	   if(munregex == null){
        		   alert("문의사항양식을 다시 확인해주세요");
        		   retrun;
        	   }
        	   $("#signform").submit();    
           })
        })
        </script>
	      <hr>
        <footer class="ft">
            <div class="ft_wrap">
                <p class="copyright">  회사명: 프라다 코리아 (유). 사업자등록번호: 213-86-18544. 공동 대표자: 이수진,명민준  개인정보 보호책임자: 이수진대표. 통신판매신고번호: 2017-경기도 일산-04082. 
				이메일:www.naver.com</p>             
                <address>경기도 고양시 일산동구 장항동 128</address>
            </div>
        </footer>
</body>
</html>
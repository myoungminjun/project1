<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="com.test.model.*" %>
<%@ page import="com.test.biz.*" %>  
<%@ page import="com.test.view.*" %>
<%
   JepumVO jepum = (JepumVO)request.getAttribute("jepum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.tit{font-size:48px; text-align:center;}
</style>

<title>공지사항 작성</title>
</head>
<body>
<!-- 헤더 인클루드 -->
   <div class="container">
      <h2 class="tit">제품추가</h2>
      <form action="../AddJepumCtrl" method="post" name="frm">
      <table class="table">
         <tr>
            <th class="item1">제품코드</th>
            <td class="item2">
            <input type="text" name="jcode" id="jcode" value="" required/>
            </td>
         </tr>
         <tr>   
            <th class="item1">제품명</th>
            <td class="item2">
            <input type="text" name="jname" id="jname" value="" required/>
            </td>
         </tr>
         <tr>   
            <th class="item1">제품가격</th>
            <td class="item2">
            <input type="text" name="jprice" id="jprice" value="" required/>
            </td>
         </tr>
         <tr>   
            <th class="item1">제품수량</th>
            <td class="item2">
            <input type="text" name="jcnt" id="jcnt" value="" required/>
            </td>
         </tr>
         <tr>   
            <th class="item1">제품사진</th>
            <td class="item2">
            <input type="text" name="jimg" id="jimg" value="" required/>
            </td>
         </tr>
      </table>
     
      <!-- 버튼 그룹 -->
      <div class="btn-group">
      	<input type="submit"  class="btn btn-default" value="제품 등록"/>
      </div>
      </form>

   </div>
<!-- 푸터 인클루드 -->
</body>
</html>
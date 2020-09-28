<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
<style>
    .outer{
    
        width:600px;
        height:800px;
        margin: auto;
        margin-top: 160px;
        
    }
   .click_link a, a:hover {
    color: black;
    text-decoration: none;
    vertical-align: middle;
    font-size: 15px;
 

    }
    .form-control{
        font-size: 13px;
        width: 300px;
    }
    #search_btn{
        width: 350px;
    }
    #id_search td{
       padding: 10px 10px 10px 25px;
    }
    #id_search_form{
    	magin:auto;
    }
    #id_search{
        margin-top: 100px;
        border: solid 1px green;
        padding: 20px;
        width:490px;
        margin: auto;
    }
    .click_link{
        margin: 160px 50px 60px 240px;
    }
    
 
</style>
</style>
</head>
<body>

<%@include file="../common/menubar.jsp" %>

	<div class="outer">
	    <div align="right" class="click_link" style="width: 900px;">
	
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
	            <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
	        </svg>
	
	        <a href="">츄레</a>
	        &lt;
	        <a href="">로그인</a>
	    </div>


        <!-- 1. 전체 내용을 감싸는 div -->
        <div id="id_search">
            <h3 align="center"><b>ID 찾기</b></h3>
            <!-- 2_1. 입력을 받는 input요소들이 위치할 영역 -->
            <form action="" id="id_search_form">
    
                <!-- 3_1. ID/PWD input요소가 들어갈 div -->
                <table align="center">
                    <tr>
                        <td> 이메일</td>
                        <td><input type="email" id="userEmail" name="userEmail" class="form-control" style="height:30px;width:260px;"maxlength="20" placeholder="가입시 작성한 이메일 입력해주세요"required></td><br>
                        <td></td>
                    </tr>
                  
                    <tr>
                        <td colspan="3"><input class="btn btn-success" id="search_btn" value="찾기" data-toggle="modal" data-target="#exampleModal">
                        </td>
                    </tr>
                </table>
            </form>
      
        </div>
        <script>
      	  $("#search_btn").click(function(){
		    	  $userEmail = $("#userEmail").val();
		    	  console.log($userEmail);
		    	  $("#email2").text($userEmail);
		    	  $("#id2").text("일단아이디");
		      });
        </script>
         <!-- Modal -->
		  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h5 class="modal-title" id="exampleModalLabel">ID 찾기</h5>
		          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">&times;</span>
		          </button>
		        </div>
		        <div class="modal-body">
		    		      입력하신 이메일 :<p id="email2"></p>
		         <br> 가입 한 아이디 : <p id="id2">아이디</p>
		        </div>
		        <div class="modal-footer">
		          <button type="button" id="loginBtn"class="btn btn-success" data-dismiss="modal">로그인 하기 </button><br>
		          <button type="button" class="btn btn-secondary">비밀번호 찾기</button>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  <script>
		      $("#loginBtn").click(function(){
		        location.href="<%=contextPath%>/loginForm.me";
		      });
		      
		  
		  </script>

	</div>
</body>
</html>
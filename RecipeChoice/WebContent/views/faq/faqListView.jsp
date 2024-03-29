<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.admin.faq.model.vo.*" %>    
<%
	ArrayList<Faq> listView = (ArrayList<Faq>)request.getAttribute("listView");

%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
	    box-sizing: border-box;
	}
	.wrap{
		overflow:hidden;
	    width:1000px;
	    height:800px;
	    margin: auto;
	}
	#header{height:20%} 
    
	#navigator{height:5%}
	#content{height:70%}
	#footer{height:10%}
	#content>div{
	    height:100%;
	    float:left;
	}
	#content_1{ width:18%; margin-right: 40px;}
	#content_2{ width:75%}
	
	#menu_1{
	    height: 30%;
	    background: rgb(39, 174, 96);
	    color: white;
	    font-size: 18px;
	    text-align: center;
	    line-height: 180px;
	}
	#menu_2{
	    height: 6%;
	    margin-top: 8px;
	    line-height: 30px;
	    border: 1px solid lightslategrey;
	    border-radius: 5px;
	}
	#menu_3{
	    height: 25%; 
	    margin-top: 10px;
	    border: 1px solid lightslategrey;
	    border-radius: 5px;
	}
	#menu_2{cursor: pointer;}
	#menu_2:hover{color: rgb(39, 174, 96);}
    .t1{
		display:inline-block;
		vertical-align:top;
		width:45%;
		height:auto;;
	    margin-top: 8px;
	    line-height: 30px;
		border:1px solid lightslategrey;
		border-radius: 5px;
	}
	p#a1{
        cursor:pointer;
        font-weight:bold;
    }
    .t1>#img{
        float:right;
    }
    
    #img{
    cursor:pointer;
    }
    .bb,#a1{
    	font-weight:bold;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		 $('p.b').hide();
	
		});
	
	
	function faqToggle(e){
		$(e).siblings('.b').toggle();
		
	};
</script>

<body>
	 <!--메뉴바 추가-->
    <%@include file="../common/menubar.jsp" %>
	       
    <div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2"></div>
            <div id="header_3"></div>
        </div>
    
        <div id="navigator"></div>
        <div id="content">
            <div id="content_1">
                <div id="menu_1">관리자</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/noticeList.no'">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/memberList.mn?page=1'">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/blackList.mn?page=1'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/seasonList.ms'">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/tip.mn'">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/faqList.mf'"style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/contactList.mc'">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/reportList.mc'">&nbsp;&nbsp;&nbsp;신고 관리</div>
                </div>
            
            <div id="content_2">
	            <br>
                <h4>자주 묻는 질문
                    &nbsp;<img src="<%= request.getContextPath() %>/resources/image/admin/faq.JPG">
                </h4>
                <h5>FAQ</h5>
                <hr>
				 <!-- 리스트가 비어있을 경우 -->
                <% if(listView.isEmpty()) {%>
                	<div class="t1">
                	<p class="bb">&nbsp;&nbsp;존재하는 faq가 없습니다.</p>
                	<hr style="width:93%;">
                	</div>
                <% }else { %>
                 <!--  리스트가 비어있지 않을 경우 -->
                <% for(Faq f : listView){ %>
				<div class="t1">
					<br>
                    <p id="a1" onclick="faqToggle(this);">&nbsp;<%= f.getFaqTitle() %>&nbsp; &nbsp;⌄</p>
                     <img id="img" onclick="deleteConfirm();" src="resources/image/admin/recyclebin.JPG">
                     <img id="img" onclick="location.href='<%=contextPath%>/updateForm.mf?fno=<%= f.getFaqNo() %>';" src="<%= request.getContextPath() %>/resources/image/admin/update.JPG">                                 
                   	<br>
					<hr style="width:93%;">
					<p class="b">&nbsp; <%= f.getFaqContent() %></p>
				
				</div>
				<script>
	          function deleteConfirm(){
	        	  var del = confirm("삭제하시겠습니까 ?")
	        	  if(del == true)
	        	  {
	        		 location.href="<%=contextPath%>/delete.mf?fno=<%=f.getFaqNo()%>";
	          }else{
	        	  alert("취소되었습니다.")
	          }
	        	  }
	        	  
           </script>
				<% } %>
			 <% } %>	
				<br><br><br><br><br><br><br><br>
				<hr>
				<!-- 로그인한 회원이 관리자일 경우에만 보여지는거임 -->
				 <% if(loginUser != null && loginUser.getMemId().equals("admin") ){ %>
				<div align="center">
					<button onclick="location.href='<%= contextPath%>/enrollform.mf';">추가하기</button>
				</div>
				<% } %>
			</div>
          
            <div id="content_3"></div>
            
        
        <div id="footer"></div>
    </div>
    <br><br><br>
    </div>
    
     <!-- footer 추가-->
     <%@include file="../common/footer.jsp" %>
</body>
</html>
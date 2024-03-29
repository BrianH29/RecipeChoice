<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.recipe.model.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	Recipe r = (Recipe)request.getAttribute("r");
	String[] tagList = (String[])r.getRcpTag().split(",");

	ArrayList<IngredientList> ing = (ArrayList<IngredientList>)request.getAttribute("ingredient");
	ArrayList<Cook> cook = (ArrayList<Cook>)request.getAttribute("cook"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/recipeWrite.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- menubar -->
	<%@include file="../common/menubar.jsp"%>

	<div class="contents">
		<div class="content">
			<div class="w3-container w3-border-bottom w3-border-grey">
				<p id="pageTitle">
					<b><big>레시피 수정하기 </big></b>
				</p>
			</div>
			<form action="<%=contextPath%>/update.rp" id="writeRecipe" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="userNo" value="<%=r.getUserNo()%>"> 
				<input type="hidden" name="memName" value="<%=r.getMemName()%>">
				<input type="hidden" name="rcpNo" value="<%=r.getRcpNo()%>"> 
			
				<table class="tb_writeRecipe">
					<tr>
						<!-- 왼쪽컬럼 -->
						<td class="leftContent" align="center">
						<img src="<%=contextPath %>/resources/recipe_upfiles/<%=r.getRcpPic() %>" id="titleImg" /><br />
							<div class="userImg">
								<img src="resources/image/mypage/cat.jpg" id="userPic"
									style="width: 90px" /> <br>
								<br> <span><%=loginUser.getMemName()%></span>
							</div></td>
						<!-- 오른쪽 컬럼 -->
						<td class="rightContent">
							<p style="font-size: 20px">
								<b>레시피 제목 및 설명 </b>
							</p> 
							<textarea name="title" cols="40" rows="1" style="resize: none; font-size: 14px" placeholder="제목 입력(20자 내외)"><%=r.getRcpTitle() %></textarea> 
							<textarea name="content" cols="40" rows="5" style="resize: none; font-size: 14px" placeholder="설명 입력(50자 내외)"><%=r.getRcpContent() %></textarea> 
							<br />
						<br />

							<p style="font-size: 20px">
								<b>조리 시간 설정</b>
							</p> <input type="number" value="<%=r.getRcpTime() %>" name="time" min="10" max="60"
							step="10" style="width: 70px" /> <br />
						<br /> <!--반복문 돌려야함-->
							<p style="font-size: 20px">
								<b>재료 List</b>
								<button id="addExtra" class="addIngredientList" type="button">
									<i class="fa fa-plus" style="font-size: 14px"></i>
								</button>
							</p>
							
							<%for(IngredientList i : ing){ %>
							<div id="ingList">
								<input type="text" name="dish" placeholder="재료명" style="font-size:14px; width:70px; height:30px;" value="<%=i.getIngDish() %>">
								<input type="text" name="metering" placeholder="계량" style="font-size:14px; width:180px; height:30px;" value="<%=i.getIngMetering()%>">
							</div>
							<%} %>
							<br /><br />

							<p style="font-size: 20px">
								<b>요리 종류 선택</b><br />
							</p> 
							<select name="dishType" id="dishType" style="font-size: 15px">
								<option value="종류별">종류별</option>
								<option value="밥종류">밥종류</option>
								<option value="찌개">찌개</option>
								<option value="탕">탕</option>
								<option value="찜">찜</option>
								<option value="볶음">볶음</option>
								<option value="밑반찬">밑반찬</option>
							</select> 
							<script>
								$(function(){
									$("#dishType>option").each(function(){
										if($(this).text() == "<%= r.getRcpDishType()%>"){
											$(this).attr("selected", true);
										}
									});
								});
							</script>
						<br />
						<br /> <!--태그별-->
							<p style="font-size: 20px">
								<b>태그선택</b>
								<button id="addExtra" class="addTag" type="button">
									<i class="fa fa-plus" style="font-size: 14px"></i>
								</button>
							</p>
							<%for(int i=0; i<tagList.length; i++) {%>
							<div id="tagList">
								<select name="tag" id="tag" style="font-size: 15px">
								    <option value="<%=tagList[i]%>"><%=tagList[i]%></option>
									<option value="소고기">소고기</option>
									<option value="돼지고기">돼지고기</option>
									<option value="닭고기">닭고기</option>
									<option value="오리고기">오리고기</option>
									<option value="해물류">해물류</option>
									<option value="건어물류">건어물류</option>
									<option value="건어물류">콩/견과류</option>
									<option value="달걀/유제품">달걀/유제품</option>
									<option value="체소류">체소류</option>
									<option value="과일류">과일류</option>
									<option value="버섯류">버섯류</option>
									<option value="곡류">곡류</option>
									<option value="밀가루">밀가루</option>
									<option value="가공식품">가공식품</option>
								</select> 
							</div>
							<%} %>
						</td>
					</tr>

					<tr class="bottomContent">
						<td colspan="2">
							<div class="w3-container w3-border-bottom w3-border-grey"></div>
							<p id="pageTitle">
								<b><big>조리 사진 첨부 </big></b>
								<button class="addRow a" type="button" disabled>
									<i class="fa fa-plus" style="font-size: 14px"></i>
								</button>
							</p> <br />
						</td>
					</tr>
					
					<%for(Cook c : cook) { %>
					<tr>
                  	<td align="center">
                    	<button class="removeRow a" type="button" disabled>
                      		<i class="fa fa-minus" style="font-size: 14px"></i>
                  		</button>&nbsp;&nbsp;
                     <img src="<%=contextPath %>/resources/recipe_upfiles/<%=c.getCookPic() %>" class="detailImg" id="detailImg<%=c.getCookOrder() %>" onclick="clickBtn(<%=c.getCookOrder() %>);" />
                  	</td>
                  	<td align="center" class="row-index">
                   	 	<span class="dot countIng"><%=c.getCookOrder() %></span>&nbsp;&nbsp;
                    	<input type="hidden" name="cookOrder" value="<%=c.getCookOrder() %>"> 
                    	<input type="hidden" name="cookPic" id="cookPic<%= c.getCookOrder() %>" value="<%=c.getCookPic() %>">
                  	<textarea name="recipeDetail" class="text" cols="40" rows="5" style="resize: none"><%=c.getCookContent() %></textarea>
                  	<div class="fileArea">
                  	<input type="file" class="recipeWrite_detailPic" id="detailBtn<%=c.getCookOrder() %>" name="RecipeWritePic<%=c.getCookOrder() %>" onchange="loadImg(this, <%=c.getCookOrder()%> );">
                  	</div>
                  	</td>
               		</tr>
					<%} %>
					<tr>
						<td id="tbody" colspan="2"></td>
					</tr>

				</table>
				<div class="fileArea">
					<input type="file" id="recipeWrite_mainPic" name="reUpfile" onchange="loadImg(this,100);"/> 
					<input type="file" id="recipeWrite_detailPic" name="RecipeWritePic1" onchange="loadImg(this,1);">
					<%if(r != null){ %>
						<input type="hidden" name="originNo" value="<%=r.getRcpNo() %>">
						<input type="hidden" name="originName" value="<%=r.getRcpPic() %>">
					<%} %>
				</div>
				<!-- 레시피작성 대표이미지 등록 -->
				<script>
            $(function () {
              $("#titleImg").click(function () {
                $("#recipeWrite_mainPic").click();
              });
              
              $("#detailImg1").click(function(){
            	 $("#recipeWrite_detailPic").click(); 
              });
            });

            function loadImg(inputFile, num) {
              if (inputFile.files.length == 1) {
                var reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function (e) {

                  switch(num) {
                  case 100 :
                    $("#titleImg").attr("src", e.target.result);
                    break;
                  case 1:
                  	$("#detailImg1").attr("src", e.target.result);
                  	break; 
                  default:
                	$("#detailImg"+num).attr("src", e.target.result);
                  	$("#cookPic"+num).val(e.target.result);
                	break;  
                  }
                };
              } else {
                switch(num) {
                case 100:
                  $("#titleImg").attr("src", null);
                  break;
                case 1 :
                	$("#detailImg").attr("src", null);
                	break;  
                }
              }
            }
          </script>


				<!-- 조리 디테일 증가 시키기/ 이미지 input 수정후 remove에 포함 시켜야함. -->
				<script>
         
         function clickBtn(num){
         	  $("#detailBtn" + num).click();
           }
         
            $(document).ready(function () {
         
           	rowIdx = 1;
            count = 1;

              $(".addRow").on("click", function () {
                $("tbody").append(`<tr>
                  <td align="center">
                    <button class="removeRow" type="button">
                      <i class="fa fa-minus" style="font-size: 14px"></i>
                   </button>&nbsp;&nbsp;
                     <img src="resources/image/logo/churro.png" class="detailImg" id="detailImg` + ++count + `" onclick="clickBtn(`+ count + `);" />
                  </td>
                  <td align="center" class="row-index">
                    <span class="dot countIng">`+ ++rowIdx +`</span>&nbsp;&nbsp;
                    <input type="hidden" name="order" value="`+ rowIdx +`">
                  <textarea name="recipeDetail" class="text" cols="40" rows="5" style="resize: none"></textarea>
                  <div class="fileArea">
                  <input type="file" class="recipeWrite_detailPic" id="detailBtn` + count + `" name="RecipeWritePic`+ rowIdx + `" onchange="loadImg(this,`+ count +` );">
                  </div></td>
                </tr>`);
              });


              //제이커리 버튼 클립이벤트 줄 제거
              $("tbody").on("click", ".removeRow", function () {
                $(this).closest("tr").remove();

                $(".countIng").text(function () {
                  if ($(this).text() == 1 || $(this).text() == 2) {
                    return $(this).text();
                  } else {
                	  return Number($(this).text()) - 1;
                  }
                  
                  
                  
                });

                rowIdx--;
              });
            });
          </script>

				<script>
				//재료리스트추가 
                  $(function () {
                    $(".addIngredientList").click(function () {
                      var content = "";

                      content +=
                          '<div><input type="text" name="dish" placeholder="재료명" style="font-size:14px; width:70px; height:30px;">';
                        content +=
                          ' <input type="text" name="metering" placeholder="계량" style="font-size:14px; width:180px; height:30px;"></div>';
                      $("#ingList").append(content);
                    });
                  
              
              //태그선택 증가식
              $(".addTag").click(function () {
            	  var contents = '';
            	  
            		contents += ' <select name="tag" id="" style="font-size: 15px">'
            		contents += '<option value="">재료선택</option>'
    				contents += '<option value="소고기">소고기</option>'
    				contents += '<option value="돼지고기">돼지고기</option>'
    				contents += '<option value="닭고기">닭고기</option>'
    				contents += '<option value="오리고기">오리고기</option>'
    				contents += '<option value="해물류">해물류</option>'
    				contents += '<option value="건어물류">건어물류</option>'
    				contents += '<option value="콩/견과류">콩/견과류</option>'
    				contents += '<option value="달걀/유제품">달걀/유제품</option>'
    				contents += '<option value="체소류">체소류</option>'
    				contents += '<option value="과일류">과일류</option>'
    				contents += '<option value="버섯류">버섯류</option>'
    				contents += '<option value="곡류">곡류</option>'
    				contents += '<option value="밀가루">밀가루</option>'
    				contents += '<option value="가공식품">가공식품</option>'
    				contents +=	'</select>';
            	  
            	  
                  $("#tagList").append(contents);
              });
            });
          </script>


				<br>
				<br>
				<div align="right">
					<button type="submit" id="insertRecipe">수정하기</button>
					<button id="insertRecipe" type="button" onclick="location.href='<%=contextPath%>/delete.rp?rcpNo=<%=r.getRcpNo()%>';">삭제하기</button>
				</div>
				<br>
				<br>
				<br>
			</form>
		</div>
	</div>

	<!--footer-->
	<%@include file="../common/footer.jsp"%>

	<script src="resources/js/bootstrap.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>
</html>
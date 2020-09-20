<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/recipeWrite.css">
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

<title>Insert title here</title>
</head>
<body>
<!-- menubar -->
<%@include file="../common/menubar.jsp" %>

    <div class="contents">
      <div class="content">
        <div class="w3-container w3-border-bottom w3-border-grey">
          <p id="pageTitle">
            <b><big>레시피 작성하기 </big></b>
          </p>
        </div>
        <form action="" id="writeRecipe" method="POST" enctype="multipart/form-data">
          <table class="tb_writeRecipe">
            <tr>
            <!-- 왼쪽컬럼 -->
              <td class="leftContent" align="center">
                <img src="" id="titleImg" /><br />
                <div class="userImg">
                  <img src="resources/image/logo/churro.png" id="userPic" style="width: 90px"/>
                  <br><br>
                  <span>사용자아이디</span>
                </div>
              </td>
              <!-- 오른쪽 컬럼 -->
              <td class="rightContent">
                <p style="font-size: 20px"><b>레시피 제목 및 설명 </b></p>
                <textarea name="title" cols="40" rows="1" style="resize: none; font-size: 14px" 
                	placeholder="제목 입력(20자 내외)"></textarea>
                	
                <textarea name="content" cols="40" rows="5" style="resize: none; font-size: 14px"
                 	placeholder="설명 입력(50자 내외)" ></textarea>
                <br /><br />
                
                <p style="font-size: 20px"><b>조리 시간 설정</b></p>
                <input type="number" value="10" name="time" min="10" max="60" step="10" style="width: 70px"/>
                
                <br /><br />
                <!--반복문 돌려야함-->
                <p style="font-size: 20px">
                  <b>재료 List</b>
                  <button id="addExtra">
                    <i class="fa fa-plus" style="font-size: 14px"></i>
                  </button>
                </p>
                <textarea name="ingredient" cols="12" rows="1" style="resize: none; font-size: 14px" placeholder="재료명">
                </textarea>
                <textarea name="measurement" cols="25" rows="1" placeholder="정확한 계량을 입력해주세요(ex.200g, 1tsp)"
                 	style="resize: none; font-size: 14px">
                </textarea>
                <textarea name="ingredient" cols="12" rows="1" placeholder="재료명" 
                	style="resize: none; font-size: 14px">
                </textarea>
                <textarea name="measurement" cols="25" rows="1" placeholder="정확한 계량을 입력해주세요(ex.200g, 1tsp)"
                 	style="resize: none; font-size: 14px">
                </textarea>
                
                <br /><br />
                <p style="font-size: 20px"><b>요리 종류 선택</b><br /></p>
                <select name="" id="" style="font-size: 15px">
                  <option value="defaul">종류별</option>
                  <option value="rice">밥종류</option>
                  <option value="soup">찌개</option>
                  <option value="stew">탕</option>
                  <option value="steamed">찜</option>
                  <option value="stir">볶음</option>
                  <option value="side">밑반찬</option>
                </select>
                <br /><br />

                <!--반복문 돌려야함-->
                <p style="font-size: 20px">
                  <b>태그선택</b>
                  <button id="addExtra">
                    <i class="fa fa-plus" style="font-size: 14px"></i>
                  </button>
                </p>
                <select name="" id="" style="font-size: 15px">
                  <option value="default">재료선택</option>
                  <option value="beef">소고기</option>
                  <option value="pork">돼지고기</option>
                  <option value="chicken">닭고기</option>
                  <option value="duck">오리고기</option>
                  <option value="seafood">해물류</option>
                  <option value="driedFish">건어물류</option>
                  <option value="nuts">콩/견과류</option>
                  <option value="dairy">달걀/유제품</option>
                  <option value="vegi">체소류</option>
                  <option value="fruit">과일류</option>
                  <option value="mushroom">버섯류</option>
                  <option value="grain">곡류</option>
                  <option value="flour">밀가루</option>
                  <option value="processedFood">가공식품</option>
                </select>

                <select name="" id="" style="font-size: 15px">
                  <option value="default">재료선택</option>
                  <option value="beef">소고기</option>
                  <option value="pork">돼지고기</option>
                  <option value="chicken">닭고기</option>
                  <option value="duck">오리고기</option>
                  <option value="seafood">해물류</option>
                  <option value="driedFish">건어물류</option>
                  <option value="nuts">콩/견과류</option>
                  <option value="dairy">달걀/유제품</option>
                  <option value="vegi">체소류</option>
                  <option value="fruit">과일류</option>
                  <option value="mushroom">버섯류</option>
                  <option value="grain">곡류</option>
                  <option value="flour">밀가루</option>
                  <option value="processedFood">가공식품</option>
                </select>

                <select name="" id="" style="font-size: 15px">
                  <option value="default">재료선택</option>
                  <option value="beef">소고기</option>
                  <option value="pork">돼지고기</option>
                  <option value="chicken">닭고기</option>
                  <option value="duck">오리고기</option>
                  <option value="seafood">해물류</option>
                  <option value="driedFish">건어물류</option>
                  <option value="nuts">콩/견과류</option>
                  <option value="dairy">달걀/유제품</option>
                  <option value="vegi">체소류</option>
                  <option value="fruit">과일류</option>
                  <option value="mushroom">버섯류</option>
                  <option value="grain">곡류</option>
                  <option value="flour">밀가루</option>
                  <option value="processedFood">가공식품</option>
                </select>
                <br />
                <select name="" id="" style="font-size: 15px">
                  <option value="default">재료선택</option>
                  <option value="beef">소고기</option>
                  <option value="pork">돼지고기</option>
                  <option value="chicken">닭고기</option>
                  <option value="duck">오리고기</option>
                  <option value="seafood">해물류</option>
                  <option value="driedFish">건어물류</option>
                  <option value="nuts">콩/견과류</option>
                  <option value="dairy">달걀/유제품</option>
                  <option value="vegi">체소류</option>
                  <option value="fruit">과일류</option>
                  <option value="mushroom">버섯류</option>
                  <option value="grain">곡류</option>
                  <option value="flour">밀가루</option>
                  <option value="processedFood">가공식품</option>
                </select>
                <select name="" id="" style="font-size: 15px">
                  <option value="default">재료선택</option>
                  <option value="beef">소고기</option>
                  <option value="pork">돼지고기</option>
                  <option value="chicken">닭고기</option>
                  <option value="duck">오리고기</option>
                  <option value="seafood">해물류</option>
                  <option value="driedFish">건어물류</option>
                  <option value="nuts">콩/견과류</option>
                  <option value="dairy">달걀/유제품</option>
                  <option value="vegi">체소류</option>
                  <option value="fruit">과일류</option>
                  <option value="mushroom">버섯류</option>
                  <option value="grain">곡류</option>
                  <option value="flour">밀가루</option>
                  <option value="processedFood">가공식품</option>
                </select>
                <select name="" id="" style="font-size: 15px">
                  <option value="default">재료선택</option>
                  <option value="beef">소고기</option>
                  <option value="pork">돼지고기</option>
                  <option value="chicken">닭고기</option>
                  <option value="duck">오리고기</option>
                  <option value="seafood">해물류</option>
                  <option value="driedFish">건어물류</option>
                  <option value="nuts">콩/견과류</option>
                  <option value="dairy">달걀/유제품</option>
                  <option value="vegi">체소류</option>
                  <option value="fruit">과일류</option>
                  <option value="mushroom">버섯류</option>
                  <option value="grain">곡류</option>
                  <option value="flour">밀가루</option>
                  <option value="processedFood">가공식품</option>
                </select>
              </td>
            </tr>

            <tr class="bottomContent">
              <td colspan="2">
                <div class="w3-container w3-border-bottom w3-border-grey"></div>
                <p id="pageTitle">
                  <b><big>조리 사진 첨부 </big></b>
                  <button id="addExtra">
                    <i class="fa fa-plus" style="font-size: 14px"></i>
                  </button>
                </p>
                <br />
              </td>
            </tr>
            <tr>
            <!-- 작성하는거 하나씩 줄이기 (반복문필요)-->
              <td align="center">
                <button id="minusExtra">
                  <i class="fa fa-minus" style="font-size: 14px"></i>
                </button>
                &nbsp;&nbsp;
                <img src="" id="detailImg" />
              </td>
              <td align="center">
                <span class="dot">1</span>&nbsp;&nbsp;
                <textarea name="recipeDetail" id="text" cols="40" rows="5" style="resize: none"></textarea>
              </td>
            </tr>
            
            
          </table>
           <div class="fileArea">
            <input type="file" id="recipeWrite_mainPic" name="recipeWrite_mainPic" onchange="loadImg(this,1);" required/>
            <input type="file" id="recipeWrite_detailPic" name="recipeWrite_detailPic" onchange="loadImg(this,1);">
          </div>
          <!-- 레시피작성 대표이미지 등록 -->
          <script>
            $(function () {
              $("#titleImg").click(function () {
                $("#recipeWrite_mainPic").click();
              });
            });

            function loadImg(inputFile, num) {
              if (inputFile.files.length == 1) {
                var reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function (e) {

                  if (num == 1) {
                    $("#titleImg").attr("src", e.target.result);
                  }
                };
              } else {
                if (num == 1) {
                  $("#titleImg").attr("src", null);
                }
              }
            }
          </script>
          
          <!-- 레시피작성 조리법 이미지 등록 -->
          <script>
          	$(function(){
          		$("#detailImg").click(function(){
          			$("#recipeWrite_detailPic").click();
          		});
          	});
          		
          		function loadImg(inputFile,num){
          			if(inputFile.files.length == 1){
          				var reader = new FileReader();
          				reader.readAsDataURL(inputFile.files[0]);
          				reader.onload = function(e){
          					
          					switch(num){
          					case 1: 
          						$("#detailImg").attr("src",e.target.result);
          						break;
          					}
          					
          				};
          			}else{
          				switch(num){
          					case 1:
          						$("#detailImg").attr("src",null);
          						break; 
          				}
          			}
          		}
          </script>
          <br><br>
          <div align="right">
            <button type="submit" id="insertRecipe">등록하기</button>
          </div>
          <br><br><br>
        </form>
      </div>
    </div>

    <!--footer-->
    <%@include file="../common/footer.jsp" %>
    
    <script src="resources/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>
</html>
<%@page import="com.kh.user.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("boardInfo");

	String servletPath = "boardWrite.bo";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 메뉴바 포함하고 빼줄것 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- include summernote css/js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <title>Document</title>
    <style>
        a, a:hover {
            color: black!important;
            text-decoration: none!important;
            vertical-align: middle!important;
        }

        th {
            text-align: center;
        }

        .title {
            font-size: 36px!important;;
            font-weight: bold!important;;
            padding-left: 100px!important;;
            color: rgb(9, 175, 79)!important;;
        }
		.title:hover {
       		color: rgb(9, 175, 79)!important;
       	}
       	
        .outerForm {
            width: 1000px;
            background: none;
            color: black;
            margin: auto;
            margin-top: 160px;
            margin-bottom: 100px;
        }

        .custom-select {
            width: 100px!important;
        }

        #checkModal div{
            width: 300px;
        }

        #checkModal button {
            width: 100px;
        }
        
        .btn-primary {
        	background-color:rgb(9, 175, 79)!important;
        }

    </style>
    <script>
    	$(function () {
    		<% if(b != null) { %>
    			<% servletPath = "boardUpdate.bo"; %>
	   			$("#categorySelect").children().each(function () {
	   				var category = "<%= b.getCategory() %>";
	   				if($(this).text() == category) {
	   					$(this).prop("selected", true);
	   				}
	   			});
   			<% } %>
    	});
    </script>
</head>
<body>

	<%@ include file="../common/menubarTemp.jsp" %>


    <div class="outerForm">

        <div align="right" style="width: 900px;">

            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
                <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
            </svg>

            <a href="">츄레</a>
            
            &lt;

            <a href="board.bo">자유게시판</a>

        </div>

        <br>
        <a href="board.bo" class="title">자유게시판</a>
        <br><br><br>


        <form action="<%= servletPath %>" id="insertForm" method="post">
			
			<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
			
            <table style="margin: 0px auto;">
            
                <tr>
                    <th width="70px">카테고리</th>
                    <td width="500">
                        <select id="categorySelect" class="custom-select" name="category">
                            <option value="1" selected>일상</option>
                            <option value="2">후기</option>
                        </select>
                    </td>
                </tr>
                
                <% if(b == null) { %>
                <tr>
                    <th>제목</th>
                    <td><input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요" required></td>
                </tr>
                <% } else { %>
        		<tr>
                    <th>제목</th>
                    <td>
                    	<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
                    	<input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요" value="<%= b.getBoardTitle() %>" required>
                    </td>
                </tr>
        		<% } %>
        
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea id="summernote" name="content"></textarea>
                    </td>
                </tr>
            </table>
        
        	<script>
	        	$('#summernote').summernote({
	                placeholder: '내용을 입력해주세요.',
	                tabsize: 2,
	                width:710,
	                height: 400,
	                callbacks: {
		                onImageUpload: function(files, editor) {
		                    sendFile(files, this);
		                },
			        	onPaste: function (e) {
							var clipboardData = e.originalEvent.clipboardData;
							if (clipboardData && clipboardData.items && clipboardData.items.length) {
								var item = clipboardData.items[0];
								if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
									e.preventDefault();
								}
							}
						}
	                }
	            });
	        	
	        	<% if(b != null) { %>
	        	$("#summernote").summernote('code', '<%= b.getBoardContent() %>');
	        	<% } %>
	        	
	        	function sendFile(files, editor) {
	        		
	        		data = new FormData();
	        		for (var i = 0, max = files.length; i < max; i++) {
						data.append("file" + (i + 1), files[i]);						
					}
	                $.ajax({
	                    url: "editorImageUpload.bo",
	                    data: data,
	                    type: "POST",
	                    cache: false,
	                    contentType: false,
	                    processData: false,
	                    success: function(urlList) {
	                    	for (var i = 0, max = urlList.length; i < max; i++) {
	                    		$(editor).summernote('editor.insertImage', urlList[i]);
	    					}
	                    },
	                    error: function() {
	                    	console.log("통신 실패");
	                    }
	                });
	            }
        	</script>
        
            <br>

            <div align="right" style="width: 890px;">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#checkModal">등록하기</button>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-content">
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                                
                                <p>등록하시겠습니까?</p>

                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-primary">등록</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

	<%@ include file="../common/footerTemp.jsp" %>
	

</body>
</html>
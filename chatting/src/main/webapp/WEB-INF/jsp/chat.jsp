<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

    <head>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"
            content="width=device-width,height=device-height,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <!-- <link rel="stylesheet" href="css/chat.css"> -->
        <!-- <script src="https://cdn.jsdelivr.net/npm/@joeattardi/emoji-button@3.0.3/dist/index.min.js"></script> -->
        <!-- <script type="text/javascript" src="js/chat.js"></script> -->
        <title>chat</title>
        <style>
          @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500&display=swap');

          *{
              user-select: none;
              box-sizing: border-box;
              margin: 0;
              padding: 0;
          }

          .fw {font-weight: 500;}

          button {
              border: none;
              background: none;
          }

          html, body {
              width: 100%;
              height: 100%;
              overflow: hidden;
              position: relative;
          }

          .user_area {
              width: 100%;
              display: flex;
              border-bottom: 1px solid #e6e6e6;
              padding: 8px 18px;
              align-items: center;
          }

          .user_option {
              overflow: hidden;
          }

          .user_option p:nth-child(1) {
              display: flex;
              align-items: center;
              margin-bottom: 7px;
          }

          .user_sns {
              width: 16px;
              height: 16px;
              border-radius: 50%;
              overflow: hidden;
              display: inline-block;
              background: center/100% no-repeat;
              margin-right: 8px;
          }

          .user_sns.fb {
              background-image: url(../images/fb.png);
          }

          .user_sns.ins {
              background-image: url(../images/ins.png);
          }

          .user_id {
              font-weight: 600;
          }

          .user_text {
              color: #008CF8;
              font-size: 14px;
              width: 80%;
              white-space: nowrap;
              overflow: hidden;
              text-overflow: ellipsis;
          }

          .user_img {
              min-width: 48px;
              width: 48px;
              height: 48px;
              border-radius: 8px;
              overflow: hidden;
              margin-right: 7px;
          }

          .user_img img {
            width: 100%;
            height: 100%;
          }

          .chat_area {
              width: 100%;
              position: absolute;
              top: 66px;
              height: calc(100% - 128px);
              overflow-y: auto;
          }

          .chat_area > article {
              padding: 14px 20px;
          }

          .chat_area > article div:not(:first-child) {
              margin-top: 23px;
          }

          .text {
              width: fit-content !important;
              max-width: 70% !important;
              padding: 8px;
              font-size: 14px;
              background: #D9D9D9;
              border-radius: 8px;
              line-height: 16.41px;
              word-break: break-all;
          }

          .mychat p {
              text-align: right;
          }

          .mychat .text {
              margin-left: auto;
          }

          .text a {
              color: #fff;
          }

          .time {
              color: #787878;
              margin-top: 12px;
              font-size: 10px;
          }

          .yourchat .text {
              background: #fff;
              border: 1px solid #787878;
          }

          .mychat .text img, .yourchat .text img {
              width: 100%;
              height: 100%;
          }

          .user_info {
              display: flex;
              align-items: center;
              margin-bottom: 8px;
          }

          .user_info > p {
              width: 16px;
              height: 16px;
              border-radius: 50%;
              overflow: hidden;
              margin-right: 4px;
          }

          .user_info > p img {
              width: 100%;
              height: 100%;
          }

          .user_info > span {
              font-size: 14px;
              font-weight: 600;
          }

          .input_area {
              width: 100%;
              background: #fff;
              display: flex;
              justify-content: space-between;
              align-items: center;
              border-top: 1px solid #d9d9d9;
              padding: 7px 19px;
              position: absolute;
              bottom: 0;
          }

          .input_area .text_area {
              position: relative;
              width: 100%;
              margin: 0 10px;
          }

          .input_area .emoji {
              position: absolute;
              top: 6px;
              right: 8px;
          }

          .input_area #chatting {
              width: 100%;
              border: none;
              /* background: #E6E6E6; */
              border-radius: 8px;
              padding: 10px 0px;
              /* margin: 0 18px; */
              /* padding: 9px 16px; */
              outline: none;
          }


          .emoji-picker {
              width: 50vw !important;
              --emoji-per-row: 10 !important;
          }

          .file {
              display: flex;
              justify-content: center;
          }

          #upload {
              display: none;
          }

          .user_comment {
              width: 32px;
              height: 32px;
              border-radius: 50%;
              overflow: hidden;
          }

          .user_comment img {
              width: 100%;
              height: 100%;
          }

          .send {
              color: #008CF880;
          }
        </style>
        
    </head>
        
    <body>
        <!-- 상단 제품 이미지/상태 -->
        <input type="hidden" id="sessionId" value="">
        <section class="user_area">
          <div class="user_img">
            <img src="images/product4.png" alt="">
          </div>
          <div class="user_option">
            <p>
              <span class="user_sns ins"></span>
              <span class="user_id">Black Butter</span><button onclick="wsOpen()" id="startBtn">이름 등록</button>
            </p>
            <p class="user_text">The main purpose of this researchThe main purpose of this researchThe main purpose of this researchThe main purpose of this researchThe main purpose of this researchThe main purpose of this researchThe main purpose of this researchThe main purpose of this researchThe main purpose of this research</p>
          </div>
        </section>
        <!-- 채팅 공간 -->
        <section class="chat_area">

        </section>
        <!-- 채팅 입력 -->
        <section class="input_area">
          <div class="user_comment">
            <img src="images/user_photo.png" alt="">
          </div>
          <div class="text_area">
            <input type="text" id="chatting" placeholder="Comment">
          </div>
          <button class="send" onclick="send()">Post</button>
          
          
        </section>
        
    </body>
    <script type="text/javascript">
    
    var ws;

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}
	$(document).ready(function(){
		wsOpen()
		});
	
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$(".chat_area").append("<article><div class='mychat'><p class='text'>" + d.msg + "</p></div></article>");	
					}else{
						$(".chat_area").append("<article><div class='yourchat'><p class='text'>" + d.msg + "</p></div></article>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
		console.log(option)
	}
    </script>
</html>
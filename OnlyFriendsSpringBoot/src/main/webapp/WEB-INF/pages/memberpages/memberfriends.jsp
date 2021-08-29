<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../frontcommonpages/shoptop.jsp"%>
<style>
body{
font-size:1.2rem
}
.friend-name{
 cursor: pointer;   
 }
 .friend-name:hover{
 color:green;
 }
</style>
</head>
<body>
 <body class="layout-2">
    <div id="app">
      <div class="main-wrapper">
        
        <%@include file="../frontcommonpages/shopheader.jsp"%>
        
        <%@include file="../frontcommonpages/shopsider.jsp"%>
        
     
		<input id="getPic" value="${personalinfo.memberPic}"
				class="d-none"></input>		
        
        <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>My Collection</h1>
          </div>

          <div class="section-body ">
            <div class="row align-items-center justify-content-center" id="row">
               
               <div class="col-6 col-sm-6 col-lg-6">
                  <div class="card chat-box card-success" id="">
                    <div class="card-header">
                      <h4>
                       Box
                      </h4>
                    </div>
                    <div class="card-body chat-content overflow-auto">
                    <ul class="list-unstyled list-unstyled-border " id="friendsarea">                          
                    </ul>
                    </div>
                   <div class="card-footer chat-form" id="cleararea">                    
                      <input type="text" class="form-control" placeholder="search name" id="searchfriend" />                                                         
                  </div>
                  </div>
                </div>
                
                <!-- chat box -->
                
        
                
                <!-- chat box -->
              
              

            </div>
          </div>
        </section>
      </div>

       <%@include file="../frontcommonpages/shopfooter.jsp"%>
      </div>
    </div>
    
    <%@include file="../frontcommonpages/shopbottom.jsp"%>
    <script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
   
    <script >  
  
    let stompClient;
    let username = $('#getAccount').prop('value');
    let usernamepic = $('#getPic').prop('value');
    let selectUser;
    let selectUserPic;
    
    $(function(){
    	var friendname = $('#searchfriend').prop('value') 
    	loadfriends()   
    	$('#searchfriend').on('change',searchfriend)  
    	
    	
    	 setTimeout(function () {
         createroom()}, 2000);
    	
    	
    	const socket = new SockJS('/OnlyFriends/chat-example')
		stompClient = Stomp.over(socket)
		stompClient.connect({}, onConnected, onError)
		
		$.ajax({
            type: "post",
            url: "bellhistory/"+username,
            success: function (data) {      	
            console.log("username:"+username)
            $.each(data,function(i,item){ //i為順序 n為單筆物件   
			var bell = 
			"<a href='#' class='dropdown-item dropdown-item-unread'>"+
            "<div class='dropdown-item-icon bg-primary text-white'>"+
              "<i class='far fa-user'></i>"+
            "</div>"+
            "<div class='dropdown-item-desc'>"+
              item.content+
              "<div class='time text-primary'>"+item.texttime+"</div>"+
            "</div>"+
         	" </a>";
			$('#bellarea').prepend(bell)            	   
        	    });
  
             },
             error: function (data) {           			 
               console.log("載入歷史訊息發生錯誤");
             },
           });   
		
		
    })
    
    
    const onConnected = () => {
	stompClient.subscribe('/topic/public/' + username, onMessageReceived)
	stompClient.send("/app/chat.newUser/" + username,
		{},
		JSON.stringify({ sender: username, type: 'CONNECT' })
	)
}

	const onError = (error) => {
	console.log('connect failed')
}
	
	
	const sendMessage = (event) => {
		const messageInput = document.querySelector('#message')
		const messageContent = messageInput.value.trim()
		if (messageContent && stompClient) {
		const chatMessage = {
			sender: username,
			content: messageInput.value,
			type: 'CHAT',
			time: new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })
		}
		stompClient.send("/app/chat.send/" + selectUser, {}, JSON.stringify(chatMessage))
		
		var d =     
         	    	"<div class='chat-item chat-right' style>"+
         	    	"<img src="+usernamepic+">"+
                    "<div class='chat-details'>"+
                      "<div class='chat-text'>"+
                      messageInput.value + "</div>"+
                      "<div class='chat-time'>"+
                      chatMessage.time +"</div>"  
                    "</div>"+                   
                    "</div>";
		$('#chat-content').append(d)
		messageInput.value = ''
		scrollbtm()
		
	}
		event.preventDefault();
}	
	
	const onMessageReceived = (payload) => {
		const message = JSON.parse(payload.body);
		console.log(message)
		if(message.content != null && selectUser == message.sender){			
			var d =     
     	    	"<div class='chat-item chat-left' style>"+
     	    	"<img src="+selectUserPic+">"+
                "<div class='chat-details'>"+
                  "<div class='chat-text'>"+
                  message.content + "</div>"+
                  "<div class='chat-time'>"+
                  message.time+"</div>"
                "</div>"+                   
                "</div>";		
		$('#chat-content').append(d)
		scrollbtm()
		}
		//如果傳訊息的對象不是正在聊天的對象,不是官方訊息,不是自己,就會傳送通知到bell
		else if(selectUser != message.sender & message.sender != 'official' & message.sender != username){		
   		 let tnum = $("#"+message.sender+"").find('span').prop('id')
   		 tnum++;
   		 $("#"+message.sender+"").find('span').html("+"+tnum)
   		 $("#"+message.sender+"").find('span').prop('id',tnum)
   		 var bell = 
			"<a href='#' class='dropdown-item dropdown-item-unread'>"+
            "<div class='dropdown-item-icon bg-primary text-white'>"+
              "<i class='fas fa-bell'></i>"+
            "</div>"+
            "<div class='dropdown-item-desc'>"+
              "New message in box"+
              "<div class='time text-primary'>"+message.time+"</div>"+
            "</div>"+
         	" </a>";
			$('#bellarea').prepend(bell)	   		 
		}
		//show official messages on the bellarea
		else if(message.sender == 'official'){
			console.log('official test')
			var bell = 
			"<a href='#' class='dropdown-item dropdown-item-unread'>"+
            "<div class='dropdown-item-icon bg-primary text-white'>"+
              "<i class='far fa-user'></i>"+
            "</div>"+
            "<div class='dropdown-item-desc'>"+
              message.content+
              "<div class='time text-primary'>"+message.time+"</div>"+
            "</div>"+
         	" </a>";
			$('#bellarea').prepend(bell)
		}

}
	function scrollbtm(){
   	 $('#chat-content')[0].scrollTop = $('#chat-content')[0].scrollHeight - $('#chat-content')[0].clientHeight;  
	}
	
	function clearalert(){
	 $("#"+selectUser+"").find('span').html("")
	 $("#"+selectUser+"").find('span').prop('id',0)
	}
	
    
     
    function loadfriends(){
    	 $.ajax({
             type: "post",
             url: "memberfriendsquery",
             success: function (data) { 
              $('#friendsarea').html('')
              $.each(data,function(i,friend){ //i為順序 n為單筆物件
         	     var item =          	    	 
         	    "<li class='media' id='"+friend.memberAccount+"'>"+
                 "<img alt='image' class='mr-3 rounded-circle' width='50' src='"+friend.memberPic+"'>"+
                 "<div class='media-body'>"+
                   "<div class='mt-0 mb-1 font-weight-bold friend-name'>"+friend.memberName+"<span class='text-danger' id='0'></span></div>"+              
                " </div>"+
               "</li>";
              $('#friendsarea').append(item);});
            
             },
             error: function (data) {           			 
               console.log("load friends無法送出");
             },
           });   

      	
    }
    
    function searchfriend(){
    	var friendname = $('#searchfriend').prop('value') 
    	$.ajax({
            type: "post",
            url: "memberfriendssearch/"+friendname,
            success: function (data) {
            	if(data.length == 0){
                	$('#friendsarea').html('')
            		console.log("no data")     
            		$('#friendsarea').append(
            			$('<p />').html("no result")
            			
            		)
            	}else{
            	console.log("have data")	
            	 $('#friendsarea').html('')
                 $.each(data,function(i,friend){ //i為順序 n為單筆物件
            	     var item =          	    	 
            	    "<li class='media' id='"+friend.memberAccount+"'>"+
                    "<img alt='image' class='mr-3 rounded-circle' width='50' src='"+friend.memberPic+"'>"+
                    "<div class='media-body'>"+
                    "<div class='mt-0 mb-1 font-weight-bold friend-name'>"+friend.memberName+"<span class='text-danger' id='0'></span></div>"+                          
                   " </div>"+
                  "</li>";
                 $('#friendsarea').append(item);}); }         
            	
            
            },
            error: function (data) {
            	loadfriends()
              console.log("搜尋朋友欄位無法送出");
            },
          });    
    	
   	 setTimeout(function () {
         createroom()          	 
  	}, 2000);
   		
    }
   

    function createroom(){
    	 $("li").on('click',function(){
    	
             $("#chatboxarea").remove()		  
               var chatbox = 
           	"<div class='col-6 col-sm-6 col-lg-6' id='chatboxarea'>"+
                "<div class='card chat-box card-success' id='mychatbox2'>"+
                  "<div class='card-header'>"+
                   "<h4 id='chatroomname'></h4>"+
                  "</div>"+
                  "<div class='card-body chat-content overflow-auto' id='chat-content'></div>"+
                  "<div class='card-footer chat-form'>"+
                    "<form id='message-controls' name='message-controls'>"+
                      "<input id='message' class='form-control' placeholder='Type your message...'/>"+
                      "<div class=''>"+
                        "<button class='btn btn-primary far fa-paper-plane' type='submit'></button>"+
                      "</div>"+
                    "</form>"+
                  "</div>"+
                "</div>"+
              "</div>";   	  
           	 $('#row').append(chatbox) 
           	 selectUser = $(this).attr('id')   
           	 selectUserPic = $(this).find('img').attr('src')
           	 clearalert()
           	 //console.log("selectUserPic"+selectUserPic)
           	 //console.log("selectuser:"+selectUser)
           	 let chatroomname = $(this).find('div.friend-name').html()
           	 $('#chatroomname').html(chatroomname)  
           	 $('#message-controls').on('submit',sendMessage)           
           	 $.ajax({
                type: "post",
                url: "chathistory/"+selectUser,
                success: function (data) {      	 
                 $.each(data,function(i,item){ //i為順序 n為單筆物件   
            	    if(item.receiver != username ){
            	    	var dbmessage =     
            	    	"<div class='chat-item chat-right' style>"+
            	    	"<img src="+usernamepic+">"+
                       "<div class='chat-details'>"+
                         "<div class='chat-text'>"+
   						item.content + "</div>"+
   					   "<div class='chat-time'>"+
   					   item.texttime+"</div>"
                       "</div>"+                   
                       "</div>";

            	    }else{
            	    	var dbmessage =     
                	    	"<div class='chat-item chat-left' style>"+
                	    	"<img src="+selectUserPic+">"+
                           "<div class='chat-details'>"+
                             "<div class='chat-text'>"+
       						item.content + "</div>"+  
       					  "<div class='chat-time'>"+
       					  item.texttime+"</div>"
                           "</div>"+                   
                           "</div>";
            	    }
            	    
            	    $('#chat-content').append(dbmessage);});
                	scrollbtm()                	
                	
                	
              
                 },
                 error: function (data) {           			 
                   console.log("載入歷史訊息發生錯誤");
                 },
               });   
           });
    	
    }
    
   
   </script>
  </body>
</html>       
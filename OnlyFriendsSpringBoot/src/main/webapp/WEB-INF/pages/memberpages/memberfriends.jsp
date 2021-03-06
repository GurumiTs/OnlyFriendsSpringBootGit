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
 .dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
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
            <h1>我的好友</h1>
          </div>

          <div class="section-body ">
            <div class="row align-items-center justify-content-center" id="row">
               
               <div class="col-6 col-sm-6 col-lg-6">
                  <div class="card chat-box card-success" id="">
                    <div class="card-header">
                      <h4>
                       聊天盒子
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
   
    <script>  
  
    let stompClient;
    let username = $('#getAccount').prop('value');
    let usernamepic = $('#getPic').prop('value');
    let myname = $('#getName').prop('value');
    let selectUser;
    let selectUserPic;
    
    $(function(){
    	var friendname = $('#searchfriend').prop('value') 
    	loadfriends()   
    	$('#searchfriend').on('change',searchfriend)  
    	$("#inviteicon").on('mouseover', loadinvitemsg)
		$("#notificationicon").on('mouseover', loadnotifymsg)
		$("#clearnotification").on('click',clearnotification)

    	const socket = new SockJS('/OnlyFriends/chat-example')
		stompClient = Stomp.over(socket)
		stompClient.connect({}, onConnected, onError)
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
			sendername:myname,
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
		if(message.content != null && selectUser != message.sender){
			var toast = 
			"<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>"+
	      	"<div class='toast-header'>"+
	      	"<i class='far fa-comment-dots text-success mx-2'></i>"+
	        "<strong class='me-auto'>"+message.sendername+"</strong>"+
	        "<small class='text-muted'>"+message.time+"</small>"+
	        "<button type='button' class='btn-close btn-close-toast' data-bs-dismiss='toast' aria-label='Close'></button>"+
	     	"</div>"+
	     " <div class='toast-body'>"+
	       message.content+
	     " </div>"+
	   " </div>";
		$("#toastarea").prepend(toast)
		closetoast()			
	} //end of if	
	if(message.content != null && selectUser != message.sender && message.sender != 'official'){
		addchatnum(message.sender)
	}

}
	function scrollbtm(){
   	 $('#chat-content')[0].scrollTop = $('#chat-content')[0].scrollHeight - $('#chat-content')[0].clientHeight;  
	}

    function loadfriends(){
    	 $.ajax({
             type: "post",
             url: "memberfriendsquery",
             success: function (data) { 
              $('#friendsarea').html('')
              $.each(data,function(i,friend){ //i為順序 n為單筆物件
               if(friend.chatnum != 0){
            	  var item =          	    	 
         	    "<li class='media position-relative' id='"+friend.friendAccount+"'>"+
                 "<img alt='image' class='mr-3 rounded-circle' width='50' src='"+friend.friendPic+"'>"+
                 "<div class='media-body'>"+
                  "<div class='mt-0 mb-1 font-weight-bold friend-name position-relative'>"+friend.friendName+                    
                  "<span class='position-absolute top-50 start-100 translate-middle badge rounded-pill bg-danger'>+"+friend.chatnum+"</span>"+
                  " </div>"+
               "</li>";   
               }  
               else{
            	   var item =          	    	 
                	    "<li class='media' id='"+friend.friendAccount+"'>"+
                        "<img alt='image' class='mr-3 rounded-circle' width='50' src='"+friend.friendPic+"'>"+
                        "<div class='media-body'>"+
                          "<div class='mt-0 mb-1 font-weight-bold friend-name'>"+friend.friendName+"</div>"+              
                       " </div>"+
                      "</li>";     
               }
              $('#friendsarea').append(item)});              
              $("li").on('click',createroom)
              $("li img").mouseenter(friendsinfo)
              $("li img").mouseleave(removeinfo)
       
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
            	console.log(data)	
            	 $('#friendsarea').html('')
                 $.each(data,function(i,friend){ //i為順序 n為單筆物件
            	     var item =          	    	 
            	    "<li class='media' id='"+friend.memberAccount+"'>"+
                    "<img alt='image' class='mr-3 rounded-circle ' width='50' src='"+friend.memberPic+"'>"+
                    "<div class='media-body'>"+
                    "<div class='mt-0 mb-1 font-weight-bold friend-name'>"+friend.memberName+"</div>"+                          
                   " </div>"+
                  "</li>";
                 $('#friendsarea').append(item);}); }     
            	$("li").on('click',createroom)
            },
            error: function (data) {
              loadfriends()
              console.log("搜尋朋友欄位無法送出");
            },
          });    
    }
    function createroom(){  
    	$(this).find('span').html('')
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
           	 selectUserName = $(this).find('div .friend-name:first-child').text()
           	 console.log(selectUserName)
           	 clearchatnum()
           	 $('#chatroomname').html(selectUserName)  
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
    }
    
    function loadinvitemsg() {
    	$('#invitearea').html('')
    	$.ajax({
    		type: "post",
    		url: "invitehistory",
    		success: function(data) {
    			$.each(data, function(i, item) { //i為順序 n為單筆物件   
    				var bell =
    					"<a href='#' class='dropdown-item dropdown-item-unread'>" +
    					"<div class='dropdown-item-icon bg-primary text-white'>" +
    					"<img alt='image' class='mr-3 rounded-circle' width='50' src='" + item.texttime + "'>" +
    					"</div>" +
    					"<div class='dropdown-item-desc'>" +
    					item.content +
    					"</div>" +
    					"<button class='btn btn-primary mx-2 confirminvite' >確認<span class='d-none'>" + item.id + "</span></button>" +
    					"<button class='btn btn-secondary mx-2 deleteinvite'>刪除<span class='d-none'>" + item.id + "</span></button>" +
    					" </a>";
    				$('#invitearea').prepend(bell)
    			});
    			$(".confirminvite").on('click', confirminvite)
    			$(".deleteinvite").on('click', deleteinvite)
    		},
    		error: function(data) {
    			console.log("載入歷史訊息發生錯誤");
    		},
    	});
    }

    function loadnotifymsg() {
    	$('#notificationarea').html('')
    	console.log(username)
    	$.ajax({
    		type: "post",
    		url: "notificationhistory/"+username,
    		success: function(data) {
    			console.log(data)
    			$.each(data, function(i, item) { //i為順序 n為單筆物件   
    			console.log(item.type)
    			if(item.type == 'NOTIFICATION'){
    				var bell =
    					"<a href='#' class='dropdown-item dropdown-item-unread'>" +
    					"<div class='dropdown-item-icon bg-primary text-white'>" +
    					"<i class='far fa-user'></i>" +
    					"</div>" +
    					"<div class='dropdown-item-desc'>" +
    					item.content +
    					"<div class='time text-primary'>" + item.texttime + "</div>" +
    					"</div>" +
    					" </a>";
    				$('#notificationarea').prepend(bell)
    			}
    				
    			});

    		},
    		error: function(data) {
    			console.log("載入歷史訊息發生錯誤");
    		},
    	});
    }



    function confirminvite() {
    	let inviteid = $(this).find('span').text();
    	console.log(inviteid)
    	$.ajax({
    		type: "post",
    		url: "memberaddfriend/" + inviteid,
    		success: function(data) {
    			loadinvitemsg()
    		},
    		error: function(xhr) {

    		},
    	});
    };

    function deleteinvite(){
    	let inviteid = $(this).find('span').text();
    	$.ajax({
    		type: "post",
    		url: "deleteinvite/" + inviteid,
    		success: function(data) {
    			loadinvitemsg()
    		},
    		error: function(xhr) {
    		},
    	});
    	
    }
    
    function clearnotification(){
 		Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
              }).then((result) => {
                if (result.isConfirmed) {
                  $.ajax({
                        type: "post",
                        url: "clearnotification",
                        success: function(response) {  
                        	loadnotifymsg()
                             Swal.fire(
                              'Deleted!',
                              'Your file has been deleted.',
                              'success'
                            ) } ,
                            error: function (xhr) {
                            Swal.fire({
                              icon: 'error',
                              title: 'Oops...',
                              text: 'Something went wrong!'
                            }) },  //error close
                     }); //ajax close          
                } //if close 

           }); //then close 
}
    
    function closetoast(){
    	$(".btn-close-toast").on('click',function(){
    	$($(".toast")[0]).remove();
    	})
    }
    
    function addchatnum(sender){
    	$.ajax({
    		type: "post",
    		url: "addchatnum/"+ sender,
    		success: function(data) {
    		loadfriends()
    		},
    		error: function(xhr) {
			console.log("addchatnum error")
    		},
    	});
    }
    
    function clearchatnum(){
    	console.log("clearchatnum")
    	$.ajax({
    		type: "post",
    		url: "clearchatnum/"+ selectUser,
    		success: function(data) {
    		loadfriends()
    		},
    		error: function(xhr) {
			console.log("clearchatnum error")
    		},
    	});
    	
    }
    
    function friendsinfo(){
    	let a = $(this).parent().attr('id');
      	let b = $(this).parent();
      	$.ajax({
      		type: "post",
      		url: "memberfriendsnum",
      		data:{"memberAccount":a},    		
      		success: function(data) {
      			let json = data[0]
      			let item = 
    				"<div class='card profile-widget position-absolute shadow border rounded-3' style='z-index:5' id='friendsinfo'>"+
    					"<div class='profile-widget-header'>"+
    					//"<img id='showMemberPic' src='"+data.memberPic+"' class='rounded-circle profile-widget-picture'"+
    			            //"style='width: 5vw; height: 5vw; object-fit: cover'/>"+
    						"<div class='profile-widget-items'>"+
    							"<div class='profile-widget-item'>"+
    								"<div class='profile-widget-item-label text-danger' style='font-size:12px;'><i class='fas fa-users'></i>Friends</div>"+
    								"<div class='profile-widget-item-value' id='friendsnum' style='font-size:12px;'>"+json.friendsnum+"</div>"+
    							"</div>"+
    							"<div class='profile-widget-item'>"+
    								"<div class='profile-widget-item-label text-warning' style='font-size:12px;'><i class='fas fa-flask'></i>Level</div>"+
    								"<div class='profile-widget-item-value' id='level' style='font-size:12px;'>"+json.level+"</div>"+
    							"</div>"+
    						"</div>"+
    					"</div>"+
    					"<div class='profile-widget-description'>"+
    						"<div class='profile-widget-name' id='prifleName' style='font-size:12px;'>"+
    						json.member.personalInfo+
    						"<div class='d-flex flex-row'>" +
    						"<a class='badge badge-success text-decoration-none text-white' style='font-size:10px;'>"+json.member.tagOne+"</a>"+
        					"<a class='badge badge-warning text-decoration-none text-white ' style='font-size:10px;'>"+json.member.tagTwo+"</a>"+
        					"<a class='badge badge-info text-decoration-none text-white' style='font-size:10px;'>"+json.member.tagThree+"</a>"+
        					"</div>"+
        					"</div>"+
    					"</div>"+   				
    			"</div>";	
      			b.append(item)                 			     		
      		},
      		error: function(xhr) {
  			console.log("friendsinfo  error")
      		},
      	});            	   
     }
    
    function removeinfo(){
    	$("#friendsinfo").remove()
    }

    
   
   </script>
  </body>
</html>       
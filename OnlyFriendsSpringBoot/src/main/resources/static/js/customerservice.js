    let stompClient;
    let username = _uuid()
	let selectUser = "ofteam"

   $(function() {		 	   
	$('#customerbtn').on('click',createroom)
})

    const onConnected = () => {
	stompClient.subscribe('/topic/public/' + username, onMessageReceived)
	stompClient.send("/app/chat.newUser/" + selectUser,
		{},
		JSON.stringify({ sender:username, type: 'CONNECT',content:'一名新的會員等待服務',time:new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })})
	)
}

	const onError = (error) => {
	console.log('connect failed')
}

 const disconnect = () => {
	stompClient.send("/app/cs.send/" + selectUser, {}, JSON.stringify({ sender:username, type: 'CHAT',content:'客戶已離線',time:new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })}))
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
		stompClient.send("/app/cs.send/" + selectUser, {}, JSON.stringify(chatMessage))
		
		var d =     
         	    	"<div class='chat-item chat-right' style>"+
         	    	"<img src='images/smallicon/question.png'  />"+
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
	console.log("receivemsg"+message)
		var d =     
     	    	"<div class='chat-item chat-left' style>"+
				"<img src='images/smallicon/customer-service.png'  />"+
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

 function createroom(){    
              var chatbox =  		
                "<div class='card chat-box card-success position-fixed bottom-0 end-0 w-25' id='mychatbox2'>"+
                  "<div class='card-header'>"+
                   "<h4 id='chatroomname'>"+"OnlyFriends線上客服"+"</h4>"+
				"<button type='button' class='btn-close btn-sm aria-label='Close' id='closecs'></button>"+
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

              "</div>";  
 	  
           	 $('body').append(chatbox)  
				const socket = new SockJS('/OnlyFriends/chat-example')
				stompClient = Stomp.over(socket)
				stompClient.connect({}, onConnected, onError)  
	         $('#message-controls').on('submit',sendMessage)  
			 $('#closecs').on('click',closecs)
					     
    }
      
  function scrollbtm(){
   	 $('#chat-content')[0].scrollTop = $('#chat-content')[0].scrollHeight - $('#chat-content')[0].clientHeight;  
	}
	
	
	function _uuid() {
	  var d = Date.now();
	  if (typeof performance !== 'undefined' && typeof performance.now === 'function'){
	    d += performance.now(); //use high-precision timer if available
	  }
	  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
	    var r = (d + Math.random() * 16) % 16 | 0;
	    d = Math.floor(d / 16);
	      return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
	  });
	}	
	
	function closecs(){
		disconnect()
		$('#mychatbox2').remove()	
	}	

  
  
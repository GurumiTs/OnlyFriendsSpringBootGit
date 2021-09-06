    let stompClient;
    let username = "ofteam"
	let customer;

   $(function() {		 	   
	const socket = new SockJS('/OnlyFriends/chat-example')
	stompClient = Stomp.over(socket)
	stompClient.connect({}, onConnected, onError)   
	$('#customerbtn').on('click',disconnect)					     
})

    const onConnected = () => {
	stompClient.subscribe('/topic/public/' + "ofteam", onMessageReceived)	
}


	const onError = (error) => {
	console.log('connect failed')
}

 const disconnect = () => {
	stompClient.send("/app/cs.send/" + customer, {}, JSON.stringify({ sender:"ofteam", type: 'CHAT',content:'服務結束',time:new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })}))
}
 const tag1 = () => {
	stompClient.send("/app/cs.send/" + customer, {}, JSON.stringify({ sender:"ofteam", type: 'CHAT',content:'稍等一下，這邊馬上幫您進行處理',time:new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })}))
	var d =     
         	    	"<div class='chat-item chat-right' style>"+
         	    	"<img src='images/smallicon/customer-service.png'  />"+
                    "<div class='chat-details'>"+
                      "<div class='chat-text'>稍等一下，這邊馬上幫您進行處理</div>"+
                      "<div class='chat-time'>"+
                      new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true }) +"</div>"  
                    "</div>"+                   
                    "</div>";
		$('#chat-content').append(d)
}
 const tag2 = () => {
	stompClient.send("/app/cs.send/" + customer, {}, JSON.stringify({ sender:"ofteam", type: 'CHAT',content:'今日還需要其他的服務嗎?',time:new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })}))
		var d =     
         	    	"<div class='chat-item chat-right' style>"+
         	    	"<img src='images/smallicon/customer-service.png'  />"+
                    "<div class='chat-details'>"+
                      "<div class='chat-text'>今日還需要其他的服務嗎?</div>"+
                      "<div class='chat-time'>"+
                      new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true }) +"</div>"  
                    "</div>"+                   
                    "</div>";
		$('#chat-content').append(d)
}

const tag3 = () => {
	stompClient.send("/app/cs.send/" + customer, {}, JSON.stringify({ sender:"ofteam", type: 'CHAT',content:'請問您的帳號是?',time:new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })}))
		var d =     
         	    	"<div class='chat-item chat-right' style>"+
         	    	"<img src='images/smallicon/customer-service.png'  />"+
                    "<div class='chat-details'>"+
                      "<div class='chat-text'>請問您的帳號是?</div>"+
                      "<div class='chat-time'>"+
                      new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true }) +"</div>"  
                    "</div>"+                   
                    "</div>";
		$('#chat-content').append(d)
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
		stompClient.send("/app/cs.send/" + customer, {}, JSON.stringify(chatMessage))
		
		var d =     
         	    	"<div class='chat-item chat-right' style>"+
         	    	"<img src='images/smallicon/customer-service.png'  />"+
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
	if(message.type == 'CONNECT'){
		createroom()
		$('#message-controls').on('submit',sendMessage) 
		$('#closecs').on('click',closecs)
		$('#tag1').on('click',tag1)
		$('#tag2').on('click',tag2)
		$('#tag3').on('click',tag3)
		customer = message.sender; 
		stompClient.send("/app/chat.newUser/" + customer,
		{},
		JSON.stringify({ sender:"ofteam", type: 'CONNECT',content:'您好，很高興能夠為您服務',time:new Date().toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })})
	)
		
		var d =     
     	    	"<div class='chat-item chat-left' style>"+
				"<img src='images/smallicon/question.png'  />"+
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
	if(message.sender == customer && message.type != 'CONNECT'){
		var d =     
     	    	"<div class='chat-item chat-left' style>"+
				"<img src='images/smallicon/question.png'  />"+
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

}


 function createroom(){    
              var chatbox =  		
			  "<div class='col-12 col-sm-12 col-lg-12 mh-100' id='chatboxarea'>"+
                "<div class='card chat-box card-success' id='mychatbox2'>"+
                  "<div class='card-header d-flex flex-row justify-content-end'>"+
				"<button type='button' class='btn-close aria-label='Close' id='closecs'></button>"+
                  "</div>"+
                  "<div class='card-body chat-content overflow-auto' id='chat-content'></div>"+
                 "<div class='card-footer'>"+
				 "<span class='badge badge-primary mx-1 fs-6' id='tag1'>稍等一下，這邊馬上幫您進行處理</span>"+
				 "<span class='badge badge-success mx-1 fs-6' id='tag2'>今日還需要其他的服務嗎?</span>"+
          	     "<span class='badge badge-warning mx-1 fs-6' id='tag3'>請問您的帳號是?</span>"+
 				"</div>"+
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
    }
      
  	function scrollbtm(){
   	 $('#chat-content')[0].scrollTop = $('#chat-content')[0].scrollHeight - $('#chat-content')[0].clientHeight;  
	}
	
	function closecs(){
		disconnect()
		$('#chatboxarea').remove()		
	}	

  
  
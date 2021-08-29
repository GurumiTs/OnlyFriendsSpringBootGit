'use strict'

  	let stompClient;
    let username = $('#getAccount').prop('value');
	let selectUser;

    
    $(function(){
    	
    	const socket = new SockJS('/OnlyFriends/chat-example')
		stompClient = Stomp.over(socket)
		stompClient.connect({}, onConnected, onError)
		 $.ajax({
                type: "post",
                url: "bellhistory/"+username,
                success: function (data) {     	 
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
	
	
	const onMessageReceived = (payload) => {
		const message = JSON.parse(payload.body);
		console.log(message)		
		if(message.sender == 'cupid'){
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
		}else if(message.sender != 'cupid' & message.sender != username){
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

}


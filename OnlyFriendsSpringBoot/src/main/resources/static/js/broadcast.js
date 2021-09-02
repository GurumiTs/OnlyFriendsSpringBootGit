'use strict'

let stompClient;
let username = $('#getAccount').prop('value');
let selectUser;



$(function() {	
	const socket = new SockJS('/OnlyFriends/chat-example')
	stompClient = Stomp.over(socket)
	stompClient.connect({}, onConnected, onError)
	$("#inviteicon").on('click', loadinvitemsg)
	$("#notificationicon").on('click', loadnotifymsg)
	$("#clearnotification").on('click',clearnotification)

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
	}
	if(message.content != null && selectUser != message.sender && message.sender != 'official'){
		addchatnum(message.sender)
	}
}


function loadinvitemsg() {
	$('#invitearea').html('')
	$.ajax({
		type: "post",
		url: "invitehistory",
		success: function(data) {
			console.log(data)
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
				$('#notificationarea').prepend(bell);
				} // end of if				
			}); //end of each

		},
		error: function(data) {
			console.log("載入歷史訊息發生錯誤");
		},
	}); //end of ajax
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
    	console.log("sender11:"+sender)
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


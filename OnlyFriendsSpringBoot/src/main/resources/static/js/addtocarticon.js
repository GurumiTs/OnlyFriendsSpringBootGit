//document.getElementById('addtocarticon').onclick = function() {
//    if (cartlist!=null) {
//        //商品總數
//    } else {
//		document.getElementById('addtocarticon').value='0';        
//    }
//    
//}

$("#cartlist").on("change", function () {
          let proId = $(this).val();
          $.ajax({
            type: "get",
            url: "cart/" + proId,
            success: function (data) {
              
            },
            error: function (e) {
              console.log(e);
            },
          });
        });
$(document).ready(function(){
  console.log('register init')

  $("#btn-sign-up").click(function(){
    var user_name = $("#input-user-name").val()
    var password = $("#input-password").val()
    var email = $("#input-email").val()
    console.log(user_name+'  '+password+'  '+email)

    $.post("/navbar/signup","user_name="+user_name+
                                    "&password="+password+
                                    "&email="+email,function(data,status){
      console.log(data.status)
      if (data.status ==0){
        location.href = "/welcome/index"
      }else alert("Register Error")

    },"json");
  });
});

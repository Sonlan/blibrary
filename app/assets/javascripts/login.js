$(document).ready(function(){
  console.log('login init')
  $("#btn-sign-in").click(function(){
    var user_name = $("#user-name").val()
    var password = $("#password").val()
    console.log(user_name+'  '+password)
  });
});

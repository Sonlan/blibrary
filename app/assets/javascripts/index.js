$(document).ready(function(){
  console.log("init")


  $("#btn-book-search").click(function(){
    var img_base_path = "http://localhost:8000/assets/";
    console.log("btn clicked")
    console.log($("#input-book-name").val())
    $.get("/book_types/search.json?book_name="+$("#input-book-name").val(),function(data,status){
      refreshContent(img_base_path,data);
    },"json");
  });


  $("#page-1").click(function(){
    console.log('page 1')
  });



  /*
  * 刷新书籍列表
  * data: hash书籍列表
  */
  function refreshContent(img_base_path,data){
    len = data.length
    console.log(len)
    var html_content="";
    for (i=0;i<len;i++){
      html_content+=toHtml(img_base_path,data[i].id,data[i].img_paths,data[i].book_name,data[i].introduction)
    }
    $("#div-book-list").html(html_content);
  }

  /*
  * 拼装html语句
  */
  function toHtml(img_base_path,book_id,img_path,book_name,introduction){
    var html_content = "<div class = 'row'>\
      <img src=\""+img_base_path+img_path+"\" class='col-sm-3'/>\
        <div class='col-sm-9'>\
          <a href='/book_types/"+book_id+"'><h2>"+book_name+"</h2></a>\
          <p>"+introduction+"</p>\
          <br>\
        </div>\
    </div><br>";
    return html_content;
  }
});

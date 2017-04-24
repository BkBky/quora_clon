$(document).ready(function() {
  // view for vote like for questions
  $(".vote_like").on("click", function(event){
    console.log("hola en quora 6");
    // alert($(this).data("id"));
    var currentQuest = $(this).attr("value");
    console.log(currentQuest);
    event.preventDefault();
    $.get("/like/", {question_id: currentQuest}, function(data){
      console.log("hola dentro de post");
      var total_likes = $("#session"+currentQuest).attr("value");
      console.log($("#session"+currentQuest));
      // console.log(data);
      $("#vote").html(data);
    });
  });
  // view for vote unlike for questions
  $(".vote_unlike").on("click", function(event){
    console.log("hola en quora 6");
    // alert($(this).data("id"));
    var currentQuest1 = $(this).attr("value");
    console.log(currentQuest1);
    event.preventDefault();
    $.get("/unlike/", {question_id: currentQuest1}, function(data){
      console.log("hola dentro de post2");
      var total_likes = $("#unlike"+currentQuest1).attr("value");
      console.log($("#unlike"+currentQuest1));
      // console.log(data);
      $("#vote").html(data);
    });
  });


});
  
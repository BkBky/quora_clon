$(document).ready(function() {
  // view for vote like for questions
  $(".vote_like_ans").on("click", function(event){
    console.log("hola en quora 7");
    // alert($(this).data("id"));
    var currentAns = $(this).attr("value");
    console.log(currentAns);
    event.preventDefault();
    $.get("/like_ans/", {answer_id: currentAns}, function(data){
       console.log("hola dentro de post");
       var total_likes_ans = $("#like_vote_ans"+currentAns).attr("value");
      console.log($("#like_vote_ans"+currentAns));
    // // console.log(data);
       $("#vote_ans").html(data);
    });
  });

    $(".vote_unlike_ans").on("click", function(event){
    console.log("hola en quora 7");
    // alert($(this).data("id"));
    var currentAns1 = $(this).attr("value");
    console.log(currentAns1);
    event.preventDefault();
    $.get("/unlike_ans/", {answer_id: currentAns1}, function(data){
       console.log("hola dentro de post");
       var total_likes_ans = $("#unlike_vote_ans"+currentAns1).attr("value");
      console.log($("#unlike_vote_ans"+currentAns1));
    // // console.log(data);
       $("#vote_ans").html(data);
    });
  });
  


});
  
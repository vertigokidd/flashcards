function colorizer(input) {
  if (input == "Correct!") {
    $("#answer-eval").addClass("correct");
  } else{
    $("#answer-eval").addClass("incorrect");
  };
}



$(document).ready(function() {
  $("#guess").focus();
  $(".summary-pic").hide().delay(500).slideDown(2000);
  $(".history").hide().delay(2500).fadeIn(1000);
  $(".question").hide().delay(2000).fadeIn(2000);
  $("#answer-eval").show(1000).fadeOut(1000);
  result = $('#answer-eval').data("result");
  colorizer(result);
});

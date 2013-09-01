seconds = []

function colorizer(input) {
  if (input == "Correct!") {
    $("#answer-eval").addClass("correct");
  } else{
    $("#answer-eval").addClass("incorrect");
  };
}

function loadTimer(){
  for(i=0; i < 15; i++){
    seconds.push(i);
  }
}


function startTimer() {

  currentSecond = seconds.pop();

  $('#timer').text(currentSecond);

  if (currentSecond <=5) {
    $('#timer').addClass('red');
    $('#timer').removeClass('white');

  };

  if(seconds.length == 0){
    $('#answer_button').click();
  }
  else{
    window.setTimeout(startTimer,1000);
  }
}


$(document).ready(function() {
  $("#guess").focus();
  $(".summary-pic").hide().delay(500).slideDown(2000);
  $(".history").hide().delay(2500).fadeIn(1000);
  $(".question").hide().delay(2000).fadeIn(2000);
  $("#answer-eval").show(1000).fadeOut(1000);
  $('#timer').addClass('white');

  result = $('#answer-eval').data("result");
  colorizer(result);

  loadTimer();


  window.setTimeout(startTimer,2000);
  // startTimer(seconds);
});





var audio = $("#audio")[0];
var quotes = $(".quotes");
var quoteIndex = -1;

function showNext() {
  audio.play();
  ++quoteIndex;
  if (quoteIndex == quotes.length - 1) {
    quotes.eq(quoteIndex).fadeIn(2000);
    $("#audio").animate({volume: 0}, 7000);
    $(".button").delay(5000).fadeIn(2000);
  }
  else {
    quotes.eq(quoteIndex)
    .fadeIn(2000)
    .delay(2000)
    .fadeOut(2000, showNext);
  }
}

showNext();

$("#replay").click(function() {
  audio.currentTime = 0;
  audio.volume = 1;
  quoteIndex = -1;
  quotes.fadeOut(0);
  $(".button").fadeOut(0);
  showNext();
});

 // <script>
 //    (function() {
 //      var quotes = $(".quotes");
 //      var quoteIndex = -1;
 //      function showNextQuote() {
 //        ++quoteIndex;
 //        quotes.eq(quoteIndex % quotes.length)
 //            .fadeIn(1700)
 //            .delay(1500)
 //            .fadeOut(1700, showNextQuote);
 //      }
 //      showNextQuote();
 //    })();
 //  </script>

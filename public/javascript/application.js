var audio = $("#audio")[0];
var quotes = $(".quotes");
var quoteIndex = -1;

function showNext() {
  audio.play();
  ++quoteIndex;
  if (quoteIndex == quotes.length - 1) {
    console.log("hit");
    quotes.eq(quoteIndex).fadeIn(1700);
    $("#audio").animate({volume: 0}, 8000);
  }
  else {
    quotes.eq(quoteIndex)
    .fadeIn(1700)
    .delay(1500)
    .fadeOut(1700, showNext);
  }
}

showNext();

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

//  THIS IS NOT WORKING. WHY? SAD FACE

// 1. when we scroll, listen into the scrolling event
// 2. test how far we have scrolled down the page
// 3. if we scroll more than 50px, lets make the logo smaller
// 4. if we scroll more than 300px, let’s hide the header
// 5. if we scroll back up, let’s show the header and make the logo the same size again

$(document).on('scroll', function() {
  
  var pixelsFromTop = $(document).scrollTop()
  
  console.log(pixelsFromTop)
  
  if (pixelsFromTop > 50) {
    $('header').addClass('compact')
  } else {
    $('header').removeClass('compact')
  }
  
  if (pixelsFromTop > 300) {
    $('header').addClass('hidden')
  } else {
    $('header').removeClass('hidden')
  }
  
})
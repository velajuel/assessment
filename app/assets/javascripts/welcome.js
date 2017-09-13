$(document).ready(function(){
  function getQoute(){
    $.getJSON("https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=jsonp&jsonp=?", function(data){
      $(".qoutes").html(data.quoteText); 
      $(".author").html("- " +data.quoteAuthor);
    });
  }
  
  $("#quotebtn").on("click", function(e){
    
    e.preventDefault()
    getQoute();
  }); 
});


// $.ajax({
//   url: 'asdf',
//   method: 'get',
//   data: 'json'
// })
// $(document).ready(function() {

//     $('quotebutton').on('click',function(){

//       $.ajax({
//         url: 'http://api.giphy.com/v1/gifs/random',
//         data: {
//             api_key:'dc6zaTOxFJmzC',
//             tag: $('#tag_input').val()},
//         method: 'get',

//         success: function(response) {
//           console.log(response)
//           console.log(response.data.image_url)
//           var url = response.data.image_url
//           $('#gif-container').html('<img src ="' + url + '">')},

//       beforeSend: function() {
//         $('#gif-container').html('Loading. . . . .')
//       }
//     })
//   })
// })

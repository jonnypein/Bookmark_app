import $ from 'jquery';
$('.movielistid').keyup(function() {
  let movielistid = document.querySelector('.movielistid').value
  // console.log("Hi, I'm in autocomplete")
  // console.log(window.location.origin)
  $.ajax({
      url: "/search_movies",
      type: "GET",
      data: { input : movielistid }
  })
});












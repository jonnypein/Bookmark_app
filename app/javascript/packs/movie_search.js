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

const bookmarks = document.querySelectorAll('.add-to-bookmarks');

bookmarks.forEach((bookmark) => {
  bookmark.addEventListener("click", () => {
    console.log('clicked');
     bookmark.innerHTML = "Bookmarked";
  });
});


const recommendations = document.querySelectorAll('.add-to-recommendations');

recommendations.forEach((recommendation) => {
  recommendation.addEventListener("click", () => {
    recommendation.innerHTML = "Recommended";
  });
});








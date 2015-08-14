$(document).ready(function() {
  setUpClickHandler();
})

function setUpClickHandler(){
  $('#mainImage').click(function(event){
    var rect = $('#mainImage')[0].getBoundingClientRect();
    var x = event.pageX  - rect.left;
    var y = event.pageY - rect.top;
    alert('clicked at : ' + x + " " + y);
  })
}


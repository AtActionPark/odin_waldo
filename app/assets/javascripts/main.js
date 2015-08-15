var mouseX,mouseY;

$(document).ready(function() {
  setUpClickHandler();
})

function setUpClickHandler(){
  $('#mainImage').click(function(event){
    var rect = $('#mainImage')[0].getBoundingClientRect();
    mouseX = event.pageX  - rect.left;
    mouseY = event.pageY - rect.top;
    console.log('clicked at : ' + mouseX + " " + mouseY);
    if($('#targetingBox').is(":visible"))
      $('#targetingBox').hide();
    else
      showTargetingBox(mouseX,mouseY);
  })
}

function showTargetingBox(x,y){
  $('#targetingBox').show();
  $('#targetingBox').css({top: y - $('#targetingBox').height(), left:x});
}

function checkAnswer(name){
  $.ajax({
      url:'/locations',
      type: "GET",
      dataType:"json",
      success: function(json){
        console.log(json[name]);
        handleAnswer(json,name);
        $('#targetingBox').hide();
      },
      error: function( xhr, status, errorThrown ) {
          alert( "Error, see log" );
          console.log( "Error: " + errorThrown );
          console.log( "Status: " + status );
          console.dir( xhr );
      },
    })
}

function handleAnswer(json,name){
  if(mouseX> json[name].left 
    && mouseX< json[name].left + json[name].width
    && mouseY> json[name].top 
    && mouseY< json[name].top + json[name].height
    )
    hideCharacter(name,json[name].left,json[name].top,json[name].width,json[name].height);
  else
    alert('nope');
}

function hideCharacter(name,x,y,w,h){
  var characterDiv = $("<div class='hiding'></div>");
  characterDiv.css({left:x, top:y, height:h,width:w})
  $('.main').append(characterDiv);
  $('#'+name).css({border: '3px solid green'})
}




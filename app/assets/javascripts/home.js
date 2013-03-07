(function(){
  Box.loadAutocomplete();
  Box.loadUploader();

  $('#address').blur(function(event) {
    var value = event.target.value;

    if(value.length > 5)
      Box.updateMap();
  });
}());
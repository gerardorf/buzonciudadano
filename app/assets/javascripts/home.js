(function(){
  Box.loadAutocomplete();
  Box.loadUploader();

  Box.getInputAddress().value = "Alboraya"
  Box.updateMap();

  $('#address').blur(function(event) {
    var value = event.target.value;

    if(value.length > 5)
      Box.updateMap();
  });
}());
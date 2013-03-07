var Box = {};

Box.getInputAddress = function() {
  return document.getElementById('address')  
};

Box.loadAutocomplete = function() {
  var cityBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(39.502617, 151.1759),
    new google.maps.LatLng(39.497881, -0.359974)
  );

  var input = Box.getInputAddress(),
      options = {
        bounds: cityBounds,
        componentRestrictions: {country: 'es'}
      };

  new google.maps.places.Autocomplete(input, options);
};

Box.updateMap = function() {
  var address = Box.getInputAddress().value,
      img = document.createElement('img');

  img.src = "http://maps.google.com/maps/api/staticmap?center=" + address +
    "&zoom=16&size=609x250&maptype=roadmap&sensor=false&markers=color:blue|" + address;

  $('#map').empty();
  $('#map').append(img);
  $('#map').show();
};
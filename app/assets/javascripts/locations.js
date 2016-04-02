window.SaveThePrincess = window.SaveThePrincess || {};

(function (module, $) {
  var events = {
    setCoordinates: function (event) {
      var parent = $(event.target).closest('.planet');
      var latitude = 180 * ((event.pageX - parent.offset().left) - (parent.width() / 2)) / parent.height();
      var longitude = 360 * ((parent.height() / 2) - (event.pageY - parent.offset().top)) / parent.width();
      $('#location_latitude').val(latitude);
      $('#location_longitude').val(longitude);
      $('.location-coordinates').html('(' + latitude.toFixed(4) + ', ' + longitude.toFixed(4) + ')');
    }
  };

  module.Location = {
    initialize: function () {
      $('.planet').on('click', events.setCoordinates);
    }
  };
}(window.SaveThePrincess, jQuery));

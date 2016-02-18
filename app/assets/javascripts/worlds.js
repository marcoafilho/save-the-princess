$(document).ready(function () {
  $.getJSON('/map', function (data) {
    $('.world').attr('src', data.path)
  });
});

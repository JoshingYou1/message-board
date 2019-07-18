$(document).on('turbolinks:load', function () {
  $('[data-toggle="popover"]').popover({
    trigger : 'hover'
  });
});

document.addEventListener("turbolinks:before-cache", function () {
  $('[data-toggle="popover"]').popover('hide');
});
$(document).on('turbolinks:load', function () {
  $('[data-toggle="popover"]').popover({
    placement : 'bottom',
    trigger : 'hover'
  });
});
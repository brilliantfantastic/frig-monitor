$(function () {
  $('.sidebar form').hide();

  $('.sidebar .add-frig').on('click', function (event) {
    $(this).hide();
    $('.sidebar form').show();
    $('.sidebar form input').focus();
    event.preventDefault();
  });
});

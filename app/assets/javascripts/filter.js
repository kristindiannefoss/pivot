$(document).ready(function () {

  var $needs = $('.need');

  $('#need_filter_category').on('change', function () {
    var currentCategory = this.value;
    if (currentCategory === "All Categories") {
     $('.need').show();
    } else {
      $needs.each(function (index, need) {
        $need = $(need);
        if ($need.data('category') === currentCategory) {
          $need.show();
        } else {
          $need.hide();
        }
      });
    }
  });

  $('#need_filter_name').on('keyup', function () {
    var keyword = this.value;
    $needs.each(function (index, need) {
      $need = $(need);
      if ($need.data('name').toLowerCase().includes(keyword.toLowerCase())) {
        $need.show();
      } else {
        $need.hide();
      }
    });
  });
});


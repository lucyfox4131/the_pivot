$(document).ready(function () {

  var $families = $(".family");

  $('#family_filter_name').on("keyup", function(){
    console.log("got here");
    var currentName = this.value;
    $families.each(function (index, family){
      $family = $(family);
      if ($family.data('name').indexOf(currentName) !== -1 ) {
        $family.show();
      } else {
        $family.hide();
      }
    });
  });

});

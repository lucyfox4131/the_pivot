$(document).ready(function () {

  var $users = $(".user");

  $('#user_filter_username').on("keyup", function(){
    console.log("got here");
    var currentUsername = this.value;
    $users.each(function (index, user){
      $user = $(user);
      if ($user.data('username').indexOf(currentUsername) !== -1 ) {
        $user.show();
      } else {
        $user.hide();
      }
    });
  });

});

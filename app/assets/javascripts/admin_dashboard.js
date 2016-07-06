$(document).ready(function () {

  function toggleView (statusID, charitiesID){
    $(statusID).on("click", function(){
      $(charitiesID).toggleClass("hidden")
    });
  };

  toggleView("#pending", "#padmin-pending")
  toggleView("#online", "#padmin-online")
  toggleView("#offline", "#padmin-offline")
  toggleView("#administrators", "#all-admins")
});

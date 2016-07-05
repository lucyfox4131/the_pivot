$(document).ready(function () {

  function toggleSong (statusID, charitiesID){
    $(statusID).on("click", function(){
      $(charitiesID).toggleClass("hidden")
    });
  };

  toggleSong("#pending", "#padmin-pending")
  toggleSong("#online", "#padmin-online")
  toggleSong("#offline", "#padmin-offline")
});

$(function() {
  $('#supply_item_quantity').on('change', function() {
    $('form.edit_supply_item').submit();
  });
});

// On dropdown change, submit the form
    // on change
// Something like $('form#toggle_admin_form').submit();
//build a .js.erb view for cart_items/update.js.erb
// Write some JS in that file that will execute after the form is submitted

// $('#supply_item_quantity').on('change', function() {
//      $('form.edit_supply_item').submit();
//    });

// $('#supply_item_quantity').bind('change', function() {
//   $.ajax({
//     url: $('form.edit_supply_item').attr('action'),
//     headers: {
//       Accept : "text/javascript; charset=utf-8",
//       "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
//     },
//     type: 'PUT',
//     data: {
//       'quantity': $(this).val(),
//       'supply_item_id': $(this).parent().parent('td').children().val(),
//     }
//   });
// });
//
//
// $('#loan_quantity').bind('click', function() {
//   $.ajax({
//     url: $('form.edit_loan').attr('action'),
//     headers: {
//       Accept : "text/javascript; charset=utf-8",
//       "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
//     },
//     type: 'PUT',
//     data: {
//       'quantity': $(this).val(),
//       'loan_id': $(this).parent().parent('td').children().val(),
//       'authenticity_token': $(form.edit_loan).siblings('input[name="authenticity_token"]').val(),
//     }
//   });
// });

// $(function() {
//   $('#selectbutton').click(function() {
//     $('#cart-form').submit();
//   });
// });


// $("#selectbutton").on("click", function() {
//   $('#cart-form').submit(function() {
//       var valuesToSubmit = $(this).serialize();
//       $.ajax({
//           type: "PUT",
//           url: $(this).attr('action'), //sumbits it to the given url of the form
//           data: valuesToSubmit,
//           dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
//       }).success(function(json){
//           console.log("success", json);
//       });
//       return false; // prevents normal behaviour
//   });
// });

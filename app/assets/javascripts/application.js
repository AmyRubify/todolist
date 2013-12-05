// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery.sortable
$(document).ready(function(e){
  $(document.body).delegate("div#group1 button", "click", function() { 
    var e1 = $("#group1");
    var e2 = $("#group2");
    e1.hide();
    e2.show();
  });
  $(document.body).delegate("div#group2 button", "click", function() { 
    var e1 = $("#group1");
    var e2 = $("#group2");
    e2.hide();
    e1.show();
  });
  $(document.body).delegate("div.sublists input", "change", function() { 
    var listId = $(this).attr("data-list-id");
    var sublistId = $(this).attr("data-sublist-id");
    $.ajax({
          type: 'put',
          url: "/lists/"+ listId + "/sublists/" + sublistId + "/update_status",
          success: function (msg) {
            if (msg == "successful") {
              //alert("successful");
              //update all sublist is completed
              $.ajax({
                    type: 'get',
                    url: "/lists/"+ listId + "/sublists_is_completed",
                    success: function (response) {
                      $('div.is-completed').html(response);
                    }
              });
              $.ajax({
                    type: 'get',
                    url: "/lists/"+ listId + "/sublists_isnot_completed",
                    success: function (response) {
                      $('div.isnot-completed').html(response);
                    }
              });
            }
          }
    });
  });
  
  $(document.body).delegate("div#group2 form#new_sublist  input[type=submit]", "click", function(e) { 
    var form = $(this).parents('form:first');
    $.ajax({
          type: form.attr("method"),
          url: form.attr("action"),
          data: form.serialize(),
          success: function (response) {
            $('div.isnot-completed').html(response);
          }
    }); 
    e.preventDefault();
    return false;
  });  
});
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "ajax:success", "form#omments-form", (ev,data)->
  console.log data
  $(this).find("textarea").val("")
  $("#comments-box").append("<li> #{data.body} - #{data.user.email}")
  $(document).on "ajax:error", "form#omments-form", (ev,data)->
    console.log data

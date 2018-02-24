# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', () ->
  $('.todo_complete').on 'click', () ->
    todo_id = $(this).val()
    status = 0
    if $(this).is(':checked')
      status = 1
    $.ajax '/todos/'+todo_id,
    type: 'PUT'
    data:
      todo: 
        status: status
      authenticity_token: $('meta[name=csrf-token]').attr('content')
    beforeSend: ()->
      $('#myModal').modal();
    error: (jqXHR, textStatus, errorThrown) ->
      $('#myModal .modal-body p').text "Error: #{textStatus}"
    complete: (data, textStatus, jqXHR) ->
      $('#myModal').modal('hide');

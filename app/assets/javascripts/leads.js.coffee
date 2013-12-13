# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  form = $('form')
  formInput = form.find('input')

  formInput.on 'change', ->
    $(this).closest('form').find(':submit').removeAttr('disabled')
    $(this).closest('.lead-data').addClass('info')

  form.submit ->
    $(this).find(':submit').attr('disabled', 'disabled')
    $(this).find('.lead-data').removeClass('info')

  # $(".pagination a").on 'click', ->


$(document).ready(ready)
$(document).on('page:load', ready)
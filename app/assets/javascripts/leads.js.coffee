# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  lead = $('.lead-item')

  # Collapse
  lead.find('.lead-form').hide()

  lead.find('.btn-edit').on 'click', (event) =>
    $(event.target).closest('.lead-item').find('.lead-form').show()
    $(event.target).closest('.lead-data').hide()

  lead.find('.btn-collapse').on 'click', (event) =>
    event.preventDefault()
    $(event.target).closest('.lead-item').find('.lead-data').show()
    $(event.target).closest('.lead-form').hide()


  # Forms
  form = lead.find('.simple_form')
  formInput = form.find('input')

  formInput.on 'change', ->
    $(this).closest('form').find('.btn-update').removeAttr('disabled')
    $(this).closest('.lead-form').addClass('info')

  form.submit ->
    $(this).find('.btn-update').attr('disabled', 'disabled')
    $(this).find('.lead-form').removeClass('info')


$(document).ready(ready)
$(document).on('page:load', ready)
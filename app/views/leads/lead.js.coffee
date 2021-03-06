# Current Lead
lead = $("#lead_<%= @lead.id %>")
alertP = lead.find(".alert-placeholder")
leadForm = lead.find(".lead-form")
success = undefined

# Error Handling
alertP.empty()
handleErrors = <%= @lead.errors.any? %>

if handleErrors
  errors = $("<ul />")

  <% @lead.errors.full_messages.each do |error| %>
  errors.append "<li><%= error %></li>"
  <% end %>

  bootstrap_alert alertP, "error", "Please correct the following errors:", errors, true

else
  leadForm.addClass("success").delay(1000).queue ->
    $(this).removeClass "success"
  success = true

# Text updates
if success
  lead.find(".lead-name").text       "<%= @lead.name %>"
  lead.find(".lead-phone").text      "<%= @lead.phone %>"
  lead.find(".lead-email").text      "<%= @lead.email %>"
  lead.find(".lead-zip").text        "<%= @lead.zip %>"
  lead.find(".lead-interest").text   "<%= @lead.interest %>"
  lead.find(".updated-at").text      "<%= l(@lead.updated_at, format: :short) %>"
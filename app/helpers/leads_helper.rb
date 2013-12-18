module LeadsHelper

  def lead_interests
    ['Doors', 'Windows', 'Both']
  end

  def lead_status_options
    ['New Lead',
     'Voicemail Left',
     'Non-Responsive',
     'Appointment Set',
     'Job Sold']
  end

  def lead_badge(text, css_class)
    css_class = 'badge lead-' + css_class.downcase.gsub(' ', '-')
    content_tag(:span, text, :class => css_class).html_safe
  end
end

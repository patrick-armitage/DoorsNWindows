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

  def lead_status_link(status)
    count = Lead.where(status: status).count

    if count > 0
      link_to count, params.merge(:search => status, :type => "status")
    else
      ''
    end
  end

  def lead_badge(text, css_class)
    css_class = 'badge lead-' + css_class.downcase.gsub(' ', '-')
    content_tag(:span, text, :class => css_class).html_safe
  end

  def lead_staleness(lead)
    css_class = ""
    if lead.status == "New Lead"
      css_class = lead.created_at < 1.day.ago ? "error" : "warning"
    end
    return css_class
  end
end

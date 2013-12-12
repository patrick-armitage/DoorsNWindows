module ApplicationHelper

  def full_title(page_title)
    base_title = "DoorsNWindows"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def container_class
    if current_page?(controller: 'leads')
      'container-fluid'
    else
      'container'
    end
  end
end
